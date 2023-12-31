SELECT *
FROM MEMBER
ORDER BY MNO DESC;

DROP TABLE TB_FILE;

CREATE TABLE TB_FILE(
    IDX NUMBER,
    PARENT_SEQ NUMBER NOT NULL,
    ORIGINAL_FILE_NAME VARCHAR2(260 BYTE) NOT NULL,
    STORED_FILE_NAME VARCHAR2(36 BYTE) NOT NULL,
    FILE_SIZE NUMBER,
    CRE_DATE DATE NOT NULL,
    PRIMARY KEY(IDX)
);

DESC TB_FILE;

CREATE SEQUENCE TB_FILE_IDX_SEQ
START WITH 1
INCREMENT BY 1;

DESC TB_FILE;

INSERT INTO TB_FILE
(IDX, PARENT_SEQ, ORIGINAL_FILE_NAME, STORED_FILE_NAME, FILE_SIZE, CRE_DATE)
VALUES(1, 1, '파일명', 'OTHER_FILE', 1024, SYSDATE);

SELECT *
FROM TB_FILE;

SELECT *
FROM MEMBER M, TB_FILE F
WHERE M.MNO = F.PARENT_SEQ
AND MNO = 224;

SELECT MEMBERS_MNO_SEQ.NEXTVAL
FROM DUAL;

SELECT IDX, ORIGINAL_FILE_NAME, STORED_FILE_NAME
    , ROUND(FILE_SIZE/1024, 1) AS FILE_SIZE
FROM TB_FILE
WHERE PARENT_SEQ = 224;

SELECT *
FROM TB_FILE
WHERE PARENT_SEQ = 225;

DELETE FROM TB_FILE
WHERE PARENT_SEQ = 224;

ROLLBACK;

SELECT *
FROM MEMBER;

COMMIT;

SELECT *
FROM TB_FILE;




