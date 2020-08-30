/*

DDL
- 데이터 정의어
- 데이터베이스 객체를 생성, 수정, 삭제한다.
- 데이터베이스 객체 : 테이블, 뷰, 트리거, 인덱스, 프로시저. 제약사항 등..
- create, alter, drop

테이블 생성하기

create table 테이블명
(
    컬럼 정의,
    컬럼 정의,
    컬럼 정의,
    컬럼명 자료형(길이) null 제약사항
);

제약 사항, Constraint (*******)
- 해당 컬럼에 들어갈 데이터(값)에 대한 조건 명시(규제)

1. not null
    - 해당 컬럼이 반드시 값을 가져야 한다.
    - 해당 컬럼에 값이 없으면 에러 발생
    - 필수값
    
2. primary key
    - PK
    - 기본키 = 기본(대표) + 키(컬럼)
    - 값이 유일해야 한다.(unique)
    - 값을 반드시 가져야 한다.(not null)
    - primary key = unique + not null
    - *** 반드시 모든 테이블은 primary key를 가져야 한다.
    - 기본키 형태
        a. 단일 기본키 > 기본키 : 1개의 컬럼이 PK 역할
        b. 복합 기본키 > 복합키 : 2개 이상이 컬럼이 모여서 PK 역할
    
3. foreign key
    - 나중에
    
4. unique
    - primary key - not null = unique
    - 중복값은 허용하지 않는다.
    - null은 허용한다.
    - 행을 구분하는 식별자로 사용이 불가능하다.
    
5. check
    - 사용자 정의 조건을 제약으로 추가할 수 있다.
    - where절에서 사용하던 조건을 사용 가능하다.

6. default
    - 기본값 설정
    - 해당 컬럼값을 대입하지 않으면(null) null 대신 미리 준비해놓은 값을 대입한다.

*/

-- 메모 테이블
create table tblMemo
(
    -- 컬럼명 자료형(길이) 제약사항
    seq number,                 -- 메모번호
    name varchar2(30),      -- 작성자
    memo varchar2(1000).    -- 메모
    regdate date                  -- 작성날짜
);

-- 데이터 추가하기
insert into tblMemo (컬럼리스트) values (값리스트);

insert into tblMemo (seq, name, memo, regdate) values (1, '홍길동', '메모입니다.', sysdate);
insert into tblMemo (seq, name, memo, regdate) values ('둘', '홍길동', '메모입니다.', sysdate);
insert into tblMemo (seq, name, memo, regdate) values (to_number('2'), '홍길동', '메모입니다.', sysdate);
insert into tblMemo (seq, name, memo, regdate) values (3, '홍길동홍길동홍길동홍길동', '메모입니다.', sysdate);
insert into tblMemo (seq, name, memo, regdate) values (4, '홍길동', '메모입니다.', '2020-05-30'); -- 모든 시간이 0시 0분 0초
insert into tblMemo (seq, name, memo, regdate) values (5, '홍길동', '메모입니다.', to_date('2020-05-30 14:30:00', 'yyyy-mm-dd hh24:mi:ss'));

-- 데이터 가져오기
select seq, name, memo, to_char(regdate, 'hh24:mi:ss') from tblMemo;



-- 메모 테이블
drop table tblMemo;

create table tblMemo
(
    -- 컬럼명 자료형(길이) 제약사항
    seq number not null,              --메모번호
    name varchar2(30) null,         --작성자
    memo varchar2(1000) not null, --메모
    regdate date null                     --작성날짜
);

insert into tblMemo (seq, name, memo, regdate) values (1, '홍길동', '메모입니다.', sysdate);
insert into tblMemo (seq, name, memo, regdate) values (2, '홍길동', null , sysdate);
insert into tblMemo (seq, name, memo, regdate) values (2, null, '메모입니다.' , sysdate);

select seq, name, memo, to_char(regdate, 'hh24:mi:ss') from tblMemo;



-- 메모 테이블
drop table tblMemo;

create table tblMemo
(
    -- 컬럼명 자료형(길이) 제약사항
    seq number primary key,              --메모번호
    name varchar2(30) null,         --작성자
    memo varchar2(1000) not null, --메모
    regdate date null                     --작성날짜
);

insert into tblMemo (seq, name, memo, regdate) values (1, '홍길동', '메모입니다.', sysdate);

-- ORA-00001: unique constraint (HR.SYS_C007089) violated
insert into tblMemo (seq, name, memo, regdate) values (1, '홍길동', '메모입니다.', sysdate);

-- ORA-01400: cannot insert NULL into ("HR"."TBLMEMO"."SEQ")
insert into tblMemo (seq, name, memo, regdate) values (null, '홍길동', '메모입니다.', sysdate);

select seq, name, memo, to_char(regdate, 'hh24:mi:ss') from tblMemo;

select * from tblCountry;
select * from tblInsa;



