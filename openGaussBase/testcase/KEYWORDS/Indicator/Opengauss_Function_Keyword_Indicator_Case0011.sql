--  @testpoint:openGauss关键字Indicator(非保留)，同时作为表名和列名带引号，并进行dml操作,Indicator列的值最终显示为1000

drop table if exists "Indicator";
create table "Indicator"(
	c_id int, c_int int, c_integer integer, c_bool int, c_boolean int, c_bigint integer,
	c_real real, c_double real,
	c_decimal decimal(38), c_number number(38), c_numeric numeric(38),
	c_char char(50) default null, c_varchar varchar(20), c_varchar2 varchar2(4000),
	c_date date, c_datetime date, c_timestamp timestamp,
	"Indicator" varchar(100) default 'Indicator'
)
PARTITION BY RANGE (c_integer)
(
	partition P_max values less than (maxvalue)
);



insert into "Indicator"(c_id,"Indicator") values(1,'hello');
insert into "Indicator"(c_id,"Indicator") values(2,'china');
update "Indicator" set "Indicator"=1000 where "Indicator"='hello';
delete from "Indicator" where "Indicator"='china';
select "Indicator" from "Indicator" where "Indicator"!='hello' order by "Indicator";

drop table "Indicator";

