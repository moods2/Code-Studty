select name, gender, age, address from tblAddressBook 
    where replace(lower(address), ' ', '') like '%' || replace(lower('%s'), ' ', '') || '%';

select distinct buseo from tblInsa;
select * from tblInsa where buseo = '기획부' order by
case
    when jikwi = '부장' then 1
    when jikwi = '과장' then 2
    when jikwi = '대리' then 3
    when jikwi = '사원' then 4
end, name;

select * from tblAddress;

-- CallableStatement + 프로시저
-- m1()
create or replace procedure procM1 (
    pname varchar2,
    page number,
    ptel varchar2,
    paddress varchar2
)
is
begin
    insert into tblAddress values (seqAddress.nextVal, pname, page, ptel, paddress, default);
end;

-- m2()
-- 반환값(단일 레코드 or 다중 레코드(cursor))
create or replace procedure procM2(
    pnum number,
    pname out varchar2,
    pbuseo out varchar2,
    pjikwi out varchar2
)
is
begin
    select name, buseo, jikwi into pname, pbuseo, pjikwi from tblInsa where num = pnum;
end;

-- m3()
create or replace procedure procM3(
    pname varchar2,     --남자이름
    wname out varchar2,     --여자이름
    wage out number         --여자나이
)
is
begin
    select name, age into wname, wage from tblWomen 
        where couple = (select name from tblMen where name = pname);
end;

-- m4()
create or replace procedure procM4(
    pbuseo varchar2,
    presult out sys_refcursor
)
is
begin
    open presult for
        select * from tblInsa where buseo = pbuseo;
end;

-- m5()
create or replace procedure procM5(
    presult out sys_refcursor
)
is
begin
    open presult for
        select * from tblAddress;
end;


select * from tblboard;
select * from tblcomment;

create or replace procedure proAddComment(
    -- 댓글쓰기 매개변수
)
is
begin
    -- 1. 카운트 증가
	update tblBoard set commentCount = commentCount + 1
		where seq = 1;
    -- 2. 댓글 증가
	insert into tblComment (seq, subject, pseq)
        values (1, '댓글', 1);
        
    commit;
    
exception
    when others then
        rollback;
        
end;
