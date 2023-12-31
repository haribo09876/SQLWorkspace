--산술연산자
SELECT ENAME 사원명, SAL 월급, SAL * 12 연봉
FROM EMP;

--  @ NULL도 데이터다
--      오라클에서 NULL은 매우 중요한 데이터이다
--      NULL의 특징
--      - 0이 아니다
--      - 빈 공간이 아니다
--      - 미확정, 알 수 없는 값을 의미(UNKNOWN)
--      - 어떤 값인지 알 수 없지만 값은 존재함
--      - 연산, 할당, 비교가 불가능
--      NULL의 모든 연산 결과는 NULL이다 (ex) 숫자 + NULL => NULL)
--      문자 + NULL => NULL 등

--  합성 연산자(CONCATENATION)
--      문자와 문자를 연결하는 합성 연산자이다
---     문자와 문자를 연결하는 경우 2개의 수직바(||)를 사용한다
---     컬럼과 문자 또는 다른 컬럼과 연결시킨다
---     문자 표현식의 결과에 의해 새로운 컬럼이 생성된다
SELECT *
FROM DEPT;

SELECT '부서번호가 ' || DEPTNO || '인 곳들은 ' || LOC || '에 있다'
FROM DEPT;

--------------------------------------------------------------------------------
SELECT *
FROM EMP;

SELECT EMPNO, ENAME, JOB, DEPTNO
FROM EMP
WHERE DEPTNO <> 10;

--다음과 같은 선수들의 출력 형태를 만드시오
--  체격정보
--  ooo 선수, 176 cm, 70 kg
DESC PLAYER;

SELECT PLAYER_NAME || ' 선수, ' || HEIGHT || ' cm,' || WEIGHT || ' kg' "체격정보"
FROM PLAYER;
		
--사원들의 자기소개서 작성
--  자기소개서
--  나의 이름은 ??? 입니다 입사한 날은 ???이고 직업은 ??? 인데요 앞으로 잘 부탁드립니다
DESC EMP;

SELECT '나의 이름은 ' || ENAME || ' 입니다' || ' 입사한 날은 ' || HIREDATE || '이고 직업은 ' || JOB || ' 인데요 앞으로 잘 부탁드립니다' 자기소개서 
FROM EMP;

--테이블 복제
CREATE TABLE TEMP_EMP
AS
SELECT *
FROM EMP;

UPDATE TEMP_EMP
SET SAL = 1000
WHERE ENAME = 'JONES';    --JONES 2975

UPDATE TEMP_EMP
SET SAL = 1500 
WHERE SAL <= 1500;

--스미스는 통장을 개설했다
INSERT INTO MY_ACCOUNT
VALUES (1, 'SMITH', 0);

--돈이 100원 감소했다
UPDATE TEMP_EMP
SET SAL = SAL - 100
WHERE ENAME = 'SMITH'; 

--궁금해서 100원을 입금했다
UPDATE MY_ACCOUNT
SET MONEY = MONEY + 100
WHERE NAME = 'SMITH';
        
--월급날이라 사장님이 SMITH에서 월급 200원을 줬다
UPDATE TEMP_EMP
SET SAL = SAL - 200
WHERE ENAME = 'KING';

--SMITH는 돈을 200원 받았다
UPDATE TEMP_EMP
SET SAL = SAL + 200
WHERE ENAME = 'SMITH'; 

--SMITH는 돈이 500원 감소했다
UPDATE TEMP_EMP
SET SAL = SAL - 500
WHERE ENAME = 'SMITH'; 

--SMITH는 통장에 500원을 입금했다
UPDATE MY_ACCOUNT
SET MONEY = MONEY + 500
WHERE NAME = 'SMITH';

--나는 회사에 취업했다
INSERT INTO TEMP_EMP
VALUES (7777, '김용원','NEWBIE', '7777', '23/05/26', 2000, NULL, NULL);

--통장을 개설했는데 내 돈이 2000원 있어서
INSERT INTO MY_ACCOUNT
VALUES (2, '김용원', 0);

--1000원이 감소했다
UPDATE TEMP_EMP
SET SAL = SAL - 1000
WHERE ENAME = '김용원';

--1000원을 적금했다
UPDATE MY_ACCOUNT
SET MONEY = MONEY + 1000
WHERE NAME = '김용원';

--월급날이 되어서 사장님이 200원을 줬다
UPDATE TEMP_EMP
SET SAL = SAL - 200
WHERE ENAME = 'KING'; 

--나는 월급을 받았다
UPDATE TEMP_EMP
SET SAL = SAL + 200
WHERE ENAME = '김용원'; 
	
--월세를 내려고 300원을 계좌에서 찾았다
UPDATE MY_ACCOUNT
SET MONEY = MONEY - 300
WHERE NAME = '김용원';

UPDATE TEMP_EMP
SET SAL = SAL + 300
WHERE ENAME = '김용원';

--세 사람은 돈을 얼마를 가졌을까요?
SELECT ENAME, SAL
FROM TEMP_EMP
WHERE ENAME = 'KING' or ENAME = 'SMITH' or ENAME = '김용원';

--사원 중 커미션이 300 또는 500 또는 1400인 사원들을 조회하시오
SELECT *
FROM EMP
WHERE COMM IN(300, 500, 1400);

--사원의 번호가 7521 이거나 7654 또는 7844인 사원을 검색하시오 (IN 연산자)
DESC EMP;

SELECT *
FROM EMP
WHERE EMPNO IN(7521, 7654, 7844);

--부서번호가 20 또는 10이 아닌 사원들을 조회하시오
--  사원명     직업      상사번호    부서번호
DESC EMP;

SELECT ENAME 사원명, JOB 직업, MGR 상사번호, DEPTNO 부서번호
FROM EMP
WHERE DEPTNO NOT IN(10, 20)
OR DEPTNO IS NULL;

SELECT *
FROM EMP;

--데이터베이스에서는 속도가 생명, 조건을 가장 효율적으로 설정하는 것이 매우 중요!!!

--선수 중에서 장씨 성과 박씨 성을 찾으시오
--  선수번호			선수명
SELECT PLAYER_ID 선수번호, PLAYER_NAME 선수명
FROM PLAYER
WHERE PLAYER_NAME LIKE '장%'
OR PLAYER_NAME LIKE '박%';

--사원들 중에서 이름이 3번째 글자가 I인 사람만을 찾으시오
--  사원번호		사원명	
DESC EMP;

SELECT EMPNO 사원번호, ENAME 사원명
FROM EMP
WHERE ENAME LIKE '__I%';

--M과 I를 포함하고 있는 이름 검색
--  사원번호		사원명
SELECT EMPNO 사원번호, ENAME 사원명
FROM EMP
WHERE ENAME LIKE ('%M%') 
AND ENAME LIKE ('%I%');

--SALES로 시작하는 직군을 제외하고 검색
--  사원번호		사원명		직업
SELECT EMPNO 사원번호, ENAME 사원명, JOB 직업
FROM EMP
WHERE JOB NOT LIKE 'SALES%';

--다섯 자리 이름만 검색
--  사원번호		사원명		직업
SELECT EMPNO 사원번호, ENAME 사원명, JOB 직업
FROM EMP
WHERE ENAME LIKE '_____';

--다섯 자리 이름 중 셋 째 자리가 A인 사원만 검색
--  사원번호		사원명		직업
SELECT EMPNO 사원번호, ENAME 사원명, JOB 직업
FROM EMP
WHERE ENAME LIKE '__A__';
		
--부서번호가 30이면서 AM을 포함하고 있는 사원을 검색하시오
--  사원번호		사원명		직업      부서번호
SELECT EMPNO 사원번호, ENAME 사원명, JOB 직업, DEPTNO 부서번호
FROM EMP
WHERE DEPTNO LIKE '30' 
AND ENAME LIKE '%AM%';

--선수 테이블에서 국적이 내국인이 아닌 경우 선수와 국적을 표시하라
--  선수명		국적
SELECT *
FROM PLAYER;

SELECT PLAYER_NAME 선수명, NATION 국적
FROM PLAYER
WHERE NATION IS NOT NULL;

--소속팀이 삼성블루윙즈이거나 전남드래곤즈에 소속된 선수들이어야 하고,
--포지션이 미드필더이어야 한다
--키는 170센티미터 이상이고 180 이하인 선수들을 조회하시오 (증명할 수 있는 코드 포함)
--  선수명		포지션		팀ID		백넘버		키
SELECT *
FROM TEAM;
--TEAM_NAME = 삼성블루윙즈 = TEAM_ID = 'K02'
--TEAM_NAME = 드래곤즈 = TEAM_ID = 'K07'

DESC PLAYER;

SELECT PLAYER_NAME 선수명, POSITION 포지션, TEAM_ID 팀ID, BACK_NO 백넘버, HEIGHT 키
FROM PLAYER
WHERE TEAM_ID = 'K02'
OR TEAM_ID ='K07'
AND POSITION = 'MF'
AND HEIGHT >= 170
AND HEIGHT <= 180;

