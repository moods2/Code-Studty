-- 문자열 함수

-- upper(), lower(), initcap()
-- varchar2 upper(대상 컬럼)
select 
    first_name, last_name, 
    upper(first_name), upper(last_name),
    lower(first_name), lower(last_name)
from employees;

select initcap('abc') from dual;

-- 이름 -> 'de'
select
    first_name
from employees
where first_name like '%de%' or first_name like '%De%'
        or first_name like '%dE%' or first_name like '%DE%';
        
select
    first_name
from employees
where upper(first_name) like '%' || upper('de') || '%';

-- substr()
-- 문자율 추출함수
-- varchar2 substr(대상 컬럼, 시작위치, 문자개수)
-- varchar2 substr(대상 컬럼, 시작위치)
-- SQL은 서수를 1부터 시작한다.

select
    '가나다라마바사아자차카타파하',
    substr('가나다라마바사아자차카타파하', 3, 5),
    substr('가나다라마바사아자차카타파하', 3)
from dual;

select * from tblInsa where ssn like '%-1%' or ssn like '%-3%';
select * from tblInsa where substr(ssn, 8, 1) in ('1', '3', '5', '7', '9');

select
    name,
    '19' || substr(ssn, 1, 2)
from tblInsa;

select
    name,
    case
        when substr(ssn, 8, 1) in ('1', '2') then '19' || substr(ssn, 1, 2)
        when substr(ssn, 8, 1) in ('3', '4') then '20' || substr(ssn, 1, 2)
    end
from tblInsa; -- *** 연습

-- 서울 + 80년대 + 여직원 -> 몇명?
select
    count(*)
from tblInsa
where city = '서울'
            and substr(ssn, 1, 1) = '8'
            and substr(ssn, 8, 1) = '2';

select
    count(distinct substr(name, 1, 1))
from tblInsa;

-- 김, 이, 박, 최, 정 씨 몇명씩 + 기타 몇명?
select
    count(case
        when substr(name, 1, 1) = '김' then 1
    end) as 김,
    count(case
        when substr(name, 1, 1) = '이' then 1
    end) as 이,
    count(case
        when substr(name, 1, 1) = '박' then 1
    end) as 박,
    count(case
        when substr(name, 1, 1) = '최' then 1
    end) as 최,
    count(case
        when substr(name, 1, 1) = '정' then 1
    end) as 정,
    count(case
        when substr(name, 1, 1) not in ('김', '이', '박', '최', '정') then 1
    end) as 기타
from tblInsa;

select
    *
from tblInsa
order by substr(ssn, 3, 2) asc; -- 태어난 월

-- length()
-- 문자열 길이
-- number length(대상 컬럼)

-- 컬럼 리스트
select name, length(name) from tblCountry;

-- where절
select name, length(name) from tblCountry where length(name) > 3;

-- order by절
select name, length(name) from tblCountry where length(name) > 3
            order by length(name) desc;
            
select
    title,
    case
        when length(title) >= 8 then substr(title, 1, 8) || '...'
        else title
    end
from tblTodo;

-- instr()
-- = indexOf()
-- 검색어의 위치 반환
-- number instr(대상 컬럼, 검색어)
-- number instr(대상 컬럼, 검색어, 시작위치)

select
    title,
    case
        when instr(title, '하기') > 0 then '0'
        when instr(title, '하기') = 0 then 'X'
    end
from tblTodo;


-- trim(), rtrim(), ltrim()
-- varchar2 trim(대상 컬럼)
select '     홍길동     ' from dual;
select trim('     홍길동     ') from dual;
select rtrim('     홍길동     ') from dual;
select ltrim('     홍길동     ') from dual;


-- replace()
-- 문자열 치환 함수
-- varchar2 replace(대상 컬럼, 찾을 문자열, 바꿀 문자열)
select replace('홍길동', '홍', '김'), replace('홍길동', '이', '김') from dual;

