/*
교육생 계정
-교육생은 시스템의 일부 기능을 로그인 과정을 거친 후에 사용할 수 있다. O
-교육생 계정은 사전에 관리자에 의해 데이터베이스에 등록된 것으로 간주한다. O
-교육생이 이용할 수 있는 기능에는 성적 조회 기능을 포함한다. O

성적 조회
-교육생은 한 개의 과정만을 등록해서 수강했다고 가정한다. 한 개의 과정 내에는 여러 개의 과목을 수강했다고 가정한다.
    단, 과정 기간이 끝나지 않은 교육생 또는 중도탈락 처리된 교육생인 경우 일부 과목만 수강했다고 가정한다. O
-교육생이 로그인에 성공하면 교육생 개인의 정보와 교육생이 수강한 과정명, 과정기간(시작 년월일, 끝 년월일), 
    강의실이 타이틀로 출력된다. O
-성적 정보는 과목별로 목록 형태로 출력된다. O
-출력될 정보는 과목번호, 과목명, 과목기간(시작 년월일, 끝 년월일), 교재명, 교사명, 과목별 배점 정보(출결, 필기, 실기 배점),
    과목별 성적 정보(출결, 필기, 실기 점수), 과목별 시험날짜,시험문제가 출력되어야 한다. O
-성적이 등록되지 않은 과목이 있는 경우 과목 정보는 출력되고 점수는 null 값으로 출력되도록 한다. O

출결 관리 및 출결 조회
-매일 근태 관리를 기록할 수 있어야 한다.(출근 1회, 퇴근 1회) O
-본인의 출결 현황을 기간별(전체, 월, 일) 조회할 수 있어야 한다. O
-다른 교육생의 현황은 조회할 수 없다. O
-모든 출결 조회는 근태 상황을 구분할 수 있어야 한다.(정상, 지각, 조퇴, 외출, 병가, 기타) O
*/

/*
-- INDEX
01. 교육생 계정 -- line 31
02. 성적 조회 -- line 67
03. 출결 관리 및 출결 조회 -- line 256
*/

--------------------------------------------------------------------------------------------------------------------
-- 01. 교육생 계정
--------------------------------------------------------------------------------------------------------------------

-- S001 : 교육생은 시스템의 일부 기능을 로그인 과정을 거친 후에 사용할 수 있다.
-- S002 : 교육생 계정은 사전에 관리자에 의해 데이터베이스에 등록된 것으로 간주한다.

-- 로그인 시 ID와 PW 비교
-- 교육생 로그인 PROCEDURE
CREATE OR REPLACE PROCEDURE PROC_STUDENT_LOGIN(
    PID IN VARCHAR2,
    PPW IN VARCHAR2,
    PRESULT OUT NUMBER,
    PSTUSEQ OUT NUMBER
)
IS
BEGIN
    SELECT COUNT(SEQ) INTO PRESULT FROM TBL_STUDENT WHERE ID = PID AND SUBSTR(SSN, 8) = PPW AND DELFLAG = 'Y';
    IF PRESULT = 1 THEN
        SELECT SEQ INTO PSTUSEQ FROM TBL_STUDENT WHERE ID = PID AND SUBSTR(SSN, 8) = PPW AND DELFLAG = 'Y' GROUP BY SEQ;
    END IF;
END;

-- 교육생 로그인 DECLARE
DECLARE
    VSTUSEQ NUMBER;
    VRESULT NUMBER;
BEGIN
    PROC_STUDENT_LOGIN('clul468', '1458913', VSTUSEQ, VRESULT);
    IF VRESULT = 1 THEN 
        DBMS_OUTPUT.PUT_LINE('로그인 성공');
    ELSIF VRESULT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('로그인 실패');
    END IF;
END;

--------------------------------------------------------------------------------------------------------------------
-- 02. 성적 조회
--------------------------------------------------------------------------------------------------------------------
-- 메인 > 교육생 > 교육생 메뉴 > 성적 조회
--------------------------------------------------------------------------------------------------------------------

-- S005 : 교육생이 로그인에 성공하면 교육생 개인의 정보와 교육생이 수강한 과정명,
-- 과정기간(시작 년월일, 끝 년월일), 강의실이 타이틀로 출력된다.

