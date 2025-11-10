create table dept7
as
select * from dept2;

select * from dept7;

desc dept7;
------------------컬럼명추가
alter table dept7
add(location varchar2(10));
------------------컬럼명변경
alter table dept7 rename column location to loc;

select * from dept7;
------------------테이블명변경
rename dept7 to dept6;
rename dept6 to dept7;
------------------구조변경
desc dept7;
alter table dept7 modify(loc varchar(20));
desc dept7;
------------------컬럼삭제
alter table dept7 drop column location;
desc dept7;
------------------컬럼참조
alter table dept7 drop column location cascade constraints;
desc dept7;
------------------모든 데이터를 빠르게 삭제함. 구조는 남아있음.
create table dept6
as
select * from dept7;

select * from dept6;

truncate table dept6;
------------------데이터와 구조를 모두 삭제함
select * from dept7;
drop table dept7;