-- @testpoint: 自定义函数CLOB数据类型的测试——CLOB类型作为自定义函数的变量

--创建自定义函数
create or replace function FVT_FUNC_CLOB_005(P1 IN VARCHAR2) return int
is
V_LANG CLOB:='字符串&*%￥14587';
V_size int;
begin
  FOR I IN 1 .. 10 LOOP
    V_LANG := V_LANG || P1;
  END LOOP;
    raise info 'v2=%',V_LANG;
    return V_size;
  EXCEPTION
  WHEN NO_DATA_FOUND
  THEN
raise info 'NO_DATA_FOUND';
end;
/
--调用存储过程
select  FVT_FUNC_CLOB_005('a');

--恢复环境
DROP function if exists FVT_FUNC_CLOB_005;
