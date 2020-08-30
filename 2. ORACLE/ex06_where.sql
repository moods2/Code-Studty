/*

select 문
- select 컬럼리스트 from 테이블;
- select 컬럼리스트 from 테이블 where 조건;

컬럼리스트(조건)
- 가져올 컬럼을 지정

where 절(조건 절)
- 가져올 레코드를 지정할 조건을 명시한다.
- 조건을 제시 > 모든 행을 대상으로 검사 > 만족하는 행은 결과셋 포함
    , 만족하지 못한 행을 결과셋 제외
- 비교 연산자 or 논리 연산자 사용

1. from 테이블
        - 가져올 테이블을 선택(데이터 소스를 선택)
        
2. where 조건
        - 가져올 행을 검사한다.(조건에 맞는 행만 걸러내기)
        
3. select 컬럼리스트
        - where을 통해 걸러진 나머지 결과셋에서 원하는 컬럼만 가져온다.

*/

select name, continent from tblCountry where continent = 'AS';

select name, city, buseo, jikwi from tblInsa where city = '서울' and buseo = '기획부';

select * from tblHousekeeping where qty >= 10;
select * from tblHousekeeping where price * qty > 30000;

-- tblComedian
-- 1. 몸무게가 60kg 이상이고, 키가 170cm 미만 사람을 가져오시오.

select * from tblComedian where weight >= 60 and height < 170;

-- 2. 여자만 가져오시오.

select * from tblComedian where gender = 'f';

-- tblInsa
-- 3. 부서가 '개발부'이고 급여(basicpay)를 150만원 이상을 받는 직원들 가져오시오.

select * from tblInsa where buseo = '개발부' and basicpay >= 1500000;

-- 4. 급여(basicpay) + 수당(sudang)을 200만원 이상 + '서울' 직원들 가져오시오.

select * from tblInsa where basicpay + sudang >= 2000000 and city = '서울';



-- 조건절(where)에서 사용되는 여러 구문(연산자 or 함수 등)
/*

between ~ and
- where 절에서 사용(조건으로 사용)
- 범위 조건
- 컬럼명 between A(최솟값) and B(최댓값)
- A, B : 포함(inclusive)
- 가독성 향상
- 회사 : between 사용 금지 (속도가 더 느림)

*/

-- 몸무게가 60~70kg 사이인 사람?
select * from tblComedian;
select * from tblComedian where weight >= 60 and weight <= 70;
select * from tblComedian where weight between 64 and 66;

-- 비교 연산에 사용 가능한 자료형
-- 1. 숫자형(number)
select * from tblInsa;
select * from tblInsa where  sudang >= 150000; -- 32
select * from tblInsa where  sudang >= 150000 and sudang <= 180000; -- 22
select * from tblInsa where sudang between 150000 and 180000; -- 22

-- 2. 문자형
select * from tblInsa where name >= '박';
select * from tblInsa where name >= '박길동' and name <= '최길동';
select * from tblInsa where name between '박길동' and '최길동';

-- 3. 날짜시간형(date)
desc tblInsa;
select * from tblInsa where ibsadate >= '2010-01-01'; -- 42
select * from tblInsa where ibsadate >= '2010-01-01' and ibsadate <= '2010-12-31'; -- 12
select * from tblInsa where ibsadate between '2010-01-01' and '2010-12-31'; -- 12


/*

in
- where절에서 사용(조건으로 사용)
- 열거형 조건(제시된 값 중 하나라도 일치하면 만족)
- 컬럼명 in (값, 값, 값...)

*/

-- tblCountry. AS, EU
select * from tblCountry where continent = 'AS' or continent = 'EU';
select * from tblCountry where continent in ('AS', 'EU');

-- tblInsa. 개발부 + 홍보부 + 총무부
select * from tblInsa where buseo in('개발부', '홍보부', '총무부');

-- 부장 + 과장 & 서울 + 인천
select * from tblInsa where jikwi in('부장', '과장') and city in('서울', '인천')
                                            and basicpay between 2500000 and 2600000;


/*

like
- where절에서 사용(조건으로 사용)
- 패턴 비교
- 문자형을 대상으로 사용(숫자형, 날짜형 사용X)
- 컬럼명 like '패턴 문자열'

패턴 문자열 구성 요소
1. _ : 임의의 문자 1개
2. % : 임의의 문자 N개(0~무한대 정수)

*/

select * from tblInsa;
select * from tblInsa where name like '김__'; --김OO
select * from tblInsa where name like '_정_';
select * from tblInsa where name like '__동';
select * from tblInsa where name like '김___';

select * from tblInsa where ssn like '______-2______'; -- 29
select * from tblInsa where ssn like '______-1______'; -- 31

select * from tblInsa where tel like '011-____-____';

select * from tblInsa where name like '김%';
select * from tblCountry where name like '_국';
select * from tblCountry where name like '%국';

-- SQL은 대소문자 구분하지 않는다. > 구문
-- SQL은 대소문자 구분한다. > 데이터
select * from employees where first_name like 'A%';
select * from employees where first_name like '%a';
select * from employees where first_name like '%a%';
select * from employees where first_name like '%a%e%';


/*

RDBMS에서 null
- 자바 null과 유사
- 컬럼이 비어있는 상태(셀)
- 직접 표현 가능 : null
- 대다수의 언어에서 null은 연산의 대상이 될 수 없다.
- null 리터럴 + not null 리터럴

null 조건
- where절에서 사용(조건으로 사용)
- 해당 컬럼이 null인지 질문
- 컬럼명 is null

*/

select * from tblCountry where population = null;
select * from tblCountry where population is null; -- 인구수 미기재
select * from tblCountry where not population is null; -- X
select * from tblCountry where population is not null; -- O

-- 할일을 마친 일들?
select * from tblTodo where completedate is not null;

-- 할일을 아직 안한 일들?
select * from tblTodo where completedate is null;

-- 도서관 - 도서 대여(대여날짜, 반납날짜)
-- 아직 반납이 안된 대여?
select * from 도서대여 where 반납날짜 is null;

-- 반납완료 기록?
select * from 도서대여 where 반납날짜 is not null;

