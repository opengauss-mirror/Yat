--  @testpoint: where:where+unique强制一个表的某个子集的唯一性

DROP TABLE if EXISTS test_index_table_105 CASCADE;
create table test_index_table_105(
c_float1 float,
c_int int,
c_varchar varchar,
c_text text
) WITH (ORIENTATION = row) ;

begin
    for i in 0..1000 loop
        insert into test_index_table_101 values(i,i);
    end loop;
end;
/

--建索引
drop index if exists index_105_01;
create unique index index_105_01 on test_index_table_105(c_float1) where  c_float1 >0;
select relname from pg_class where relname like 'index_105_%' order by relname;

--清理环境
DROP TABLE if EXISTS test_index_table_105 CASCADE;