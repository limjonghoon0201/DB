--JOIN 문법
select * from emp;
select * from dept;
select empno, ename, dname from emp, dept;
select empno, ename, dname, deptno from emp, dept where emp.deptno = dept.deptno; --오류남 
select e.empno, e.ename, d.dname, e.deptno from emp e, dept d where e.deptno = d.deptno;

select * from student;
select * from professor;
select s.name stu_name, p.name prof_name from student s, professor p where s.profno = p.profno;

select * from department;

select s.name stu_name, d.dname dept_name, p.name prof_name from student s, department d, professor p where s.deptno1=d.deptno and s.profno=p.profno;

select * from customer;
select * from gift;
select c.gname cust_name, c.point point, g.gname gift_name from customer c, gift g where point between g_start and g_end;