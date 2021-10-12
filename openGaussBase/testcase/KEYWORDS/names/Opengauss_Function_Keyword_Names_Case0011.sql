--  @testpoint:openGauss关键字names(非保留)，同时作为表名和列名带引号，并进行dml操作,names列的值最终显示为1000

drop table if exists "names";
create table "names"(
	c_id int, c_int int, c_integer integer, c_bool int, c_boolean int, c_bigint integer,
	c_real real, c_double real,
	c_decimal decimal(38), c_number number(38), c_numeric numeric(38),
	c_char char(50) default null, c_varchar varchar(20), c_varchar2 varchar2(4000),
	c_date date, c_datetime date, c_timestamp timestamp,
	"names" varchar(100) default 'names'
)
PARTITION BY RANGE (c_integer)
(
	partition P_max values less than (maxvalue)
);



insert into "names"(c_id,"names") values(1,'hello');
insert into "names"(c_id,"names") values(2,'china');
update "names" set "names"=1000 where "names"='hello';
delete from "names" where "names"='china';
select "names" from "names" where "names"!='hello' order by "names";

drop table "names";
