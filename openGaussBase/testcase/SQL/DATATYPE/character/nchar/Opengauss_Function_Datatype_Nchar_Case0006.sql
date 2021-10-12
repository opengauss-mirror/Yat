-- @testpoint: 插入超出范围值，字节长度设定为8000，合理报错

DECLARE
  V_C nchar(8001);
BEGIN
  DROP TABLE IF EXISTS test_nchar_06;
  CREATE TABLE test_nchar_06 (stringv nchar(8000));
  FOR I IN 1 .. 8001 LOOP
    V_C := V_C || 'x';
  END LOOP;
  insert into test_nchar_06 values (V_C);
END;
/

