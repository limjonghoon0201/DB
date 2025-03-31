--데이터구조
desc emp;
select * from emp;
select ename,job from emp;
--테이블구조
desc professor;
select * from professor;
select name from professor;
select name,'good morning~~!' "인사" from professor;
select dname,'it''s deptno:', deptno "DNAME AND DEPTNO" from dept;
select dname,'it''s deptno:'|| deptno "DNAME AND DEPTNO" from dept;
select dname, q'[, it's deptno : ]' , deptno " DNAME AND DEPTNO" from dept;
select profno "교수님 번호", name 이름,pay as "급여" from professor;

