SET DEFINE OFF;

commit;

INSERT INTO HEART
VALUE(HEART_NUMBER, HEART_CHECK, MEMBER_NUMBER, MOVIE_NUMBER)
VALUES(HEART_NUMBER_SEQ.NEXTVAL, 'N', 1, 1);
INSERT INTO HEART
VALUES(HEART_NUMBER_SEQ.NEXTVAL, 'N', 2, 2);
INSERT INTO HEART
VALUES(HEART_NUMBER_SEQ.NEXTVAL, 'Y', 3, 2);
INSERT INTO HEART
VALUES(HEART_NUMBER_SEQ.NEXTVAL, 'Y', 4, 4);
SELECT* FROM HEART;


INSERT INTO WATCH
VALUE(WATCH_NUMBER, WATCH_CHECK, MEMBER_NUMBER, MOVIE_NUMBER)
VALUES(WATCH_NUMBER_SEQ.NEXTVAL, 'N', 1, 1);
INSERT INTO WATCH
VALUES(WATCH_NUMBER_SEQ.NEXTVAL, 'Y', 2, 2);
INSERT INTO WATCH
VALUES(WATCH_NUMBER_SEQ.NEXTVAL, 'N', 2, 2);
INSERT INTO WATCH
VALUES(WATCH_NUMBER_SEQ.NEXTVAL, 'N', 2, 3);
SELECT* FROM WATCH;


INSERT INTO POST_COMMENT
VALUE(POST_COMMENT_NUMBER, POST_COMMENT_CONTENT, POST_COMMENT_DATE, BOARD_NUMBER, MEMBER_NUMBER)
VALUES(POST_COMMENT_NUMBER_SEQ.NEXTVAL, '나도..', SYSDATE, 1, 2);
INSERT INTO POST_COMMENT
VALUES(POST_COMMENT_NUMBER_SEQ.NEXTVAL, '반갑습니다~!!', '2023-09-01', 2, 3);
INSERT INTO POST_COMMENT
VALUES(POST_COMMENT_NUMBER_SEQ.NEXTVAL, '국밥 ㄱㄱ', '2023-09-03', 3, 1);
INSERT INTO POST_COMMENT
VALUES(POST_COMMENT_NUMBER_SEQ.NEXTVAL, '칼국수 어떰?', '2023-09-10', 3, 3);
INSERT INTO POST_COMMENT
VALUES(POST_COMMENT_NUMBER_SEQ.NEXTVAL, '광고 신고함', SYSDATE, 5, 4);
SELECT* FROM POST_COMMENT;




INSERT INTO RATING
VALUE(RATING_NUMBER, RATING_GRADE, MOVIE_NUMBER, MEMBER_NUMBER)
VALUES(RATING_NUMBER_SEQ.NEXTVAL, 3.5, 1, 1);
INSERT INTO RATING
VALUES(RATING_NUMBER_SEQ.NEXTVAL, 4, 1, 2);
INSERT INTO RATING
VALUES(RATING_NUMBER_SEQ.NEXTVAL, 3, 2, 2);
INSERT INTO RATING
VALUES(RATING_NUMBER_SEQ.NEXTVAL, 3.8, 3, 3);
SELECT* FROM RATING;


INSERT INTO LINE_REVIEW
VALUE(LINE_REVIEW_NUMBER, LINE_REVIEW_CONTEXT, MEMBER_NUMBER, MOVIE_NUMBER)
VALUES(LINE_REVIEW_NUMBER_SEQ.NEXTVAL, '재밌음', 1, 1);
INSERT INTO LINE_REVIEW
VALUES(LINE_REVIEW_NUMBER_SEQ.NEXTVAL, '좀 무서웠어요', 2, 1);
INSERT INTO LINE_REVIEW
VALUES(LINE_REVIEW_NUMBER_SEQ.NEXTVAL, '추천안함 시간낭비임;;', 2, 2);
INSERT INTO LINE_REVIEW
VALUES(LINE_REVIEW_NUMBER_SEQ.NEXTVAL, '킬링 타임용 영화', 4, 3);
INSERT INTO LINE_REVIEW
VALUES(LINE_REVIEW_NUMBER_SEQ.NEXTVAL, '별로..', 3, 4);
SELECT* FROM LINE_REVIEW;


