-- @testpoint: 匿名块定义函数

declare
sqlstr varchar(1024);
begin
sqlstr := 'select round(4,4)';
execute immediate sqlstr;
end;
/
