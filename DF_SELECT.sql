-- 가입자의 모든 정보
SELECT M.MEMBER_NUMBER 번호, M.MEMBER_ID 아이디, M.MEMBER_PASSWORD 비밀번호, M.MEMBER_NAME 이름, M.MEMBER_EMAIL 이메일,
        M.MEMBER_BIRTH_DATE 생년월일, M.MEMBER_PHONE_NUMBER 전화번호, M.MEMBER_GENDER 성별,
        M.MEMBER_CREATE_DATE 가입일, M.MEMBER_MODIFY_DATE 수정일,
        PG.PREFER_GENRE_FIRST 선호장르1, PG.PREFER_GENRE_SECOND 선호장르2, PG.PREFER_GENRE_THIRD 선호장르3
FROM MEMBER M JOIN PREFER_GENRE PG
ON M.MEMBER_NUMBER = PG.MEMBER_NUMBER;


-- 가입자의 게시글 보기
SELECT B.BOARD_NUMBER 게시번호, M.MEMBER_ID 작성자, B.BOARD_TITLE 제목, B.BOARD_CONTENT 내용,
        B.BOARD_CREATE_DATE 작성일, B.BOARD_HIT 조회수, b.member_number
FROM MEMBER M JOIN BOARD B
ON M.MEMBER_NUMBER = B.MEMBER_NUMBER;


-- 가입자가 좋아요 한 영화
SELECT m.member_id, mv.movie_title, h.heart_check
FROM MEMBER M JOIN HEART H
ON M.MEMBER_NUMBER = h.member_number
JOIN MOVIE MV
ON h.movie_number = mv.movie_number;


-- 가입자가 본 영화
SELECT m.member_id, mv.movie_title, w.watch_check
FROM MEMBER M JOIN watch w
ON M.MEMBER_NUMBER = w.member_number
JOIN MOVIE MV
ON w.movie_number = mv.movie_number;


-- 게시글의 댓글 보기
SELECT B.BOARD_NUMBER 게시번호, M.MEMBER_ID 댓글작성자, PC.POST_COMMENT_CONTENT 댓글내용, PC.POST_COMMENT_DATE 댓글작성일
FROM BOARD B JOIN POST_COMMENT PC
ON B.BOARD_NUMBER = PC.BOARD_NUMBER
JOIN MEMBER M
ON PC.MEMBER_NUMBER = M.MEMBER_NUMBER;


-- 영화 정보 보기
SELECT M.MOVIE_NUMBER, M.MOVIE_TITLE, A.ACTOR_NAME, d.director_name
FROM MOVIE M JOIN CAST_MEMBER CM
ON M.MOVIE_NUMBER = CM.MOVIE_NUMBER
JOIN DIRECTOR D
ON D.DIRECTOR_NUMBER = M.MOVIE_NUMBER
JOIN ACTOR A
ON A.ACTOR_NUMBER = CM.ACTOR_NUMBER;


-- 회원 장바구니 보기
SELECT M.MEMBER_ID 아이디, mv.movie_title 영화제목, mv.movie_price 가격
FROM MEMBER M JOIN BASKET B
ON m.member_number = b.member_number
JOIN MOVIE MV
ON b.movie_number = mv.movie_number;


-- 회원 주문 내역 보기
SELECT OH.ORDER_HISTORY_NUMBER, M.MEMBER_ID 아이디, MV.MOVIE_TITLE, OH.ORDER_HISTORY_TIME
FROM MEMBER M JOIN ORDER_HISTORY OH
ON m.member_number = oh.member_number
JOIN ORDER_PRODUCT OP
ON op.order_history_number = oh.order_history_number
JOIN MOVIE MV
ON op.movie_number = mv.movie_number;


-- 한줄평 보기
SELECT m.member_id, MV.MOVIE_TITLE, lr.line_review_context
FROM LINE_REVIEW LR JOIN MEMBER M
ON LR.MEMBER_NUMBER = M.MEMBER_NUMBER
JOIN MOVIE MV
ON LR.MOVIE_NUMBER = MV.MOVIE_NUMBER;


-- 회원별 영화 평점 보기
SELECT m.member_id, mv.movie_title, r.rating_grade
FROM MOVIE MV JOIN RATING R
ON mv.movie_number = R.MOVIE_NUMBER
JOIN MEMBER M
ON r.member_number = m.member_number;


-- 영화 평점 보기
SELECT NVL(AVG(MOV.RATING_GRADE), 0)
FROM (SELECT m.member_id, mv.movie_title, r.rating_grade
        FROM MOVIE MV JOIN RATING R
        ON mv.movie_number = R.MOVIE_NUMBER
        JOIN MEMBER M
        ON r.member_number = m.member_number)MOV
WHERE MOV.movie_title = '타겟';
