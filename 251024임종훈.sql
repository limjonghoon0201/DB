create table new_table (no number(3), name varchar2(10), birth date);
desc new_table;
select * from new_table;

create table tt02 (no number(3,1) default 0, name varchar2(10) default 'No Name', hiredate date default sysdate);
insert into tt02 (no) values(1);
select * from tt02;

create table �ѱ����̺� (�÷�1 number, �÷�2 varchar2(10), �÷�3 date);
select * from �ѱ����̺�;

select * from dept2;
create table dept3 as select * from dept2;
select * from dept3;

create table dept4 as select dcode, dname from dept2;
select * from dept4;

create table dept5 as select * from dept2 where 1=2;
select * from dept5;

create table dept6 as select dcode, dname from dept2 where dcode in(1000,1001,1002);
select * from dept6;
