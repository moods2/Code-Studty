-- 스크립트 파일(*.sql)
/*

오라클 계정
1. system(sys)
    - 최고 관리자
2. hr
    - 학습용 계정
3. scott
    - 학습용 계정
    
잠긴 계정 활성화하기
- 권한이 있는 유저(관리자)가 한다.
- system

alter user 유저명 account unlock;
alter user 유저명 account lock;

암호 바꾸기
- 권한이 있는 유저만 실행 가능
- alter user 유저명 identified by 암호;
- alter user hr identified by java1234;

*/
alter user hr account unlock;
alter user hr identified by java1234;

select * from tabs;

alter user scott account unlock;
alter user scott identified by java1234;

alter user scott account unlock identified by java1234;

/*

데이터베이스, Database

오라클, Oracle
- 회사명
-데이터베이스(Database) -> 데이터베이스 관리시스템(Database Management System > DBMS)
    -> 관계형 데이터베이스 관리시스템(Relation Database Management System > RDBMS)

데이터베이스
- 데이터의 집합

관계형 데이터베이스 관리시스템의 종료(RDBMS)
1. Oracle
    - Oracle
    - 기업용
    
2. MS-SQL
    - Microsoft
    - 기업용
    
3. MySQL
    - Oracle
    - 개인용 + 기업용
    
4. MariaDB
    - MySQL 기반
    - 무료
    - 개인용 + 기업용
    
5. PostgreSQL
    - 무료
    - 개인용 + 기업용

6. DB2
    - IBM
    - 메인프레임

7. Access
    - MS
    - 개인용 + 소규모 기업
    
8. 티베로
    - 티맥스(Tmax)
    - 제우스(웹서버)
    
9. SQLLite
    - 경량
    - 모바일 등


데이터베이스 클라이언트 툴
1. SQL Developer
    - 무료
    - Oracle

2. Toad(두꺼비)

3. SQLGate

4. DataGrip(JetBrain) - 30일평가판 > 대학교 이메일

5. SQL*Plus
    - 오라클 설치하면 기본 설치되는 툴
    - CLI(Command Line Interface)
    - cmd > sqlplus > hr + java1234 > select * from tabs;


오라클 에디션 + 버전

데이터 모델



프로젝트 > 다른 컴퓨터의 오라클 서버
1. 오라클 서버 > 방화벽 열기(1521)
2. 접속 생성


SQL, Structured Query Language
- SQL == Query
- 질의를 목적으로 만들어진 언어
- 자바에 비해 자연어에 가깝다.

1. DBMS와 SQL은 서로 독립적이다.
    - 표준 SQL(ANSI-SQL)
    - 표준 SQL은 모든 DBMS에서 공통으로 사용한다.
    - SQL-86 > SQL89 > ... SQL99 > SQL2011
2. 대화식 언어이다.
    - 질문 > 답변 > 질문 > 답변 > x 반복
    
오라클 = ANSI-92/99 + PL/SQL

ANSI SQL 종류

1. DDL
    - Data Definition Language
    - 데이터 정의어
    - 구조를 만드는 명령어
    - 테이블, 뷰, 사용자, 인덱스 등의 객체를 생성/수정/삭제하는 명령어
    a. create: 생성
    b. drop: 삭제
    c. alter: 수정
    - 데이터베이스 관리자
    - 데이터베이스 담당자
    - 프로그래머(일부)
    
2. DML
    - Data Manipulation Language
    - 데이터 조작어
    - 데이터베이스의 데이터 추가/수정/삭제/조회
    - CRUD(Create, Read, Update, Delete)
    a. select: 읽기
    b. insert: 추가
    c. update: 수정
    d. delete: 삭제
    - 데이터베이스 관리자
    - 데이터베이스 담당자
    - 프로그래머(*******************************)
    
3. DCL
    - Data Control Language
    - 데이터 제어어
    - 계정 관리, 보안 관리, 트랜잭션 처리 등 제어 역할
    a. commit
    b. rollback
    c. grant
    d. revoke
    - 데이터베이스 관리자
    - 데이터베이스 담당자
    - 개발자(일부)
    
4. DQL
    - Data Query Language
    - DML 중에서 select 만을 이렇게 부른다.
    
5. TCL
    - Transaction Control Language
    - DCL 중에서 commit, rollback 만을 이렇게 부른다.
    
오라클 서버 기본 인코딩
- ~ 8i : EUC-KR
- 9i ~ 현재 : UTF-8

SQL 대소문자를 구분하지 않는 언어이다.
*/
select * from tabs;
SELECT * FROM TABS;

SELECT * FROM tabs;

-- 생성 -> 식별자 > 규칙(최대 30바이트 이하)
create table tblTest (
        num number
);

drop table tblTest;
















