1. tblInsa. 입사년도별 남자와 여자 인원수를 가져오시오.(groupby+decode)
select * from tblInsa;
select 
    to_char(ibsadate, 'yyyy') as 년도,
    count(decode(substr(ssn, 8, 1), 1, 1)) as 남자,
    count(decode(substr(ssn, 8, 1), 2, 1)) as 여자
from tblInsa
    group by to_char(ibsadate, 'yyyy')
        order by to_char(ibsadate, 'yyyy') asc;


2. tblInsa. 부서별 남,여 인원수 출력. 여자인원수가 5명 이상인 부서만 가져오시오.(groupby+having+decode)
select * from tblInsa;
select
    buseo,
    count(decode(substr(ssn, 8, 1), 1, 1)) as 남자,
    count(decode(substr(ssn, 8, 1), 2, 1)) as 여자
from tblInsa
    group by buseo
        having count(decode(substr(ssn, 8, 1), 2, 1)) >= 5;


3. tblInsa. 입사월별 인원수 구하기. (월, 인원수)(groupby)
출력결과
월     인원수
1월    10명
2월    25명
select * from tblInsa;
select 
    substr(ssn, 3, 2) || '월' as 월,
    count(*) || '명' as 인원수
from tblInsa
    group by substr(ssn, 3, 2)
        order by substr(ssn, 3, 2) asc;


5. tblInsa. 아래 형식으로 지역별 인원수를 가져오시오(decode)
전체 서울  인천  경기
60    x     x     x
select * from tblInsa;
select 
    count(*) as 전체,
    count(decode(city, '서울', 1)) as 서울,
    count(decode(city, '인천', 1)) as 인천,
    count(decode(city, '경기', 1)) as 경기
from tblInsa;

6. tblInsa. 부서별 기본급이 가장 높은 사람을 출력하시오.(이름, 부서, 기본급) 동급은 첫번째 사람만 출력하시오.(subquery+groupby) --!!!
select * from tblInsa;
select
    a.buseo as 부서, a.b as 기본급, (select name from tblInsa where buseo = a.buseo and basicpay = a.b) as 이름
from (select buseo, max(basicpay) b
    from tblInsa
        group by buseo) a;


7. tblInsa. 지역(city)별로 급여(기본급+수당) 1순위 직원만 출력하시오.(급여, 직원명,주민번호,입사일,지역,부서,직위)(groupby+subquery)
select * from tblInsa;
select
    a.b as 급여,
    (select name from tblInsa where city = a.city and basicpay+sudang = a.b) as 직원명,
    (select ssn from tblInsa where city = a.city and basicpay+sudang = a.b) as 주민번호,
    (select ibsadate from tblInsa where city = a.city and basicpay+sudang = a.b) as 입사일,
    a.city as 지역,
    (select buseo from tblInsa where city = a.city and basicpay+sudang = a.b) as 부서,
    (select jikwi from tblInsa where city = a.city and basicpay+sudang = a.b) as 직위
from (select city, max(basicpay+sudang) b
    from tblInsa
        group by city) a;


8. tblInsa. 부서별 인원수가 가장 많은 부서 및 인원수를 출력하시오.(groupby+subquery)
select * from tblInsa;
select
    *
from (select buseo, count(*)
    from tblInsa
        group by buseo
            order by count(*) desc)
    where rownum = '1';


9. tblInsa. 여자 인원수가 가장 많은 부서 및 인원수를 출력하시오.(groupby+subquery)
select * from tblInsa;
select
    *
from (select buseo, count(*),count(decode(substr(ssn, 8, 1), 2, 1)) as 여자인원수
    from tblInsa
        group by buseo
            order by count(decode(substr(ssn, 8, 1), 2, 1)) desc)
    where rownum = '1';


10. tblInsa. 지역(city)별 평균 급여(basicpay+sudang)가 가장 높은 지역 및 평균급여를 출력하시오(groupby+subquery)
select * from tblInsa;
select
    *
from (select city as 지역, round(avg(basicpay+sudang)) as 평균급여
    from tblInsa
        group by city
            order by round(avg(basicpay+sudang)) desc)
        where rownum = 1;


11. tblInsa. 이름, 부서, 출신도, 기본급, 수당, 기본급+수당, 세금, 실수령액 출력하시오.(case)
- 세금: 총급여가 250만원 이상이면 2%, 200만원 이상이면 1%, 나머지 0.
- 실수령액: 총급여-세금
select * from tblInsa;
select 
    name as 이름, buseo as 부서, city as 출신도, basicpay as 기본급, sudang as 수당, basicpay+sudang as "기본급+수당",
    case
        when basicpay+sudang >= 2500000 then (basicpay+sudang) * 0.02
        when basicpay+sudang >= 2000000 then (basicpay+sudang) * 0.01
        else 0
    end as 세금,
    (basicpay+sudang) - case
        when basicpay+sudang >= 2500000 then (basicpay+sudang) * 0.02
        when basicpay+sudang >= 2000000 then (basicpay+sudang) * 0.01
        else 0
    end as 실수령액
