-- 개설된 강의실 정보
CREATE TABLE TBL_OPEN_CLASSROOM
(
    SEQ NUMBER PRIMARY KEY, -- 개설된 강의실 번호
    OCRSSEQ NUMBER NOT NULL REFERENCES TBL_OPEN_COURSE(SEQ), -- 개설 과정 번호
    ROOMSEQ NUMBER NOT NULL REFERENCES TBL_CLASSROOM(SEQ) -- 강의실 번호   
);

COMMENT ON TABLE TBL_OPEN_CLASSROOM is '개설된 강의실 정보 테이블';
COMMENT ON COLUMN TBL_OPEN_CLASSROOM.SEQ is '개설된 강의실 정보 번호';
COMMENT ON COLUMN TBL_OPEN_CLASSROOM.OCRSSEQ is '개설 과정 번호 참조 키';
COMMENT ON COLUMN TBL_OPEN_CLASSROOM.ROOMSEQ is '강의실 번호 참조 키';

-- 성적
CREATE TABLE TBL_SCORE
(
    SEQ NUMBER PRIMARY KEY, -- 성적 번호
    WRITE NUMBER, -- 필기 성적
    PERFORMANCE NUMBER, -- 실기 성적
    ATTEND NUMBER, -- 출결 점수
    OSUBSEQ NUMBER NOT NULL REFERENCES TBL_OPEN_SUBJECT(SEQ), -- 개설 과목 번호
    STESEQ NUMBER NOT NULL REFERENCES TBL_STUDENT(SEQ) -- 교육생 번호
);

COMMENT ON TABLE TBL_SCORE is '성적 테이블';
COMMENT ON COLUMN TBL_SCORE.SEQ is '성적 번호';
COMMENT ON COLUMN TBL_SCORE.WRITE is '필기 성적';
COMMENT ON COLUMN TBL_SCORE.PERFORMANCE is '실기 성적';
COMMENT ON COLUMN TBL_SCORE.ATTEND is '출결 점수';
COMMENT ON COLUMN TBL_SCORE.OSUBSEQ is '개설 과목 번호 참조 키';
COMMENT ON COLUMN TBL_SCORE.STESEQ is '교육생 번호 참조 키';

-- 배점
CREATE TABLE TBL_POINT
(
    SEQ NUMBER PRIMARY KEY, -- 배점 번호
    WRITE NUMBER, -- 필기 배점
    PERFORMANCE NUMBER, -- 실기 배점
    ATTEND NUMBER DEFAULT 20 NOT NULL, -- 출결 배점
    OSUBSEQ NUMBER NOT NULL REFERENCES TBL_OPEN_SUBJECT(SEQ) --  개설 과목 번호
);

COMMENT ON TABLE TBL_POINT is '배점 테이블';
COMMENT ON COLUMN TBL_POINT.SEQ is '배점 번호';
COMMENT ON COLUMN TBL_POINT.WRITE is '필기 배점';
COMMENT ON COLUMN TBL_POINT.PERFORMANCE is '실기 배점';
COMMENT ON COLUMN TBL_POINT.ATTEND is '출결 배점';
COMMENT ON COLUMN TBL_POINT.OSUBSEQ is '개설 과목 번호 참조 키';

-- 시험
CREATE TABLE TBL_TEST
(
    SEQ NUMBER PRIMARY KEY, -- 시험 번호
    TESTFILE VARCHAR2(500), -- 시험 파일
    TESTDATE DATE, -- 시험 날짜
    OSUBSEQ NUMBER NOT NULL REFERENCES TBL_OPEN_SUBJECT(SEQ) -- 개설 과목 번호
);

COMMENT ON TABLE TBL_TEST is '시험 테이블';
COMMENT ON COLUMN TBL_TEST.SEQ is '시험 번호';
COMMENT ON COLUMN TBL_TEST.TESTFILE is '시험 파일';
COMMENT ON COLUMN TBL_TEST.TESTDATE is '시험 날짜';
COMMENT ON COLUMN TBL_TEST.OSUBSEQ is '개설 과목 번호 참조 키';

insert into tbl_student values (student_seq.nextval, '장정우', 'jwoo0823', '950823-1852369', '010-4820-3060', '302-0344-8261-01', '2020-02-04');
commit;

