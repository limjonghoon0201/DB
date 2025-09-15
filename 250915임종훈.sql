select * from student;
select * from score;
select * from hakjum;
select s.name stu_name, sc.total score, h.grade cre from student s, score sc, hakjum h where sc.studno=s.studno and sc.total>=h.min_point and sc.total<=h.max_point;
select s.name stu_name, sc.total score, h.grade cre from student s, score sc, hakjum h where sc.studno=s.studno and sc.total between h.min_point and h.max_point;

select * from professor;
select s.name stu_name, p.name prof_name from student s, professor p where s.profno = p.profno(+);
select s.name stu_name, p.name prof_name from student s, professor p where s.profno(+) = p.profno;

select s.name stu_name, p.name prof_name from student s, professor p where s.profno(+) = p.profno
union all
select s.name stu_name, p.name prof_name from student s, professor p where s.profno = p.profno(+);

select s.name, p.name from student s, professor p where s.profno(+) = p.profno;
select s.name stu_name, p.name prof_name from professor p join student s on s.profno=p.profno;
select s.name stu_name, p.name prof_name from professor p left outer join student s on s.profno=p.profno;

select s.name stu_name, p.name prof_name from professor p right outer join student s on s.profno=p.profno;


select s.name stu_name, p.name prof_name from professor p full outer join student s on s.profno=p.profno;

select * from emp;
select e1.empno, e1.ename, e1.mgr, e2.ename from emp e1, emp e2 where e1.empno=e2.mgr;



