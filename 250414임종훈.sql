--2025년 4월 14일 1장 Select 연습문제
select * from emp;
--1번
select * from dept;
--2번
select job, empno, ename, hiredate from emp;
--3번
select distinct job from emp;
--4번
select ename, sal from emp where sal>=2850;
--5번
select ename, deptno from emp where mgr = 7566;
--6번
select ename, sal from emp where sal<=1500 or sal>=2850;
--7번
select ename, job, hiredate from emp where hiredate between'81/02/20' and'81/05/01' order by hiredate ASC;
--8번
select ename, deptno from emp where deptno=10 or deptno=30 order by ename;
--9번
select ename "employee" , sal "Monthly Salary" from emp where deptno=10 or deptno=30;
--10번
select ename from emp;
--11번
select ename, sal, comm from emp where comm is not null order by sal desc;
--12번
select ename from emp where substr(ename,3,1) = 'A';
--13번
select ename from emp where ename like '%L%' and length(ename) - length(replace(ename, 'L','')) = 2 and deptno = 30;
--14번
select ename, job, sal from emp where job in ('CLERK', 'ANALYST') and sal not in (1000,3000,5000);
--15번
select empno, ename, sal, floor(sal*1.15) "New Salary" from emp;
--16번
select empno, ename, sal, floor(sal*1.15) "New Salary", floor(sal *1.15) - sal "Increase" from emp;
--17번
select inicap(ename) "NAME", length(ename) "LENENAME" from emp;