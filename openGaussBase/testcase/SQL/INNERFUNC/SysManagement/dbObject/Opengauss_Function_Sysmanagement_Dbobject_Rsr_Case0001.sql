-- @testpoint: pg_relation_size(relation regclass)接受一个表、索引、压缩表的OID或者名称，然后返回它们的字节大小。


-- 表、索引
create table test (a int)
with(orientation = column)
partition by range (a)
(
        partition test_p1 values less than (88),
        partition test_p2 values less than (99)
);
create index test_index on test (a) local;

insert into test values (59);
insert into test values (90);

select pg_relation_size(a.oid) from pg_class a where a.relname='test';
select pg_relation_size(b.oid) from pg_class b where b.relname='test_index';
select pg_relation_size('test');
select pg_relation_size('test_index');
drop table test;

-- 压缩表
CREATE TABLE test
 (
     sk            INTEGER               NOT NULL,
     id            CHAR(16)              NOT NULL,
     name          VARCHAR(20)                   ,
     grade              DECIMAL(5,2)
 ) WITH (ORIENTATION = COLUMN, COMPRESSION=HIGH);
insert into test values(10,'kk','mmmm','5.21');
select pg_relation_size(a.oid) from pg_class a where a.relname='test';
select pg_relation_size('test');
drop table test;