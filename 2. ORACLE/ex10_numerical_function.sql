/*

숫자 함수(수학 함수)
- 자바의 Math 클래스

rount()
- 반올림 함수
- number round(대상 컬럼) : 정수 반환
- number round(대상 컬럼, 소수이하 자릿수) : 실수 반환

*/

select height / weight, round(height / weight) from tblComedian;

select * from dual; -- 시스템 테이블(1행 1열)

select round(10 / 3) from dual;

select round(avg(basicpay)) from tblInsa;

select
    round(987.654),
    round(987.654, 1),
    round(987.654, 2)
from dual;


-- ceil()
-- number ceil(대상 컬럼)
-- 무조건 올림 함수
select
    round(3.6),
    ceil(3.6),
    round(3.1),
    ceil(3.1)
from dual;


-- floor(), trunc()
-- 무조건 내림 함수(절삭 함수)
-- number floor(대상 컬럼)
-- number trunc(대상컬럼, [소수 이하 자릿수])

select
    5.6789,
    floor(5.6789),
    trunc(5.6789),
    trunc(5.6789, 1),
    trunc(5.6789, 2)
from dual;


-- ceil <-> floor
-- round <-> trunc

-- mod()
-- 나머지 함수
-- number mod(피제수, 제수)
select mod(10, 3) from dual;

-- 100분 -> 1시간 40분
-- 100 / 60 -> 몫(시간)
-- 100 % 60 -> 나머지(분)
select 
    floor(100 / 60) as 시,
    mod(100, 60) as 분
from dual;

select
    abs(-10),
    power(2, 8), -- 제곱 2^8
    sqrt(4) -- 제곱근
from dual;
