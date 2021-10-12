-- @testpoint: 创建存储过程并测试execute immediate 执行动态查询

drop table if exists  user_tables;
create table user_tables(
table_id int,
table_name varchar2(10));

insert into user_tables values(1,'t_cust');
insert into user_tables values(1,'t_user');

drop table if exists t_cust;
create table t_cust(
  month_id varchar2(6),
  id int,
  name varchar2(200),
  begin_date date,
  sal number
);

drop table if exists t_user;
create table t_user(
  id int,
  name varchar2(200),
  begin_date date,
  sal number
);

create or replace procedure pro1(v_month int) is
  v_id int;
begin
  execute immediate 'select 1 from user_tables where table_name in(''t_cust'',''t_user'')
   group by table_name having table_name=''t_cust'' limit 1'
      into v_id;
    raise notice '%',v_id;
  declare
    v_num int;
  begin
    execute immediate 'select count(1) from user_tables where table_name in(''t_cust'',''t_user'')
    group by table_name limit 1' into v_num;
    raise notice '%',v_num;
  end;
end;
/

begin
   pro1(2);
end;
/

drop table t_cust;
drop table t_user;
drop procedure pro1;
drop table if exists  user_tables;