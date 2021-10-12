-- @testpoint: interval分区,分区方式partition_less_than_item的语法校验，合理报错
drop table if exists partition_table_001;

-- 未遵循：每个分区都需要指定一个上边界。
create table partition_table_001(
col_1 smallint check (col_1 > 0),
col_2 char(30) default 'hey boy',
col_3 int,
col_4 date primary key,
col_5 boolean,
col_6 nchar(30),
col_7 float
)partition by range (col_4)
interval ('1 year')
(
	partition partition_p1 values less than ('2018-01-01'),
	partition partition_p2 values less than ('2018-01-01'),
	partition partition_p3 values less than ('2018-01-01')
);

-- 未遵循：分区上边界的类型应当和分区键的类型一致。
create table partition_table_001(
col_1 smallint check (col_1 > 0),
col_2 char(30) default 'hey boy',
col_3 int,
col_4 date primary key,
col_5 boolean,
col_6 nchar(30),
col_7 float
)partition by range (col_4)
interval ('1 year')
(
	partition partition_p1 values less than ('yo man'),
	partition partition_p2 values less than ('@#$'),
	partition partition_p3 values less than ('2020-01-01')
);

-- 未遵循：分区列表是按照分区上边界升序排列的，值较小的分区位于值较大的分区之前。
create table partition_table_001(
col_1 smallint check (col_1 > 0),
col_2 char(30) default 'hey boy',
col_3 int,
col_4 date primary key,
col_5 boolean,
col_6 nchar(30),
col_7 float
)partition by range (col_4)
interval ('1 year')
(
	partition partition_p1 values less than ('2021-01-01'),
	partition partition_p2 values less than ('2019-01-01'),
	partition partition_p3 values less than ('2023-01-01')
);
