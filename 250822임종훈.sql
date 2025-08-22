insert into emp (empno, deptno, ename, sal) values (1000, 10, 'Tiger', 3600);
insert into emp (empno, deptno, ename, sal) values (2000, 30, 'Cat', 3000);
--연습문제4
select deptno, job, sum(sal) from emp group by deptno, job order by deptno;
select deptno,
sum(decode(job,'CLERK',sal,0)) "CLERK",
sum(decode(job,'MANAGER',sal,0)) "MANAGER",
sum(decode(job,'PRESIDENT',sal,0)) "PRESIDENT",
sum(decode(job,'ANALYSTY',sal,0)) "ANALYSTY",
sum(decode(job,'SALESMAN',sal,0)) "SALESMAN",
sum(nvl2(job,sal,0)) "TOTAL"
from emp group by rollup(deptno) order by deptno;

--연습문제 5
select deptno, ename, sal, sum(sal) over(order by sal)total from emp;

--연습문제 6
select * from fruit;
select max(sum(decode(name,'apple',100))) apple,
max(sum(decode(name,'grape',200))) grape,
max(sum(decode(name,'orange',300))) orange
from fruit group by name;

--연습문제 7 다음시간에 계속..