SELECT PLAYER_NAME 선수명, POSITION 포지션, TEAM_ID 팀ID, BACK_NO 백넘버, HEIGHT 키
FROM PLAYER
WHERE TEAM_ID IN ('K02', 'K07')
AND POSITION = 'MF'
AND HEIGHT BETWEEN 170 AND 180;

--급여가 가장 높은 순으로 출력하고, 숫자가 동일하면 사원명이 빠른 순으로 정렬하시오
--  사원명      급여
DESC EMP;

SELECT ENAME 사원명, SAL 급여
FROM EMP
ORDER BY SAL DESC, ENAME;
			
--부서 번호가 빠른 사원부터 출력하되, 같은 부서 내의 사원을 출력할 경우 최근에 입사한
--사원부터 출력하되 사원 번호, 입사일, 사원명, 급여 컬럼을 출력하시오
SELECT EMPNO "사원 번호", HIREDATE 입사일, ENAME 사원명, SAL 급여
FROM EMP
ORDER BY DEPTNO, HIREDATE DESC;

--키가 큰 순서대로, 키가 같은 경우 백넘버가 빠른 순으로 정렬한다 (키가 NULL인 데이터는 제외)
--  선수명		포지션		백넘버		키
DESC PLAYER;

SELECT PLAYER_NAME 선수명, POSITION 포지션, BACK_NO 백넘버, HEIGHT 키
FROM PLAYER
WHERE HEIGHT IS NOT NULL
ORDER BY HEIGHT DESC, BACK_NO;

--부서명이 빠른 순으로, 그 후 부서 위치 글자가 빠른 순으로, 그 후 부서번호가 큰 순으로 정렬하시오
--  부서명		위치		부서번호
DESC DEPT;

SELECT DNAME 부서명, LOC 위치, DEPTNO 부서번호
FROM DEPT
ORDER BY DNAME, LOC, DEPTNO DESC;

--대문자로 변경
SELECT 'Welcome to Oracle', UPPER('Welcome to Oracle')
FROM DUAL;

--소문자로 변경
SELECT 'Welcome to Oracle', LOWER('Welcome to Oracle')
FROM DUAL;

--문자열 길이
SELECT LENGTH('ORACLE'), LENGTH('오라클')
FROM DUAL;

--바이트 수를 알려주는 함수
SELECT LENGTHB('ORACLE'), LENGTHB('오라클')
FROM DUAL;

--사용자로부터 문자열 입력을 받았다
--사원테이블의 직급이 비밀번호라고 가정하고, 직급을 사용자가 소문자로 manager이라고 입력했다면
--틀린게 아니라 비밀번호가 맞다고 할려고 한다면 어떻게 sql문을 작성하여야 하는가?
--manager인 사원들을 모두 조회하시오
--  사원명		직급
SELECT *
FROM EMP;

SELECT ENAME 사원명, JOB 직급
FROM EMP
WHERE JOB = UPPER('manager');

--경기장의 지역번호와 전화번호를 합친 번호의 길이를 구하시오
--  STADIUM_ID		        TEL					T_LEN
--  D03						063273-1763			11
--	B02						031753-3956			11
--	C06						054282-2002			11
--	,
--	,
--	,
--	F04						055					3
--	F05						031					3
DESC STADIUM;

SELECT *
FROM STADIUM;

SELECT STADIUM_ID, (DDD || TEL) TEL, LENGTH(DDD || TEL) T_LEN
FROM STADIUM;

--------------------------------------------------------------------------------
SELECT 'Welcome to Oracle', SUBSTR('Welcome to Oracle', 4, 3)
FROM DUAL;

--SQL Expert라는 문자열 중 Exp라는 문자열을 출력하시오
SELECT SUBSTR('SQL Expert', 5, 3)
FROM DUAL;
		
--SQL Expert라는 문자열 중 xpert를 대문자로 변경하여 출력하시오
SELECT UPPER(SUBSTR('SQL Expert', 6, 5))
FROM DUAL;

--사원 테이블의 입사년도 컬럼에서 년도와 달을 출력하시오
--  입사년도		년도		달
--				81		02
--				80		12
SELECT * 
FROM EMP;

SELECT HIREDATE 입사년도, SUBSTR(HIREDATE, 1, 2) 년도, SUBSTR(HIREDATE, 4, 2) 달
FROM EMP;
		
--9월에 입사한 사원을 출력하시오
--  사원명     입사년도
SELECT ENAME 사원명, HIREDATE 입사년도
FROM EMP
WHERE SUBSTR(HIREDATE, 4, 2) = '09';

--선수 테이블에서 생년월일이 87년 생인 선수들을 조회하시오
--  선수명   생년월일
SELECT PLAYER_NAME 선수명, BIRTH_DATE 생년월일
FROM PLAYER
WHERE SUBSTR(BIRTH_DATE, 1, 2) = '87';
 	   
--------------------------------------------------------------------------------
SELECT INSTR('Welcome to Oracle', 'o', 1, 1), INSTR('Welcome to Oracle', 'o', 6, 1)
FROM DUAL;

SELECT INSTR('Welcome to Oracle', 'o'),
INSTR('Welcome to Oracle', 'o', 1, 1),
INSTR('Welcome to Oracle', 'o', 6, 1)
FROM DUAL;

--  사원이름(ENAME) 중 세 번째 글자에 'R'이 있는 (이후 글자의 규칙은 없음) 사원을 출력하시오
--	EMPNO       ENAME       (LIKE 없이 구현)
SELECT EMPNO, ENAME
FROM EMP
WHERE INSTR(ENAME, 'R', 3, 1) = 3;

SELECT TRIM('a' from 'aaaaOracleaaaa')
FROM DUAL;

SELECT TRIM('    Oracle    ')
FROM DUAL;

SELECT TRIM('    Oracle    '), length('    Oracle    '),
length(TRIM('    Oracle    '))
FROM DUAL;

SELECT 34.5678, FLOOR(34.5678)
FROM DUAL;

--소수점 둘째 자리까지 표현하시오
SELECT 34.5678, FLOOR(34.5678 * 100) / 100
FROM DUAL;

--3번째 자리에서 반올림
SELECT 34.5678, ROUND(34.5678), ROUND(34.5678, 2)
FROM DUAL;

--34.5678이라는 숫자를 반올림처리하여, 30이라는 숫자가 나오도록 작성하시오
SELECT 34.5678, ROUND(34.5678/10)*10, ROUND(35.5678/10)*10, ROUND(34.5678, -1), ROUND(35.5678, -1)
FROM DUAL;

SELECT 34.5678, TRUNC(34.5678), TRUNC(34.5678, 1), TRUNC(34.5678, -1)
FROM DUAL;

SELECT 27/2, MOD(27, 2), MOD(27, 5)
FROM DUAL;

--사원들의 연봉은 (SAL + 3000)라고 친다
--위와 같은 경우, 각 사원들의 월급은 얼마인지 구하시오
--연봉에서 월급을 구하는데 소수점 2번째 자리에서 반올림
--연봉에서 월급을 구하는데 소수점 2번째 자리에서 내림처리한 결과
--급여가 가장 높은 순으로 정렬
--  ENAME			SAL			연봉			월급(ROUND)		월급(????)
SELECT ENAME, SAL, (SAL + 3000) 연봉,
ROUND((SAL + 3000) / 12, 1) "월급(ROUND)",
TRUNC((SAL + 3000) / 12, 1) "월급(TRUNC)"
FROM EMP
ORDER BY SAL DESC;

--선수들의 키가 짝수인 사람들만 출력하는데, 키가 작은 순으로 정렬하시오
--  선수명     키
SELECT PLAYER_NAME 선수명, HEIGHT 키
FROM PLAYER
WHERE MOD(HEIGHT, 2) = 0 
ORDER BY HEIGHT ASC;

--현재 날짜와 시각을 출력한다
SELECT SYSDATE
FROM DUAL;

SELECT SYSDATE -1 어제, SYSDATE 현재, SYSDATE + 1 내일
FROM DUAL;

--사원들의 경력(년차수)를 구하시오    (365일 기준, 올림)
SELECT EMPNO, ENAME, SYSDATE 현재날짜, HIREDATE 입사날짜,
CEIL((SYSDATE - HIREDATE) / 365) "경력(년차)"
FROM EMP;

SELECT TO_CHAR(12300), TO_CHAR(12300) + 20000, TO_CHAR(12300) * 20000
FROM DUAL;

--------------------------------------------------------------------------------
SELECT ENAME, SAL, TO_CHAR(SAL, 'L999,999')
FROM EMP;

SELECT ENAME, SAL, TO_CHAR(SAL, '00000000'), TO_CHAR(12345, '999,999,999')
FROM EMP;

SELECT TO_CHAR(TO_NUMBER('20,000', '99,999') - TO_NUMBER('10,500', '99,999'), '999,999') 
FROM DUAL;

SELECT SYSDATE, TO_CHAR(SYSDATE, 'YYYY/MM/DD') 날짜, TO_CHAR(SYSDATE, 'YYYY, MON, DAY') 문자형
FROM DUAL;

