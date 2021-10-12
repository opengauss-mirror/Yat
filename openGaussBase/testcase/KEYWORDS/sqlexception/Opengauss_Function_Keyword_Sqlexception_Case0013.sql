--  @testpoint:openGauss关键字sqlexception(非保留)，同时作为表名和列名带引号，与union结合查询合并两个SELECT 语句查询

drop table if exists "sqlexception" CASCADE;
create table "sqlexception"(
	c_id int, c_int int, c_integer integer, c_bool int, c_boolean int, c_bigint integer,
	c_real real, c_double real,
	c_decimal decimal(38), c_number number(38), c_numeric numeric(38),
	c_char char(50) default null, c_varchar varchar(20), c_varchar2 varchar2(4000),
	c_date date, c_datetime date, c_timestamp timestamp,
	"sqlexception" varchar(100) default 'sqlexception'
)
PARTITION BY RANGE (c_integer)
(
	partition P_max values less than (maxvalue)
);

insert into "sqlexception"(c_id,"sqlexception") values(1,'hello');
insert into "sqlexception"(c_id,"sqlexception") values(2,'china');
insert into "sqlexception"(c_id,"sqlexception") values(3,'gauss');
---两个select语句合并查询，查询结果显示hello、china、gauss，对括号中的select子句取limit 2
select "sqlexception" from "sqlexception" where "sqlexception"='hello'
union all (select "sqlexception" from "sqlexception" where "sqlexception"!='hello' order by "sqlexception" limit 2);

drop table "sqlexception" CASCADE;
