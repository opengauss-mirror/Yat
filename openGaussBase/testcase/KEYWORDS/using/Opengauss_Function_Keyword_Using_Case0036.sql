-- @testpoint: 对分区表创建指定索引


drop table if exists using_test_02 cascade;
create table using_test_02(id int,c_int int,c_vchar varchar(100),c_blob text,c_date date)
partition by range (c_int)
(partition t101_1 values less than (10),
partition t101_2 values less than (20),
partition t101_3 values less than (40),
partition t101_4 values less than (maxvalue)
);

create index idx_using_test_04 on using_test_02(c_int,c_vchar) local;
create index idx_using_test_05 on using_test_02(c_int,c_vchar,c_date) local;
create index idx_using_test_06 on using_test_02 using btree(c_vchar) local;
drop index idx_using_test_04,idx_using_test_05,idx_using_test_06;
drop table if exists using_test_02 cascade;

