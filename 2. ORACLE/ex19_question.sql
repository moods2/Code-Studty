34. tblCountry. 인구가 5000 ~ 20000 사이인 국가 총 몇개입니까? --4
select count(name) from tblCountry where population between 5000 and 20000;

35. employees. 직업이 'IT_PROG'인 직원 중에서 급여가 5000불 넘는 직원 몇명입니까? --2
select count(*) from employees where job_id = 'IT_PROG' and salary >= 5000;

36. tblInsa. 010이 아닌 번호를 사용하는 직원은 몇명입니까?(연락처가 없는 사람 제외) --42
select count(*) from tblInsa where not substr(tel, 1, 3) = '010';

37. tblInsa. 서울 사람 빼고 나머지는 모두 몇명입니까? --40
select count(*) from tblInsa where not city = '서울';

38. tblInsa. 남자 직원은 모두 몇명입니까? --31
select count(*) from tblInsa where substr(ssn, 8, 1) = 1;

39. tblCountry. 유럽과 아프리카에 속한 나라의 모든 인구의 합은? --14198
select sum(population) from tblCountry where continent in ('EU', 'AF');

40. employees. 매니저(108)이 관리하고 있는 직원들의 급여 총 합은? --39600
select sum(salary) from employees where manager_id = 108;

41. employees. 직업이 ST_CLERK, SH_CLERK인 직원들을 급여 총 합은? --120000
select sum(salary) from employees where job_id in ('ST_CLERK', 'SH_CLERK');

42. tblInsa. 서울에 있는 직원들의 급여 합은(급여 + 수당)? --33812400
select sum(basicpay + sudang) from tblInsa where city = '서울';

43. tblInsa. 장급(부장+과장)들의 총 급여 합은? --36289000
select sum(basicpay) from tblInsa where jikwi in ('과장', '부장');

44. tblCountry. 아시아에 속한 국가의 평균 인구수는? --39165
select avg(population) from tblCountry where continent = 'AS';

45. employees. 이름(first_name)에 'NI'이 포함된 직원들의 평균 급여는?(대소문자 구분없이) --7400
select avg(salary) from employees where upper(first_name) like '%' || upper('ni') || '%';

46. tblInsa. 간부급(과장,부장)들의 평균 급여는? --2419267
select round(avg(basicpay)) from tblInsa where jikwi in('과장', '부장');

47. tblInsa. 사원급(사원,대리)들의 평균 급여는? --1268947
select round(avg(basicpay)) from tblInsa where jikwi in('대리', '사원');

48. tblCountry. 면적이 가장 넓은 나라의 면적은? --959
select max(area) from tblCountry;

49. tblInsa. 급여(급여+수당)가 가장 적게 받는 직원의 금액은? --988000
select min(basicpay + sudang) from tblInsa;

50. tblInsa. 직원명과 태어난 년도을 가져오되 태어난 년도를 오름차순으로 가져오시오.
select name, '19' || substr(ssn, 1, 2) from tblInsa order by ssn asc;

51. tblInsa. 서울에 사는 여직원 중 80년대생 몇명인지? --3
select count(*) from tblInsa where city = '서울' and substr(ssn, 1, 1) = 8 and substr(ssn, 8, 1) = 2;

52. tblInsa. 간부급(과장/부장)들은 어떤 성(김,이,박..)들이 있는지? --이,김,정,최,지,문,박,허,홍,권
select distinct substr(name, 1, 1) from tblInsa where jikwi in('과장', '부장');

53. tblInsa. 직원들을 태어난 월순으로 정렬해서 가져오시오.(오름차순 → 월, 이름)
select * from tblInsa order by substr(ssn, 3, 2) asc, name asc;

54. tblInsa. 모든 직원을 남자 → 여자 순으로 정렬해서 가져오시오. (같은 성별끼리는 이름순으로 정렬)
select * from tblInsa order by substr(ssn, 8, 1) asc, name asc;

