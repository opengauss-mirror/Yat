-- @testpoint: 创建存储过程时带immutable参数

drop table if exists proc_localtemptab_t_005;
create table  proc_localtemptab_t_005(id  int,name varchar(100),ctime date);
insert into proc_localtemptab_t_005 values (1,'proc_localtemptab_t_005','2020-11-24 16:10:28');

--不带immutable创建存储过程
create or replace procedure test_proc_using_005(str boolean)  as
begin
    insert into proc_localtemptab_t_005 values (1,'proc_localtemptab_t_005','2020-11-24 16:10:28');
end;
/
--调用存储过程
call test_proc_using_005(1);

--查看表结构
select * from proc_localtemptab_t_005;

--清理环境
drop procedure test_proc_using_005;
drop table proc_localtemptab_t_005;

--带immutable 参数时创建存储过程
create or replace procedure test_proc_using_005(a int) immutable as
declare
  v_lang clob := '你好';
begin
  for i in 1 .. 2
  loop
    v_lang := v_lang || '你也好';
  end loop;
    raise notice '%',v_lang;
end;
/
--调用存储过程
call test_proc_using_005(1);
--清理环境
drop procedure test_proc_using_005;



