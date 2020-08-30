-- db.sql

-- 회원 테이블
drop table tblMember cascade constraints;
drop sequence seqMember;

create table tblMember (
    seq number primary key,                 -- 번호(PK)
    id varchar2(30) not null,               -- 아이디
    name varchar2(30) not null,             -- 이름
    email varchar2(100) not null,           -- 이메일
    pw varchar2(30) not null,               -- 암호
    pic varchar2(50) not null,              -- 프로필 사진
    regdate date default sysdate            -- 가입일
);

create sequence seqMember;

select * from tblMember;

delete from tblMember;

commit;

drop table tblComment;
drop table tblBoard;


-- 게시판
create table tblBoard (
    seq number primary key,                 --글번호(PK)
    subject varchar2(1000) not null,        --제목
    content varchar2(2000) not null,        --내용
    regdate date default sysdate not null,  --등록일
    readcount number default 0 not null,    --조회수
    --heart number default 0 not null,         --추천
    mseq number not null references tblMember(seq), --회원번호(FK)
    thread number not null, --답변
    depth number not null --답변
);

delete from tblHeart;
delete from tblComment;
delete from tblBoard;

alter table tblBoard
add (thread number not null);

alter table tblBoard
add (depth number not null);

create sequence seqBoard;

insert into tblBoard (seq, subject, content, regdate, readcount, heart, mseq)
    values (seqBoard.nextVal, '게시판 테스트입니다.', '글내용입니다.', default,
                default, default, 5);

select * from tblMember;
select * from tblBoard;

commit;


select seq, subject, (select name from tblMember where seq = tblBoard.mseq) as name
, regdate, readcount from tblBoard;


create or replace view vwBoard
as
select 
    seq, subject, 
    (select name from tblMember where seq = tblBoard.mseq) as name,
    regdate, readcount,
    (sysdate - regdate) * 24 as gap,
    content,
    (select count(*) from tblComment where bseq = tblBoard.seq) as commentcount,
    (select count(*) from tblHeart where bseq = tblBoard.seq) as heart,
    thread, depth
from tblBoard;

select * from vwBoard;


select a.*, 
    (select name from tblMember where seq = a.mseq) as name, 
    (select id from tblMember where seq = a.mseq) as id 
    from tblBoard a where seq = ?;



-- 작업 히스토리
create table tblHistory (
    seq number primary key,
    content varchar2(2000) not null
);

insert into tblHistory values (1, 'v0.1\n- 시작');

delete from tblHistory;

commit;

select * from tblBoard;
delete from tblBoard;


-- 댓글

create table tblComment (
    seq number primary key,
    commentContent varchar2(1000) not null,
    regdate date default sysdate,
    mseq number not null 
            references tblMember(seq),
    bseq number not null
            references tblBoard(seq)
);

create sequence seqComment;



select 
   a.*,
   (select name from tblMember where seq = a.mseq) as name,
   (select id from tblMember where seq = a.mseq) as id
from tblComment a;



-- 1. join : X
-- 2. union : O
-- 3. 상관 서브쿼리 : O
select count(*) as bcnt from tblBoard where mseq = 5
union all
select count(*) as ccnt from tblComment where mseq = 5;

select (select count(*) as bcnt from tblBoard where mseq = 5) as bcnt
    , (select count(*) as ccnt from tblComment where mseq = 5) as ccnt 
    from dual;



-- 1. 댓글 테이블 삭제
drop table tblComment;
-- 2. 게시판 테이블 삭제
drop table tblBoard;
-- 3. 게시판 테이블 생성(heart 삭제 후)
-- create table tblBoard
-- 4. 댓글 테이블 생성
-- create table tblComment
-- 5. 추천 테이블 생성
create table tblHeart (
    seq number primary key,
    mseq number not null references tblMember(seq),
    bseq number not null references tblBoard(seq)
);

create sequence seqHeart;










select * from tblHeart;

select a.*, 
    (select name from tblMember where seq = a.mseq) as name, 
    (select id from tblMember where seq = a.mseq) as id,
    (select count(*) from tblHeart where bseq = a.seq and mseq = 5) as heart
from tblBoard a ;

select count(*) as cnt from tblHeart where bseq = 61 and mseq = 5;


select nvl(max(thread), 0) + 1000 from tblBoard;


select * from vwBoard order by thread desc, depth asc;

select * from tblMember;

-- 초기화
delete from tblHeart;
delete from tblComment;
delete from tblBoard;

commit;

-- 한페이지 당 -> 20개씩
select * from (select a.*, rownum as rnum from (select * from vwBoard order by thread desc) a) where rnum >= 21 and rnum <= 40;



-- 일정 테이블
create table tblPlan (
    seq number primary key,                             --번호(PK)
    mseq number not null references tblMember(seq),    --회원(FK)
    regdate varchar2(10) not null,                      --날짜
    content varchar2(300) not null                      --일정 내용
);

create sequence seqPlan;

select * from tblPlan;


select p.*, (select name from tblMember where seq = p.mseq) as name 
from tblPlan p;




-- 쪽지
create table tblMessage (
    seq number primary key,
    smseq number not null references tblMember(seq),
    rmseq number not null references tblMember(seq),
    content varchar2(1000) not null,
    regdate date default sysdate,
    state number(1) default 0 
    -- 0(안읽음+확인안함), 1(안읽음+확인했음)
    -- , 2(읽음,확인했음)
);

create sequence seqMessage;

select * from tblMessage;

select * from tblMember;
delete from tblMember where seq = 44;