SELECT SYSDATE, TO_CHAR(SYSDATE, 'YYYY-MM-DD AM HH24:MI:SS')
FROM DUAL;

--이 사원들은 몇 시 분에? 입사했을까?
--사원명   직급  입사날짜        년월일 시분초
--                           ???/??/??  ??,??,??    
SELECT ENAME 사원명, MGR 직급, HIREDATE 입사날짜
    , TO_CHAR(HIREDATE, 'YYYY/MM/DD HH24,MI,SS') "년원일 시분초"
FROM EMP;

SELECT SYSDATE
FROM DUAL;

--현재 날짜를 기준으로 한국사람 전용 달력
--  2023년05월31일 21시08분42초
SELECT SYSDATE "현재 날짜", TO_CHAR(SYSDATE, 'YYYY') ||'년'
    || TO_CHAR(SYSDATE, 'MM') || '월'
    || TO_CHAR(SYSDATE, 'DD') || '일'
    || TO_CHAR(SYSDATE, 'HH24') || '시'
    || TO_CHAR(SYSDATE, 'MI') || '분'
    || TO_CHAR(SYSDATE, 'SS') || '초' "한국사람 전용 달력"
FROM DUAL;

--TO_DATE('문자', 'FORMAT')   (문자는 날짜 형태의 문자만 가능하다)

--1981년10월20일의 DATE을 만들기
SELECT TO_DATE('19811020', 'YYYYMMDD')
FROM DUAL;

SELECT ENAME, HIREDATE
FROM EMP
WHERE HIREDATE = '19811117';

SELECT ENAME, HIREDATE
FROM EMP
WHERE HIREDATE = TO_DATE('1981/11/17', 'YY/MM/DD');

SELECT ENAME, HIREDATE
FROM EMP
WHERE HIREDATE = TO_DATE('19811117', 'YYYYMMDD');

CREATE TABLE DATE_TEST_EMP
AS
SELECT EMPNO, ENAME, HIREDATE
FROM EMP;

SELECT *
FROM DATE_TEST_EMP;

DESC DATE_TEST_EMP;

INSERT INTO DATE_TEST_EMP
VALUES(1, '자바', '20230601');

SELECT EMPNO, ENAME, HIREDATE, TO_CHAR(HIREDATE, 'YYYYMMDD HH24:MI:SS')
FROM DATE_TEST_EMP;

INSERT INTO DATE_TEST_EMP
VALUES(1, '자바', '20230601 14:19:30');

INSERT INTO DATE_TEST_EMP
VALUES(1, '자바', TO_DATE('20230603 07:10:30', 'YYYYMMDD HH24:MI:SS'));

INSERT INTO DATE_TEST_EMP
VALUES(1, '자바', TO_DATE('20230603 071030', 'YYYYMMDD HH24MISS'));

SELECT EMPNO, ENAME, SYSDATE 현재날짜, HIREDATE 입사날짜,
CEIL((SYSDATE - HIREDATE) / 365) "경력(년차)"
FROM EMP;

--시간은 금이다   1시간?  초??
SELECT 1 시간, 60 분, 60*60 초
FROM DUAL;

--1년을 기준으로  (일, 시, 분, 초)
SELECT (1*365) 일, (1*365*24) 시, (1*365*24*60) 분, (1*365*24*60*60) 초
FROM DUAL;

--8760 + 525600
SELECT (8760 + 525600) 원본, (8760 + 525600) / (60*60) 시
FROM DUAL;

--미국 달러를 한국	원화로, 한국 원화를 미국 달러로 변환해주는 SQL문
SELECT '1원 = 0.00076달러 / 1달러 = 1322.84원' 기준환율,
123 "소지금(달러)", TRUNC(123 * 1322.84, 2) "소지금환율(원-달러)",
12345 "소지금(원)", TRUNC(12345 * 0.00076, 2) "소지금환율(달러-원)"
FROM DUAL;
			
--여행가고 싶은 나라? 스웨덴 원화로 변환
SELECT '1원 = 0.0082크로나 / 1크로나 = 121.83원' 기준환율,
123 "소지금(크로나)", TRUNC(123 * 121.83, 2) "소지금환율(원-크로나)",
12345 "소지금(원)", TRUNC(12345 * 0.0082, 2) "소지금환율(크로나-원)"
FROM DUAL;

SELECT SYSDATE, SYSDATE - 365, TO_CHAR(SYSDATE - 365, 'YYYYMMDD HH24:MI:SS'),
SYSDATE - (9/24), TO_CHAR(SYSDATE - (9/24), 'YYYYMMDD HH24:MI:SS')
FROM DUAL;

SELECT ENAME, SYSDATE - HIREDATE
FROM EMP;

SELECT *
FROM DATE_TEST_EMP;

DESC DATE_TEST_EMP;

INSERT INTO DATE_TEST_EMP
VALUES(10, '개발자2', TO_DATE('20130608 071030', 'YYYYMMDD HH24MISS'));

INSERT INTO DATE_TEST_EMP
VALUES(13, '개발자3', TO_DATE('20210608 071030', 'YYYYMMDD HH24MISS'));

INSERT INTO DATE_TEST_EMP
VALUES(14, '개발자4', TO_DATE('20210508 071030', 'YYYYMMDD HH24MISS'));

INSERT INTO DATE_TEST_EMP
VALUES(15, '개발자5', TO_DATE('20010608 071030', 'YYYYMMDD HH24MISS'));

INSERT INTO DATE_TEST_EMP
VALUES(16, '개발자6', TO_DATE('20010508 071030', 'YYYYMMDD HH24MISS'));

SELECT ENAME 사원명, TO_CHAR(HIREDATE,'YYYY/MM/DD HH24:MI:SS') 입사일자,
TO_DATE('20110601 10:00:00', 'YYYYMMDD HH24:MI:SS') 기준날짜,

CEIL((TO_DATE('20110601 10:00:00', 'YYYYMMDD HH24:MI:SS') - HIREDATE) / 365) 연차,
TRUNC(((TO_DATE('20110601 10:00:00', 'YYYYMMDD HH24:MI:SS') - HIREDATE) / 365), 0) "근무기간(년)",
TRUNC(((((TO_DATE('20110601 10:00:00', 'YYYYMMDD HH24:MI:SS') - HIREDATE) / 365) - TRUNC((TO_DATE('20110601 10:00:00', 'YYYYMMDD HH24:MI:SS') - HIREDATE) / 365, 0)) * 365), 0) "추가 근무기간(일)"
FROM DATE_TEST_EMP;

-- 20001101 07:00:00    -  20001101 06:00:00
-- 20001101 07:00:00    -  20001101 08:00:00
DESC DATE_TEST_EMP;

SELECT *
FROM DATE_TEST_EMP;

ROLLBACK;

INSERT INTO DATE_TEST_EMP
VALUE(EMPNO, ENAME, HIREDATE)
VALUES(100, 'AAA', TO_DATE('20001101 07:00:00', 'YYYYMMDD HH24:MI:SS'));

SELECT *
FROM DATE_TEST_EMP
ORDER BY HIREDATE DESC;

SELECT TO_DATE('20001101 07:00:00', 'YYYYMMDD HH24:MI:SS') 입사날짜
FROM DUAL;

SELECT TO_DATE('20001101 07:00:00', 'YYYYMMDD HH24:MI:SS') 입사날짜,
    TO_DATE('20011101 07:00:00', 'YYYYMMDD HH24:MI:SS')
    - TO_DATE('20001101 07:00:00', 'YYYYMMDD HH24:MI:SS') 지난일수
FROM DUAL;

SELECT 365 / 365 년
FROM DAUL;

SELECT TO_DATE('20001101 07:00:00', 'YYYYMMDD HH24:MI:SS') 입사날짜,
    TO_DATE('20011101 07:00:00', 'YYYYMMDD HH24:MI:SS')
    - TO_DATE('20001101 07:00:00', 'YYYYMMDD HH24:MI:SS') 지난일수,
    TO_NUMBER(TO_DATE('20020501 07:00:00', 'YYYYMMDD HH24:MI:SS')
    - TO_DATE('20001101 07:00:00', 'YYYYMMDD HH24:MI:SS')) / 365 AS 년
FROM DUAL;

SELECT TO_NUMBER(TO_CHAR(TO_DATE('20011101 07:00:00', 'YYYYMMDD HH24:MI:SS')
    - TO_DATE('20001101 07:00:00', 'YYYYMMDD HH24:MI:SS'))) / 365 AS 년
FROM DUAL;

SELECT TO_DATE('20001101 07:00:00', 'YYYYMMDD HH24:MI:SS') 입사날짜,
    TO_DATE('20011101 07:00:00', 'YYYYMMDD HH24:MI:SS')
    - TO_DATE('20001101 07:00:00', 'YYYYMMDD HH24:MI:SS') 지난일수,
    CEIL(TO_NUMBER(TO_DATE('20010501 07:00:00', 'YYYYMMDD HH24:MI:SS')
    - TO_DATE('20001101 07:00:00', 'YYYYMMDD HH24:MI:SS')) / 365) AS 년