--photoshop
insert into tbl_book values (book_seq.nextval, '포토샵-일러스트레이터 CC 2020 무작정 따라하기', '길벗', 21);
insert into tbl_book values (book_seq.nextval, 'Photoshop 10년 사용할 수 있는 테크닉 사전', '길벗', 21);
insert into tbl_book values (book_seq.nextval, '맛있는 디자인 프리미어 프로-애프터 이펙트 CC 2020', '한빛미디어', 21);

--illustrator
insert into tbl_book values (book_seq.nextval, '일러스트레이터 Illustrator CS5(영문판)', '교학사', 22);
insert into tbl_book values (book_seq.nextval, 'How to be an Illustrator', 'Laurence King', 22);
insert into tbl_book values (book_seq.nextval, '스크린톤 제작 테크닉 with Photoshop Illustrator', '디지털북스', 22);

--aduino
insert into tbl_book values (book_seq.nextval, '상상을 현실로 만드는 아두이노(Arduino)', '에듀아이', 23);
insert into tbl_book values (book_seq.nextval, '스크래치 for 아두이노', '디지털북스', 23);
insert into tbl_book values (book_seq.nextval, '한 권으로 끝내는 아두이노 입문 + 실전(종합편)', '앤써북', 23);

--raspberry Pi
insert into tbl_book values (book_seq.nextval, 'IoT 사물인터넷을 위한 라즈베리파이 4 정석', '앤써북', 24);
insert into tbl_book values (book_seq.nextval, '사물인터넷을 위한 리눅스 프로그래밍 with 라즈베리 파이', '제이펍', 24);
insert into tbl_book values (book_seq.nextval, '라즈베리파이로 시작하는 핸드메이드 IoT', '비제이퍼블릭', 24);

--lisp
insert into tbl_book values (book_seq.nextval, 'LISP Network Deployment and Troubleshooting', 'Cisco Press', 25);
insert into tbl_book values (book_seq.nextval, 'ANSI Common LISP', 'Pearson', 25);
insert into tbl_book values (book_seq.nextval, 'Practical Common LISP', 'Apress', 25);

--cad
insert into tbl_book values (book_seq.nextval, '건축 인테리어 실무를 위한 캐드 도면 설계', '디지털북스', 26);
insert into tbl_book values (book_seq.nextval, '국산 캐드 캐디안(CADian)', '유니크', 26);
insert into tbl_book values (book_seq.nextval, '캐드 앤 그래픽스(CAD - Graphics)', '이엔지미디어', 26);

--prolog
insert into tbl_book values (book_seq.nextval, 'Programming in PROLOG', 'Springer', 27);
insert into tbl_book values (book_seq.nextval, '인공지능 논리 Prolog 프로그래밍', '한티미디어', 27);
insert into tbl_book values (book_seq.nextval, '언어 정보 처리를 위한 PROLOG', '한국외국어대학교출판부', 27);

--php
insert into tbl_book values (book_seq.nextval, '생활코딩! PHP + MySQL', '위키북스', 28);
insert into tbl_book values (book_seq.nextval, 'PHP - MySQL 닌자 비법서', '한빛미디어', 28);
insert into tbl_book values (book_seq.nextval, '러닝 PHP', '한빛미디어', 28);

--asp
insert into tbl_book values (book_seq.nextval, '웹사이트 구축을 위한 ASP 웹 프로그래밍', '오성미디어', 29);
insert into tbl_book values (book_seq.nextval, 'ASP NET 4.0 프로그래밍', '한빛아카데미', 29);
insert into tbl_book values (book_seq.nextval, '핵심 ASP 프로그래밍', '생능', 29);

--R
insert into tbl_book values (book_seq.nextval, 'Do it! 쉽게 배우는 R 데이터 분석', '이지스퍼블리싱', 30);
insert into tbl_book values (book_seq.nextval, '빅 데이터 분석을 위한 R 프로그래밍', '가메', 30);
insert into tbl_book values (book_seq.nextval, '빅데이터 분석 도구 R 프로그래밍', '에이콘출판', 30);

--hadoop
insert into tbl_book values (book_seq.nextval, 'Hadoop Hacks', '와우북스', 31);
insert into tbl_book values (book_seq.nextval, 'Hadoop 보안', '에이콘출판', 31);
insert into tbl_book values (book_seq.nextval, 'Hadoop 에코시스템', '에이콘출판', 31);

