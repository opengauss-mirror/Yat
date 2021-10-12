--  @testpoint:openGauss关键字barrier(非保留)同时作为表名和列名带引号,并使用该列结合limit排序,barrier列的值按字母大小排序且只显示前2条数据
--创建表
drop table if exists "barrier";
create table "barrier"(
	c_id int, c_int int, c_integer integer, c_bool int, c_boolean int, c_bigint integer,
	c_real real, c_double real,
	c_decimal decimal(38), c_number number(38), c_numeric numeric(38),
	c_char char(50) default null, c_varchar varchar(20), c_varchar2 varchar2(4000),
	c_date date, c_datetime date, c_timestamp timestamp,
	"barrier" varchar(100) default 'barrier'
)
PARTITION BY RANGE (c_integer)
(
	partition P_max values less than (maxvalue)
);

--清除表数据
delete from "barrier";

--向保重插入数据
insert into "barrier"(c_id,"barrier") values(1,'hello');
insert into "barrier"(c_id,"barrier") values(2,'china');
insert into "barrier"(c_id,"barrier") values(3,'gauss');

--查看表内容
select "barrier" from "barrier" where "barrier"!='hello' order by "barrier" limit 2 ;

--清除环境
drop table "barrier";
