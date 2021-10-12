--  @testpoint:openGauss保留关键字left同时作为表名和列名带引号,并使用该列结合limit排序,left列的值按字母大小排序且只显示前2条数据
drop table if exists "left";
create table "left"(
	c_id int, c_int int, c_integer integer, c_bool int, c_boolean int, c_bigint integer,
	c_real real, c_double real,
	c_decimal decimal(38), c_number number(38), c_numeric numeric(38),
	c_char char(50) default null, c_varchar varchar(20), c_varchar2 varchar2(4000),
	c_date date, c_datetime date, c_timestamp timestamp,
	"left" varchar(100) default 'left'
)
PARTITION BY RANGE (c_integer)
(
	partition P_max values less than (maxvalue)
);

--清理表数据
delete from "left";

--插入数据
insert into "left"(c_id,"left") values(1,'hello');
insert into "left"(c_id,"left") values(2,'china');
insert into "left"(c_id,"left") values(3,'gauss');

--查看表数据
select "left" from "left" where "left"!='hello' order by "left" limit 2 ;

--清理环境
drop table "left";