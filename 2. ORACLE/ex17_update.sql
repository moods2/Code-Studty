/*

update 문
- DML
- 원하는 행의 원하는 컬럼값을 수정하는 명령어
-  update 테이블명 set 컬럼명 = 수정할값 [,컬럼명 = 수정할값] X N

*/
commit;
rollback;

select * from tblCountry;

update tblCountry set capital = '세종' where name = '대한민국'; -- where pk 조건

-- 해수면 낮아짐 -> 10% 증가
update tblCountry set area = area * 1.1;

update 주소록 set address = '서울시 강남구 역삼동';

select * from tblInsa;

-- 홍길동 -> city(제주), tel(010-1234-5678), buseo(홍보부), jikwi(과장), basicpay(+20%)
update tblInsa
    set
        city = '제주',
        tel = '010-1234-5678',
        buseo = '홍보부',
        jikwi = '과장',
        basicpay = basicpay * 1.2
    where num = 1001;

-- ** 하면 안되는 행동!!! -> PK는 절대로 수정하지 않는다!!!(주민번호, 아이디 등..)
select * from tblInsa;

update tblInsa set
    num = 2000
        where num = 1001;

