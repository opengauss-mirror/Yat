-- @testpoint: 创建行存分区表,合理报错

drop table if exists test_uuid_11;
create table test_uuid_11 (c1 uuid,c2 int) with(orientation=row, compression=no)
PARTITION BY RANGE (c1)
(
        PARTITION P4 VALUES LESS THAN('zzzzzzzz-zzzz-zzzz-zzzz-zzzzzzzzzzzz'),
        PARTITION P5 VALUES LESS THAN(MAXVALUE)
);
