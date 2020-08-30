-- 날짜 시간 함수

-- sysdate
-- 현재 시스템의 시간을 반환
-- date sysdate
-- 자바 : Calendar.getInstance(), new Date()

select sysdate from dual; -- 20/05/25
select to_char(sysdate, 'YYYY-MM-DD HH24:MI:SS') from dual;


-- 날짜시간 연산
-- +, -
-- 1. 시각 - 시각 = 시간(일)
-- 2. 시각 + 시간 = 시각
-- 3. 시각 - 시간 = 시각

select
    name, ibsadate,
    round(sysdate - ibsadate) as 근무일수,
    round((sysdate - ibsadate) / 365) as 근무년수,
    round((sysdate - ibsadate) * 24) as 근무시수,
    round((sysdate - ibsadate) * 24 * 60) as 근무분수
from tblInsa
where (sysdate - ibsadate) > 3650
order by sysdate - ibsadate desc;

-- 시각 + 시간(일) = 시각
-- 시각 - 시간(일) = 시각
select sysdate + 100 from dual;
select sysdate - 100 from dual;

select sysdate + (1 / 24 *  6) from dual;


-- last_day()
-- 해당 시각이 포함된 달의 마지막 날짜
-- date last_day(date)
select sysdate, last_day(sysdate) from dual;
select (last_day(sysdate) - sysdate) * 24 from dual;


-- 시각 - 시각 = 시간(일) -> (환산) -> 시, 분, 초
-- 시각 - 시각 = 시간(일) or 시간(년)

--months_between()
-- number months_between(date, date)
select 
    round((sysdate - ibsadate)), 
    round(months_between(sysdate, ibsadate)),
    round(months_between(sysdate, ibsadate) / 12)
from tblInsa;

-- 시각 + 시간(일,시,분,초) = 시각
-- 시각 + 시간(월, 년) = 시각
-- add_months()
-- date add_months(date, number)
select
    sysdate,
    sysdate + 90,
    add_months(sysdate, 3)
from dual;

-- 시각 - 시각 = 일 -> 연산자
-- 시각 + 일 = 시각 -> 연산자
-- 시각 - 시각 = 월 -> months_between()
-- 시각 + 월 = 시각 -> add_months()
