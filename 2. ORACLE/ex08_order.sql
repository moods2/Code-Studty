/*

정렬, Sort
- order by 절
- select문과 같이 사용
- 원본 테이블 정렬(X) -> 결과 테이블 정렬(O)
- 정렬을 기준으로 컬럼을 사용한다.
- 오름차순, 내림차순
- order by 컬럼명 [asc|desc]

1. select 절
2. from 절
3. where 절
4. order by 절

*/
select * from tblInsa order by  name;
select * from tblInsa order by  name asc;
select * from tblInsa order by  name desc;

-- 정렬 대상으로 가능한 자료형
select * from tblInsa order by basicpay desc; -- 숫자

select * from tblInsa order by name asc; -- 문자

select * from tblInsa order by ibsadate desc; -- 날짜시간

select * from tblInsa order by basicpay desc; -- 허경운
select * from tblInsa order by basicpay + sudang desc; -- 홍길동

-- 부장(4) > 과장(3) > 대리(2) > 사원(1)
select 
    name,
    jikwi
from tblInsa
order by  case
        when jikwi = '부장' then 4
        when jikwi = '과장' then 3
        when jikwi = '대리' then 2
        when jikwi = '사원' then 1
    end desc;
    
select name, jikwi
from tblInsa
where jikwi in('과장', '부장');

select name, jikwi
from tblInsa
where jikwi in('과장', '부장');

select name, jikwi
from tblInsa
where case
        when jikwi = '부장' then 4
        when jikwi = '과장' then 3
        when jikwi = '대리' then 2
        when jikwi = '사원' then 1
    end >= 3;

-- 다중 정렬
select * from tblInsa order by city asc, buseo desc, name asc;

--------------------------------------------연습문제-----------------------------------------------

--문제1
select * from tblCountry; --14

--문제2
select name, capital from tblCountry; --14

--문제3
select name as 국가명, capital as 수도명, population as 인구수, area as 면적, continent as 대륙 from tblCountry; --14

--문제4
select 
    '국가명:' || name || ', ' || '수도명:' || capital || ', ' || '인구수:' || population as 국가정보 
from tblCountry; --14

--문제5
select 
    first_name || ' ' || last_name as 이름,
    email || '@GMAIL.COM' as 이메일,
    phone_number as 연락처,
    '$' || salary as 급여
from employees;
select * from employees; --107

--문제6
select name, area from tblCountry where area <= 100; --9

--문제7
select name from tblCountry where continent in('AS', 'EU'); --7

--문제8
select 
    first_name || last_name as 이름,
    phone_number as 연락처    
from employees 
where job_id = 'IT_PROG'; --5

--문제9
select first_name || last_name, phone_number, hire_date from employees where last_name = 'Grant'; --2

--문제10
select first_name || last_name, salary, phone_number from employees where manager_id = 120; --8

--문제11
select first_name || last_name, phone_number, email, job_id from employees where department_id in(60, 80, 100); --45

--문제12
select * from tblInsa where buseo = '기획부'; --7

--문제13
select name, jikwi, tel from tblInsa where city = '서울' and jikwi = '부장'; --3

--문제14
select * from tblInsa where basicpay + sudang >= 1500000 and city = '서울'; --9

--문제15
select * from tblInsa where sudang <= 150000 and jikwi in('사원', '대리'); --28

--문제16
select * from tblInsa where basicpay * 12 >= 20000000 and city = '서울' and jikwi in('과장', '부장'); --6

--문제17
select * from tblCountry where name like '_국'; --3
select * from tblCountry where name like '%국';

--문제18
select * from employees where phone_number like '515%'; --21

--문제19
select * from employees where job_id like 'SA%'; --35

--문제20
select * from employees where first_name like '%de%' or first_name like '%De%'; --3

--문제21
select * from tblInsa where ssn like '______-1______'; --31

--문제22
select * from tblInsa where ssn like '______-2______'; --29

--문제23
select * from tblInsa where ssn like '___7%' or ssn like '___8%' or ssn like '___9%'; --14

--문제24
select * from tblInsa where name like '김__' and (city = '서울' or city = '인천'); --8

--문제25
select * from tblInsa where tel like '010%' and jikwi in('사원', '대리') and buseo in('영업부', '총무부', '개발부'); --10

--문제26
select * from tblInsa where ibsadate between '2008-01-01' and '2010-12-31' and city in('서울', '인천', '경기'); --18

--문제27
select * from employees where department_id is null; --1

--문제28
select distinct job_id from employees; --19

--문제29
select distinct department_id from employees where hire_date between '2002-01-01' and '2004-12-31'; --10

--문제30
select distinct manager_id from employees where salary >= 5000; --13

--문제31
select distinct jikwi from tblInsa where ssn like '8_____-1%'; --4

--문제32
select distinct city from tblInsa where sudang >= 200000; --3

--문제33
select distinct buseo from tblInsa where tel is null; --2