FROM DUAL;

SELECT EMPNO, ENAME, HIREDATE,
    CEIL(TO_NUMBER(TO_DATE('19820122 07:00:00', 'YYYYMMDD HH24:MI:SS')
    - HIREDATE) / 365) 년차
FROM DATE_TEST_EMP
ORDER BY HIREDATE DESC;

SELECT ENAME, HIREDATE, ADD_MONTHS(HIREDATE, 6)
FROM EMP;

SELECT HIREDATE, EXTRACT(DAY FROM HIREDATE) 입사일
FROM EMP;

SELECT NULL, NVL(NULL, 'NVL-OK'), NVL(NULL, 10), NVL(NULL, 10) + 10,
    NULL + 10, NVL('KYW', 'NVL-OK')
FROM DUAL;

--성남 일화천마 소속 선수의 이름과 포지션을 출력하는데
--포지션이 없는 경우, 없음 이라고 표시되도록 출력하시오
--포지션이 느린 순으로 출력하시오
--  선수명		소속팀ID			포지션
SELECT *
FROM TEAM;
--TEAM_ID = K08 (성남 일화천마)

SELECT PLAYER_NAME 선수명, TEAM_ID 소속팀ID, NVL(POSITION, '없음') 포지션
FROM PLAYER
WHERE TEAM_ID = 'K08'
ORDER BY POSITION DESC;

SELECT EMPNO, ENAME, COMM, DEPTNO, NVL(ENAME, '넌 이름도 몰라?'), NVL(DEPTNO, 99)
FROM EMP;

--사원의 연봉과 상여금(COMM)을 포함한 금액을 구하시오. NULL은 0원이다
--제일 많은 금액을 받는 사원부터 출력하시오
--  사원명     월급      연봉      COMM    연봉+상여금
SELECT ENAME 사원명, SAL 월급, (SAL * 12) 연봉, NVL(COMM, 0) COMM, ((SAL * 12) + NVL(COMM, 0)) "연봉+상여금"
FROM EMP
ORDER BY "연봉+상여금" DESC;

--상관이 없는 사원을 출력하되, MGR이 NULL 대신 CEO라고 출력되도록 하시오
--  사원번호    사원명     MANAGER(상사)
SELECT *
FROM EMP;

SELECT EMPNO 사원번호, ENAME 사원명, NVL(TO_CHAR(MGR), 'CEO') "MANAGER(상사)"
FROM EMP
WHERE MGR IS NULL;

--------------------------------------------------------------------------------
SELECT DEPTNO,
    DECODE(
        DEPTNO, 10, 'A',
                20, 'B',
                'DEFAULT'
    ) 조건문
FROM EMP
ORDER BY DEPTNO;

SELECT ENAME, DEPTNO,
    CASE	WHEN DEPTNO = 10 THEN 'ACCOUNTING'
            WHEN DEPTNO = 20 THEN 'RESEARCH'
            WHEN DEPTNO = 30 THEN 'SALES'
            ELSE 'OPERATIONS'
	END 부서명
FROM EMP;

--사원 중 직급이 ANALYST면 5%, CLERK면 15%, SALESMAN면 10%, MANAGER면 20% 인상 시킨다
--  사원번호		사원명		JOB		SAL		UPSAL
--UPSAL이 가장 높은 사람순으로 출력하되, 소수점 3번째 자리에서 올림 처리하시오
SELECT *
FROM EMP;

SELECT EMPNO 사원번호, ENAME 사원명, JOB, SAL, CEIL(
    CASE	WHEN JOB = 'ANALYST' THEN SAL * (1 + 0.05)
            WHEN JOB = 'CLERK' THEN SAL * (1 + 0.15)
            WHEN JOB = 'SALESMAN' THEN SAL * (1 + 0.1)
            WHEN JOB = 'MANAGER' THEN SAL * (1 + 0.2)
            ELSE SAL
        END * 100) / 100 UPSAL
FROM EMP
ORDER BY UPSAL DESC;
		
--사원의 급여가 2000 이상인 사원들은 상, 1000 이상인 사원들은 중,
--그 아래 사원들은 하로 급여등급을 출력하고, 급여가 가장 적은 사람 순으로 출력하시오
--  사원명     급여      SALARY_GRADE
SELECT *
FROM EMP;		

SELECT ENAME 사원명, SAL 급여,
    CASE	WHEN SAL >= 2000 THEN '상'
            WHEN SAL >= 1000 THEN '중'
            ELSE '하'
	END "SALARY_GRADE"
FROM EMP
ORDER BY SAL ASC;

--부서 정보에서 부서 위치를 미국의 동부, 중부, 서부로 구분하시오
--  부서명       LOC       AREA
--  NEW YORK    EAST
--	DALLAS		CENTER
--	CHICAGO		CENTER
--	BOSTON		EAST
SELECT * 
FROM DEPT;

SELECT DNAME 부서명, LOC,
    CASE	WHEN LOC = 'NEW YORK' THEN 'EAST'
            WHEN LOC = 'DALLAS' THEN 'CENTER'
            WHEN LOC = 'CHICAGO' THEN 'CENTER'
            WHEN LOC = 'BOSTON' THEN 'EAST'
	END AREA
FROM DEPT;

SELECT SUM(SAL)
FROM EMP;

--전체 사원의 평균급여를 구하시오(소수점1의 자리수 까지 구하시오 내림처리)
--  평균급여
SELECT TRUNC(AVG(SAL), 1) 평균급여
FROM EMP;
		
--선수들 중 가장 나이가 많은 사람의 생년월일을 구하시오
--  최고참선수_생년월일
SELECT MIN(BIRTH_DATE) "최고참선수_생년월일"
FROM PLAYER;

--선수들 평균 몸무게를 구하시오
--  평균몸무게
SELECT AVG(NVL(WEIGHT, 0)) 평균몸무게
FROM PLAYER;

--GROUP BY
SELECT POSITION, AVG(HEIGHT) 평균키
FROM PLAYER
GROUP BY POSITION;

--사원 테이블 전체 수, COMM을 받는 사원의 수, 직업의 갯수, 실제 직업 값이 있는 수
SELECT COUNT(*), COUNT(COMM), COUNT(JOB), COUNT(DISTINCT JOB)
FROM EMP;

--부서번호별 최대급여		최소급여
--  부서번호를 오름차순 하시오
SELECT DEPTNO 부서번호, MAX(SAL) 최대급여, MIN(SAL) 최소급여 
FROM EMP
GROUP BY DEPTNO
ORDER BY DEPTNO;
		
--선수들의 팀별 총 선수의 수와 닉네임이 존재하지 않는 선수의 수를 출력하시오
--  별칭없는 컬럼명			총선수의수			닉네임x수
--총 선수의 수가 가장 많은 순으로 정렬
SELECT *
FROM PLAYER;

SELECT TEAM_ID, COUNT(PLAYER_NAME) 총선수의수, COUNT(PLAYER_NAME) - COUNT(NICKNAME) "닉네임X수" 
FROM PLAYER
GROUP BY TEAM_ID
ORDER BY COUNT(PLAYER_NAME) DESC;

--부서 번호별 평균급여가 2000이상인 부서번호와 평균급여를 구하시오
SELECT DEPTNO, AVG(SAL)
FROM EMP
GROUP BY DEPTNO
HAVING AVG(SAL) >= 2000;

--HAVING절에서 일반적으로 그룹함수를 적용한 컬럼이 조건으로 온다
--WHERE 절은 단순컬럼들이 온다

--부서의 최댓값과 최솟값을 구하되, 최대 급여가 2900 초과인 부서만 출력하시오 (부서번호가 빠른 순으로)
--  부서번호        MAX         MIN
SELECT DEPTNO, MAX(SAL), MIN(SAL)
FROM EMP
GROUP BY DEPTNO
HAVING MAX(SAL) > 2900
ORDER BY DEPTNO;
	
--선수테이블에서 포지션별 키의 최대, 최소, 평균 값을 출력하시오 (NULL값이 있는 경우 150를 적용) 
--  포지션			인원수			키대상		최대키		최소키			일반평균키		NULL적용평균키
SELECT POSITION 포지션, COUNT(PLAYER_ID) 인원수,
COUNT(HEIGHT) 키대상, MAX(HEIGHT)최대키, MIN(HEIGHT) 최소키,
AVG(HEIGHT) 일반평균키, AVG(NVL(HEIGHT, 150)) null적용평균키
FROM PLAYER
GROUP BY POSITION;

--평균키가 180이상인 포지션별 평균키를 반올림으로 소수점 3번째 자리에서 적용한 값을 구하시오
--  포지션     평균키
SELECT POSITION 포지션, ROUND(AVG(HEIGHT), 2) 평균키
FROM PLAYER
GROUP BY POSITION
HAVING AVG(HEIGHT) >= 180;

--선수들 중 삼성블루윙즈와 fc서울의 인원수는 얼마인가?
--  팀ID     인원수
SELECT *
FROM TEAM;
-- 수원 삼성블루윙즈(K02), FC서울(K09)

