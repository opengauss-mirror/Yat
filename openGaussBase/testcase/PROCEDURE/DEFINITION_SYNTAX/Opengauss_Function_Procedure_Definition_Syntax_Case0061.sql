-- @testpoint: 存储过程中,select into语句中给int数据类型赋值,截取到int类型下边界，合理报错

declare
  v_int int;
begin
     raise info 'result:% ',v_int;
end;