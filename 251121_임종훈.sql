create table t_readonly (no number, name varchar2(10));
truncate TABLE t_readonly;
select * from t_readonly;

alter table t_readonly read only;
insert into t_readonly values(111,'AAA');
alter table t_readonly read write;

create table vt1(
    col1 number,
    col2 number,
    col3 number generated always as (col1 + col2));
    
insert into vt1 (col1, col2) values(1,2);

select * from vt1;

update vt1 set col1=5;

alter table vt1 add(col4 generated always as ((col1*12)+12));

select column_name, data_type, data_default from user_tab_columns where table_name = 'VT1' order by column_id;