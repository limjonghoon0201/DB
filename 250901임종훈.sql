--3�� �������Լ� ��������
--1) emp ���̺��� ����Ͽ� ��� �߿��� �޿�(sal)�� ���ʽ�(comm)�� ��ģ �ݾ��� ���� ���� ���� ���� ���� ���, ��ձݾ��� ���ϼ���.
--��, ���ʽ��� ���� ���� ���ʽ��� 0 ���� ����ϰ� ��� �ݾ��� ��� �Ҽ��� ù° �ڸ������� ������ �ϼ���.
select * from emp;
select max(sal+nvl(comm,0)) max, min(sal+nvl(comm,0)) min, round(avg(sal+nvl(comm,0)),2) avg from emp;


--2) student ���̺��� birthday Į���� �����ؼ� �Ʒ��� ���� ������ ���� �ڼ��� ����ϼ���.
select * from student;
select count(*)||'EA' total,
    count(decode(to_char(birthday,'MM'),'01',0))||'EA' jan,
    count(decode(to_char(birthday,'MM'),'02',0))||'EA' feb,
    count(decode(to_char(birthday,'MM'),'03',0))||'EA' maR,
    count(decode(to_char(birthday,'MM'),'04',0))||'EA' apr,
    count(decode(to_char(birthday,'MM'),'05',0))||'EA' MAY,
    count(decode(to_char(birthday,'MM'),'06',0))||'EA' jun,
    count(decode(to_char(birthday,'MM'),'07',0))||'EA' jul,
    count(decode(to_char(birthday,'MM'),'08',0))||'EA' aug,
    count(decode(to_char(birthday,'MM'),'09',0))||'EA' sep,
    count(decode(to_char(birthday,'MM'),'10',0))||'EA' oct,
    count(decode(to_char(birthday,'MM'),'11',0))||'EA' nov,
    count(decode(to_char(birthday,'MM'),'12',0))||'EA' dec
from student;

--3) Student ���̺��� tel Į���� �����Ͽ� �Ʒ��� ���� ������ �ο����� ����ϼ���.
--��, 02-SEOUL, 031-GYEONGGI, 051-BUSAN, 052-ULSAN, 053-DAEGU, 055-GYEONGNAM���� ����ϼ���.
select * from student;
select 
    count(*) total,
    count(decode(substr(tel,1,instr(tel,')')-1),'02',0)) seoul,
    count(decode(substr(tel,1,instr(tel,')')-1),'031',0)) gyeonggi,
    count(decode(substr(tel,1,instr(tel,')')-1),'051',0)) busan,
    count(decode(substr(tel,1,instr(tel,')')-1),'052',0)) ulsan,
    count(decode(substr(tel,1,instr(tel,')')-1),'053',0)) daegu,
    count(decode(substr(tel,1,instr(tel,')')-1),'055 ',0)) gyeongam
from student;


--4) ���� emp ���̺� �Ʒ��� �ΰ��� �����͸� �Է��Ͻ� �� �۾��ϼ���.
--Emp ���̺��� ����Ͽ� �Ʒ��� ȭ��� ���� �μ����� ���޺��� �޿� �հ� ����� ����ϼ���.
select deptno, job, sum(sal) from emp group by deptno, job order by deptno;
select deptno,
sum(decode(job,'CLERK',sal,0)) "CLERK",
sum(decode(job,'MANAGER',sal,0)) "MANAGER",
sum(decode(job,'PRESIDENT',sal,0)) "PRESIDENT",
sum(decode(job,'ANALYSTY',sal,0)) "ANALYSTY",
sum(decode(job,'SALESMAN',sal,0)) "SALESMAN",
sum(nvl2(job,sal,0)) "TOTAL"
from emp group by rollup(deptno) order by deptno;

--5) emp ���̺��� ����Ͽ� �������� �޿��� ��ü �޿��� ���� �޿� �ݾ��� �Ʒ��� ������ ����ϼ���.
-- ��, �޿��� ������������ �����ؼ� ����ϼ���.
select deptno, ename, sal, sum(sal) over(order by sal)total from emp;


--6) fruit ���̺��� �Ʒ��� ���� ���·� ����ϼ���.
select * from fruit;
select max(sum(decode(name,'apple',100))) apple,
max(sum(decode(name,'grape',200))) grape,
max(sum(decode(name,'orange',300))) orange
from fruit group by name;


