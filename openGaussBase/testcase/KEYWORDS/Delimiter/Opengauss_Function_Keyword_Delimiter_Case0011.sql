--  @testpoint:openGauss关键字delimiter(非保留)，同时作为表名和列名带引号，并进行dml操作,delimiter列的值最终显示为1000

drop table if exists "delimiter";
create table "delimiter"(
	c_id int, c_int int, c_integer integer, c_bool int, c_boolean int, c_bigint integer,
	c_real real, c_double real,
	c_decimal decimal(38), c_number number(38), c_numeric numeric(38),
	c_char char(50) default null, c_varchar varchar(20), c_varchar2 varchar2(4000),
	c_date date, c_datetime date, c_timestamp timestamp,
	"delimiter" varchar(100) default 'delimiter'
)
PARTITION BY RANGE (c_integer)
(
	partition P_max values less than (maxvalue)
);



insert into "delimiter"(c_id,"delimiter") values(1,'hello');
insert into "delimiter"(c_id,"delimiter") values(2,'china');
update "delimiter" set "delimiter"=1000 where "delimiter"='hello';
delete from "delimiter" where "delimiter"='china';
select "delimiter" from "delimiter" where "delimiter"!='hello' order by "delimiter";

drop table "delimiter";
