--  @testpoint:openGauss关键字trusted(非保留)，同时作为表名和列名带引号，并进行dml操作,trusted列的值最终显示为1000

drop table if exists "trusted" CASCADE;
create table "trusted"(
	c_id int, c_int int, c_integer integer, c_bool int, c_boolean int, c_bigint integer,
	c_real real, c_double real,
	c_decimal decimal(38), c_number number(38), c_numeric numeric(38),
	c_char char(50) default null, c_varchar varchar(20), c_varchar2 varchar2(4000),
	c_date date, c_datetime date, c_timestamp timestamp,
	"trusted" varchar(100) default 'trusted'
)
PARTITION BY RANGE (c_integer)
(
	partition P_max values less than (maxvalue)
);



insert into "trusted"(c_id,"trusted") values(1,'hello');
insert into "trusted"(c_id,"trusted") values(2,'china');
update "trusted" set "trusted"=1000 where "trusted"='hello';
delete from "trusted" where "trusted"='china';
select "trusted" from "trusted" where "trusted"!='hello' order by "trusted";

drop table "trusted";