--7) student ���̺��� Tel Į���� ����Ͽ� �Ʒ��� ���� ������ �ο����� ��ü ��� �����ϴ� ������ ����ϼ���.
select * from student;
select
    count(*)||'EA('||count(*)/count(*)*100||'%)' total,
    count(decode(substr(tel,1,instr(tel,')')-1),'02',0))||'EA('||count(decode(substr(tel,1,instr(tel,')')-1),'02',0))/count(*)*100||'%)' seoul,
    count(decode(substr(tel,1,instr(tel,')')-1),'031',0))||'EA('||count(decode(substr(tel,1,instr(tel,')')-1),'031',0))/count(*)*100||'%)' gyeonggi,
    count(decode(substr(tel,1,instr(tel,')')-1),'051',0))||'EA('||count(decode(substr(tel,1,instr(tel,')')-1),'051',0))/count(*)*100||'%)' busan,
    count(decode(substr(tel,1,instr(tel,')')-1),'052',0))||'EA('||count(decode(substr(tel,1,instr(tel,')')-1),'052',0))/count(*)*100||'%)' ulsan,
    count(decode(substr(tel,1,instr(tel,')')-1),'053',0))||'EA('||count(decode(substr(tel,1,instr(tel,')')-1),'053',0))/count(*)*100||'%)' daegu,
    count(decode(substr(tel,1,instr(tel,')')-1),'055',0))||'EA('||count(decode(substr(tel,1,instr(tel,')')-1),'055',0))/count(*)*100||'%)' gyeongnam
from student;

--8) emp ���̺��� ����Ͽ� �Ʒ��� ���� �μ����� �޿� �����հ谡 �������� ����ϼ���.( �� �μ� ��ȣ�� �������� ����ϼ���. )
select deptno, ename, sal, sum(sal) over(partition by deptno order by sal) total from emp;

--9) emp ���̺��� ����Ͽ� �Ʒ��� ���� �� ����� �޿����� ��ü ���� �޿� �Ѿ׿��� ��%�� ������ �����ϴ��� ����ϼ���.
--��, �޿� ������ ���� ����� ���� ��µǵ��� �ϼ���.
select deptno, ename, sal, sum(sal) over() total_sal, round(sal/sum(sal) over()*100,2) from emp order by sal desc;
select deptno, ename, sal, sum(sal) over() total_sal, round(ratio_to_report(sal) over()*100,2) from emp order by sal desc;
select deptno, ename, sal, sum(sal) over() total_sal, round(sal/sum(sal) over()*100,2) from emp group by deptno, ename, sal order by 5 desc;

--10)emp ���̺��� ��ȸ�Ͽ� �Ʒ��� ���� �� �������� �޿��� �ش� �μ� �հ�ݾ׿��� ��%�� ������ �����ϴ����� ����ϼ���.
--��, �μ� ��ȣ�� �������� ������������ ����ϼ���.
select deptno, ename, sal, sum(sal) over(partition by deptno) sum_dept, round(sal/sum(sal) over(partition by deptno)*100,2) "%" from emp order by deptno, ename; 


--11) loan ���̺��� ����Ͽ� 1000�� ������ ���� ������ ����ϵ� ��������, ���� �����ڵ�, ����Ǽ�, ���� �Ѿ�, ���� ����ݾ��� �Ʒ��� ���� ����ϼ���.
select * from loan;
select l_date ��������, l_code ���������ڵ�, l_qty ����Ǽ�, l_total �����Ѿ�, sum(l_total) over(order by l_date) ��������ݾ� from loan where l_store = 1000;

--12) loan ���̺��� ����Ͽ� ��ü ������ ���� �����ڵ�, ���� ����, ��������, ����Ǽ�, ������� ���� �ڵ�� ���� �������� ���� �հ踦 ���ϼ���.
select l_code ���������ڵ�, l_store ��������, l_date ��������, l_qty ����Ǽ�, l_total �����, sum(l_total) over(partition by l_code, l_store order by l_date) ��������ݾ� from loan;

--13) loan ���̺��� ��ȸ�Ͽ� 1000�� ������ ���� ������ ���� �ڵ庰�� ���ļ� ��������, ���� �����ڵ�, ����Ǽ�, ���� �Ѿ�, �ڵ庰 ���� ����ݾ��� �Ʒ��� ���� ����ϼ���.
select l_date ��������, l_code ���������ڵ�, l_qty ����Ǽ�, l_total �����Ѿ�, sum(l_total) over(partition by l_code order by l_total) ��������ݾ� from loan where l_store = 1000;


--14) professor ���̺��� �� �������� �޿��� ���ϰ� �� ������ �޿����� ��ü ������ �޿� �հ迡�� �����ϴ� ������ ����ϼ���.
select * from professor;
select deptno, name, pay, sum(pay) over() "TOTAL PAY", round(pay/sum(pay) over() *100,2) "RATIO %" from professor order by pay desc;


--15) professor ���̺��� ��ȸ�Ͽ� �а� ��ȣ, ������, �޿�, �а��� �޿� �հ踦 ���ϰ� �� ������ �޿��� �ش� �а��� �޿� �հ迡�� �����ϴ� ������ ����ϼ���.
select deptno, name, pay, sum(pay) over(partition by deptno) total_deptno, round(pay/sum(pay) over(partition by deptno) * 100, 2) from professor;