SELECT *
FROM PLAYER;

SELECT TEAM_ID 팀ID, COUNT(PLAYER_NAME) 인원수
FROM PLAYER
GROUP BY TEAM_ID
HAVING TEAM_ID = 'K02'
OR TEAM_ID = 'K09';

--포지션별 평균키만 출력하는데, 최대키가 190 이상인 선수를 가지고 있는 포지션의 정보만 출력하시오
--  포지션     평균키
SELECT POSITION 포지션, AVG(HEIGHT) 평균키
FROM PLAYER
GROUP BY POSITION
HAVING MAX(HEIGHT) >= 190;

SELECT *
FROM EMP
WHERE ROWNUM = 1;

SELECT *
FROM EMP
WHERE ROWNUM <= 3;

--SMITH 사원의 부서명은 무엇인가?
SELECT DEPTNO
FROM EMP
WHERE ENAME = 'SMITH';

SELECT DNAME
FROM DEPT
WHERE DEPTNO = 20;

SELECT ENAME, DNAME
FROM EMP, DEPT
WHERE EMP.DEPTNO = DEPT.DEPTNO
and ENAME = 'SMITH';

--사원과 부서의 정보를 모두 출력하시오
SELECT *
FROM EMP, DEPT
WHERE EMP.DEPTNO = DEPT.DEPTNO;

--ACCOUNTING 부서 소속 사원의 이름과 입사일을 출력하시오
--  사원명     부서명     입사일 (1989-02-01 같은 느낌)
DESC EMP;

DESC DEPT;

SELECT EMP.ENAME 사원명, DEPT.DNAME 부서명, TO_CHAR(EMP.HIREDATE, 'YYYY-MM-DD') 입사일
FROM EMP, DEPT
WHERE EMP.DEPTNO = DEPT.DEPTNO
AND DEPT.DNAME = 'ACCOUNTING';
			
--직급이 MANAGER인 사원의 이름, 부서명을 출력하시오
--  사원번호		사원명		직급		부서번호		부서명
DESC EMP;

DESC DEPT;

SELECT EMP.EMPNO 사원번호, EMP.ENAME 사원명, JOB 직급, EMP.DEPTNO 부서번호, DEPT.DNAME 부서명
FROM EMP, DEPT
WHERE EMP.DEPTNO = DEPT.DEPTNO
AND EMP.JOB = 'MANAGER';

--DML 다룬다?
--DDL 구성?
--데이터베이스 제약조건

--제약 조건 확인하기
SELECT *
FROM USER_CONSTRAINTS;

--SYSTEM에서 전체 제약조건 확인 가능
SELECT *
FROM DBA_CONSTRAINTS;

--생성, 조회 등 테이블 명은 항상 대문자로!!! 
SELECT *
FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'EMP';

SELECT *
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
AND E.ENAME = 'SMITH';

--부서테이블 기본키
ALTER TABLE DEPT
ADD CONSTRAINT DEPT_DEPTNO_PK PRIMARY KEY(DEPTNO);

--사원테이블 외래키
DESC EMP;

ALTER TABLE EMP
ADD CONSTRAINT EMP_DEPT_DEPTNO_FK
FOREIGN KEY(DEPTNO) REFERENCES DEPT(DEPTNO);
--         나의 컬럼             케이블명(부모테이블의 컬럼)

SELECT *
FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'EMP'
OR TABLE_NAME = 'DEPT';

--포지션이 골키퍼(GK)인 선수들에 대한 데이터만을 백넘버 순으로 출력하시오
--  선수명		백넘버		연고지(REGION_NAME)		팀명
DESC PLAYER;

DESC TEAM;

SELECT P.PLAYER_NAME 선수명, P.BACK_NO 백넘버, T.REGION_NAME "연고지(REGION_NAME)", T.TEAM_NAME 팀명
FROM PLAYER P, TEAM T
WHERE P.TEAM_ID = T.TEAM_ID
AND P.POSITION = 'GK'
ORDER BY P.BACK_NO;

--팀 테이블과 구장 테이블의 관계를 이용해서 구하시오
--소속팀이 가지고 있는 전용구장의 정보를 팀의 정보와 함게 출력하시오
--연고지가 빠른 순으로 정렬
--  연고지   팀명         STADIUM_ID      STADIUM_NAME   좌석수
--ex) 전북    현대모터스   D03             전주월드컵경기장  28,000                              
DESC TEAM;

DESC STADIUM;

SELECT T.REGION_NAME 연고지, T.TEAM_NAME 팀명, T.STADIUM_ID, S.STADIUM_NAME, TO_CHAR(S.SEAT_COUNT, '999,999') 좌석수
FROM TEAM T, STADIUM S
WHERE T.STADIUM_ID = S.STADIUM_ID
ORDER BY T.REGION_NAME;

SELECT ENAME, SAL, GRADE
FROM EMP E, SALGRADE S
WHERE SAL >= LOSAL
AND SAL <= HISAL;

--셀프조인
SELECT *
FROM EMP;

SELECT EMPLOYEE.EMPNO 내사원번호, EMPLOYEE.ENAME, EMPLOYEE.MGR
    , MANAGER.ENAME 상사이름, MANAGER.EMPNO 상사사원번호
FROM EMP EMPLOYEE, EMP MANAGER
WHERE EMPLOYEE.MGR = MANAGER.EMPNO;

--'SMITH의 상사는 ???입니다' 라고 출력되도록 하시오
--정렬은 사원이름순으로 한다
--  사원명		상사명		사원과 상사의 정보
SELECT *
FROM EMP;

SELECT EMPLOYEE.ENAME 사원명, MANAGER.ENAME 상사명, EMPLOYEE.ENAME || '의 상사는 ' || MANAGER.ENAME || '입니다' "사원과 상사의 정보"
FROM EMP EMPLOYEE, EMP MANAGER                  -- ('EMPLOYEE'와 'MANAGER' 이름의) EMP테이블 2개를 준비했다   
WHERE EMPLOYEE.MGR = MANAGER.EMPNO              -- '사원의 상사번호'와 '상사의 사원번호'를 '조인'했다
ORDER BY 사원명;                                 -- '사원명', '상사명', '사원과 상사의 정보' 컬럼을 출력했다
                                                -- '사원명'을 기준으로 정렬했다
--매니저가 KING인 사원들의 이름과 직급을 출력하시오
--  WORK_NAME		WORK_JOB			상사명
SELECT EMPLOYEE.ENAME "WORK_NAME", EMPLOYEE.JOB "WORK_JOB", MANAGER.ENAME 상사명
FROM EMP EMPLOYEE, EMP MANAGER                  -- ('EMPLOYEE'와 'MANAGER' 이름의) EMP테이블 2개를 준비했다
WHERE EMPLOYEE.MGR = MANAGER.EMPNO              -- '사원의 상사번호'와 '상사의 사원번호'를 '조인'했다
AND MANAGER.ENAME = 'KING';                     -- 상사의 이름이 'KING'이라는 '조건을 설정'했다.
                                                -- 'WORK_NAME(사원의 이름)', 'WORK_JOB(사원의 직급)', '상사명' 컬럼을 출력했다
--SMITH와 같은 근무지에서 근무하는 사원을 출력하시오
--  SMITH사원명			동료사원명		
SELECT EMPLOYEE.ENAME SMITH사원명, COLLEAGUE.ENAME 동료사원명
FROM EMP EMPLOYEE, EMP COLLEAGUE                -- ('EMPLOYEE'와 'COLLEAGUE' 이름의) EMP테이블 2개를 준비했다
WHERE EMPLOYEE.DEPTNO = COLLEAGUE.DEPTNO        -- '사원의 부서번호'와 '동료의 부서번호'를 '조인'했다
AND EMPLOYEE.ENAME = 'SMITH'                    -- 사원의 이름이 'SMITH'이라는 '조건을 설정'했다.
AND EMPLOYEE.ENAME <> COLLEAGUE.ENAME;          -- 사원의 이름과 동료의 이름이 같지 않다는 '조건을 설정'했다.
                                                -- 'SMITH사원명', '동료사원명' 컬럼을 출력했다
--ESCAPE 문자
SELECT *
FROM EMP
WHERE ENAME LIKE '%\%' ESCAPE '\';

--사원과 부서의 정보를 모두 출력하라
--사원의 정보를 표현하는데 사원이 없는 부서의 정보도 모두 출력하시오
SELECT *
FROM EMP E, DEPT D
WHERE E.DEPTNO(+) = D.DEPTNO;

SELECT *
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO(+);

--상사와 사원이 존재한다
--상사가 있는 사원들과 상사가 존재하지 않는 사원들의 정보를 모두 출력하시오
--  일반사원    직장상사                      직장상사의 번호
--  SMITH      JONES                       1234
--	???        NULL은 상사 없음으로 출력하시오  NULL은 0
SELECT E.ENAME 일반사원, NVL(M.ENAME, '상사 없음') 직장상사
    , NVL(M.MGR, 0) "직장상사의 상사번호"
