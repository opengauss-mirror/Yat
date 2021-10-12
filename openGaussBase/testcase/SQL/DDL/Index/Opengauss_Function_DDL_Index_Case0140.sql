--  @testpoint:RENAME PARTITION：修改索引名称64位

--建普通表
DROP TABLE if EXISTS test_index_table_140 CASCADE;
create table test_index_table_140(
c_int int
) WITH (ORIENTATION = column) partition by range(c_int)(
partition p1 values less than (100),
partition p2 values less than (1000),
partition p3 values less than (5000),
partition p4 values less than (10001)
);


--建索引
drop index if exists index_140_01;
create index index_140_01 on test_index_table_140(c_int) local (PARTITION p1,PARTITION p2,PARTITION p3,PARTITION p4);
select relname from pg_class where relname like 'index_140_%' order by relname;

--rename
select relname from PG_PARTITION where parentid=(select relfilenode from pg_class where relname='index_140_01') order by relname asc;
select relname from PG_PARTITION where parentid=(select relfilenode from pg_class where relname='index_140_01') order by relname asc;
select relname from PG_PARTITION where parentid=(select relfilenode from pg_class where relname='index_140_01') order by relname asc;

--清理环境
DROP TABLE if EXISTS test_index_table_140 CASCADE;