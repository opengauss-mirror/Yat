--  @testpoint:openGauss保留关键字distinct同时作为表名和列名带引号，并进行dml操作,distinct列的值最终显示为1000
drop table if exists "distinct";
create table "distinct"(
	c_id int, c_int int, c_integer integer, c_bool int, c_boolean int, c_bigint integer,
	c_real real, c_double real,
	c_decimal decimal(38), c_number number(38), c_numeric numeric(38),
	c_char char(50) default null, c_varchar varchar(20), c_varchar2 varchar2(4000),
	c_date date, c_datetime date, c_timestamp timestamp,
	"distinct" varchar(100) default 'distinct'
)
PARTITION BY RANGE (c_integer)
(
	partition P_max values less than (maxvalue)
);



insert into "distinct"(c_id,"distinct") values(1,'hello');
insert into "distinct"(c_id,"distinct") values(2,'china');
update "distinct" set "distinct"=1000 where "distinct"='hello';
delete from "distinct" where "distinct"='china';
select "distinct" from "distinct" where "distinct"!='hello' order by "distinct";

drop table "distinct";