-- 교육생 메인
-- 메인 PROCEDURE
CREATE OR REPLACE PROCEDURE PROC_STUDENT_MAIN(
    PNUM IN NUMBER,                     --학생번호
    PRESULT OUT SYS_REFCURSOR
)
IS
BEGIN
    OPEN PRESULT FOR
    SELECT
    DISTINCT
        ST.NAME, ST.ID, ST.SSN, ST.TEL, ST.ACCOUNT,
        C.NAME AS COURSENAME, TO_CHAR(OC.STARTDATE, 'YY/MM/DD') AS STARTDATE, TO_CHAR(OC.ENDDATE, 'YY/MM/DD') AS ENDDATE,
        OCL.ROOMSEQ AS ROOM, SU.TYPE
    FROM TBL_STUDENT ST
        INNER JOIN TBL_APPLY AP --수강신청 조인
            ON ST.SEQ = AP.STUSEQ
                INNER JOIN TBL_OPEN_COURSE OC --개설 과정 조인
                    ON AP.OCRSSEQ = OC.SEQ
                        INNER JOIN TBL_COURSE C --과정 조인
                            ON OC.CRSSEQ = C.SEQ
                                INNER JOIN TBL_OPEN_CLASSROOM OCL --개설된 강의실 조인
                                    ON OC.SEQ = OCL.OCRSSEQ
                                        INNER JOIN TBL_SUPPORT SU
                                            ON AP.SEQ = SU.APPSEQ
                                        WHERE ST.SEQ = PNUM; -- 현재 로그인 한 교육생 번호 변수
END;

-- 메인 DECLARE
DECLARE
    PRESULT SYS_REFCURSOR;
    PNAME TBL_STUDENT.NAME%TYPE;
    PSSN TBL_STUDENT.SSN%TYPE;
    PTEL TBL_STUDENT.TEL%TYPE;
    PACCOUNT TBL_STUDENT.ACCOUNT%TYPE;
    PCOURSENAME TBL_COURSE.NAME%TYPE;
    PSTARTDATE DATE;
    PENDDATE DATE;
    PROOM TBL_OPEN_CLASSROOM.ROOMSEQ%TYPE;
BEGIN
    PROC_STUDENT_MAIN(8, PRESULT);
    LOOP
        FETCH PRESULT INTO PNAME, PSSN, PTEL, PACCOUNT, PCOURSENAME, PSTARTDATE, PENDDATE, PROOM;
        EXIT WHEN PRESULT%NOTFOUND;
        
        DBMS_OUTPUT.PUT_LINE(PNAME || ' ' || PSSN || ' ' || PTEL || ' ' || PACCOUNT || ' ' || PCOURSENAME || ' ' || 
        PSTARTDATE || ' ' || PENDDATE || ' ' || PROOM);
        
    
    END LOOP;
END;

-- S003 : 교육생이 이용할 수 있는 기능에는 성적 조회 기능을 포함한다.
-- S006 : 성적 정보는 과목별로 목록 형태로 출력된다.
-- S007 : 출력될 정보는 과목번호, 과목명, 과목기간(시작 년월일, 끝 년월일), 
-- 교재명, 교사명, 과목별 배점 정보(출결, 필기, 실기 배점), 과목별 성적 정보(출결, 필기, 실기 점수), 
-- 과목별 시험날짜, 시험문제가 출력되어야 한다.
-- S008 : 성적이 등록되지 않은 과목이 있는 경우 과목 정보는 출력되고 점수는 null 값으로 출력되도록 한다.

