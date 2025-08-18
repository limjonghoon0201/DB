select * from emp;
--count함수
select count(*), count(comm) from emp;
--sum함수
select count(comm), sum(comm) from emp;
--avg함수
select count(comm), sum(comm), avg(comm) from emp;
--max, min 함수
select max(sal), min(sal) from emp;
select max(hiredate) "MAX", min(hiredate) "MIN" from emp;
--group by 절 사용하기
select deptno, round(avg(nvl(sal,0)),2) "AVG" from emp group by deptno;
select deptno, job, avg(nvl(sal,0)) "AVG_SAL" from emp group by deptno, job order by deptno;
--연습문제1
select max(sal+nvl(comm,0)) max, min(sal+nvl(comm,0)) min, round(avg(sal+nvl(comm,0)),1) avg from emp;
--연습문제2
select * from student;

select substr(birthday,4,2) bi, count(*) from student group by substr(birthday,4,2) order by bi;

select count(*)||'EA' total,
count(decode(substr(birthday,4,2),'01',0))||'EA' jan,
count(decode(substr(birthday,4,2),'02',0))||'EA' feb,
count(decode(substr(birthday,4,2),'03',0))||'EA' mar,
count(decode(substr(birthday,4,2),'04',0))||'EA' apr,
count(decode(substr(birthday,4,2),'05',0))||'EA' may,
count(decode(substr(birthday,4,2),'06',0))||'EA' jun,
count(decode(substr(birthday,4,2),'07',0))||'EA' jul,
count(decode(substr(birthday,4,2),'08',0))||'EA' aug,
count(decode(substr(birthday,4,2),'09',0))||'EA' sep,
count(decode(substr(birthday,4,2),'10',0))||'EA' oct,
count(decode(substr(birthday,4,2),'11',0))||'EA' nov,
count(decode(substr(birthday,4,2),'12',0))||'EA' dec
from student;
--연습문제3
select * from student;

select count(*)||'' total,
count(decode(substr(tel,1,instr(tel,')')-1),'02',0)) seoul,
count(decode(substr(tel,1,instr(tel,')')-1),'031',0)) gyeonggi,
count(decode(substr(tel,1,instr(tel,')')-1),'051',0)) busan,
count(decode(substr(tel,1,instr(tel,')')-1),'052',0)) ulsan,
count(decode(substr(tel,1,instr(tel,')')-1),'053',0)) daegu,
count(decode(substr(tel,1,instr(tel,')')-1),'055',0)) gyeongnam
from student;
