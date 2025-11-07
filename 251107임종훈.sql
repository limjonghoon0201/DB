--144p
--테이블 복사하기
---------------------------
create table dept3
as
select * from dept2;

select * from dept3;
---------------------------
create table dept4
as
select dcode, dname from dept2;

select * from dept4;
---------------------------
create table dept5
as
select * from dept2 where dcode=1002;

select * from dept5;
---------------------------
create table dept6
as
select dcode, dname from dept2 where dcode in(1000,1001,1002);

select * from dept6;
---------------------------
create table dept7
as
select * from dept2 where 1=2;

select * from dept7;
---------------------------
alter table dept6
add(loacation varchar2(10));

select * from dept6;
---------------------------
alter table dept6
add(location2 varchar2(10) default 'SEOUL');

select * from dept6;
---------------------------
