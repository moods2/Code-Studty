/*

뷰, View
- DB Object 중 하나(테이블, 시퀀스, 제약사항, 뷰)
- 가상 테이블, 테이블의 복사본, 뷰 테이블
- 실제 테이블처럼 취급하는 객체
- select 문 자체를 저장하는 객체(*********)

뷰의 용도
- 가독성 향상
- 자주 사용하는 select를 저장해놓는 객체(***)

*/

create view vwInsa
as
select * from tblInsa;

select * from vwInsa;


-- tblInsa. -> 남자 직원 select x 100번
create view vwTemp
as
select num, name, ssn, tel, jikwi from tblInsa
    where substr(ssn, 8, 1) = '1' and buseo = '기획부';
    
select * from vwTemp;

drop view vwvideo;
create or replace view vwVideo
as
select
    m.name as 회원명,
    v.name as 비디오제목,
    g.period as 대여기간,
    r.rentdate as 대여날짜,
    case
        when r.retdate is null then '반납 안함'
        when r.retdate is not null then '반납 완료'
    end as 반납상태
from tblGenre g
    inner join tblVideo v
        on g.seq = v.genre --연결
            inner join tblRent r
                on v.seq = r.video --연결
                    inner join tblMember m
                        on m.seq = r.member; --연결

select * from vwVideo;

-- 테이블 10개 -> 뷰 수십개
-- 1. 덩치 큰 SQL
-- 2. 반복 SQL
-- 뷰를 호출하는 시점에서 실행 (테이블 수정 시 뷰도 수정됨)


-- 서울 직원 뷰
create or replace view vwSeoul
as
select name, buseo, jikwi, basicpay from tblInsa where city = '서울';

select * from vwSeoul; --홍길동(서울)

-- '홍길동' -> 부산
update tblInsa set city = '부산' where name = '홍길동';

select * from tblInsa;
rollback;


-- 뷰를 사용할 때 주의점
-- 1. select 대상 : 실행O > 뷰는 읽기 전용으로 사용한다.
-- 2. insert 대상 : 실행O >절대 사용 금지
-- 3. update 대상 : 실행O >절대 사용 금지
-- 4. delete 대상 : 실행O >절대 사용 금지

select * from vwSeoul;
insert into vwSeoul values (1061, '아무개', '951010-1010101', sysdate, '서울'
                                                , '010-1234-5678', '기획부', '사원', 2500000, 200000);

update vwSeoul set buseo = '영업부' where num = 1061;
delete vwSeoul where num = 1061;


/*

뷰의 종류
1. 단순 뷰
- 하나의 기본 테이블을 사용해 만든 뷰
- CRUD -> R만 사용

2. 복합 뷰
- 두개의 기본 테이블을 사용해 만든 뷰
- 조인, 서브쿼리
- R

*/