INSERT INTO BASKET
VALUE(BASKET_NO, MEMBER_NUMBER, MOVIE_NUMBER)
VALUES(BASKET_NUMBER_SEQ.NEXTVAL, 1, 1);
INSERT INTO BASKET
VALUES(BASKET_NUMBER_SEQ.NEXTVAL, 1, 2);
INSERT INTO BASKET
VALUES(BASKET_NUMBER_SEQ.NEXTVAL, 2, 3);
INSERT INTO BASKET
VALUES(BASKET_NUMBER_SEQ.NEXTVAL, 3, 4);
SELECT* FROM BASKET;

-- 주문 내역
INSERT INTO ORDER_HISTORY
VALUE(ORDER_HISTORY_NUMBER, ORDER_HISTORY_TIME, ORDER_HISTORY_STATE, MEMBER_NUMBER)
VALUES(33, '2023-09-22', 'Y', 1);
-- 해당 주문 내역의 상품 정보
INSERT INTO ORDER_PRODUCT
VALUE(ORDER_PRODUCT_NUMBER, ORDER_HISTORY_NUMBER, MOVIE_NUMBER)
VALUES(ORDER_PRODUCT_NUMBER_SEQ.NEXTVAL, 33, 4);
INSERT INTO ORDER_PRODUCT
VALUE(ORDER_PRODUCT_NUMBER, ORDER_HISTORY_NUMBER, MOVIE_NUMBER)
VALUES(ORDER_PRODUCT_NUMBER_SEQ.NEXTVAL, 33, 2);

INSERT INTO ORDER_HISTORY
VALUE(ORDER_HISTORY_NUMBER, ORDER_HISTORY_TIME, ORDER_HISTORY_STATE, MEMBER_NUMBER)
VALUES(34, '2023-09-22', 'Y', 1);
-- 해당 주문 내역의 상품 정보
INSERT INTO ORDER_PRODUCT
VALUE(ORDER_PRODUCT_NUMBER, ORDER_HISTORY_NUMBER, MOVIE_NUMBER)
VALUES(ORDER_PRODUCT_NUMBER_SEQ.NEXTVAL, 34, 4);
INSERT INTO ORDER_PRODUCT
VALUE(ORDER_PRODUCT_NUMBER, ORDER_HISTORY_NUMBER, MOVIE_NUMBER)
VALUES(ORDER_PRODUCT_NUMBER_SEQ.NEXTVAL, 34, 2);

INSERT INTO ORDER_HISTORY
VALUE(ORDER_HISTORY_NUMBER, ORDER_HISTORY_TIME, ORDER_HISTORY_STATE, MEMBER_NUMBER)
VALUES(35, '2023-09-22', 'Y', 1);
-- 해당 주문 내역의 상품 정보
INSERT INTO ORDER_PRODUCT
VALUE(ORDER_PRODUCT_NUMBER, ORDER_HISTORY_NUMBER, MOVIE_NUMBER)
VALUES(ORDER_PRODUCT_NUMBER_SEQ.NEXTVAL, 35, 3);

INSERT INTO ORDER_HISTORY
VALUE(ORDER_HISTORY_NUMBER, ORDER_HISTORY_TIME, ORDER_HISTORY_STATE, MEMBER_NUMBER)
VALUES(36, '2023-09-22', 'Y', 1);
-- 해당 주문 내역의 상품 정보
INSERT INTO ORDER_PRODUCT
VALUE(ORDER_PRODUCT_NUMBER, ORDER_HISTORY_NUMBER, MOVIE_NUMBER)
VALUES(ORDER_PRODUCT_NUMBER_SEQ.NEXTVAL, 36, 1);

