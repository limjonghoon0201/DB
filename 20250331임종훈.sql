--�����ͱ���
desc emp;
select * from emp;
select ename,job from emp;
--���̺���
desc professor;
select * from professor;
select name from professor;
select name,'good morning~~!' "�λ�" from professor;
select dname,'it''s deptno:', deptno "DNAME AND DEPTNO" from dept;
select dname,'it''s deptno:'|| deptno "DNAME AND DEPTNO" from dept;
select dname, q'[, it's deptno : ]' , deptno " DNAME AND DEPTNO" from dept;
select profno "������ ��ȣ", name �̸�,pay as "�޿�" from professor;

