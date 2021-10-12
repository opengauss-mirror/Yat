--  @testpoint:openGauss关键字Lateral(非保留)，同时作为表名和列名带引号，并进行dml操作,Lateral列的值最终显示为1000

drop table if exists "Lateral";
create table "Lateral"(
	c_id int, c_int int, c_integer integer, c_bool int, c_boolean int, c_bigint integer,
	c_real real, c_double real,
	c_decimal decimal(38), c_number number(38), c_numeric numeric(38),
	c_char char(50) default null, c_varchar varchar(20), c_varchar2 varchar2(4000),
	c_date date, c_datetime date, c_timestamp timestamp,
	"Lateral" varchar(100) default 'Lateral'
)
PARTITION BY RANGE (c_integer)
(
	partition P_max values less than (maxvalue)
);



insert into "Lateral"(c_id,"Lateral") values(1,'hello');
insert into "Lateral"(c_id,"Lateral") values(2,'china');
update "Lateral" set "Lateral"=1000 where "Lateral"='hello';
delete from "Lateral" where "Lateral"='china';
select "Lateral" from "Lateral" where "Lateral"!='hello' order by "Lateral";

drop table "Lateral";
