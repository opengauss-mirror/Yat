-- @testpoint: 创建存储过程时带 cost 参数，用来估计函数的执行成本，取值范围正数

--创建存储过程，带cost 参数，估计函数执行成本为0.00002
create table test_emp_001(name varchar(10));
create or replace procedure test_proc_using_016() cost 0.00002 as
  v_sql varchar2(2000);
begin
    v_sql := 'insert into test_emp_001 values (:v1)';
    execute immediate v_sql using  'kimy';
end;
/
--调用存储过程
call test_proc_using_016();

--查看表结构
select * from test_emp_001;

--清理环境
drop procedure test_proc_using_016;
drop table test_emp_001;