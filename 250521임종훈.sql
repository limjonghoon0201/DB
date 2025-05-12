--¹¬½ÃÀû Çüº¯È¯
select to_number('5') from dual;
select to number('A') from dual;
select ascii('A') from dual;
select to_date('24/4/28')+1 from dual;
select '24/4/28'+1 from dual;
--ÀÏ¹ÝÇÔ¼ö
select ename, comm,nvl(comm,0),nvl(comm,100) from emp where deptno=30;
select empno,ename,sal,comm,nvl2(comm,sal+comm,sal*0) "NVL2" from emp where deptno=30;
select deptno, name, decode(deptno, 101, 'Computer Engineering') "DNAME" from professor;
select empno, ename, sal,
        case when sal between 1 and 1000 then 'level 1'
             when sal between 1001 and 2000 then 'level 2'
             when sal between 2001 and 3000 then 'level 3'
             when sal between 3001 and 4000 then 'level 4'
        else 'level 5'
    end "LEVEL"
from emp;
