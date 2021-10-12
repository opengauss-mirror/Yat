-- @testpoint:  create index:table_name：列存local临时表的index：success
--删表
drop table if exists test_index_table_016 cascade;
create local TEMPORARY table test_index_table_016(id int) WITH (ORIENTATION = column);
--插入数据
BEGIN
  for i in 1..10000 LOOP
    insert into test_index_table_016 values(i);
  end LOOP;
end;
/
explain select * from test_index_table_016 where id = 1;
--创建索引
drop index if exists index_016;
create index index_016 on test_index_table_016(id);
explain select * from test_index_table_016 where id = 1;
select relname from pg_class where relname='index_016';
--清理数据
drop index if exists index_016;
drop table if exists test_index_table_016 cascade;