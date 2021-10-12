--  @testpoint:openGauss关键字old(非保留)，同时作为表名和列名带引号，并进行dml操作,old列的值最终显示为1000

drop table if exists "old";
create table "old"(
	c_id int, c_int int, c_integer integer, c_bool int, c_boolean int, c_bigint integer,
	c_real real, c_double real,
	c_decimal decimal(38), c_number number(38), c_numeric numeric(38),
	c_char char(50) default null, c_varchar varchar(20), c_varchar2 varchar2(4000),
	c_date date, c_datetime date, c_timestamp timestamp,
	"old" varchar(100) default 'old'
)
PARTITION BY RANGE (c_integer)
(
	partition P_max values less than (maxvalue)
);



insert into "old"(c_id,"old") values(1,'hello');
insert into "old"(c_id,"old") values(2,'china');
update "old" set "old"=1000 where "old"='hello';
delete from "old" where "old"='china';
select "old" from "old" where "old"!='hello' order by "old";

drop table "old";

