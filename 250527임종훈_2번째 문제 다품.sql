--2�� ������ �Լ� ��������
1. emp ���̺��� ����Ͽ� deptno�� 10 ���� ������� ����̸��� �� 9 ����Ʈ�� ����ϵ� �� �ڸ����� �ش� �ڸ��� ���ڷ� ä�켼��.
select lpad(ename,9,'123456789') from emp where deptno = 10;

2. emp ���̺��� �Ʒ��� ���� deptno �� 10���� ������� ename �� 10�ڸ��� ����ϵ� ������ ���ڸ����� ��-�� �� ä�켼��.
select rpad(ename,10,'-') from emp where deptno = 10;

3. emp���̺��� deptno�� 10���� ������� �̸��� �� 9�ڸ��� ����ϵ� ������ ���ڸ��� �ش� �ڸ����� �ش��ϴ� ���ڰ� ��µǵ��� ���
select rpad(ename,9,substr('123456789',lengthb(ename)+1)) from emp where deptno = 10;

4. emp���̺��� �ƶ�� ���� 20�� �μ��� �Ҽӵ� �������� �̸��� 2~3��° ���ڸ� '-'���� �����ؼ� ����ϼ���.
select ename, replace(ename, substr(ename,2,2),'--') from emp where deptno=20;

5. student���̺��� ����1(deptno1)dl 101���� �л����� �̸��� �ֹε�Ϲ�ȣ�� ����ϵ� �ֹε�Ϲ�ȣ�� �� 7�ڸ��� '-/'�� ǥ�õǵ��� ����ϼ���.
select name, jumin, replace(jumin, substr(jumin,7,7),'-/-/-/-') from student where deptno1 = 101;

6. student ���̺��� ����1�� 102���� �л����� �̸��� ��ȭ��ȣ, ��ȣ��ȣ���� ���� �κи� '*'ó���Ͽ� ����ϼ���.
   ��, ��� ������ 3�ڸ��� �����մϴ�. ** REPLACE ���� 3 ** 
select * from student;
select name, tel, replace(tel,substr(tel,1,3),'***') from student where deptno1 = 102;

7. student ���̺��� deptno1�� 101���� �а� �л����� �̸��� ��ȭ��ȣ�� ��ȭ��ȣ���� ������ȣ�� ������ ������ ������ ��ȣ�� *�� ǥ���ؼ� ����ϼ���. ** REPLACE ���� 4 
select name, tel, replace(tel, substr(tel,9,4),'****') from student where deptno1 = 101;

8. Student ���̺��� birthday �÷��� ����Ͽ� ������ 1���� �л��� �̸��� birthday �� �Ʒ� ȭ��� ���� ����ϼ���.
select birthday from student where substr(birthday,4,2) = '01';


9. emp ���̺��� hiredate �÷��� ����Ͽ� �Ի����� 1,2,3 ���� ������� ����� �̸�, �Ի����� ����ϼ���.
select ename, hiredate from emp where substr(hiredate,4,2) in ('01','02','03');

10. emp ���̺��� ��ȸ�Ͽ� �̸��� 'ALLEN' �� ����� ����� �̸��� ������ ����ϼ���. �� ������ (sal * 12)+comm �� ����ϰ�, ������ õ ���� ���б�ȣ�� ǥ���ϼ���.
select ename, to_char((sal*12)+ comm, '999,999') from emp where ename = 'ALLEN';

11. professor ���̺��� ��ȸ�Ͽ� 201 �� �а��� �ٹ��ϴ� �������� �̸��� �޿�, ���ʽ�, ������ �Ʒ��� ���� ����ϼ���. 
    �� ������ (pay*12)+bonus �� ����ϰ� õ ���� ���б�ȣ�� ǥ���մϴ�.
select * from professor;
select name, pay, bonus, to_char((pay*12)+bonus,'999,999') from professor where deptno = 101;

12. emp ���̺��� ��ȸ�Ͽ� comm ���� ������ �ִ� ������� empno , ename , hiredate , �ѿ���,15% �λ� �� ������ �Ʒ� ȭ��ó�� ����ϼ���.
    �� �ѿ����� (sal*12)+comm ���� ����ϰ� �Ʒ� ȭ�鿡���� SAL �� ��µǾ����� 15% �λ��� ���� �ѿ����� 15% �λ� ���Դϴ�.(HIREDATE �÷��� ��¥ ���İ� SAL �÷� , 15% UP �÷��� $ ǥ�ÿ� , ��ȣ ������ �ϼ���)
