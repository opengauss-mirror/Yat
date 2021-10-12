--  @testpoint:openGauss关键字real(非保留)，同时作为表名和列名带引号，并进行dml操作,real列的值最终显示为1000

drop table if exists "real";
create table "real"(
	c_id int, c_int int, c_integer integer, c_bool int, c_boolean int, c_bigint integer,
	c_real real, c_double real,
	c_decimal decimal(38), c_number number(38), c_numeric numeric(38),
	c_char char(50) default null, c_varchar varchar(20), c_varchar2 varchar2(4000),
	c_date date, c_datetime date, c_timestamp timestamp,
	"real" varchar(100) default 'real'
)
PARTITION BY RANGE (c_integer)
(
	partition P_max values less than (maxvalue)
);



insert into "real"(c_id,"real") values(1,'hello');
insert into "real"(c_id,"real") values(2,'china');
update "real" set "real"=1000 where "real"='hello';
delete from "real" where "real"='china';
select "real" from "real" where "real"!='hello' order by "real";

drop table "real";

