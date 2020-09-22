
-- 코드 게시판(스크랩 + 코드 조각 관리)
-- 싱글 유저
-- 코드 첨부(1개만)

drop table tblCategory;
drop table tblCode;

-- 카테고리 테이블
create table tblCategory (
    seq number primary key,                             --PK
    name varchar2(100) not null,                         --카테고리명
    type varchar2(100) not null
);

-- 게시판 테이블
create table tblCode (
    seq number primary key,                             --글번호(PK)
    subject varchar2(500) not null,                     --제목
    content varchar2(2000) not null,                    --내용
    filename varchar2(300) not null,                    --첨부 파일
    regdate date default sysdate not null,
    cseq number not null references tblCategory(seq)    --카테고리(언어)
);

create sequence seqCategory;
create sequence seqCode;

insert into tblCategory (seq, name) values (seqCategory.nextVal, '');
insert into tblCategory (seq, name) values (seqCategory.nextVal, '');
insert into tblCategory (seq, name) values (seqCategory.nextVal, '');
insert into tblCategory (seq, name) values (seqCategory.nextVal, '');
insert into tblCategory (seq, name) values (seqCategory.nextVal, '');