-- 메모 테이블
drop table tblMemo;

create table tblMemo
(
    -- 컬럼명 자료형(길이) 제약사항
    seq number primary key,              --메모번호(PK)
    name varchar2(30) unique,          --작성자(unique + null)
    memo varchar2(1000) not null,      --메모
    regdate date null                          --작성날짜
);

insert into tblMemo (seq, name, memo, regdate) values (1, '홍길동', '메모입니다.', sysdate);
insert into tblMemo (seq, name, memo, regdate) values (2, '홍길동', '메모입니다.', sysdate);
insert into tblMemo (seq, name, memo, regdate) values (3, null, '메모입니다.', sysdate);
insert into tblMemo (seq, name, memo, regdate) values (4, null, '메모입니다.', sysdate);

select * from tblMemo;



-- 메모 테이블
drop table tblMemo;

create table tblMemo
(
    -- 컬럼명 자료형(길이) 제약사항
    seq number primary key,              --메모번호(PK)
    name varchar2(30) unique,          --작성자(unique + null)
    memo varchar2(1000) not null,      --메모
    regdate date null,                         --작성날짜
    color varchar2(30) check(color in('red', 'greed', 'black')) not null,           --메모색상('red', 'greed', 'black')
    prio number check(prio between 1 and 100) not null
);

insert into tblMemo (seq, name, memo, regdate, color, prio)
    values (1, '홍길동', '메모입니다', sysdate, 'red', 100);
    
insert into tblMemo (seq, name, memo, regdate, color, prio)
    values (2, '아무개', '메모입니다', sysdate, 'yellow', 100);
    
insert into tblMemo (seq, name, memo, regdate, color, prio)
    values (3, '호호호', '메모입니다', sysdate, 'red', 200);
    
select * from tblMemo;



-- 메모 테이블
drop table tblMemo;

create table tblMemo
(
    -- 컬럼명 자료형(길이) 제약사항
    seq number primary key,              --메모번호(PK)
    name varchar2(30) default '익명', --작성자(unique + null)
    memo varchar2(1000) not null,      --메모
    regdate date null,                         --작성날짜
    color varchar2(30) check(color in('red', 'greed', 'black')) not null,           --메모색상('red', 'greed', 'black')
    prio number default 50
);

insert into tblMemo (seq, name, memo, regdate, color, prio)
    values (1, '홍길동', '메모입니다', sysdate, 'red', 100);

insert into tblMemo (seq, name, memo, regdate, color, prio)
    values (2, null, '메모입니다', sysdate, 'red', null); --명시적 null -> default 동작X
    
insert into tblMemo (seq, memo, regdate, color)
    values (3, '메모입니다', sysdate, 'red'); --암시적 null -> default 동작O

select * from tblMemo;



-- 메모 테이블
drop table tblMemo;

create table tblMemo
(
    -- 컬럼명 자료형(길이) 제약사항
    seq number constraint tblmemo_seq_pk primary key,              --메모번호(PK)
    name varchar2(30),                                                               --작성자(unique + null)
    memo varchar2(1000) constraint tblmemo_memo_ck check(length(memo) between 33 and 333),                 --메모
    regdate date                                                                           --작성날짜
);


-- 메모 테이블
drop table tblMemo;

create table tblMemo
(
    -- 컬럼명 자료형(길이)
    seq number,
    name varchar2(30) not null,
    memo varchar2(1000) not null,
    regdate date,
    
    -- 제약사항 추가
    constraint tblmemo_seq_pk primary key(seq),
    constraint tblmemo_memo_ck check(length(memo) > 20),
    constraint tblmemo_uq unique(name)
    
);

insert into tblMemo (seq, name, memo, regdate)
    values (1, '홍길동', '메모입니다.메모입니다.메모입니다.메모입니다.메모입니다.메모입니다.메모입니다.메모입니다.메모입니다.메모입니다.메모입니다.메모입니다.메모입니다.메모입니다.메모입니다.메모입니다.메모입니다.메모입니다.메모입니다.', sysdate);

insert into tblMemo (seq, name, memo, regdate)
    values (1, '홍길동', '메모입니다.메모입니다.메모입니다.메모입니다.메모입니다.메모입니다.메모입니다.메모입니다.메모입니다.메모입니다.메모입니다.메모입니다.메모입니다.메모입니다.메모입니다.메모입니다.메모입니다.메모입니다.메모입니다.', sysdate);
    
select * from tblMemo;


/*

제약 사항을 만드는 방법
1. 컬럼 수준에서 만드는 방법
    - 위의 방법
    - 컬럼 1개를 선언할 때 제약사항도 같이 선언하는 방법
    - ex) seq number primary key
    - 컬럼명 자료형(길이) [constraint 제약명] 제약조건

2. 테이블 수준에서 만드는 방법
    - 컬럼 정의와 제약 사항 정의를 분리 > 가독성

*/

