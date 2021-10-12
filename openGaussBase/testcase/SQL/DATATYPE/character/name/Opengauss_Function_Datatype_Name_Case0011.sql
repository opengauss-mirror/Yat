-- @testpoint: 创建行存分区表，分区字段设为name
-- @modified at: 2020-11-13

drop table if exists name_12;
CREATE TABLE name_12 (c1 clob,c2 int) WITH (orientation=row, compression=no)
PARTITION BY RANGE (c1)
(
        PARTITION P1 VALUES LESS THAN('g'),
        PARTITION P2 VALUES LESS THAN('n'),
        PARTITION P3 VALUES LESS THAN('q'),
        PARTITION P4 VALUES LESS THAN('t'),
        PARTITION P5 VALUES LESS THAN('z')
);
insert into name_12 values ('i',1);
select * from name_12;
drop table name_12;