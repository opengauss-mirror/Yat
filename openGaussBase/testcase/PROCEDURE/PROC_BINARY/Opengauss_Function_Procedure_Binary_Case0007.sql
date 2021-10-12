-- @testpoint: 存储过程结合二进制类型的测试 raw输入非二进制类型-int，合理报错

--创建存储过程
create or replace procedure proc_binary_007(p1 raw) is
begin
raise info 'p1=:%',p1;
    exception
when no_data_found then
    raise info 'no_data_found';
end;
/

--调用存储过程-int
call proc_binary_007(245);

--恢复环境
drop procedure if exists proc_binary_007;

