-- @testpoint: 验证匿名块内变量支持带引号及是否区分大小写 合理报错

declare
	a number;
	a number;
begin
	a := 1;
	a := 1;
	raise info ':%',a-a;
end;
/

