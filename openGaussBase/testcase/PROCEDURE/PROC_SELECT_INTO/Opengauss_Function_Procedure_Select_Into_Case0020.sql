-- @testpoint: 测试select into语句中给int数据类型赋值，测试real隐式转换为bigint 合理报错

declare
   v_real real;
   v_bigint bigint;
begin
    select v_real into v_bigint from sys_dummy;
    raise info 'result:% ',v_bigint;
end;
/