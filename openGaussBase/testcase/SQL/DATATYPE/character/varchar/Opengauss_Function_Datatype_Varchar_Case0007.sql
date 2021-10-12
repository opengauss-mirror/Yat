-- @testpoint: 插入超出范围正常值，字节长度设定为8000，合理报错


DECLARE
  V_C varchar(8001);
BEGIN
  drop table if exists test_varchar_07;
  create table test_varchar_07 (name varchar(8000));
  FOR I IN 1 .. 8001 LOOP
    V_C := V_C || 'q';
  END LOOP;
  insert into test_varchar_07 values (V_C);
END;
/
