--  @testpoint:openGauss关键字write(非保留)，同时作为表名和列名带引号，并进行dml操作,write列的值最终显示为1000

drop table if exists "write";
create table "write"(
	c_id int, c_int int, c_integer integer, c_bool int, c_boolean int, c_bigint integer,
	c_real real, c_double real,
	c_decimal decimal(38), c_number number(38), c_numeric numeric(38),
	c_char char(50) default null, c_varchar varchar(20), c_varchar2 varchar2(4000),
	c_date date, c_datetime date, c_timestamp timestamp,
	"write" varchar(100) default 'write'
)
PARTITION BY RANGE (c_integer)
(
	partition P_max values less than (maxvalue)
);



insert into "write"(c_id,"write") values(1,'hello');
insert into "write"(c_id,"write") values(2,'china');
update "write" set "write"=1000 where "write"='hello';
delete from "write" where "write"='china';
select "write" from "write" where "write"!='hello' order by "write";

drop table "write";

