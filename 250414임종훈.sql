select * from emp;
--�Է°��� ù ���ڸ� �빮�ڷ� ��ȯ
select ename, initcap(ename) "INITCAR" from emp where deptno=10;
--�ҹ���, �빮�� ��ȯ
select ename, lower(ename) "LOWER", upper(ename) "UPPER" from emp where deptno=10;
--����
select ename, length(ename), lengthb(ename) from emp where deptno=20;
select 'ȫ�浿', length('ȫ�浿'), lengthb('ȫ�浿') from dual;
--���� ����
select substr('abcde',3,2) "3,2", substr('abcde',-3,2), substr('abcde',-3,4) from dual;
--student���̺��� jumin�÷��� ����ؼ� 1������ 101���� �л����� �̸��� �¾ ����,����, �Ϸ� �� ��¥�� ����ϼ���(050413-3111111)
select * from student;
select name, substr(jumin,3,4)-1 "Birthday-1" from student where deptno1=101;
--'-'�� 3��° ������ ��ġ
select 'A-B-C-D', instr('A-B-C-D','-',1,3) "INSTR" from dual;
--student ���̺��� 1������ 101���� �л����� tel�÷��� ��ȸ�Ͽ� 3�� ù��°�� ������ ��ġ�� �̸��� ��ȭ��ȣ�� �Բ� ���
select name, tel, instr(tel,'3'), profno from student where deptno1=101;
--INSTR:Ư������ ��ġ ����
select 'A-B-C-D', instr('A-B-C-D','-',1,3) "INTSTR" from dual;
select name, tel, instr(tel,'3'), profno from student where deptno1 = 101;
--LPAD:���ʿ� Ư�� ���� ä��
select name, id, lpad(id, 10, '*') from student where deptno1 = 201;
select name, id, lpad(id, 10, '123456') from student where deptno1 = 201;
select lpad(ename, 9, '123456789') from emp where deptno = 10;
--RPAD:�����ʿ� Ư�� ���� ä��
select name, id, rpad(id, 10, '*') from student where deptno1 = 201;
select rpad(ename, 10, '-') from emp where deptno = 10;
select rpad(ename, 9, substr('123456789',lengthb(ename)+1)) from emp where deptno = 10;
select rpad(ename, 9, '123456789') from emp where deptno = 10;
--LTRIM:�־��� ���ڿ����� ���� ���� ����
select ename from emp where deptno=10;
select ltrim(ename,'C') from emp where deptno=10;
--RTRIM:�־��� ���ڿ����� ������ ���� ����
select rtrim(ename,'R') from emp where deptno=10;
--REPLACE:A�� B�� ��ȯ
select ename, replace(ename,substr(ename,1,2), '**') from emp where deptno = 10;
select ename ,replace(ename,substr(ename,2,2), '--') from emp where deptno = 20;
select name, jumin, replace(jumin, substr(jumin,7,13), '-/-/-/-/') from student where deptno1 = 101;