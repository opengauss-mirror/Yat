--  @testpoint:openGauss保留关键字trailing同时作为表名和列名带引号，与union结合查询合并两个SELECT 语句查询
drop table if exists "trailing";
create table "trailing"(
	c_id int, c_int int, c_integer integer, c_bool int, c_boolean int, c_bigint integer,
	c_real real, c_double real,
	c_decimal decimal(38), c_number number(38), c_numeric numeric(38),
	c_char char(50) default null, c_varchar varchar(20), c_varchar2 varchar2(4000),
	c_date date, c_datetime date, c_timestamp timestamp,
	"trailing" varchar(100) default 'trailing'
)
PARTITION BY RANGE (c_integer)
(
	partition P_max values less than (maxvalue)
);

insert into "trailing"(c_id,"trailing") values(1,'hello');
insert into "trailing"(c_id,"trailing") values(2,'china');
insert into "trailing"(c_id,"trailing") values(3,'gauss');
---两个select语句合并查询，查询结果显示hello、china、gauss，对括号中的select子句取limit 2
select "trailing" from "trailing" where "trailing"='hello'
union all (select "trailing" from "trailing" where "trailing"!='hello' order by "trailing" limit 2);

drop table "trailing";