FROM EMP E, EMP M
WHERE E.MGR = M.EMPNO(+);

--경기장에 등록된 운동장 중에 홈팀이 없는 경기장도 출력하시오
--홈팀ID로 오름차순하시오
--  경기장명   경기장ID      좌석수   HOMETEAM_ID      팀명
SELECT *
FROM TEAM;

SELECT *
FROM STADIUM;

SELECT S.STADIUM_NAME 경기장명, S.STADIUM_ID 경기장ID
    , S.SEAT_COUNT 좌석수, S.HOMETEAM_ID, T.TEAM_NAME 팀명
FROM STADIUM S, TEAM T
WHERE T.STADIUM_ID(+) = S.STADIUM_ID
ORDER BY HOMETEAM_ID;

--2개 테이블 조작?    3개 테이블 조작?
SELECT P.PLAYER_NAME 선수명, P.POSITION, T.REGION_NAME, T.TEAM_NAME, S.STADIUM_NAME
FROM PLAYER P, TEAM T, STADIUM S
WHERE P.TEAM_ID = T.TEAM_ID
AND T.STADIUM_ID = S.STADIUM_ID
ORDER BY P.POSITION;

--INNER JOIN(내부 조인)이라고 부른다 (동등 조인과 같다)
SELECT *
FROM EMP E INNER JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
AND E.SAL >= 2000;

--다중조인 ANSI 방법
SELECT P.PLAYER_NAME 선수명, P.POSITION, T.REGION_NAME, T.TEAM_NAME, S.STADIUM_NAME
FROM PLAYER P INNER JOIN TEAM T
ON P.TEAM_ID = T.TEAM_ID
JOIN STADIUM S
ON T.STADIUM_ID = S.STADIUM_ID
ORDER BY 선수명;

--포지션이 GK가 아닌 선수들, 팀이 삼성블루윙즈인 선수들에 대해 출력하시오
--선수명이 느린 순으로 출력
--  선수명		백넘버		포지션	팀명
SELECT P.PLAYER_NAME 선수명, P.BACK_NO 백넘버, P.POSITION 포지션, T.TEAM_NAME 팀명
FROM PLAYER P INNER JOIN TEAM T
ON P.TEAM_ID = T.TEAM_ID
WHERE P.POSITION <> 'GK'
AND T.TEAM_NAME = '삼성블루윙즈'
ORDER BY 선수명 DESC;

--소속팀이 가지고 있는 전용구장 중 좌석수가 50000 이상인 전용구장만 출력하시오
--좌석수가 큰 순으로 출력
--  팀번호   팀명      경기장ID      경기장명   좌석수
SELECT T.TEAM_ID 팀번호, T.TEAM_NAME 팀명, T.STADIUM_ID 경기장ID, S.STADIUM_NAME 경기장명, S.SEAT_COUNT 좌석수    
FROM TEAM T INNER JOIN STADIUM S
ON T.STADIUM_ID = S.STADIUM_ID
AND S.SEAT_COUNT >= 50000
ORDER BY 좌석수 DESC;

--사원들의 급여 중 1~2등급인 사원들의 정보를 출력하시오
--급여가 낮은 사원부터 출력되도록 하시오
--  사원번호    사원명     직급      급여      급여등급    낮은값(LOSAL)      큰값(HISAL)	
SELECT *
FROM EMP;

SELECT *
FROM SALGRADE;

SELECT E.EMPNO 사원번호, E.ENAME 사원명, E.JOB 직급
    , E.SAL 급여, S.GRADE 급여등급, S.LOSAL 낮은값, S.HISAL 큰값	   
FROM EMP E INNER JOIN SALGRADE S
ON E.SAL >= S.LOSAL
AND E.SAL <= S.HISAL
WHERE S.GRADE <= 2
ORDER BY 급여;

--홈팀이 3점 이상 차이로 승리한 경기의 경기장 이름, 경기 일정,
--홈팀 이름과 원정팀 이름 정보를 출력하시오
--  경기장 ID		경기장명		경기날짜		팀명		상대팀명		HOME_SCORE		AWAY_SCORE
DESC TEAM;

DESC STADIUM;

DESC SCHEDULE;

SELECT S.STADIUM_ID "경기장 ID", S.STADIUM_NAME 경기장명
    , TO_CHAR(TO_DATE(SC.SCHE_DATE, 'YYYY-MM-DD'), 'YYYY-MM-DD') 경기날짜, T.TEAM_NAME 팀명
    , D.TEAM_NAME 상대팀명, SC.HOME_SCORE "HOME_SCORE", SC.AWAY_SCORE "AWAY_SCORE" 
FROM STADIUM S INNER JOIN SCHEDULE SC
ON S.STADIUM_ID = SC.STADIUM_ID
JOIN TEAM T
ON T.STADIUM_ID = S.STADIUM_ID
JOIN TEAM D
ON SC.AWAYTEAM_ID = D.TEAM_ID
WHERE SC.HOME_SCORE - SC.AWAY_SCORE >= 3;

SELECT *
FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'TEAM'
OR TABLE_NAME = 'STADIUM'
OR TABLE_NAME = 'SCHEDULE';

DESC USER_CONSTRAINTS;

--
DESC TEAM;

DESC STADIUM;

DESC SCHEDULE;

SELECT S.STADIUM_ID, S.STADIUM_NAME, SC.SCHE_DATE, T.TEAM_NAME, AT.TEAM_NAME
    , SC.HOME_SCORE, SC.AWAY_SCORE
FROM STADIUM S, SCHEDULE SC, TEAM T, TEAM AT
WHERE S.STADIUM_ID = SC.STADIUM_ID
AND SC.HOMETEAM_ID = T.TEAM_ID
AND SC.AWAYTEAM_ID = AT.TEAM_ID
AND SC.HOME_SCORE >= SC.AWAY_SCORE + 3;

--
SELECT SD.STADIUM_ID AS 경기장ID, SD.STADIUM_NAME AS 경기장명
    , TO_CHAR(TO_DATE(SC.SCHE_DATE), 'YYYY-MM-DD') AS 경기날짜 
    , T.TEAM_NAME AS 팀명, T2.TEAM_NAME AS 상대팀명, SC.HOME_SCORE, SC.AWAY_SCORE
FROM TEAM T, TEAM T2, STADIUM SD, SCHEDULE SC
WHERE SC.STADIUM_ID = SD.STADIUM_ID
AND SD.STADIUM_ID = T.STADIUM_ID
AND (SC.HOME_SCORE - SC.AWAY_SCORE) >= 3
AND SC.HOMETEAM_ID = T.TEAM_ID
AND SC.AWAYTEAM_ID = T2.TEAM_ID;

--ANSI표준 CROSS JOIN
SELECT E.ENAME, D.DNAME
FROM EMP E CROSS JOIN DEPT D
ORDER BY E.ENAME;

--ORACLE CROSS JOIN
SELECT E.ENAME, D.DNAME
FROM EMP E, DEPT D
ORDER BY E.ENAME;

CREATE TABLE DEPT01(
    DEPTNO NUMBER(2),
    DNAME VARCHAR2(100)
);

INSERT INTO DEPT01
VALUES(10, 'ACCOUNTING');

INSERT INTO DEPT01
VALUES(20, 'RESEARCH');

CREATE TABLE DEPT02
AS
SELECT *
FROM DEPT01;

INSERT INTO DEPT02
VALUES(10, 'ACCOUNTING');

INSERT INTO DEPT02
VALUES(30, 'SALES');

SELECT *
FROM DEPT01;

SELECT *
FROM DEPT02;

SELECT *
FROM DEPT01 D, DEPT02 D2
WHERE D.DEPTNO = D2.DEPTNO(+);

--ANSI표준 OUTER JOIN
SELECT *
FROM DEPT01 D LEFT OUTER JOIN DEPT02 D2
ON D.DEPTNO = D2.DEPTNO;

SELECT *
FROM DEPT01 D RIGHT OUTER JOIN DEPT02 D2
ON D.DEPTNO = D2.DEPTNO;

SELECT *
FROM DEPT01 D FULL OUTER JOIN DEPT02 D2
ON D.DEPTNO = D2.DEPTNO;

--스타디움에 등록된 운동장 중에 홈팀이 없는 경기장도 있다
--홈팀이 없는 경기장을 출력하시오 (ANSI 표준 조인 LEFT)
--  경기장명    팀명
DESC TEAM;

DESC STADIUM;

SELECT S.STADIUM_NAME 경기장명, T.TEAM_NAME 팀명 
FROM TEAM T LEFT OUTER JOIN STADIUM S
ON T.STADIUM_ID = S.STADIUM_ID;

--DEPT에 등록된 부서 중에 사원이 없는 부서를 출력하시오 (ANSI 표준 조인 RIGHT)
DESC EMP;

DESC DEPT;

SELECT D.DNAME 부서이름, E.ENAME 사원명 
FROM EMP E RIGHT OUTER JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
WHERE E.DEPTNO IS NULL;

