/*

group by 절
- 레코드를 특정 컬럼값(1개 or 그 이상)에 맞춰서 그룹을 나누는 역할
- 그룹을 왜 나누는지? -> 각각의 나눠진 그룹을 대상 -> 집계 함수를 적용하기 위해서(***)
- group by 컬럼명

select 컬럼리스트
from 테이블
where 조건
group by 절
order by 컬럼

1. from 테이블
2. where 조건
3. group by 절
4. select 컬럼리스트
5. order by 컬럼

*/

-- 부서별 그룹
select count(*) from tblInsa group by buseo;

-- 부서별로 평균 급여?
select * from tblInsa;

select round(avg(basicpay)) from tblInsa; --155만원

select distinct buseo from tblInsa;

select round(avg(basicpay)) from tblInsa where buseo = '총무부'; --171
select round(avg(basicpay)) from tblInsa where buseo = '개발부'; --138
select round(avg(basicpay)) from tblInsa where buseo = '영업부'; --160
select round(avg(basicpay)) from tblInsa where buseo = '기획부'; --185
select round(avg(basicpay)) from tblInsa where buseo = '인사부'; --153
select round(avg(basicpay)) from tblInsa where buseo = '자재부'; --141
select round(avg(basicpay)) from tblInsa where buseo = '홍보부'; --145

select buseo, round(avg(basicpay)), count(*) from tblInsa group by buseo;


select * from tblComedian;

select
    count(decode(gender, 'm', 1)) as 남자,
    count(decode(gender, 'f', 1)) as 여자
from tblComedian;

select
    count(*)
from tblComedian
group by gender;

select 
    job, count(*)
from tbladdressbook
group by job
order by count(*) desc;

select 
    buseo, city, jikwi, count(*)
from tblInsa
group by buseo, city, jikwi;


--group by + 집계 함수
select
    hometown as "지역",
    count(*) as "지역별 인구수",
    round(avg(weight), 1) as "지역별 평균 몸무게",
    max(weight) as "지역별 최고 몸무게",
    min(weight) as "지역별 최저 몸무게",
    sum(weight) as "지역별 몸무게 총합"
from tbladdressbook
group by hometown;


select
    nvl2(completedate, 'o', 'x'),
    count(*)
from tbltodo
group by nvl2(completedate, 'o', 'x');

select
    substr(ssn, 8, 1),
    count(*)
from tblInsa
group by substr(ssn, 8, 1);


/*
having절
- 조건절

select 컬럼리스트
from 테이블
where 조건
group by 절
having 절
order by 컬럼

1. from 테이블
2. where 조건
3. group by 절
4. having 절
5. select 컬럼리스트
6. order by 컬럼

from절 -> where절 : 개인에 대한 질문(조건)
group by절 -> having절 : 그룹(집계 함수 결과)에 대한 질문(조건)

*/

select
    buseo, count(*)
from tblInsa
--where count(*) >= 10
group by buseo
having count(*) >= 10;

select
    buseo, round(avg(basicpay))
from tblInsa
--where basicpay >= 1550000 -- 급여가 155만원 이상인사람들만 가져와서 그룹화
group by buseo
having avg(basicpay) >= 1550000; --그룹화가 된 급여평균에서 155만원 이상인 사람


-- 날짜
select
    to_char(buydate, 'dd'),
    count(*) as 날짜별구매횟수,
    sum(qty) as 날짜별구매개수,
    max(price) as 날짜별최대단가,
    max(qty * price) as 날짜별최대구매비용
from tblhousekeeping
group by to_char(buydate, 'dd')
order by to_char(buydate, 'dd') asc;

select
    case
        when price >= 0 and price < 3000 then '저가'
        when price >= 3000 and price < 10000 then '중가'
        when price >= 10000 then '고가'
    end as price, 
    count(*)
from tblHousekeeping
group by case
        when price >= 0 and price < 3000 then '저가'
        when price >= 3000 and price < 10000 then '중가'
        when price >= 10000 then '고가'
    end;


-- tblInsa. 부서별 직급의 인원수 가져오기
-- [부서] [인원]    [부장]    [과장]    [대리]    [사원]
-- 총무부 7             1            2          3           1
-- 개발부 14           2            2          4           6
-- 영업부 16           1            1          2           12
select
    buseo as "부서",
    count(*) as "인원",
    count(decode(jikwi, '부장', 1)) as 부장,
    count(decode(jikwi, '과장', 1)) as 과장,
    count(decode(jikwi, '대리', 1)) as 대리,
    count(decode(jikwi, '사원', 1)) as 사원
from tblInsa
group by buseo;

--복습
select
    buseo, jikwi, count(*)
from tblInsa
group by buseo, jikwi
order by buseo asc, jikwi asc;

select 
    buseo, count(*)
from tblInsa
group by buseo
--having avg(basicpay) > 1500000;
having count(*) >= 10;


-- group by 결과를 좀 더 자세하게 출력하는 함수
-- rollup(), cube() : summary
-- cube()가 rollup보다 더 자세하다

-- rollup()
select
    buseo,
    count(*),
    sum(basicpay),
    avg(basicpay),
    max(basicpay),
    min(basicpay)
from tblInsa
group by rollup(buseo);

select
    buseo,
    jikwi,
    city,
    count(*)
from tblInsa
group by rollup(buseo, jikwi, city)
order by buseo, jikwi;

--cube()
select
    buseo,
    count(*)
from tblInsa
group by cube(buseo)
order by buseo;

select
    buseo, 
    jikwi, 
    count(*)
from tblInsa
group by cube(buseo, jikwi)
order by buseo, jikwi;

select
    buseo, 
    jikwi,
    city,
    count(*)
from tblInsa
group by cube(buseo, jikwi, city)
order by buseo, jikwi, city;


-- listagg
-- 11g 이후
select
    buseo,
    count(*),
    listagg(name, ', ') within group(order by name asc) as name
from tblInsa
group by buseo
order by buseo;

select
    buydate,
    count(*),
    listagg(item, ', ') within group(order by item) as item,
    sum(qty * price) as totalprice
from tblhousekeeping
group by buydate
order by buydate;

