--  @testpoint:调用函数，对于非重载的函数，参数列表包含出参，出参传入null
drop FUNCTION if EXISTS func_increment_sql005(num1 IN integer, num2 IN integer, res OUT integer);
--创建带出参的函数
CREATE FUNCTION func_increment_sql005(num1 IN integer, num2 IN integer, res OUT integer)
RETURN integer
AS
BEGIN
res := num1 + num2;
END;
/
--查询func_increment_sql005为非重载的函数
select proname from pg_proc where proname='func_increment_sql005';
--出参传入变量
CALL func_increment_sql005(1,999,null);
drop FUNCTION func_increment_sql005;