-- 교육생 성적 조회
-- 과목번호, 과목명, 과목기간(시작, 끝), 교재명, 교사명,
-- 과목별 배점정보(출결, 필기, 실기), 과목별 성적정보(출결, 필기, 실기), 과목별 시험날짜, 시험문제
-- 성적 PROCEDURE
CREATE OR REPLACE PROCEDURE PROC_STUDENT_SCORE_INFO(
    PNUM IN NUMBER,                     --학생번호
    PRESULT OUT SYS_REFCURSOR
)
IS
BEGIN
    OPEN PRESULT FOR
    SELECT 
        ST.NAME,
        SUB.SEQ, SUB.NAME AS SUBJECT, TO_CHAR(OS.STARTDATE, 'YY/MM/DD') AS STARTDATE, TO_CHAR(OS.ENDDATE, 'YY/MM/DD') AS ENDDATE,
        LPAD(BO.NAME, 40, ' ') AS BOOK, TEA.NAME AS TEACHER,
        CASE
        WHEN PO.ATTEND IS NOT NULL THEN PO.ATTEND || '%'
        WHEN PO.ATTEND IS NULL THEN NULL
    END AS ATPERCENT,
    CASE
        WHEN PO.WRITE IS NOT NULL THEN PO.WRITE || '%'
        WHEN PO.WRITE IS NULL THEN NULL
    END AS WRPERCENT,
    CASE
        WHEN PO.PERFORMANCE IS NOT NULL THEN PO.PERFORMANCE || '%'
        WHEN PO.PERFORMANCE IS NULL THEN NULL
    END AS PEPERCENT,
        (SELECT ATTEND FROM TBL_SCORE WHERE APPSEQ = AP.SEQ AND OSUBSEQ = OS.SEQ) AS ATSCORE,
        (SELECT WRITE FROM TBL_SCORE WHERE APPSEQ = AP.SEQ AND OSUBSEQ = OS.SEQ) AS WRSCORE,
        (SELECT PERFORMANCE FROM TBL_SCORE WHERE APPSEQ = AP.SEQ AND OSUBSEQ = OS.SEQ) AS PESCORE
    FROM TBL_STUDENT ST
        INNER JOIN TBL_APPLY AP --수강신청 조인
            ON ST.SEQ = AP.STUSEQ
                INNER JOIN TBL_OPEN_COURSE OC --개설 과정 조인
                    ON AP.OCRSSEQ = OC.SEQ
                        INNER JOIN TBL_OPEN_SUBJECT OS --개설 과목 조인
                            ON OC.SEQ = OS.OCRSSEQ
                                LEFT OUTER JOIN TBL_POINT PO --배점 조인
                                    ON OS.SEQ = PO.OSUBSEQ
--                                        INNER JOIN TBL_SCORE SCO --성적 조인
--                                            ON AP.SEQ = SCO.APPSEQ
                                                INNER JOIN TBL_TEST TES --시험 조인
                                                    ON OS.SEQ = TES.OSUBSEQ
                                                        INNER JOIN TBL_AVAIL_SUBJECT AVS --강의가능 과목 조인
                                                            ON OS.AVAILSEQ = AVS.SEQ
                                                                INNER JOIN TBL_TEACHER TEA --교사 조인
                                                                    ON AVS.TEASEQ = TEA.SEQ
                                                                        INNER JOIN TBL_BOOK BO --교재 조인
                                                                            ON AVS.BOOKSEQ = BO.SEQ
                                                                                INNER JOIN TBL_SUBJECT SUB --과목 조인
                                                                                    ON AVS.SUBSEQ = SUB.SEQ
                                                                                
    WHERE ST.SEQ = PNUM AND ST.DELFLAG = 'Y' AND AP.DELFLAG = 'Y' AND OC.DELFLAG = 'Y' AND OS.DELFLAG = 'Y'
        AND TES.DELFLAG = 'Y' AND AVS.DELFLAG = 'Y' AND TEA.DELFLAG = 'Y' AND BO.DELFLAG = 'Y' AND SUB.DELFLAG = 'Y'
            ORDER BY OS.STARTDATE;
END;

