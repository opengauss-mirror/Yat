--  @testpoint:openGauss关键字generated(非保留)，同时作为表名和列名带引号，并进行dml操作,generated列的值最终显示为1000

drop table if exists "generated";
create table "generated"(
	c_id int, c_int int, c_integer integer, c_bool int, c_boolean int, c_bigint integer,
	c_real real, c_double real,
	c_decimal decimal(38), c_number number(38), c_numeric numeric(38),
	c_char char(50) default null, c_varchar varchar(20), c_varchar2 varchar2(4000),
	c_date date, c_datetime date, c_timestamp timestamp,
	"generated" varchar(100) default 'generated'
)
PARTITION BY RANGE (c_integer)
(
	partition P_max values less than (maxvalue)
);



insert into "generated"(c_id,"generated") values(1,'hello');
insert into "generated"(c_id,"generated") values(2,'china');
update "generated" set "generated"=1000 where "generated"='hello';
delete from "generated" where "generated"='china';
select "generated" from "generated" where "generated"!='hello' order by "generated";

drop table "generated";