select empno, ename, to_char(hiredate,'yyyy-mm-dd') HIREDATE, to_char((sal*12)+comm,'$999,999') "SAL", to_char(((sal*12)+comm)*1.15,'$999,999') "15% up" from emp where comm is not null;

13. Professor ���̺��� 201�� �а� �������� �̸��� �޿�, bonus,�� ������ ����ϼ���.��, ������(PAY*12+bonus)�� ����ϰ� bonus�� ���� ������ 0���� ����ϼ���.
select * from professor;
select name, pay, bonus, to_char((pay*12)+nvl(bonus,0),'999,999') from professor where deptno=201;

14. emp ���̺��� deptno �� 30�� �� ������� empno , ename , sal , comm ���� ����ϵ� ���� comm ���� null �� �ƴϸ� sal+comm ���� ����ϰ�, comm ���� null �̸� sal*0 �� ���� ����ϼ���.
select empno, ename, sal, comm, nvl2(comm, comm+sal, sal*0) from emp where deptno=30;
select empno, ename, sal, comm, nvl(comm+sal, sal*0) from emp where deptno=30;

15. EMP ���̺��� deptno�� 30���� ������� ��ȸ���� comm���� ���� ��� 'Exist'�� ����ϰ� comm���� null�� ��� 'NULL'�� ����ϼ���.
select nvl2(comm,'Exist','Null') from emp where deptno=30;

16. professor ���̺��� �а���ȣ�� ������, �а����� ����ϵ� deptno �� 101 ���� ������ �а����� "Computer Engineering" ���� ����ϰ�, 101���� �ƴ� �������� �а��� �ƹ��͵� ������� ������.
select * from professor;
select deptno, name, decode(deptno,101,'Computer Engineering') from professor;

17. Professor ���̺��� deptno�� name�� dname�� ����ϵ� dname�� �а� ��ȣ�� 101 �� �̸� ��Computer Engineering�� , 102 ���̸� 'Multimedia Engineering' , 103 ���̸� 'Software Engineering' �������� 'ETC' �� ����ϼ���.
select deptno, name, decode(deptno,101,'Computer Engineering', 102, 'Multimedia Engineering', 103, 'Software Engineering', 'ETC') from professor;

18. Student ���̺��� �����Ͽ� deptno1 �� 201 ���� �л��� �̸��� ��ȭ��ȣ, ���� ���� ����ϼ���. �� ������ȣ�� 02 �� "SEOUL", 031 �̸� "GYEONGGI", 051 �̸� "BUSAN", 052 �̸� "ULSAN", 055 �̸� "GYEONGNAM", �������� "ETC" �� ǥ���ϼ���.
select * from student;
select name, tel, case substr(tel,1,instr(tel,')')-1)
    when '02' then 'SEOUL' 
    when '031' then 'GYEONGGI' 
    when '051' then 'BUSAN' 
    when '052' then 'ULSAN' 
    when '055' then 'GYEONGNAM' 
    else 'ETC' end "LOC"
from student where deptno1=201;

19. Student ���̺��� jumin �÷��� �����Ͽ� �л����� �̸��� �¾ �� , �׸��� �б⸦ ����ϼ���. �¾ ���� 01-03�� �� 1/4, 04 ? 06�� �� 2/4 , 07 ? 09 �� �� 3/4 , 10 ? 12 ���� 4/4 �� ����ϼ���.
select * from student;
select name, substr(jumin,4,2),case 
    when substr(jumin,4,2) in ('01','02','03') then '1/4'
    when substr(jumin,4,2) in ('04','05','06') then '2/4'
    when substr(jumin,4,2) in ('07','08','09') then '3/4'
    else '4/4' end "�б�"
from student;

20. emp ���̺��� ��ȸ�Ͽ� empno , ename , sal , LEVEL(�޿����)�� �Ʒ��� ���� ����ϼ���. �� �޿������ sal �� �������� 1 - 1000 �̸� Level 1 , 1001 - 2000 �̸� Level 2 , 2001 - 3000 �̸� Level 3 , 3001 - 4000 �̸� Level 4 , 4001 ���� ������ Level 5 �� ����ϼ���.
select empno, ename, sal, case
    when sal between 1 and 1000 then 'Level 1'
    when sal between 1001 and 2000 then 'Level 2'
    when sal between 2001 and 3000 then 'Level 3'
    when sal between 3001 and 4000 then 'Level 4'
    else 'Level 5' end as "LEVEL(�޿����)"
from emp;