-- 성적 VIEW
CREATE OR REPLACE VIEW VW_STUDENT_SCORE_INFO
AS
SELECT 
        ST.NAME,
        SUB.SEQ, SUB.NAME AS SUBJECT, OS.STARTDATE, OS.ENDDATE,
        LPAD(BO.NAME, 40, ' ') AS BOOK, TEA.NAME AS TEACHER,
        CASE
        WHEN PO.ATTEND IS NOT NULL THEN PO.ATTEND || '%'
        WHEN PO.ATTEND IS NULL THEN NULL
    END AS ATPERCENT,
    CASE
        WHEN PO.WRITE IS NOT NULL THEN PO.WRITE || '%'
        WHEN PO.WRITE IS NULL THEN NULL
    END AS WRPERCENT,
    CASE
        WHEN PO.PERFORMANCE IS NOT NULL THEN PO.PERFORMANCE || '%'
        WHEN PO.PERFORMANCE IS NULL THEN NULL
    END AS PEPERCENT,
        (SELECT ATTEND FROM TBL_SCORE WHERE APPSEQ = AP.SEQ AND OSUBSEQ = OS.SEQ) AS ATSCORE,
        (SELECT WRITE FROM TBL_SCORE WHERE APPSEQ = AP.SEQ AND OSUBSEQ = OS.SEQ) AS WRSCORE,
        (SELECT PERFORMANCE FROM TBL_SCORE WHERE APPSEQ = AP.SEQ AND OSUBSEQ = OS.SEQ) AS PESCORE
    FROM TBL_STUDENT ST
        INNER JOIN TBL_APPLY AP --수강신청 조인
            ON ST.SEQ = AP.STUSEQ
                INNER JOIN TBL_OPEN_COURSE OC --개설 과정 조인
                    ON AP.OCRSSEQ = OC.SEQ
                        INNER JOIN TBL_OPEN_SUBJECT OS --개설 과목 조인
                            ON OC.SEQ = OS.OCRSSEQ
                                LEFT OUTER JOIN TBL_POINT PO --배점 조인
                                    ON OS.SEQ = PO.OSUBSEQ
--                                        INNER JOIN TBL_SCORE SCO --성적 조인
--                                            ON AP.SEQ = SCO.APPSEQ
                                                INNER JOIN TBL_TEST TES --시험 조인
                                                    ON OS.SEQ = TES.OSUBSEQ
                                                        INNER JOIN TBL_AVAIL_SUBJECT AVS --강의가능 과목 조인
                                                            ON OS.AVAILSEQ = AVS.SEQ
                                                                INNER JOIN TBL_TEACHER TEA --교사 조인
                                                                    ON AVS.TEASEQ = TEA.SEQ
                                                                        INNER JOIN TBL_BOOK BO --교재 조인
                                                                            ON AVS.BOOKSEQ = BO.SEQ
                                                                                INNER JOIN TBL_SUBJECT SUB --과목 조인
                                                                                    ON AVS.SUBSEQ = SUB.SEQ
    WHERE ST.DELFLAG = 'Y' AND AP.DELFLAG = 'Y' AND OC.DELFLAG = 'Y' AND OS.DELFLAG = 'Y'
        AND TES.DELFLAG = 'Y' AND AVS.DELFLAG = 'Y' AND TEA.DELFLAG = 'Y' AND BO.DELFLAG = 'Y' AND SUB.DELFLAG = 'Y';


-- 성적 DECLARE
DECLARE
    PRESULT SYS_REFCURSOR;
    VROW VW_STUDENT_SCORE_INFO%ROWTYPE;
BEGIN
    PROC_STUDENT_SCORE_INFO(8, PRESULT);
    LOOP
        FETCH PRESULT INTO VROW;
        EXIT WHEN PRESULT%NOTFOUND;
        
        DBMS_OUTPUT.PUT_LINE(VROW.NAME || ' ' || VROW.SEQ || ' ' || VROW.SUBJECT || ' ' || VROW.STARTDATE || ' ~ ' || VROW.ENDDATE
         || ' ' || VROW.BOOK || ' ' || VROW.TEACHER || ' ' || VROW.ATPERCENT || ' ' || VROW.WRPERCENT || ' ' || VROW.PEPERCENT
          || ' ' || VROW.ATSCORE || ' ' || VROW.WRSCORE || ' ' || VROW.PESCORE);
        
    END LOOP;
END;

--------------------------------------------------------------------------------------------------------------------
-- 03. 출결 관리 및 출결 조회
--------------------------------------------------------------------------------------------------------------------

-- S010 : 본인의 출결 현황을 기간별(전체, 월, 일) 조회할 수 있어야 한다.
-- S011 : 다른 교육생의 현황은 조회할 수 없다.
-- S012 : 모든 출결 조회는 근태 상황을 구분할 수 있어야 한다.(정상, 지각, 조퇴, 외출, 병가, 기타)