INSERT INTO ORDER_HISTORY
VALUE(ORDER_HISTORY_NUMBER, ORDER_HISTORY_TIME, ORDER_HISTORY_STATE, MEMBER_NUMBER)
VALUES(37, '2023-09-22', 'Y', 1);
-- 해당 주문 내역의 상품 정보
INSERT INTO ORDER_PRODUCT
VALUE(ORDER_PRODUCT_NUMBER, ORDER_HISTORY_NUMBER, MOVIE_NUMBER)
VALUES(ORDER_PRODUCT_NUMBER_SEQ.NEXTVAL, 37, 2);

INSERT INTO ORDER_HISTORY
VALUE(ORDER_HISTORY_NUMBER, ORDER_HISTORY_TIME, ORDER_HISTORY_STATE, MEMBER_NUMBER)
VALUES(38, '2023-09-22', 'Y', 1);
-- 해당 주문 내역의 상품 정보
INSERT INTO ORDER_PRODUCT
VALUE(ORDER_PRODUCT_NUMBER, ORDER_HISTORY_NUMBER, MOVIE_NUMBER)
VALUES(ORDER_PRODUCT_NUMBER_SEQ.NEXTVAL, 38, 3);

INSERT INTO ORDER_HISTORY
VALUE(ORDER_HISTORY_NUMBER, ORDER_HISTORY_TIME, ORDER_HISTORY_STATE, MEMBER_NUMBER)
VALUES(39, '2023-09-22', 'Y', 1);
-- 해당 주문 내역의 상품 정보
INSERT INTO ORDER_PRODUCT
VALUE(ORDER_PRODUCT_NUMBER, ORDER_HISTORY_NUMBER, MOVIE_NUMBER)
VALUES(ORDER_PRODUCT_NUMBER_SEQ.NEXTVAL, 39, 4);

INSERT INTO ORDER_HISTORY
VALUE(ORDER_HISTORY_NUMBER, ORDER_HISTORY_TIME, ORDER_HISTORY_STATE, MEMBER_NUMBER)
VALUES(40, '2023-09-22', 'Y', 1);
-- 해당 주문 내역의 상품 정보
INSERT INTO ORDER_PRODUCT
VALUE(ORDER_PRODUCT_NUMBER, ORDER_HISTORY_NUMBER, MOVIE_NUMBER)
VALUES(ORDER_PRODUCT_NUMBER_SEQ.NEXTVAL, 40, 4);

INSERT INTO ORDER_HISTORY
VALUE(ORDER_HISTORY_NUMBER, ORDER_HISTORY_TIME, ORDER_HISTORY_STATE, MEMBER_NUMBER)
VALUES(41, '2023-09-22', 'Y', 1);
-- 해당 주문 내역의 상품 정보
INSERT INTO ORDER_PRODUCT
VALUE(ORDER_PRODUCT_NUMBER, ORDER_HISTORY_NUMBER, MOVIE_NUMBER)
VALUES(ORDER_PRODUCT_NUMBER_SEQ.NEXTVAL, 41, 3);

INSERT INTO ORDER_HISTORY
VALUE(ORDER_HISTORY_NUMBER, ORDER_HISTORY_TIME, ORDER_HISTORY_STATE, MEMBER_NUMBER)
VALUES(42, '2023-09-22', 'Y', 1);
-- 해당 주문 내역의 상품 정보
INSERT INTO ORDER_PRODUCT
VALUE(ORDER_PRODUCT_NUMBER, ORDER_HISTORY_NUMBER, MOVIE_NUMBER)
VALUES(ORDER_PRODUCT_NUMBER_SEQ.NEXTVAL, 42, 2);

INSERT INTO ORDER_HISTORY
VALUE(ORDER_HISTORY_NUMBER, ORDER_HISTORY_TIME, ORDER_HISTORY_STATE, MEMBER_NUMBER)
VALUES(43, '2023-09-22', 'Y', 1);
-- 해당 주문 내역의 상품 정보
INSERT INTO ORDER_PRODUCT
VALUE(ORDER_PRODUCT_NUMBER, ORDER_HISTORY_NUMBER, MOVIE_NUMBER)
VALUES(ORDER_PRODUCT_NUMBER_SEQ.NEXTVAL, 43, 1);

COMMIT;