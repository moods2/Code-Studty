/*

select 문
- DML, DQL
- 사용 빈도가 가장 높다.
- 목적 : 데이터베이스로부터 원하는 데이터를 가져오는 명령어(읽기)

select 문

select 컬럼리스트 from 테이블명 where 검색조건
a. select 컬럼리스트
b. from 테이블명
c. where 검색조건

문장을 구성하는 각 절들은 실행 순서가 이미 정해져 있다.
1. from 테이블명
2. where 검색조건
3. select 컬럼리스트

1. select 절 : 해당 테이블에서 가져올 컬럼을 지정한다.
2. from 절 : 데이터를 가져올 테이블 지정한다.

*/
select * --2
    from employees; --1
    
--접근 가능한 테이블 목록
select * from tabs; --시스템 테이블(tabs)
select * from countries;
select * from hr.countries;

-- scott
-- DEPT
-- EMP
-- BONUS
-- SALGRADE

select * from emp;
select * from emp where deptno in (20, 10);

select empno from emp;

-- select 컬럼리스트 유형
-- 1. *(all) : 모든 컬럼
select * from emp;

-- 2. 컬럼명
select ename from emp;
select ename, job, hiredate from emp;

select ename, length(ename) from emp;

-- ORA-00904: "WEIGHT": invalid identifier -> 오류 검색시 ORA-00904검색(고유번호)
select ename, weight from emp;

-- ORA-00942: table or view does not exist
select ename from empp;

select scott.emp.ename from scott.emp;

desc emp;