-- student -> studentcheckattend
-- 교육생 출결 조회
-- 출결 조회 PROCEDURE
CREATE OR REPLACE PROCEDURE PROC_STUDENT_ATTEND(
    PNUM IN NUMBER,
    PRESULT OUT SYS_REFCURSOR
)
IS
BEGIN
    OPEN PRESULT FOR
    SELECT
        ST.NAME,
        TO_CHAR(AST.DAYS, 'YYYY-MM-DD') AS DAYS,
        TO_CHAR(AST.INTIME, 'HH24:MI') AS INTIME,
        TO_CHAR(AST.OUTTIME, 'HH24:MI') AS OUTTIME,
        CASE
            WHEN TO_CHAR(AST.INTIME, 'HH24:MI') > '09:10' THEN '지각'
            WHEN TO_CHAR(AST.OUTTIME, 'HH24:MI') < '17:50' THEN '조퇴'
            WHEN TO_CHAR(AST.INTIME, 'HH24:MI') <= '09:10' AND
                TO_CHAR(AST.OUTTIME, 'HH24:MI') >= '17:50' THEN '정상'
        END AS STATUS,
        TO_CHAR(AST.INTIME, 'HH24:MI'),
        AST.STATUS AS NOTE
    FROM TBL_STUDENT ST
        INNER JOIN TBL_APPLY AP --수강신청 조인
            ON ST.SEQ = AP.STUSEQ
                INNER JOIN TBL_ATTEND_STUDENT AST --학생 근태 조인
                    ON AP.SEQ = AST.APPSEQ
                        WHERE ST.SEQ = PNUM AND ST.DELFLAG = 'Y' AND AP.DELFLAG = 'Y' AND AST.DELFLAG = 'Y'
                            ORDER BY DAYS DESC;
END;

-- 출결 조회 DECLARE
DECLARE
    PRESULT SYS_REFCURSOR;
    PNAME TBL_STUDENT.NAME%TYPE;
    PDAYS DATE;
    PINTIME DATE;
    POUTTIME DATE;
    PCONDITION VARCHAR2(10);
    PSTATUS TBL_ATTEND_STUDENT.STATUS%TYPE;
BEGIN
    PROC_STUDENT_ATTEND(8, PRESULT);
    LOOP
        FETCH PRESULT INTO PNAME, PDAYS, PINTIME, POUTTIME, PCONDITION, PSTATUS;
        EXIT WHEN PRESULT%NOTFOUND;
        
        DBMS_OUTPUT.PUT_LINE(PNAME || ' ' || PDAYS || ' ' || TO_CHAR(PINTIME, 'HH24:MI') || ' ' ||
        TO_CHAR(POUTTIME, 'HH24:MI') || ' ' || PCONDITION || ' ' || PSTATUS);
        
    END LOOP;
END;

-- S009 : 매일 근태 관리를 기록할 수 있어야 한다.(출근 1회, 퇴근 1회)

-- student -> studentcheckattend
-- 교육생 출결 관리
-- 출/퇴근 PROCEDURE
CREATE OR REPLACE PROCEDURE PROC_STUDENT_ATTEND_INOUT(
    PNUM NUMBER, --PNUM
    PRESULT OUT NUMBER
)
IS
    PSEQ NUMBER;
    PINTIME DATE;
    POUTTIME DATE;
BEGIN
    SELECT MAX(SEQ) INTO PSEQ FROM TBL_ATTEND_STUDENT WHERE APPSEQ = (SELECT SEQ FROM TBL_APPLY WHERE STUSEQ = PNUM);
    SELECT INTIME, OUTTIME INTO PINTIME, POUTTIME FROM TBL_ATTEND_STUDENT WHERE SEQ = PSEQ;
    IF PINTIME IS NOT NULL AND POUTTIME IS NOT NULL THEN
        INSERT INTO TBL_ATTEND_STUDENT VALUES (ATTEND_STUDENT_SEQ.NEXTVAL, SYSDATE, SYSDATE, NULL, NULL, 
            (SELECT SEQ FROM TBL_APPLY WHERE STUSEQ = PNUM), DEFAULT);
        PRESULT := 0;
    ELSIF PINTIME IS NOT NULL AND POUTTIME IS NULL THEN
        UPDATE TBL_ATTEND_STUDENT SET OUTTIME = SYSDATE WHERE SEQ = PSEQ;
        PRESULT := 1;
    END IF;
