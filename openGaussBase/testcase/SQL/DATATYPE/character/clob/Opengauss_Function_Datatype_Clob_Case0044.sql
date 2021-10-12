--  @testpoint: --clob：建行存分区表后alter增加clob数据类型
drop table if exists test_clob_044 cascade;
create table test_clob_044(id int)
PARTITION BY RANGE(id)(
        PARTITION P1 VALUES LESS THAN(100),
        PARTITION P2 VALUES LESS THAN(1000),
        PARTITION P3 VALUES LESS THAN(MAXVALUE));
alter table test_clob_044 add column name clob;
--查询字段信息
SELECT col_description(a.attrelid,a.attnum) as comment,format_type(a.atttypid,a.atttypmod) as type,a.attname as name, a.attnotnull as notnull
FROM pg_class as c,pg_attribute as a
where c.relname = 'test_clob_044' and a.attrelid = c.oid and a.attnum>0;

--清理数据
drop table if exists test_clob_044;