--swift
insert into tbl_book values (book_seq.nextval, '스위프트 프로그래밍: Swift 5', '한빛미디어', 32);
insert into tbl_book values (book_seq.nextval, 'The 친절한 Swift 프로그래밍 Zero(V 4.0)', '책장', 32);
insert into tbl_book values (book_seq.nextval, '가장 쉬운 Swift 입문 책', '비제이퍼블릭', 32);

--unreal engine
insert into tbl_book values (book_seq.nextval, 'UNREAL ENGINE 4 for DESIGN VISUALIZATION', '에이콘출판', 33);
insert into tbl_book values (book_seq.nextval, 'Unreal Engine Physics Essentials', 'Packt Publishing', 33);
insert into tbl_book values (book_seq.nextval, 'Learning Unreal Engine Game Development', 'Packt Publishing', 33);

--unity
insert into tbl_book values (book_seq.nextval, '소문난 명강의 레트로의 유니티 게임 프로그래밍 에센스', '한빛미디어', 34);
insert into tbl_book values (book_seq.nextval, '그림으로 이해하고 만들면서 익히는 유니티 교과서', '길벗', 34);
insert into tbl_book values (book_seq.nextval, '인생 유니티 교과서', '성안당', 34);

--solidity
insert into tbl_book values (book_seq.nextval, '이더리움과 솔리디티 입문', '위키북스', 35);
insert into tbl_book values (book_seq.nextval, '솔리디티 프로그래밍 에센셜', '위키북스', 35);
insert into tbl_book values (book_seq.nextval, '처음 배우는 블록체인', '한빛미디어', 35);

--cloud
insert into tbl_book values (book_seq.nextval, '클라우드 네이티브 아키텍처', '위키북스', 36);
insert into tbl_book values (book_seq.nextval, '기초 클라우드 마스터(BCM)', '아카데미소프트', 36);
insert into tbl_book values (book_seq.nextval, '통합 클라우드 마스터 ICM', '아카데미소프트', 36);

--deep learning
insert into tbl_book values (book_seq.nextval, '밑바닥부터 시작하는 딥러닝', '한빛미디어', 37);
insert into tbl_book values (book_seq.nextval, '케라스 창시자에게 배우는 딥러닝', '길벗', 37);
insert into tbl_book values (book_seq.nextval, '백견불여일타 딥러닝 입문 with 텐서플로우 2.x', '로드북', 37);

--ui/ux
insert into tbl_book values (book_seq.nextval, 'NCS를 기반으로 한 UI/UX 디자인 이론과 실습', '한빛아카데미', 38);
insert into tbl_book values (book_seq.nextval, '스마트폰 앱 UX UI 디자인', '영진닷컴', 38);
insert into tbl_book values (book_seq.nextval, '바로 뽑아 쓰는 스마트폰 앱 UX UI 디자인', '디지털 북스', 38);

--kotlin
insert into tbl_book values (book_seq.nextval, '이것이 안드로이드다 with 코틀린', '한빛미디어', 39);
insert into tbl_book values (book_seq.nextval, '코틀린을 다루는 기술', '길벗', 39);
insert into tbl_book values (book_seq.nextval, 'Kotlin in Action', '에이콘출판', 39);

--xml
insert into tbl_book values (book_seq.nextval, 'XML 프로그래밍', '한빛아카데미', 40);
insert into tbl_book values (book_seq.nextval, '핵심만 골라 빠르고 쉽게 배우는 XML 퀵스타트 가이드', '프리렉', 40);
insert into tbl_book values (book_seq.nextval, '끝장 XML 기술과 활용', '오성미디어', 40);

commit;

select * from tbl_book;
select * from tbl_ATTEND_ADMIN;

commit;

select * from tbl_attend_admin;

create sequence attend_admin_seq;

create sequence covid19_admin_seq;

select min(days) from tbl_attend_admin;

commit;

insert into tbl_apply values (apply_seq.nextVal, '2020-03-05', 1, 1);
insert into tbl_apply values (apply_seq.nextVal, null, 2, 2);
insert into tbl_apply values (apply_seq.nextVal, '2020-03-07', 3, 3);

