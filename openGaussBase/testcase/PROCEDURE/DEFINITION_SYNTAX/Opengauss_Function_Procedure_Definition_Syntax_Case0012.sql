-- @testpoint: 存储过程声明语法 定义变量 NUMBER(10,4)

--创建存储过程
CREATE OR REPLACE PROCEDURE Proc_Syntax_012()
IS
DECLARE
emp_id  NUMBER(10,4) := 123456.1235;
begin
emp_id := 123456.1235+1;
raise info ':%',emp_id;
end;
/

--调用存储过程
call Proc_Syntax_012();

--清理环境
DROP PROCEDURE Proc_Syntax_012;