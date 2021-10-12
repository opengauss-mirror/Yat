--  @testpoint:openGauss关键字valid(非保留)，同时作为表名和列名带引号，并进行dml操作,valid列的值最终显示为1000

drop table if exists "valid" CASCADE;
create table "valid"(
	c_id int, c_int int, c_integer integer, c_bool int, c_boolean int, c_bigint integer,
	c_real real, c_double real,
	c_decimal decimal(38), c_number number(38), c_numeric numeric(38),
	c_char char(50) default null, c_varchar varchar(20), c_varchar2 varchar2(4000),
	c_date date, c_datetime date, c_timestamp timestamp,
	"valid" varchar(100) default 'valid'
)
PARTITION BY RANGE (c_integer)
(
	partition P_max values less than (maxvalue)
);



insert into "valid"(c_id,"valid") values(1,'hello');
insert into "valid"(c_id,"valid") values(2,'china');
update "valid" set "valid"=1000 where "valid"='hello';
delete from "valid" where "valid"='china';
select "valid" from "valid" where "valid"!='hello' order by "valid";

drop table "valid";

