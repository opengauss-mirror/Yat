-- @testpoint: BINARY类型的测试———RAW输入整数类型

--创建自定义函数
create or replace function FVT_FUNC_BINARY_023(P1 RAW) return RAW
is
V1 RAW(200);
begin
    V1:=P1;
    return V1;
    EXCEPTION
WHEN NO_DATA_FOUND THEN raise info 'NO_DATA_FOUND';
end;
/

--调用自定义函数-int
select FVT_FUNC_BINARY_023('0012200');

--恢复环境
drop function if exists FVT_FUNC_BINARY_023;

