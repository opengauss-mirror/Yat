--  @testpoint:openGauss关键字nclob(非保留)，同时作为表名和列名带引号，并进行dml操作,nclob列的值最终显示为1000

drop table if exists "nclob";
create table "nclob"(
	c_id int, c_int int, c_integer integer, c_bool int, c_boolean int, c_bigint integer,
	c_real real, c_double real,
	c_decimal decimal(38), c_number number(38), c_numeric numeric(38),
	c_char char(50) default null, c_varchar varchar(20), c_varchar2 varchar2(4000),
	c_date date, c_datetime date, c_timestamp timestamp,
	"nclob" varchar(100) default 'nclob'
)
PARTITION BY RANGE (c_integer)
(
	partition P_max values less than (maxvalue)
);



insert into "nclob"(c_id,"nclob") values(1,'hello');
insert into "nclob"(c_id,"nclob") values(2,'china');
update "nclob" set "nclob"=1000 where "nclob"='hello';
delete from "nclob" where "nclob"='china';
select "nclob" from "nclob" where "nclob"!='hello' order by "nclob";

drop table "nclob";

