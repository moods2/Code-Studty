-- D:\class\JDBCTest\jdbc.sql

create table tblAddress (

    seq number primary key,                 --번호(PK)
    name varchar2(30) not null,             --이름
    age number(3) not null,                 --나이
    tel varchar2(15) null,                  --전화
    address varchar2(300) not null,         --주소
    regdate date default sysdate not null   --등록시간

);

create sequence seqAddress;

insert into tblAddress (seq, name, age, tel, address, regdate)
    values (seqAddress.nextVal, '홍길동', 20, '010-1234-5678',
                '서울시 강남구 역삼동', default);
                
commit;

select * from tblAddress;