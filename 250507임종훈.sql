--¿ù
select sysdate, to_char(sysdate) from dual;
select sysdate, to_char(sysdate), to_char(sysdate,'mm'), to_char(sysdate,'mon'), to_char(sysdate,'month') from dual;
--ÀÏ
select sysdate, to_char(sysdate) from dual;
select sysdate, to_char(sysdate), to_char(sysdate,'dd'), to_char(sysdate,'day'), to_char(sysdate,'ddth') from dual;
--½Ã°£
select sysdate, to_char(sysdate,'rrrr-mm-dd:hh24:mi:ss') from dual;

select * from student;
select studno, name, birthday from student where substr(to_char(birthday),4,2)='01';
select * from emp;
select empno, ename, hiredate from emp where substr(to_char(hiredate),4,2) in ('01','02','03');
select ename, empno, sal, comm , to_char(sal*12+comm,'999,999.00') from emp where ename = 'ALLEN';
select empno, ename, to_char(hiredate,'yyyy-mm-dd') hiredate, to_char(sal*12+comm,'999,999$') sal, to_char((sal*12+comm)*1.15,'999,999$') "15% up" from emp where comm is not null;
