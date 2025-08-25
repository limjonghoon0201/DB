--3�� �������Լ� ��������
--1) emp ���̺��� ����Ͽ� ��� �߿��� �޿�(sal)�� ���ʽ�(comm)�� ��ģ �ݾ��� ���� ���� ���� ���� ���� ���, ��ձݾ��� ���ϼ���.
--��, ���ʽ��� ���� ���� ���ʽ��� 0 ���� ����ϰ� ��� �ݾ��� ��� �Ҽ��� ù° �ڸ������� ������ �ϼ���.
select * from emp;

--2) student ���̺��� birthday Į���� �����ؼ� �Ʒ��� ���� ������ ���� �ڼ��� ����ϼ���.


--3) Student ���̺��� tel Į���� �����Ͽ� �Ʒ��� ���� ������ �ο����� ����ϼ���.
--��, 02-SEOUL, 031-GYEONGGI, 051-BUSAN, 052-ULSAN, 053-DAEGU, 055-GYEONGNAM���� ����ϼ���.


--4) ���� emp ���̺� �Ʒ��� �ΰ��� �����͸� �Է��Ͻ� �� �۾��ϼ���.
--Emp ���̺��� ����Ͽ� �Ʒ��� ȭ��� ���� �μ����� ���޺��� �޿� �հ� ����� ����ϼ���.


--5) emp ���̺��� ����Ͽ� �������� �޿��� ��ü �޿��� ���� �޿� �ݾ��� �Ʒ��� ������ ����ϼ���.
-- ��, �޿��� ������������ �����ؼ� ����ϼ���.


--6) fruit ���̺��� �Ʒ��� ���� ���·� ����ϼ���.



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



--15) professor ���̺��� ��ȸ�Ͽ� �а� ��ȣ, ������, �޿�, �а��� �޿� �հ踦 ���ϰ� �� ������ �޿��� �ش� �а��� �޿� �հ迡�� �����ϴ� ������ ����ϼ���.

