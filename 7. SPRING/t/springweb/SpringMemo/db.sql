create table tblMemo (
    seq number primary key,
    name varchar2(30) not null,
    memo varchar2(1000) not null,
    regdate date default sysdate not null
);

create sequence seqMemo;

select * from tblmemo;