END;

--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

-- 관리자 열체크 VIEW
CREATE OR REPLACE VIEW VW_ADMIN_COVID19
AS
SELECT
    CAD.SEQ,
    AD.SEQ AS ADSEQ,
    AAD.DAYS,
    CAD.AMTEMP,
    CAD.PMTEMP
FROM TBL_ADMIN AD
    INNER JOIN TBL_ATTEND_ADMIN AAD
        ON AD.SEQ = AAD.ADMSEQ
            INNER JOIN TBL_COVID19_ADMIN CAD
                ON AAD.SEQ = CAD.ATTSEQ
                    WHERE AD.DELFLAG = 'Y' AND AAD.DELFLAG = 'Y' AND CAD.DELFLAG = 'Y'
                        ORDER BY AD.SEQ ASC, AAD.DAYS DESC;

-- 교사 열체크 VIEW
CREATE OR REPLACE VIEW VW_TEACHER_COVID19
AS
SELECT
    CTEA.SEQ,
    TEA.NAME,
    TEA.SEQ AS TEASEQ,
    ATEA.DAYS,
    CTEA.AMTEMP,
    CTEA.PMTEMP
FROM TBL_TEACHER TEA
    INNER JOIN TBL_ATTEND_TEACHER ATEA
        ON TEA.SEQ = ATEA.TEASEQ
            INNER JOIN TBL_COVID19_TEACHER CTEA
                ON ATEA.SEQ = CTEA.ATTSEQ
                    WHERE TEA.DELFLAG = 'Y' AND ATEA.DELFLAG = 'Y' AND CTEA.DELFLAG = 'Y'
                        ORDER BY TEA.SEQ ASC, ATEA.DAYS DESC;

-- 교사가 평가 확인 VIEW
-- 이름, 과목명, 과목시작, 과목종료, 평점
CREATE OR REPLACE VIEW VW_TEACHER_SCORE_CHECK
AS
SELECT
    T.NAME,
    S.NAME AS SUBJECT,
    OSU.STARTDATE,
    OSU.ENDDATE,
    TRUNC(AVG(TS.SCORE), 1) AS AVG
FROM TBL_TEACHER_SCORE TS
    INNER JOIN TBL_OPEN_SUBJECT OSU
        ON TS.OSUBSEQ = OSU.SEQ
            INNER JOIN TBL_AVAIL_SUBJECT ASU
                ON OSU.AVAILSEQ = ASU.SEQ
                    INNER JOIN TBL_APPLY AP
                        ON TS.APPSEQ = AP.SEQ
                            INNER JOIN TBL_TEACHER T
                                ON ASU.TEASEQ = T.SEQ
                                    INNER JOIN TBL_SUBJECT S
                                        ON ASU.SUBSEQ = S.SEQ
WHERE TS.DELFLAG = 'Y' AND OSU.DELFLAG = 'Y' AND ASU.DELFLAG = 'Y' AND AP.DELFLAG = 'Y' AND T.DELFLAG = 'Y' AND S.DELFLAG = 'Y'
                                        GROUP BY T.NAME, S.NAME, OSU.STARTDATE, OSU.ENDDATE;


-- student -> employment
-- 취업정보 VEIW
-- 학생이름, 수강상태, 수료날짜, 회사명, 연봉
CREATE OR REPLACE VIEW VW_EMPLOYMENT
AS
SELECT 
    STU.NAME,
    CASE
        WHEN OC.ENDDATE <= AP.STATUS THEN '수료'
        WHEN OC.ENDDATE > AP.STATUS THEN '중도탈락'
        WHEN AP.STATUS IS NULL THEN '수강중'
    END AS STATUS,
    EMP.COMPANY,
    CASE
        WHEN EMP.SALARY IS NOT NULL THEN TO_CHAR(EMP.SALARY, '999,999,999')
        WHEN EMP.SALARY IS NULL THEN NULL
    END AS SALARY,
    OC.SEQ AS COURSESEQ,
    C.NAME AS COURSENAME