--상사들 중에 아랫사원들의 정보와 아랫사원이 존재하지 않는 사원들을 출력하시오
--  상사정보    아랫사원 정보(NULL)    (ANSI 표준 조인 ??????)
DESC EMP;

SELECT D.ENAME 상사정보, e.ENAME "아랫사원 정보" 
FROM EMP E FULL OUTER JOIN EMP D
ON E.MGR = D.EMPNO;

--MARTIN의 부서위치는 어디인가?	
DESC EMP;

DESC DEPT;

SELECT E.ENAME 이름, D.LOC 부서위치
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
AND ENAME = 'MARTIN';

--서브쿼리
SELECT LOC
FROM DEPT
WHERE DEPTNO = (SELECT DEPTNO
                FROM EMP
                WHERE ENAME = 'MARTIN');

--SMITH와 같은 부서에서 근무하는 사원의 이름과 부서의 번호를 출력하시오
--  사원번호        사원명     DEPTNO
SELECT *
FROM EMP;

SELECT *
FROM DEPT;

--서브쿼리  VS  조인
SELECT EMPNO 사원번호, ENAME 사원명, DEPTNO
FROM EMP
WHERE DEPTNO = (SELECT DEPTNO
                FROM EMP
                WHERE ENAME = 'SMITH')
AND ENAME <> 'SMITH';  

SELECT E.EMPNO 사원번호, E.ENAME 사원명, E.DEPTNO
FROM EMP E INNER JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
AND E.DEPTNO = 20
AND ENAME <> 'SMITH';

--FORD와 동일한 직급을 가진 사원을 출력하시오
--  전체 컬럼
SELECT *
FROM EMP
WHERE JOB = (SELECT JOB
             FROM EMP
             WHERE ENAME = 'FORD')
AND ENAME <> 'FORD';

SELECT *
FROM EMP E INNER JOIN EMP M
ON E.EMPNO = M.EMPNO
AND E.JOB = 'ANALYST'
AND E.ENAME <> 'FORD';  
		
--FORD의 급여와 동일하거나 더 많이 받는 사원명의 급여를 출력하시오
--  사원번호    사원명     급여
SELECT EMPNO 사원번호, ENAME 사원명, SAL 급여
FROM EMP
WHERE SAL >= (SELECT SAL
              FROM EMP
              WHERE ENAME = 'FORD')
AND ENAME <> 'FORD';

SELECT *
FROM EMP E INNER JOIN EMP M
ON E.EMPNO = M.EMPNO
AND E.SAL >= '3000'
AND E.ENAME <> 'FORD';

--정남일 선수가 소속된 팀의 선수들에 대한 정보를 표시하시오
--서브쿼리, 백넘버를 내림차순으로 하시오
--  선수번호    선수명     포지션
DESC TEAM;

DESC PLAYER;
            
SELECT PLAYER_ID 선수번호, PLAYER_NAME 선수명, POSITION 포지션, BACK_NO 백넘버
FROM PLAYER
WHERE TEAM_ID = (SELECT TEAM_ID
                 FROM PLAYER
                 WHERE PLAYER_NAME = '정남일')
ORDER BY BACK_NO DESC;
                
SELECT P.PLAYER_ID 선수번호, P.PLAYER_NAME 선수명, P.POSITION 포지션, P.BACK_NO 백넘버
FROM PLAYER P INNER JOIN PLAYER P2
ON P.TEAM_ID = P2.TEAM_ID
AND P.PLYAER_NAME = '정남일'
ORDER BY BACK_NO DESC;

SELECT T.TEAM_ID AS 팀ID, T.TEAM_NAME AS 팀명
    ,P.*
FROM TEAM T JOIN PLAYER P
ON T.TEAM_ID = P.TEAM_ID
WHERE P.TEAM_ID = ( SELECT TEAM_ID
                    FROM PLAYER
                    WHERE PLAYER_NAME = '정남일')
ORDER BY P.BACK_NO;

SELECT T.TEAM_ID AS 팀ID, T.TEAM_NAME AS 팀명
    ,P.PLAYER_ID, P.PLAYER_NAME ,P.TEAM_ID ,P.E_PLAYER_NAME
    ,P.NICKNAME,P.JOIN_YYYY,P.POSITION,P.BACK_NO
    ,P.NATION,P.BIRTH_DATE,P.SOLAR,P.HEIGHT,P.WEIGHT
FROM TEAM T JOIN PLAYER P
ON T.TEAM_ID = P.TEAM_ID
WHERE P.TEAM_ID = ( SELECT TEAM_ID
                    FROM PLAYER
                    WHERE PLAYER_NAME = '정남일')
ORDER BY P.BACK_NO;
	
--선수들 중에서 키가 평균 이하인 선수들의 정보를 조회하시오
--  선수명     포지션     키       백넘버
DESC PLAYER;

DESC TEAM;

SELECT PLAYER_NAME 선수명, POSITION 포지션, HEIGHT 키, BACK_NO 백넘버
FROM PLAYER
WHERE HEIGHT <= (SELECT AVG(HEIGHT)
                 FROM PLAYER);

--DALLAS에서 근무하는 사원의 이름, 부서 번호를 출력하시오
--  사원번호    사원명     부서번호
SELECT EMPNO 사원번호, ENAME 사원명, DEPTNO 부서번호
FROM EMP
WHERE DEPTNO = (SELECT DEPTNO
                FROM DEPT
                WHERE LOC = 'DALLAS');

SELECT DEPTNO
FROM DEPT
WHERE LOC = 'DALLAS';

--SALES 부서에서 근무하는 모든 사원의 이름과 급여를 출력하시오
--  사원번호   사원명   급여      부서명
--                             영업부
SELECT EMPNO 사원번호, ENAME 사원명, SAL 급여, CASE WHEN DEPTNO = 30 THEN '영업부'
                                                 ELSE '부서미정'
                                                 END 부서명
FROM EMP
WHERE DEPTNO = (SELECT DEPTNO
                FROM DEPT
                WHERE DNAME = 'SALES');
 	                     
--자신의 직속상관이 KING인 사원의 이름과 급여를 출력하시오
--  사원번호    사원명     급여
SELECT EMPNO 사원번호, ENAME 사원명, SAL 급여
FROM EMP
WHERE MGR = (SELECT EMPNO
             FROM EMP
             WHERE ENAME = 'KING');
               
--선수들 중 나이가 20~30세인 선수들의 정보를 출력하시오
--나이가 많은 사람이 먼저 나오도록 정렬하시오
--  선수번호    선수명     생년월일(????년??월??일)   나이
DESC PLAYER;

SELECT P.PLAYER_ID 선수번호, P.PLAYER_NAME 선수명
       , TO_CHAR(P.BIRTH_DATE, 'YYYY"년"MM"월"DD"일"') 생년월일
       , TRUNC((SYSDATE - P.BIRTH_DATE) / 365) 나이
FROM PLAYER P JOIN PLAYER P2
ON P.PLAYER_ID = P2.PLAYER_ID
WHERE (SYSDATE - P.BIRTH_DATE) / 365 <= 30
AND (SYSDATE - P.BIRTH_DATE) / 365 >= 20
ORDER BY 나이 DESC;

-- 급여가 2500이상 받는 사원이 소속된 부서에서 근무하는 사원들의 정보를 SELECT 하라
SELECT ENAME, SAL, DEPTNO
FROM EMP
WHERE DEPTNO IN (SELECT DEPTNO
                 FROM EMP
                 WHERE SAL >= 2500);

SELECT ENAME, SAL
FROM EMP
WHERE SAL > (SELECT MAX(SAL)
             FROM EMP
             GROUP BY DEPTNO
             HAVING DEPTNO = 30);

SELECT ENAME, SAL
FROM EMP
WHERE SAL >= ALL (SELECT SAL
                  FROM EMP);
SELECT SAL
FROM EMP;

SELECT ENAME, SAL
FROM EMP
WHERE SAL > ANY (SELECT SAL
                 FROM EMP
                 WHERE DEPTNO =30);
SELECT SAL
FROM EMP
WHERE DEPTNO = 30;

--부서별로 가장 급여를 많이 받는 사원의 정보를 출력하시오
--  EMPNO   ENAME   SAL     DEPTNO
SELECT MAX(SAL), DEPTNO
FROM EMP
GROUP BY DEPTNO;

SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE SAL IN (SELECT MAX(SAL)
              FROM EMP
              GROUP BY DEPTNO);
			
--직급이 SALESMAN 인 사원이 받는 급여들의 최소 급여보다
--많이 받는 사원들의 이름과 급여를 출력하되, 부서번호가 20번인 사원은 제외하시오
--  사원번호    사원명     직급      급여      부서번호
SELECT *
FROM EMP;

SELECT MIN(SAL)
FROM EMP
WHERE JOB = 'SALESMAN';

SELECT EMPNO 사원번호, ENAME 사원명, JOB 직급, SAL 급여, DEPTNO 부서번호
FROM EMP
WHERE SAL > ANY(SELECT SAL
                FROM EMP
                WHERE JOB = 'SALESMAN')
