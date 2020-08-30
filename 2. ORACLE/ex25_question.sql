1. tblInsa. 80년대생 남자 직원들의 평균 월급(basicpay)보다 더 많이 받는 80년대생 여직원들을 출력하시오.(subquery) --5
select * from tblInsa 
where substr(ssn, 1, 1) = '8' and substr(ssn, 8, 1) = '2' 
and basicpay > (select avg(basicpay) from tblInsa where substr(ssn, 1, 1) = '8' and substr(ssn, 8, 1) = '1');


2. tblStaff, tblProject. 현재 재직중인 모든 직원의 이름, 주소, 월급, 담당프로젝트명을 출력하시오.(join)
select 
    name, address, salary, p.project
from tblStaff s
    inner join tblProject p
        on s.seq = p.staff;


3. tblVideo, tblRent, tblMember. '뽀뽀할까요' 라는 비디오를 빌려간 회원의 이름?(join) --신숙주
select * from tblVideo;
select * from tblRent;
select * from tblMember;

select
    m.name
from tblMember m
    inner join tblRent r
        on m.seq = r.member
            inner join tblVideo v
                on r.video = v.genre
                    where v.name = '뽀뽀할까요';


4. tblInsa. 평균 이상의 월급을 받는 직원들?(subquery) --27
select * from tblInsa where basicpay > (select avg(basicpay) from tblInsa);
select avg(basicpay) from tblInsa;


5. tblStaff, tblProejct. 'TV 광고'을 담당한 직원의 월급?(join) -- 250
select * from tblStaff;
select * from tblProject;

select salary from tblStaff s
    inner join tblProject p
        on p.staff = s.seq
            where project = 'TV 광고';


6. tblMember. 가장 나이가 많은 회원의 주소? (bYear)(subquery) --12-3번지 301호
select address from tblMember where byear = (select min(byear) from tblMember);


7. tblVideo. '털미네이터' 비디오를 한번이라도 빌려갔던 회원들의 이름?(join) --김유신
select * from tblVideo;
select * from tblRent;
select * from tblMember;

select m.name
    from tblMember m
        inner join tblRent r
            on m.seq = r.member
                inner join tblVideo v
                    on v.genre = r.video
                        where v.name = '털미네이터';


8. tblStaff, tblProject. 서울시에 사는 직원을 제외한 나머지 직원들의 이름, 월급, 담당프로젝트명을 출력하시오.(join) --5
select * from tblStaff;
select * from tblProject;

select name, salary, p.project from tblStaff s
    inner join tblProject p
        on s.seq = p.staff
            where not address = '서울';


9. tblCustomer, tblSales. 상품을 2개(단일상품) 이상 구매한 회원의 연락처, 이름, 구매상품명, 수량 출력하시오.(join) --7
select * from tblCustomer;
select * from tblSales;

select tel, name, s.item, s.qty
    from tblCustomer c
        inner join tblSales s
            on c.seq = s.cseq
                where qty >= 2;


10. tblVideo. 모든 비디오 제목, 보유수량, 대여가격을 출력하시오.(join)
select * from tblVideo;
select * from tblGenre;

select v.name, v.qty, g.price
    from tblVideo v
        inner join tblGenre g
            on v.genre = g.seq;
            

11. tblVideo. 2007년 2월에 대여된 구매내역을 출력하시오. 회원명, 비디오명, 언제, 대여가격을 가져오시오.(join) --5
select * from tblVideo;
select * from tblRent;
select * from tblMember;
select * from tblGenre;

select m.name, v.name, r.rentdate, g.price
    from tblMember m
        inner join tblRent r
            on m.seq = r.member
                inner join tblVideo v
                    on r.video = v.seq
                        inner join tblGenre g
                            on v.genre = g.seq
                                where r.rentdate between '2007-02-01' and '2007-03-01';


12. tblVideo. 현재 반납을 안한 회원명과 비디오명, 대여날짜 출력하시오.(join) --4
select * from tblVideo;
select * from tblRent;
select * from tblMember;

select m.name, v.name, r.rentdate
    from tblMember m
        inner join tblRent r
            on m.seq = r.member
                inner join tblVideo v
                    on r.video = v.seq
                        where r.retdate is null;


