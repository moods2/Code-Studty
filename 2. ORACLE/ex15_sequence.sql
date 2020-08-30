/*

시퀀스, seqeunce
- 데이터베이스 객체 중 하나
- 식별자 생성 도구

시퀀스 객체 생성하기
- create sequence 시퀀스명;

시퀀스 색체 삭제하기
- drop sequence 시퀀스명;

*/

select * from tblTodo;
select max(seq) + 1 from tblTodo;

create sequence seqNum;

-- 1, 2, 3, 4, 5.... 일련번호
select seqNum.nextVal from dual;

-- 'A001', 'A002', 'A003'... 쇼핑몰 상품번호
select 'A' || seqNum.nextVal from dual;

select 'A' || trim(to_char(seqNum.nextVal, '000')) from dual;

drop table tblMemo;

create table tblMemo
(
    seq number primary key,
    name varchar2(30),
    memo varchar2(1000),
    regdate date default sysdate
);

create sequence seqMemo;

insert into tblMemo (seq, name, memo) values (seqMemo.nextVal, '홍길동', '메모입니다.');

select * from tblMemo;

-- ORA-08002: sequence SEQMEMO.CURRVAL is not yet defined in this session
select seqMemo.currVal from dual; --확인 + 0
select seqMemo.nextVal from dual; --확인 + 1


-- 개발 중.. > 서비스 오픈 > 번호 초기화(= 시퀀스 객체 리셋)
select seqMemo.nextVal from dual;

-- A.
drop sequence seqMemo;
create sequence seqMemo
    increment by 1 -- 시퀀스 증감치 지정(양수, 음수)
    start with 1      -- 시작값(seed)
    --maxvalue 10     -- 최댓값
    --minvalue 1       -- 최솟값
    --cycle
    cache 20;
    
-- 시퀀스 객체 생성하기
-- create sequence 시퀀스명;
-- create seqeunce 시퀀스명
--                increment by N
--                start with N
--                maxvalue N
--                minvalue N
--                cycle
--                cache N;

