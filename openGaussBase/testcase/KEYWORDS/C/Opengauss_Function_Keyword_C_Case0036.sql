-- @testpoint: 定义表名和列名为C
drop table if exists C;
create  table C(
	c_id int, c_int int, c_integer integer, c_bool int, c_boolean int, c_bigint integer,
	c_real real, c_double real,
	c_decimal decimal(38), c_number number(38), c_numeric numeric(38),
	c_char char(50) default null, c_varchar varchar(20), c_varchar2 varchar2(4000),
	c_dCe date, c_dCetime date, c_timestamp timestamp,
	C text  default 'gauss'
);

insert into C (c_id,C) values(1,'123');
select * from C;
drop table if exists C;