AND DEPTNO <> 20;

SELECT EMPNO 사원번호, ENAME 사원명, JOB 직급, SAL 급여, DEPTNO 부서번호
FROM EMP
WHERE SAL > (SELECT MIN(SAL)
             FROM EMP
             WHERE JOB = 'SALESMAN')
AND DEPTNO <> 20;

--직급이 MANAGER인 사람이 속한 부서의 부서 번호와 부서명과 지역을 출력하시오
--  부서번호    부서명     LOCATION
SELECT DEPTNO 부서번호, DNAME 부서명, LOC LOCATION
FROM DEPT
WHERE DEPTNO IN (SELECT DEPTNO
                 FROM EMP
                 WHERE JOB = 'MANAGER');
                 
--SMITH와 동일한 직급을 가진 사원의 이름과 직급을 출력하라
--  사원번호    사원명     급여      직급
SELECT *
FROM EMP;

SELECT EMPNO 사원번호, ENAME 사원명, SAL 급여, JOB 직급
FROM EMP
WHERE JOB IN (SELECT JOB
              FROM EMP
              WHERE ENAME = 'SMITH')
AND ENAME <> 'SMITH';        
                 
--직급이 매니저인 사원이 받는 급여들의 최대 급여보다 많이 받는 사원들의
--이름과 급여를 출력하되 부서번호가 20번인 사원은 제외하시오
SELECT EMPNO 사원번호, ENAME 이름, SAL 급여, DEPTNO 부서번호
FROM EMP
WHERE SAL > ALL (SELECT SAL
                 FROM EMP
                 WHERE JOB = 'MANAGER')
AND (DEPTNO <> 20 OR DEPTNO IS NULL);

--선수들 중 정현수라는 선수가 소속되어 있는 팀 정보를 출력하시오
--  연고지명    팀명      영문팀명
SELECT REGION_NAME 연고지명, TEAM_NAME 팀명, E_TEAM_NAME 영문팀명
FROM TEAM
WHERE TEAM_ID IN (SELECT TEAM_ID
                  FROM PLAYER
                  WHERE PLAYER_NAME = '정현수');
   
--영업 사원들의 최소 급여보다 많이 받는 사원들의 이름과 급여,
--직급을 출력하되 영업 사원은 출력하지 마시오
--  사원번호    사원명     담당업무    급여
SELECT *
FROM EMP;

SELECT EMPNO 사원번호, ENAME 사원명, JOB 담당업무, SAL 급여
FROM EMP
WHERE SAL > ANY (SELECT SAL
                 FROM EMP
                 WHERE JOB = 'SALESMAN')
AND JOB <> 'SALESMAN';

--소속팀별 키가 가장 작은 사람들의 정보를 출력하시오
SELECT TEAM_ID, PLAYER_NAME, HEIGHT
FROM PLAYER
WHERE (TEAM_ID, HEIGHT) IN (SELECT TEAM_ID, MIN(HEIGHT)
                            FROM PLAYER
                            GROUP BY TEAM_ID)
ORDER BY TEAM_ID, PLAYER_NAME;

SELECT TEAM_ID, MIN(HEIGHT)
FROM PLAYER
GROUP BY TEAM_ID;

--선수 정보와 해당 선수가 속한 팀의 평균키를 함께 출력하시오?
SELECT PLAYER_NAME, HEIGHT
    , (SELECT AVG(HEIGHT)
       FROM PLAYER X
       WHERE X.TEAM_ID = P.TEAM_ID
       ) 소속팀의평균키
FROM PLAYER P;

--연봉의 급여가 30000이상인 사원들의 정보를 구하시오
SELECT *
FROM (  SELECT EMPNO, ENAME, SAL, SAL * 12 AS YEAR_SAL
        FROM EMP
        WHERE SAL BETWEEN 2000 AND 3000) NEW_TABLE
WHERE YEAR_SAL > 30000;

SELECT *
FROM (  SELECT EMPNO, ENAME, SAL, SAL * 12 AS YEAR_SAL, DEPTNO
        FROM EMP
        WHERE SAL BETWEEN 2000 AND 3000) NEW_TABLE
WHERE NEW_TABLE.DEPTNO = DEPTNO;

--K-리그 선수들 중에서 포지션이 미드필더인 선수들의 소속팀명 및 선수 정보를 출력하시오
--선수 테이블들에 관련된 정보는 인라인 뷰로 처리
--  팀ID     팀명      선수명     백넘버
SELECT *
FROM (SELECT T.TEAM_ID 팀ID, T.TEAM_NAME 팀명, P.PLAYER_NAME 선수명, P.BACK_NO 백넘버
      FROM TEAM T JOIN PLAYER P
      ON T.TEAM_ID = P.TEAM_ID
      WHERE POSITION = 'MF') NEW_TABLE;

SELECT NEW_TABLE.TEAM_ID 팀ID, T.TEAM_NAME 팀명,
    NEW_TABLE.PLAYER_ID 선수번호, NEW_TABLE.PLAYER_NAME 선수명,
    NEW_TABLE.BACK_NO 백넘버
FROM (SELECT PLAYER_NAME, BACK_NO, TEAM_ID, PLAYER_ID
      FROM PLAYER
      WHERE POSITION = 'MF') NEW_TABLE, TEAM T
WHERE NEW_TABLE.TEAM_ID = T.TEAM_ID;

--세일즈 부서에 속한 사원들 중 급여가 가장 높은 사원의 정보와 부서명을 출력하시오
--  부서번호    부서명     사원번호    사원명     급여
SELECT D.DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.SAL
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
AND E.SAL = (SELECT MAX(SAL)
             FROM EMP
             WHERE DEPTNO = (SELECT DEPTNO
                             FROM DEPT
                             WHERE DNAME = 'SALES'));

(SELECT E.EMPNO, E.ENAME, E.SAL
FROM EMP E
WHERE E.SAL = (SELECT MAX(SAL)
               FROM EMP
               WHERE DEPTNO = (SELECT DEPTNO
                               FROM DEPT
                               WHERE DNAME = 'SALES'))) WORKER;


SELECT WORKER.EMPNO, WORKER.ENAME, WORKER.SAL, D.DNAME, D.DEPTNO
FROM DEPT D JOIN(SELECT E.EMPNO, E.ENAME, E.SAL, E.DEPTNO
                 FROM EMP E
                 WHERE E.SAL = (SELECT MAX(SAL)
                                FROM EMP
                                WHERE DEPTNO = (SELECT DEPTNO
                                                FROM DEPT
                                                WHERE DNAME = 'SALES'))) WORKER
ON D.DEPTNO = WORKER.DEPTNO;

SELECT D.DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.SAL
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
AND E.SAL = (SELECT MAX(E2.SAL)
             FROM EMP E2, DEPT D2
             WHERE E2.DEPTNO = D2.DEPTNO
             AND D2.DNAME = 'SALES');

--선수들 중에서 평균키 보다 높은 선수들 중 키가 제일 큰 사람들 순서로 출력하되, 키에 NULL인 선수들은 제외하시오
--  선수번호    선수명     키
SELECT PLAYER_ID, PLAYER_NAME, HEIGHT
FROM PLAYER
WHERE HEIGHT > (SELECT AVG(HEIGHT)
                FROM PLAYER)
ORDER BY HEIGHT DESC;

SELECT *
FROM (SELECT PLAYER_ID, PLAYER_NAME, HEIGHT
      FROM PLAYER
      WHERE HEIGHT > (SELECT AVG(HEIGHT)
                      FROM PLAYER)) NEW_TABLE
ORDER BY HEIGHT DESC;

--사원 중 급여가 가장 낮은 순에서 3번째 사원들 까지 정보를 출력하시오
--  사원번호    사원명     급여
--  우선적으로 정렬 후, 정보를 출력
SELECT *
FROM EMP;

SELECT *
FROM EMP
ORDER BY SAL;

SELECT EMPNO, ENAME, SAL
FROM EMP
ORDER BY SAL;

SELECT E.EMPNO, E.ENAME, E.SAL
FROM (SELECT EMPNO, ENAME, SAL
      FROM EMP
      ORDER BY SAL) E
WHERE ROWNUM <= 3;

--년차가 높은 사원들 중 5명의 정보를 출력하되 연차가 높은 순으로 정렬하시오
SELECT *
FROM EMP;

SELECT *
FROM EMP;

SELECT ENAME, HIREDATE, CEIL((SYSDATE - HIREDATE) / 365) 연차 ,SAL
FROM EMP
ORDER BY 연차 DESC;

SELECT NEW_EMP.ENAME, NEW_EMP.HIREDATE, NEW_EMP.YEAR_SAL
FROM (
        SELECT ROWNUM R_NUM, ENAME, HIREDATE, YEAR_SAL ,SAL
        FROM (SELECT ENAME, HIREDATE, CEIL((SYSDATE - HIREDATE) / 365) YEAR_SAL ,SAL
              FROM EMP
              ORDER BY HIREDATE) YEAR) NEW_EMP
WHERE NEW_EMP.R_NUM <= 5;
