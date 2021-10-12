-- @testpoint: RENAME PARTITION：修改索引分区名称为索引同义词名称

--建普通表
DROP TABLE if EXISTS test_index_table_143 CASCADE;
create table test_index_table_143(
c_int int
) WITH (ORIENTATION = row) partition by range(c_int)(
partition p1 values less than (100),
partition p2 values less than (1000),
partition p3 values less than (5000),
partition p4 values less than (10001)
);

--建索引
drop index if exists index_143_01;
create index index_143_01 on test_index_table_143(c_int) local (PARTITION p1,PARTITION p2,PARTITION p3,PARTITION p4);
select relname from pg_class where relname like 'index_143_%' order by relname;

--建同义词
drop synonym if exists syn_index_143_01;
create synonym  syn_index_143_01 for index_143_01;

--通过同义词rename
select relname from PG_PARTITION where parentid=(select relfilenode from pg_class where relname='index_143_01') order by relname asc;
ALTER INDEX if exists index_143_01 RENAME PARTITION p1 TO syn_index_143_01;
select relname from PG_PARTITION where parentid=(select relfilenode from pg_class where relname='index_143_01') order by relname asc;

--清理环境
drop synonym if exists syn_index_143_01;
DROP TABLE if EXISTS test_index_table_143 CASCADE;