FROM TBL_EMPLOYMENT EMP
    INNER JOIN TBL_APPLY AP
        ON EMP.APPSEQ = AP.SEQ
            INNER JOIN TBL_STUDENT STU
                ON AP.STUSEQ = STU.SEQ
                    INNER JOIN TBL_OPEN_COURSE OC
                        ON OC.SEQ = AP.OCRSSEQ
                            INNER JOIN TBL_COURSE C
                                ON OC.CRSSEQ = C.SEQ
                            WHERE EMP.DELFLAG = 'Y' AND AP.DELFLAG = 'Y' AND STU.DELFLAG = 'Y' AND OC.DELFLAG = 'Y';

-- 취업정보 UPDATE PROCEDURE
CREATE OR REPLACE PROCEDURE PROC_UPDATE_EMPLOYMENT(
    PCOMPANY VARCHAR2,
    PSALARY NUMBER,
    PSTUNAME VARCHAR2,
    PRESULT OUT NUMBER
)
IS
BEGIN

    UPDATE TBL_EMPLOYMENT SET COMPANY = PCOMPANY,
                          SALARY = PSALARY
                          WHERE APPSEQ = (SELECT SEQ FROM TBL_APPLY 
                            WHERE STUSEQ = (SELECT SEQ FROM TBL_STUDENT WHERE NAME = PSTUNAME));
    PRESULT := 1;

EXCEPTION
    WHEN OTHERS THEN
        PRESULT := 0;
END;

-- 취업정보 UPDATE DECLARE
DECLARE
    VRESULT NUMBER;
BEGIN
    PROC_UPDATE_EMPLOYMENT('구글', 33000000, 1, VRESULT);
    IF VRESULT = 1 THEN
        DBMS_OUTPUT.PUT_LINE('추가 성공');
    ELSIF VRESULT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('추가 실패');
    END IF;
END;

-- 취업정보 INSERT PROCEDURE
CREATE OR REPLACE PROCEDURE PROC_INSERT_EMPLOYMENT(
    PCOMPANY VARCHAR2,
    PSALARY NUMBER,
    PSTUNAME VARCHAR2,
    PRESULT OUT NUMBER,
    VRESULT OUT NUMBER
)
IS
BEGIN
    
    SELECT COUNT(SEQ) INTO PRESULT FROM TBL_EMPLOYMENT 
        WHERE APPSEQ = (SELECT SEQ FROM TBL_APPLY 
                WHERE STUSEQ = (SELECT SEQ FROM TBL_STUDENT WHERE NAME = PSTUNAME));
    
    IF PRESULT = 0 THEN    
        INSERT INTO TBL_EMPLOYMENT VALUES (EMPLOYMENT_SEQ.NEXTVAL, PCOMPANY, PSALARY, 
        (SELECT SEQ FROM TBL_APPLY WHERE STUSEQ = (SELECT SEQ FROM TBL_STUDENT WHERE NAME = PSTUNAME)), DEFAULT);
        VRESULT := 1;
    ELSE 
        VRESULT := 0;
    END IF;
    
END;

-- 취업정보 INSERT DECLARE
DECLARE
    VRESULT NUMBER;
BEGIN
    PROC_INSERT_EMPLOYMENT('네이버', 34000000, 8, VRESULT);
    IF VRESULT = 1 THEN
        DBMS_OUTPUT.PUT_LINE('추가 성공');
    ELSIF VRESULT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('추가 실패');
    END IF;
END;

-- 관리자 체온 추가 PROCEDURE
CREATE OR REPLACE PROCEDURE PROC_INSERT_ADMIN_COVID19(
    PAMTEMP NUMBER,
    PPMTEMP NUMBER,
    PADMSEQ NUMBER,
    PRESULT OUT NUMBER
)
IS
    PSEQ NUMBER;
    PATTSEQ NUMBER;
BEGIN    
    SELECT MAX(SEQ) INTO PSEQ FROM TBL_ATTEND_ADMIN WHERE ADMSEQ = PADMSEQ;
    SELECT MAX(ATTSEQ) INTO PATTSEQ FROM TBL_COVID19_ADMIN;
    IF PSEQ <> PATTSEQ THEN
        INSERT INTO TBL_COVID19_ADMIN
            VALUES (COVID19_ADMIN_SEQ.NEXTVAL, PAMTEMP, PPMTEMP, PSEQ, DEFAULT);
        PRESULT := 1;
    ELSE
        PRESULT := 0;
    END IF;