create sequence employment_seq;
drop sequence employment_seq;
create sequence apply_seq;
drop sequence apply_seq;
drop sequence STUDENT_SEQ;
CREATE sequence STUDENT_SEQ;


SELECT STATUS, SEQ FROM TBL_APPLY;

commit;

UPDATE TBL_EMPLOYMENT SET SALARY = SALARY*10000 WHERE SALARY IS NOT NULL;

select * from tbl_avail_subject where teaseq = 5 order by subseq;
select * from tbl_open_course;
select * from tbl_course;
select * from tbl_subject;
select * from tbl_course_subject where crsseq = 10;

--4     20/01/04	 20/07/22  crsseq = 7 teacher = 4     6.5개월..?

INSERT INTO TBL_OPEN_SUBJECT VALUES (OPEN_SUBJECT_SEQ.NEXTVAL, '2020-01-04', '2020-01-17', 4, 75);
INSERT INTO TBL_OPEN_SUBJECT VALUES (OPEN_SUBJECT_SEQ.NEXTVAL, '2020-01-18', '2020-02-01', 4, 76);
INSERT INTO TBL_OPEN_SUBJECT VALUES (OPEN_SUBJECT_SEQ.NEXTVAL, '2020-02-02', '2020-02-15', 4, 77);
INSERT INTO TBL_OPEN_SUBJECT VALUES (OPEN_SUBJECT_SEQ.NEXTVAL, '2020-02-16', '2020-02-29', 4, 78);
INSERT INTO TBL_OPEN_SUBJECT VALUES (OPEN_SUBJECT_SEQ.NEXTVAL, '2020-03-01', '2020-03-14', 4, 79);
INSERT INTO TBL_OPEN_SUBJECT VALUES (OPEN_SUBJECT_SEQ.NEXTVAL, '2020-03-15', '2020-03-28', 4, 80);
INSERT INTO TBL_OPEN_SUBJECT VALUES (OPEN_SUBJECT_SEQ.NEXTVAL, '2020-03-29', '2020-04-11', 4, 81);
INSERT INTO TBL_OPEN_SUBJECT VALUES (OPEN_SUBJECT_SEQ.NEXTVAL, '2020-04-12', '2020-04-25', 4, 82);
INSERT INTO TBL_OPEN_SUBJECT VALUES (OPEN_SUBJECT_SEQ.NEXTVAL, '2020-04-26', '2020-05-09', 4, 83);
INSERT INTO TBL_OPEN_SUBJECT VALUES (OPEN_SUBJECT_SEQ.NEXTVAL, '2020-05-10', '2020-05-23', 4, 84);
INSERT INTO TBL_OPEN_SUBJECT VALUES (OPEN_SUBJECT_SEQ.NEXTVAL, '2020-05-24', '2020-06-20', 4, 95);
INSERT INTO TBL_OPEN_SUBJECT VALUES (OPEN_SUBJECT_SEQ.NEXTVAL, '2020-06-21', '2020-07-22', 4, 89);


--21	19/04/08	19/09/23	crsseq = 10	teacher = 4     5.5개월

INSERT INTO TBL_OPEN_SUBJECT VALUES (OPEN_SUBJECT_SEQ.NEXTVAL, '2019-04-08', '2019-04-21', 21, 75);
INSERT INTO TBL_OPEN_SUBJECT VALUES (OPEN_SUBJECT_SEQ.NEXTVAL, '2019-04-22', '2019-05-06', 21, 76);
INSERT INTO TBL_OPEN_SUBJECT VALUES (OPEN_SUBJECT_SEQ.NEXTVAL, '2019-05-07', '2019-05-21', 21, 77);
INSERT INTO TBL_OPEN_SUBJECT VALUES (OPEN_SUBJECT_SEQ.NEXTVAL, '2019-05-22', '2019-06-05', 21, 78);
INSERT INTO TBL_OPEN_SUBJECT VALUES (OPEN_SUBJECT_SEQ.NEXTVAL, '2019-06-06', '2019-06-20', 21, 79);
INSERT INTO TBL_OPEN_SUBJECT VALUES (OPEN_SUBJECT_SEQ.NEXTVAL, '2019-06-21', '2019-07-05', 21, 80);
INSERT INTO TBL_OPEN_SUBJECT VALUES (OPEN_SUBJECT_SEQ.NEXTVAL, '2019-07-06', '2019-07-20', 21, 81);
INSERT INTO TBL_OPEN_SUBJECT VALUES (OPEN_SUBJECT_SEQ.NEXTVAL, '2019-07-21', '2019-08-04', 21, 82);
INSERT INTO TBL_OPEN_SUBJECT VALUES (OPEN_SUBJECT_SEQ.NEXTVAL, '2019-08-05', '2019-08-19', 21, 83);
INSERT INTO TBL_OPEN_SUBJECT VALUES (OPEN_SUBJECT_SEQ.NEXTVAL, '2019-08-20', '2019-09-03', 21, 84);
INSERT INTO TBL_OPEN_SUBJECT VALUES (OPEN_SUBJECT_SEQ.NEXTVAL, '2019-09-04', '2020-09-23', 21, 90);

    
--22	19/05/08	19/12/13	crsseq = 4	teacher = 2     7개월

