-- @testpoint: 插入正常值，字节长度设定为9999
-- @modified at: 2020-11-16

DECLARE
  V_C nvarchar2(9999);
BEGIN
  drop table if exists test_nvarchar2_04;
  create table test_nvarchar2_04 (name nvarchar2(9999));
  FOR I IN 1 .. 9999 LOOP
    V_C := V_C || 'q';
  END LOOP;
  insert into test_nvarchar2_04 values (V_C);
END;
/
select * from test_nvarchar2_04;
drop table test_nvarchar2_04;