13. tblInsa. basicpay+sudang가 100만원 미만, 100만원 이상~200만원 미만, 200만원 이상인 직원들의 수 출력하시오.(groupby)
select * from tblInsa;
select
    case
        when basicpay+sudang < 1000000 then '100미만'
        when basicpay+sudang >= 1000000 and basicpay+sudang < 2000000 then '중간'
        when basicpay+sudang >= 2000000 then '200이상'
    end as 월급,
    count(*)
from tblInsa
    group by case
        when basicpay+sudang < 1000000 then '100미만'
        when basicpay+sudang >= 1000000 and basicpay+sudang < 2000000 then '중간'
        when basicpay+sudang >= 2000000 then '200이상'
    end;


14. tblInsa. 주민번호를 가지고 생년월일의 년도별 직원수 출력하시오.(group by)
select * from tblInsa;
select 
   '19' || substr(ssn, 1, 2) as 년도, count(*)
from tblInsa
group by '19' || substr(ssn, 1, 2)
order by '19' || substr(ssn, 1, 2);
    

15. tblInsa. 주민번호를 기준으로 월별 오름차순, 월이 같으면 년도 내림차순 출력하시오.(이름, 주민번호) . SUBSTR() 함수 이용.(orderby)
select * from tblInsa;
select 
    name, ssn
from tblInsa
        order by substr(ssn, 3, 2), substr(ssn, 1, 2) desc;


16. tblInsa. 입사일을 기준으로  월별 오름차순, 월이 같으면 년도 내림차순 출력하시오.(orderby)
select * from tblInsa;
select * from tblInsa order by substr(ibsadate, 4, 2), substr(ibsadate, 1, 2) desc;


17. tblInsa. 전체인원수, 남자인원수, 여자인원수를 동시 출력하시오.(count+decode) --60, 31, 29
select * from tblInsa;
select 
    count(*) as 전체인원수,
    count(decode(substr(ssn, 8, 1), 1, 1)) as 남자인원수,
    count(decode(substr(ssn, 8, 1), 2, 1)) as 여자인원수
from tblInsa;


18. tblInsa. 개발부, 영업부, 총무부 인원수 출력하시오.(count+decode) --14, 16, 7
select * from tblInsa;
select
    count(decode(buseo, '개발부', 1)) as 개발부,
    count(decode(buseo, '영업부', 1)) as 영업부,
    count(decode(buseo, '총무부', 1)) as 총무부
from tblInsa;


19. tblInsa. 서울 사람의 남자와 여자의 기본급합을 출력하시오.(decode+group by) --여:12920400, 남:17880000
select * from tblInsa;
select 
    decode(substr(ssn, 8, 1), '1', '남자', '2', '여자') as 성별,
    sum(basicpay)
from tblInsa
where city = '서울'
group by decode(substr(ssn, 8, 1), '1', '남자', '2', '여자');


20. tblInsa. 부서별 남자와 여자 인원수를 출력하시오.(decode+group by)
select 
    buseo,
    count(*),
    count(decode(substr(ssn, 8, 1), 1, 1)) as 남자,
    count(decode(substr(ssn, 8, 1), 2, 1)) as 여자
from tblInsa
group by buseo;


21. employees. 총 사원 수 및 2003, 2004, 2005, 2006 년도 별 고용된 사원들의 총 수를 가져오시오.(groupby+subquery)
select * from employees;
select
    (select count(*) from hr.employees) as 총사원수,
    to_char(hire_date, 'yyyy') as 년도,
    count(*)
from employees
where to_char(hire_date, 'yyyy') between 2003 and 2006
group by to_char(hire_date, 'yyyy')
order by to_char(hire_date, 'yyyy');


22. tblInsa. 남자 급여(기본급+수당)을 (내림차순)순위대로 가져오시오. (이름, 부서, 직위, 급여, 순위 출력)(rownum+subquery)
select * from tblInsa;
select
    a.*, rownum 
from (select name, buseo, jikwi, basicpay+sudang 
    from tblInsa
        where substr(ssn, 8, 1) = '1'
            order by basicpay+sudang desc) a;


