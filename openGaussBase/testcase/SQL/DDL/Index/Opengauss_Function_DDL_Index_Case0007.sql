-- @testpoint:  create index：存在的模式名：success
--建模式
drop schema if exists testschema cascade;
create schema testschema;
drop table if exists testschema.test_index_schema_01 cascade;
create table testschema.test_index_schema_01(id int);
--插入数据
BEGIN
  for i in 1..10000 LOOP
    insert into testschema.test_index_schema_01 values(i);
  end LOOP;
end;
/
explain select * from testschema.test_index_schema_01 where id = 1;
--建索引
drop index if exists testschema.schema_index_01;
create index testschema.schema_index_01 on testschema.test_index_schema_01(id);
explain select * from testschema.test_index_schema_01 where id = 1;
--清理数据
drop index testschema.schema_index_01;
drop table if exists testschema.test_index_schema_01 cascade;
drop schema if exists testschema cascade;