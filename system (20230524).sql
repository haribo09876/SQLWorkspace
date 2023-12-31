--사용자 계정 생성 및 계정 비밀번호 변경, 잠금 해제  (계정명 : scott / 패스워드 : tiger        계정명 : kyw / 패스워드 : Kyw12)
CREATE USER scott IDENTIFIED BY tiger ACCOUNT UNLOCK;

--계정에 접근 가능 권한 부여 (생성한 사용자가 데이터베이스에 접속할 수 있도록 기본적인 시스템 권한 8가지를 부여)
GRANT CONNECT
TO scott;

--계정에 객체 생성 권한 설정 (생성한 사용자에 대하여 객체(테이블, 뷰, 인덱스등)을 생성할 수 있도록 시스템 권한을 부여)
GRANT RESOURCE
TO scott;

--계정에 접근 가능 권한 회수
REVOKE CONNECT
FROM scott;

--계정 권한 확인 (생성한 사용자의 권한을 확인하는 쿼리)
SELECT * 
FROM USER_ROLE_PRIVS;

--DD (데이터 딕셔너리(데이터 사전))
SELECT * 
FROM DBA_ROLE_PRIVS;

SELECT * 
FROM DBA_ROLE_PRIVS
WHERE GRANTEE = 'scott'
OR GRANTEE = 'kyw';

--SYSTEM에서 전체 제약조건 확인 가능
SELECT *
FROM USER_CONSTRAINTS;

SELECT *
FROM DBA_CONSTRAINTS;

SELECT *
FROM DBA_CONSTRAINTS
WHERE TABLE_NAME = 'PLAYER';

SELECT *
FROM TAB;


--SELECT *
--FROM ALL_OBJECTS
--WHERE OBJECT_TYPE = 'TABLE';

--<주요 내용>
--  kyw (20230607)
--      384줄  PRIMARY KEY, CHECK
--      460줄  PRIMARY KEY, REFERENCES
--      527줄  PRIMARY KEY, REFERENCES
--      598줄  제약조건 추가(ALTER), 제거 등
--      646줄  제약조건 제거 및 강제 무시

--  scott (20230609)
--      252줄  UPPER, LOWER, LENGTH, LENGTHB, SUBSTR, TRIM, FLOOR, ROUND, TRUNC, MOD, DATE
--      676줄  CASE
--      794줄  GROUP BY
--      910줄  PRIMARY(기본키), FOREIGN KEY(외래키)
--      967줄  셀프조인
--      993줄  ESCAPE문자
--      998줄  내용이 없는 정보도 모두 출력
--      1033줄 테이블 조인(3개)
--      1040줄 INNER JOIN(내부조인)
--      1046줄 다중조인(ANSI표준)
--      1090줄 테이블 조인(3개)
--      1118줄 테이블 조인(4개)
--      1144줄 CROSS JOIN
--      1186줄 OUTER JOIN(ANSI표준)
--      1238줄 서브쿼리
--      1297줄 서브쿼리
--      1317줄 서브쿼리에서 AVG
--      1360줄 서브쿼리
--      1379줄 JOIN
--      1393줄 서브쿼리
--      1407줄 ALL
--      1488줄 IN
--      1496줄 ANY
--      1509줄 IN
--      1521줄 인라인뷰
--      1542줄 인라인뷰
--      1559줄 서브쿼리(2중)
--      1570줄 인라인뷰
--      1585줄 인라인뷰
