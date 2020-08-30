--관리자 테스트용


create table tblAdminMember(
    seq number primary key,
    id varchar2(30) not null,
    name varchar2(30) not null,
    pw varchar2(30) not null
);

create sequence seqAdminMember;

commit;


insert into tblAdminMember values (seqAdminMember.nextVal,'ssh1234','신승환','1234');
insert into tblAdminMember values (seqAdminMember.nextVal,'lsy1234','한시연','1234');
insert into tblAdminMember values (seqAdminMember.nextVal,'jhw1234','전혜원','1234');

select * from tblAdminMember;


--select count(*) as cnt from tblMember where id = ? and pw = ?

select * from tblinsa;

select count(*) as cnt from tblAdminMember where id = 'jhw1234' and pw = 1234;

select * from tblMember where id = 'jhw1234';