INSERT INTO TBL_OPEN_SUBJECT VALUES (OPEN_SUBJECT_SEQ.NEXTVAL, '2019-05-08', '2019-05-22', 22, 26);
INSERT INTO TBL_OPEN_SUBJECT VALUES (OPEN_SUBJECT_SEQ.NEXTVAL, '2019-05-23', '2019-06-06', 22, 27);
INSERT INTO TBL_OPEN_SUBJECT VALUES (OPEN_SUBJECT_SEQ.NEXTVAL, '2019-06-07', '2019-06-21', 22, 28);
INSERT INTO TBL_OPEN_SUBJECT VALUES (OPEN_SUBJECT_SEQ.NEXTVAL, '2019-06-22', '2019-07-06', 22, 29);
INSERT INTO TBL_OPEN_SUBJECT VALUES (OPEN_SUBJECT_SEQ.NEXTVAL, '2019-07-07', '2019-07-21', 22, 30);
INSERT INTO TBL_OPEN_SUBJECT VALUES (OPEN_SUBJECT_SEQ.NEXTVAL, '2019-07-22', '2019-08-05', 22, 31);
INSERT INTO TBL_OPEN_SUBJECT VALUES (OPEN_SUBJECT_SEQ.NEXTVAL, '2019-08-06', '2019-08-20', 22, 32);
INSERT INTO TBL_OPEN_SUBJECT VALUES (OPEN_SUBJECT_SEQ.NEXTVAL, '2019-08-21', '2019-09-04', 22, 33);
INSERT INTO TBL_OPEN_SUBJECT VALUES (OPEN_SUBJECT_SEQ.NEXTVAL, '2019-09-05', '2019-09-19', 22, 34);
INSERT INTO TBL_OPEN_SUBJECT VALUES (OPEN_SUBJECT_SEQ.NEXTVAL, '2019-09-20', '2019-10-04', 22, 261);
INSERT INTO TBL_OPEN_SUBJECT VALUES (OPEN_SUBJECT_SEQ.NEXTVAL, '2019-10-05', '2019-10-26', 22, 38);
INSERT INTO TBL_OPEN_SUBJECT VALUES (OPEN_SUBJECT_SEQ.NEXTVAL, '2019-10-27', '2019-11-02', 22, 42);
INSERT INTO TBL_OPEN_SUBJECT VALUES (OPEN_SUBJECT_SEQ.NEXTVAL, '2019-11-03', '2019-12-13', 22, 35);


--23	19/06/08	19/12/10	crsseq = 7	teacher = 5	    6개월

