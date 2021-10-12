--  @testpoint:openGauss关键字Header(非保留)，同时作为表名和列名带引号，并进行dml操作,Header列的值最终显示为1000

drop table if exists "Header";
create table "Header"(
	c_id int, c_int int, c_integer integer, c_bool int, c_boolean int, c_bigint integer,
	c_real real, c_double real,
	c_decimal decimal(38), c_number number(38), c_numeric numeric(38),
	c_char char(50) default null, c_varchar varchar(20), c_varchar2 varchar2(4000),
	c_date date, c_datetime date, c_timestamp timestamp,
	"Header" varchar(100) default 'Header'
)
PARTITION BY RANGE (c_integer)
(
	partition P_max values less than (maxvalue)
);



insert into "Header"(c_id,"Header") values(1,'hello');
insert into "Header"(c_id,"Header") values(2,'china');
update "Header" set "Header"=1000 where "Header"='hello';
delete from "Header" where "Header"='china';
select "Header" from "Header" where "Header"!='hello' order by "Header";

drop table "Header";

