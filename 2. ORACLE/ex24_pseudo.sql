/*

의사 컬럼, Pseudo Column
- 실제 컬럼이 아닌데 컬럼처럼 행동하는 객체
- 오라클 전용. MS-SQL(top), MYSQL(limit)
- rownum
- rownum은 from절이 실행된 직후 호출(+계산)이 된다. > 하나의 select from에서 단 한번만 실행

*/
select name, buseo, jikwi from tblInsa;

-- 질문의 조건에 1행이 포함이 되면 O, 포함이 안되면 X
select name, buseo, jikwi from tblInsa where rownum = 1;
select name, buseo, jikwi from tblInsa where rownum <= 5;
select name, buseo, jikwi from tblInsa where rownum = 10;
select name, buseo, jikwi from tblInsa where rownum >= 5 and rownum <=10;

select name, buseo, jikwi, rownum from tblInsa order by name;

--tblInsa. 급여를 가장 많이 받는 직원. Top 5
select name, buseo, jikwi, basicpay from tblInsa order by basicpay desc;

-- 원하는 정렬을 한 후 -> 제대로된 rownum을 얻는 방법 -> 서브 쿼리 사용
select name, buseo, jikwi, basicpay, rownum 
    from (select name, buseo, jikwi, basicpay from tblInsa order by basicpay desc)
        where rownum <= 5;
        
--tblInsa. 급여를 가장 많이 받는 직원. Top 6 ~ 10
-- 특정 테이블 -> 내가 원하는 정렬 + 내가 원하는 범위 추출 -> 최소 서브쿼리 2개 이상
select name, buseo, jikwi, basicpay, rnum, rownum from
(select name, buseo, jikwi, basicpay, rownum as rnum
    from (select name, buseo, jikwi, basicpay from tblInsa order by basicpay desc))
        where rnum between 6 and 10;
        
create or replace view vwBasicpay
as
select name, buseo, jikwi, basicpay, rownum as rnum
    from (select name, buseo, jikwi, basicpay from tblInsa order by basicpay desc);

select * from vwBasicpay where rnum = 3;


select * from tblAddressbook;

-- 지역별(hometown) 거주자가 가장 많은 순서 Top 3
select a.*, rownum from (select hometown, count(*) as cnt
                                        from tblAddressbook
                                            group by hometown
                                                order by count(*) desc) a
                                                    where rownum <= 3;

-- 지역별(hometown) 거주자가 가장 많은 순서 Top 4~6

select b.* from (select a.*, rownum as rnum
                                    from (select hometown, count(*) as cnt
                                        from tblAddressbook
                                            group by hometown
                                                order by count(*) desc) a) b
                                                    where rnum between 4 and 6;

-- 1. 원하는대로 정렬
-- 2. 그걸로 서브쿼리 만들어서 원하는 순서에 맞게 정렬
-- 3. 1이 포함되지 않는 조건은 한번더 서브쿼리를 만든다


-- tblInsa. 부서별 인원수가 가장 많은 2번째 부서?
select b.*
    from (select a.*, rownum as rnum
        from (select buseo, count(*)
            from tblInsa
                group by buseo
                    order by count(*) desc) a) b
                        where rnum = 2;