INSERT INTO TBL_OPEN_SUBJECT VALUES (OPEN_SUBJECT_SEQ.NEXTVAL, '2019-06-08', '2019-06-22', 23, 96);
INSERT INTO TBL_OPEN_SUBJECT VALUES (OPEN_SUBJECT_SEQ.NEXTVAL, '2019-06-23', '2019-07-07', 23, 97);
INSERT INTO TBL_OPEN_SUBJECT VALUES (OPEN_SUBJECT_SEQ.NEXTVAL, '2019-07-08', '2019-07-22', 23, 98);
INSERT INTO TBL_OPEN_SUBJECT VALUES (OPEN_SUBJECT_SEQ.NEXTVAL, '2019-07-23', '2019-08-06', 23, 99);
INSERT INTO TBL_OPEN_SUBJECT VALUES (OPEN_SUBJECT_SEQ.NEXTVAL, '2019-08-07', '2019-08-21', 23, 100);
INSERT INTO TBL_OPEN_SUBJECT VALUES (OPEN_SUBJECT_SEQ.NEXTVAL, '2019-08-22', '2019-09-05', 23, 101);
INSERT INTO TBL_OPEN_SUBJECT VALUES (OPEN_SUBJECT_SEQ.NEXTVAL, '2019-09-06', '2019-09-20', 23, 102);
INSERT INTO TBL_OPEN_SUBJECT VALUES (OPEN_SUBJECT_SEQ.NEXTVAL, '2019-09-21', '2019-10-05', 23, 103);
INSERT INTO TBL_OPEN_SUBJECT VALUES (OPEN_SUBJECT_SEQ.NEXTVAL, '2019-10-06', '2019-10-20', 23, 104);
INSERT INTO TBL_OPEN_SUBJECT VALUES (OPEN_SUBJECT_SEQ.NEXTVAL, '2019-10-21', '2019-11-04', 23, 105);
INSERT INTO TBL_OPEN_SUBJECT VALUES (OPEN_SUBJECT_SEQ.NEXTVAL, '2019-11-05', '2019-12-03', 23, 106);
INSERT INTO TBL_OPEN_SUBJECT VALUES (OPEN_SUBJECT_SEQ.NEXTVAL, '2019-12-03', '2019-12-10', 23, 107);



DROP SEQUENCE SUPPORT_SEQ;
CREATE SEQUENCE SUPPORT_SEQ;
commit;

SELECT * FROM TBL_ATTEND_STUDENT;
SELECT COUNT(*) FROM TBL_ATTEND_STUDENT WHERE INTIME IS NULL GROUP BY APPSEQ;


--    STU.NAME AS "학생 이름",
--    STU.ID AS "학생 ID",
--    STU.SSN AS "학생 주민등록번호",
--    STU.TEL AS "학생 핸드폰번호",
--    STU.ACCOUNT AS "학생 계좌번호",
--    STU.REGDATE AS "학생 등록일",
--    CRS.NAME AS "과정명",
--    OC.STARTDATE AS "과정 시작일",
--    OC.ENDDATE AS "과정 종료일",
--    CROOM.SEQ AS "강의실번호",
--    SUB.NAME AS "과목명",
--    OS.STARTDATE AS "과목 시작일",
--    OS.ENDDATE AS "과목 종료일"

SELECT * FROM TBL_COURSE;


SELECT
    
    STU.SEQ, 
    STU.NAME AS "학생 이름", 
    STU.ID AS "학생 ID", 
    STU.SSN AS "학생 주민등록번호",
    STU.TEL AS "학생 핸드폰번호", 
    STU.ACCOUNT AS "학생 계좌번호", 
    STU.REGDATE AS "학생 등록일",
    (SELECT NAME FROM TBL_COURSE WHERE SEQ = OC.CRSSEQ) AS "과정명",
    OC.STARTDATE AS "과정 시작일",
    OC.ENDDATE AS "과정 종료일",
    OCROOM.SEQ AS "강의실번호",
    (SELECT NAME FROM TBL_SUBJECT WHERE SEQ = AVAS.SUBSEQ) AS "과목명",
    OS.STARTDATE AS "과목 시작일",
    OS.ENDDATE AS "과목 종료일"
    
FROM TBL_STUDENT STU -- 교육생
--    LEFT OUTER JOIN TBL_APPLY APP -- 수강 신청
    INNER JOIN TBL_APPLY APP -- 수강 신청
        ON STU.SEQ = APP.STUSEQ
            INNER JOIN TBL_OPEN_COURSE OC -- 개설 과정
                ON OC.SEQ = APP.OCRSSEQ
                    LEFT OUTER JOIN TBL_OPEN_SUBJECT OS -- 개설 과목
                        ON OS.OCRSSEQ = OC.SEQ
                            INNER JOIN TBL_AVAIL_SUBJECT AVAS-- 강의 가능 과목
                                ON OS.AVAILSEQ = AVAS.SEQ
                                    INNER JOIN TBL_OPEN_CLASSROOM OCROOM-- 개설된 강의실
                                        ON OCROOM.OCRSSEQ = OC.SEQ
                                WHERE STU.SEQ = 365;