55. employees. 이름(first_name + last_name)이 가장 긴 순서대로 가져오시오.
select * from employees order by length(first_name) + length(last_name) desc;

56. employees. 이름(first_name + last_name)이 가장 긴사람은 몇글자? --16
select max(length(first_name) + length(last_name)) from employees;

57. employees. last_name이 5자 이상인 사람들은 first_name이 몇글자?
select length(first_name) from employees where length(last_name) >= 5;

58. tbldiary. 다이어리를 작성한 날짜가 총 며칠분이며, 날씨가 맑음, 흐림, 비가 온 날이 각각 며칠이었는지? --7,5,3,2
select
    count(distinct regdate) as 며칠,
    count(case
        when weather = '맑음' then 1
    end)as 맑음,
    count(case
        when weather = '흐림' then 1
    end) as 흐림,
    count(case
        when weather = '비' then 1
    end) as 비
from tbldiary;

59. tbldiary. 공부와 관련된 작성 게시물이 총 몇개인가?('오라클', '자바', '코딩'이 들어간 게시물 개수) --1,1,1
select 
    count(case
        when instr(subject, '오라클') > 0 then 1
    end) as 오라클,
    count(case
        when instr(subject, '자바') > 0 then 1
    end) as 자바,
    count(case
        when instr(subject, '코딩') > 0 then 1
    end) as 코딩
from tbldiary;

60. fine_dust_standard + fine_dust. 강남구의 미세먼지(PM10) 상태가 좋음, 보통, 나쁨, 매우나쁨이 각각 며칠이었는지? --140,163,95,57
select * from fine_dust where mea_station = '강남구';
select * from fine_dust_standard;
select
    count(case
        when pm10 between 0 and 30 then 1
    end) as 좋음,
    count(case
        when pm10 between 31 and 50 then 1
    end) as 보통,
    count(case
        when pm10 between 51 and 70 then 1
    end) as 나쁨,
    count(case
        when pm10 between 71 and 999 then 1
    end) as 매우나쁨
from fine_dust
where mea_station = '강남구';

61. lotto_detail. 1인당 당첨금이 가장 많은 순으로 가져오시오. (1등 당첨자 수, 1등 당첨금, 총 당첨금)
select
    win_person_no as "1등 당첨자 수",
    win_money as 당첨금,
    win_person_no * win_money as "총 당첨금"
from lotto_detail 
order by win_money desc;

62. tblsubway. 2017년 4월 2일에 승차한 승객수가 가장 많은 순으로 가져오시오.
select
    *
from tblsubway 
where boardingdate = '2017-04-02' and gubun = '승차' 
order by passengernumber desc;

63. tblzoo. 다리가 있고(leg) 날지 못하는(fly) 동물들의 종(family)을 가져오시오. --포유,양서,조,파충
select
    distinct family
from tblzoo 
where leg > 0 and fly = 'n';

65. tbltodo. 오전(0~11시)과 오후(12~23시)에 끝마친(completedate) 할일들의 개수를 각각 가져오시오. --1,11
select 
    count(case
        when to_char(completedate, 'hh24') between 0 and 11 then 1
    end) as 오전,
    count(case
        when to_char(completedate, 'hh24') between 12 and 23 then 1
    end) as 오후
from tbltodo;

66. tbladdressbook. 구글 메일, 다음 메일, 네이버 메일을 사용하는 사람이 각각 몇명인지? --414,350,460
select * from tbladdressbook;
select 
    count(decode(substr(email, instr(email, '@') + 1), 'gmail.com', 1)) as 구글,
    count(decode(substr(email, instr(email, '@') + 1), 'daum.net', 1)) as 다음,
    count(decode(substr(email, instr(email, '@') + 1), 'naver.com', 1)) as 네이버
from tbladdressbook;

67. tbladdressbook. 서울 이외의 지역에서 사는 사람들이 총 몇명인지? --772
select 
    count(*)
from tbladdressbook 
where not substr(address, 1, 2) = '서울';