END;

-- 특정 관리자만 보여주는 PROCEDURE
CREATE OR REPLACE PROCEDURE PROC_SEE_COVID19_ADMIN(
    PNUM NUMBER,
    PRESULT OUT SYS_REFCURSOR
)
IS
BEGIN
    OPEN PRESULT FOR
        SELECT * FROM VW_ADMIN_COVID19 WHERE ADSEQ = PNUM ORDER BY DAYS DESC;
END;

--특정 기간 입력받아서 조회하기
CREATE OR REPLACE PROCEDURE PROC_FIND_COVID19_ADMIN(
    PSTARTDATE DATE,
    PENDDATE DATE,
    PRESULT OUT SYS_REFCURSOR
)
IS
BEGIN
    OPEN PRESULT FOR
        SELECT * FROM VW_ADMIN_COVID19 WHERE DAYS BETWEEN PSTARTDATE AND PENDDATE;
END;


-- 학생이 교사 평가 시 과목 전체조회 PROCEDURE
CREATE OR REPLACE PROCEDURE PROC_STUDENT_SCORE_TEACHER(
    PNUM IN NUMBER,
    PRESULT OUT SYS_REFCURSOR
)
IS
BEGIN
OPEN PRESULT FOR
SELECT
    T.NAME,
    S.SEQ,
    S.NAME AS SUBJECT,
    OSU.STARTDATE,
    OSU.ENDDATE,
    TS.SCORE
FROM TBL_TEACHER_SCORE TS
    INNER JOIN TBL_OPEN_SUBJECT OSU
        ON TS.OSUBSEQ = OSU.SEQ
            INNER JOIN TBL_AVAIL_SUBJECT ASU
                ON OSU.AVAILSEQ = ASU.SEQ
                    INNER JOIN TBL_APPLY AP
                        ON TS.APPSEQ = AP.SEQ
                            INNER JOIN TBL_TEACHER T
                                ON ASU.TEASEQ = T.SEQ
                                    INNER JOIN TBL_SUBJECT S
                                        ON ASU.SUBSEQ = S.SEQ
WHERE TS.APPSEQ = (SELECT SEQ FROM TBL_APPLY WHERE STUSEQ = PNUM) AND TS.DELFLAG = 'Y' AND OSU.DELFLAG = 'Y'
    AND ASU.DELFLAG = 'Y' AND AP.DELFLAG = 'Y' AND T.DELFLAG = 'Y' AND S.DELFLAG = 'Y';
END;


-- 학생이 교사 평가 INSERT PROCEDURE
CREATE OR REPLACE PROCEDURE PROC_STUDENT_GRADETEACHER(
    PNUM IN NUMBER,
    PSUBNUM IN NUMBER,
    PSCORE IN NUMBER,
    PRESULT OUT NUMBER
)
IS
    TENDDATE DATE;
    OSEQ NUMBER;
    TSEQ NUMBER;
BEGIN
    SELECT 
        OS.ENDDATE, OS.SEQ, AP.SEQ INTO TENDDATE, OSEQ, TSEQ
    FROM TBL_OPEN_SUBJECT OS
        INNER JOIN TBL_OPEN_COURSE OC
            ON OS.OCRSSEQ = OC.SEQ
                INNER JOIN TBL_APPLY AP
                    ON OC.SEQ = AP.OCRSSEQ
                        INNER JOIN TBL_AVAIL_SUBJECT ASU
                            ON OS.AVAILSEQ = ASU.SEQ
                                INNER JOIN TBL_SUBJECT S
                                    ON ASU.SUBSEQ = S.SEQ
                    WHERE AP.STUSEQ = PNUM AND S.SEQ = PSUBNUM;
    IF SYSDATE - tenddate > 0 THEN
    UPDATE TBL_TEACHER_SCORE SET SCORE = PSCORE WHERE OSUBSEQ = OSEQ AND APPSEQ = TSEQ;
        PRESULT := 1;
    ELSE 
        PRESULT := 0;
    END IF;
END;

