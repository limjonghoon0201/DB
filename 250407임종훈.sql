 --문제1
 select * from student;
 select name ||'''s ID: '||ID||',WEIGHT is '||weight||'Kg' "ID AND WEIGHT" from student;
 --문제2
 select * from emp;
 select ename||'('||job||') , '||ename||''''||job||'''' "NAME AND JOB" from emp;
 --문제3
 select ename||'''s sal is $'||Sal "Name and Sal" from emp;
 --where절 사용
 select empno, ename from emp where empno=7900;
 select ename , sal from emp where sal<1000;
 --기본산술연산자
 select ename, sal, deptno from emp where deptno = 10;
 select ename, sal, sal+100, deptno from emp where deptno = 10;
 select ename , sal , sal*1.1 from emp where deptno = 10;
 --비교연산자
 select ename, hiredate from emp where hiredate >= '81/12/25';
 --Between A and B
 select empno , ename, sal from emp where sal between 2450 and 3000;
 select empno , ename, sal from emp where sal>=2450 and sal<=3000;
 --IN연산자
 select empno , ename, deptno from emp where deptno in (10,20);
 select empno , ename, deptno from emp where ename in ('KING','FORD');
 --LIKE연산자
 select empno , ename, sal from emp where sal like '1%'; --sal이 1로 시작하는 모든 값
 select empno , ename, sal from emp where ename like 'A%'; --ename이 A로 시작하는 모든 값
 select empno , ename, hiredate from emp where hiredate like '%03'; --hiredate이 03로 끝나는 모든 값
 select empno , ename, hiredate from emp where ename like '_A%'; --두 번째 글자가 A인 모든 값
 --and, or
 select ename, hiredate, sal from emp where hiredate > '82-01-01' and sal >=1300;
 select ename, hiredate, sal from emp where hiredate > '82-01-01' or sal >=1300;
 --집합 연산자
 select studno, name, deptno1, 1 from student where deptno1 = 101
 union
 select profno, name, deptno, 2 from professor where deptno = 101;
 
 select studno, name, deptno1, 1 from student where deptno1 = 101
 union all
 select profno, name, deptno, 2 from professor where deptno = 101;
 