from tblInsa;


12. tblInsa. 부서별 평균 급여를 출력하되, A, B, C 등급으로 나눠서 출력.
- 200만원 초과 - A등급
- 150~200만원 - B등급
- 150만원 미만 - C등급
select * from tblInsa;
select 
    buseo, 
    case
        when avg(basicpay + sudang) > 2000000 then 'A'
        when avg(basicpay + sudang) >= 1500000 and avg(basicpay + sudang) <= 2000000 then 'B'
        when avg(basicpay + sudang) < 1500000 then 'C'
    end as 급여등급
from tblInsa
group by buseo;


13. lotto_detail. 역대 로또 1등 당첨금(1인 당첨금)이 가장 많은 순으로 5개를 가져오시오.(subquery)
select * from lotto_detail;
select
    *
from (select * from lotto_detail
        where win_person_no <> 0
        order by (win_money / win_person_no) desc) a
    where rownum <= 5;


14. lotto_master. 로또 번호(1~45) 중 가장 많이 나온 숫자를 6개 가져오시오.(bonus 숫자 포함)(union+groupby+subquery) --!!!!
select * from lotto_master;
select
    *
from (select num, count(*)
    from (select num1 as num from lotto_master
            union all
            select num2 as num from lotto_master
            union all
            select num3 as num from lotto_master
            union all
            select num4 as num from lotto_master
            union all
            select num5 as num from lotto_master
            union all
            select num6 as num from lotto_master
            union all
            select bonus as num from lotto_master)
            group by num
                order by count(*) desc)
    where rownum <= 6;


15. tblSubway. 승차 인원의 합보다 하차 인원의 합이 더 많은 역들을 가져오시오.(groupby+having+case+sum)
select * from tblSubway;
select 
    stationname,
    sum(case when gubun = '승차' then passengernumber end) as 승차,
    sum(case when gubun = '하차' then passengernumber end) as 하차
from tblSubway
group by stationname
having sum(case when gubun = '승차' then passengernumber end) < sum(case when gubun = '하차' then passengernumber end);


16. traffic_accident. 년도별(10년단위,1차그룹)+교통수단별(2차그룹) 총 사고 인원수와 사망자수를 가져오시오.(groupby)
select * from traffic_accident;
select 
    case
        when year >= 1980 and year < 1990 then 1980
        when year >= 1990 and year < 2000 then 1990
        when year >= 2000 and year < 2010 then 2000
        when year >= 2010 then 2010
    end as 년도별,
    trans_type as 교통수단별,
    sum(total_acct_num) as 사고인원,
    sum(death_person_num) as 사망인원
from traffic_accident
    group by case
            when year >= 1980 and year < 1990 then 1980
            when year >= 1990 and year < 2000 then 1990
            when year >= 2000 and year < 2010 then 2000
            when year >= 2010 then 2010
        end, trans_type
        order by case
                when year >= 1980 and year < 1990 then 1980
                when year >= 1990 and year < 2000 then 1990
                when year >= 2000 and year < 2010 then 2000
                when year >= 2010 then 2010
            end;


17. traffic_accident. 발생 년도와 상관없이 사고당 평균 사망자수가 가장 많은 교통 수단은 무엇인가?(groupby+subquery)
select * from traffic_accident;
select
    a.trans_type as 교통수단, a.s as 평균
from (select trans_type, round(sum(death_person_num) / sum(total_acct_num) * 100) s
    from traffic_accident
        group by trans_type
            order by round(sum(death_person_num) / sum(total_acct_num) * 100) desc) a
    where rownum = 1;


18. tblAddressbook. BMI(체중(kg)/키(m)^2) 지수가 30이 넘는 사람들 중 가장 많은 직업은?(subquery+groupby)
select * from tblAddressbook;
select
    *
from (select job, count(*)
    from tblAddressbook
        where weight / power(height * 0.01, 2) > 30
            group by job
                order by count(*) desc)
    where rownum = 1;


19. tblHousekeeping. 가장 과소비를 한 날짜(Top 3)와 그 날짜에 구매한 물품 명단과 총금액을 가져오시오.(subquery+groupby+listagg)
select * from tblHousekeeping;
select
    a.buydate,
    a.s,
    a.g
from (select buydate, sum(price * qty) s, listagg(item, ', ') within group (order by item asc) g
    from tblHousekeeping
        group by buydate
            order by sum(price * qty) desc) a
    where rownum <= 3;


20. tblAddressBook. 고향(hometown)을 떠나 거주(address)하는 사람들 중에서 동명이인인 사람들이 어떤 직업들을 가지고 있는가?(subquery+groupby+listagg)
select * from tblAddressbook;
select 
    name,
    listagg(job, ', ') within group (order by job asc) job
from tblAddressbook
    where address not like '%' || hometown || '%'
        group by name
            having count(*) > 1
                order by name;