select
    name, ssn, substr(ssn, 8, 1)
from tblInsa;

select
    name, ssn,
    case
        when substr(ssn, 8, 1) = '1' then '남자'
        when substr(ssn, 8, 1) = '2' then '여자'
    end as 성별,
    replace(replace(substr(ssn, 8, 1), '1', '남자'), '2', '여자')
from tblInsa;

select
    name,
    continent,
    case
        when continent = 'AS' then '아시아'
        when continent = 'AF' then '아프리카'
        when continent = 'EU' then '유럽'
        when continent = 'AU' then '호주'
        when continent = 'SA' then '아메리카'
    end as c1,
    replace(replace(replace(replace(replace(continent, 'AS', '아시아'), 'SA', '아메리카'), 'EU', '유럽'), 'AF', '아프리카'), 'AU', '호주')
from tblCountry;

-- decode()
-- 문자열 치환 함수(replace() 유사)
-- varchar2 decode(대상 컬럼, 찾을 문자열, 바꿀 문자열, 찾을 문자열, 바꿀 문자열 ...)
-- replace 중첩 작업 시 decode 사용을 권장
-- ** 못찾으면 null 반환 -> count()(집계 함수) 자주 사용
select
    name,
    decode(substr(ssn, 8, 1), '1', '남자', '2', '여자')
from tblInsa;

select
    name,
    continent,
    case
        when continent = 'AS' then '아시아'
        when continent = 'AF' then '아프리카'
        when continent = 'EU' then '유럽'
        when continent = 'AU' then '호주'
        when continent = 'SA' then '아메리카'
    end as c1,
    replace(replace(replace(replace(replace(continent, 'AS', '아시아'), 'SA', '아메리카'), 'EU', '유럽'), 'AF', '아프리카'), 'AU', '호주') as c2,
    decode(continent, 'AS', '아시아', 'SA', '아메리카', 'EU', '유럽', 'AF', '아프리카', 'AU', '호주')
from tblCountry;

-- tblComedian. 남자 몇명? 여자 몇명?
select last || first as name, gender from tblComedian;

-- ORA-00937: not a single...
select
    --last || first as name,
    count(case
        when gender = 'm' then 1
    end),
    count(case
        when gender = 'f' then 1
    end)
from tblComedian;

select
    count(decode(gender, 'm', 1)),
    count(decode(gender, 'f', 1))
from tblComedian;

-- tblInsa. 부장 몇명? 과장 몇명? 대리 몇명? 사원 몇명? -> 1개 결과셋
select 
    count(decode(jikwi, '부장', 1)),
    count(decode(jikwi, '과장', 1)),
    count(decode(jikwi, '대리', 1)),
    count(decode(jikwi, '사원', 1))
from tblInsa;

-- tblInsa. 부장 + 과장 몇명? 대리 + 사원 몇명? -> 1개 결과셋
select 
    count(decode(jikwi, '부장', 1)) + count(decode(jikwi, '과장', 1)),
    count(decode(jikwi, '대리', 1)) + count(decode(jikwi, '사원', 1))
from tblInsa;

select
    count(decode(jikwi, '부장', 1, '과장', 2)),
    count(decode(jikwi, '대리', 1, '사원', 2))
from tblInsa;


-- job. 학생 몇명? 건물주 몇명?
select
    count(decode(job, '학생', 1))as  학생수,
    count(decode(job, '건물주', 1)) as 건물주수
from tblAddressBook
order by seq asc;


-- 강동구 몇명? 마포구 몇명?
select
    count(case
        when instr(address, '강동구') > 0 then 1
    end) as 강동구,
    count(case
        when instr(address, '마포구') > 0 then 1
    end) as 마포구
from tblAddressBook;

select
    count(*) - count(decode(instr(address, '강동구'), 0 , 1)),
    count(*) - count(decode(instr(address, '마포구'), 0 , 1))
from tblAddressBook;
