23. tblInsa. 여자 급여(기본급+수당)을 (오름차순)순위대로 가져오시오. (이름, 부서, 직위, 급여, 순위 출력)(rownum+subquery)
select * from tblInsa;
select
    a.*, rownum 
from (select name, buseo, jikwi, basicpay+sudang 
    from tblInsa
        where substr(ssn, 8, 1) = '2'
            order by basicpay+sudang) a;

24. tblInsa. 여자 인원수가 (가장 많은 부서 및 인원수) 가져오시오.(rownum+subquery+groupby)
select * from tblInsa;
select
    a.*
from (select buseo, count(*)
    from tblInsa
        where substr(ssn, 8, 1) = '2'
            group by buseo
                order by count(*) desc) a
    where rownum = '1';
    

25. tblInsa. 지역별 인원수 (내림차순)순위를 가져오시오.(city, 인원수)(subquery+groupby)
select * from tblInsa;
select
    a.*, rownum
from (select city, count(*)
    from tblInsa
        group by city
            order by count(*) desc) a;


26. tblInsa. 부서별 인원수가 가장 많은 부서 및원수 출력하시오.(rownum+subquery+groupby)
select * from tblInsa;

select
    a.*, rownum
from (select buseo, count(*)
    from tblInsa
        group by buseo
            order by count(*) desc) a
    where rownum = '1';


27. tblInsa. 남자 급여(기본급+수당)을 (내림차순) 3~5등까지 가져오시오. (이름, 부서, 직위, 급여, 순위 출력)(rownum+subquery+groupby)
select * from tblInsa;
select * from (select a.*, rownum as rnum
    from (select name, buseo, jikwi, basicpay + sudang
            from tblInsa
                group by name, buseo, jikwi, basicpay + sudang
                    order by basicpay + sudang desc) a) b
        where rnum between 3 and 5;


28. tblInsa. 입사일이 빠른 순서로 5순위까지만 가져오시오.(rownum+subquery)
select * from tblInsa;
select 
    a.*, rownum
from (select name, ibsadate
    from tblInsa
        group by name, ibsadate
            order by ibsadate) a
    where rownum <= 5;


29. tblhousekeeping. 지출 내역(가격 * 수량) 중 가장 많은 금액을 지출한 내역 3가지를 가져오시오.(rownum+subquery)
select * from tblhousekeeping;
select 
    a.*, rownum
from (select item, price*qty
    from tblhousekeeping
        order by price*qty desc) a
    where rownum <= 3;


30. tblinsa. 평균 급여 2위인 부서에 속한 직원들을 가져오시오.(rownum+subquery+groupby) --??
select * from tblInsa;
select
    *
from (select a.*, rownum as rnum
    from (select buseo, count(*), round(avg(basicpay+sudang))
        from tblInsa
            group by buseo
                order by round(avg(basicpay+sudang)) desc) a) b
    where rnum = 2;


31. tbltodo. 등록 후 가장 빠르게 완료한 할일을 순서대로 5개 가져오시오.(rownum+subquery)
select * from tblTodo;
select
    a.*, rownum
from (select *
    from tblTodo
        order by completedate - adddate) a
    where rownum <= 5;


32. tblinsa. 남자 직원 중에서 급여를 3번째로 많이 받는 직원과 9번째로 많이 받는 직원의 급여 차액은 얼마인가? -- 240000
select * from tblInsa;
--select
--    b.*
--from (select a.*, rownum as rnum
--    from (select basicpay+sudang
--        from tblInsa
--            where substr(ssn, 8, 1) = '1'
--                order by basicpay+sudang desc) a) b
--    where rnum in ('3', '9');
-- 따로 만들어서 듀얼에서 합침
select
   ( (select basicpay from (select basicpay, rownum as rnum from (select basicpay from tblInsa where substr(ssn, 8, 1) = '1' order by basicpay+sudang desc)) where rnum = 3) 
    -
    (select basicpay from (select basicpay, rownum as rnum from (select basicpay from tblInsa where substr(ssn, 8, 1) = '1' order by basicpay+sudang desc)) where rnum = 9)) as 차액
from dual;

