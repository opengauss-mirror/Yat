--  @testpoint:openGauss关键字comment(非保留)，同时作为表名和列名带引号，并进行dml操作,comment列的值最终显示为1000

drop table if exists "comment";
create table "comment"(
	c_id int, c_int int, c_integer integer, c_bool int, c_boolean int, c_bigint integer,
	c_real real, c_double real,
	c_decimal decimal(38), c_number number(38), c_numeric numeric(38),
	c_char char(50) default null, c_varchar varchar(20), c_varchar2 varchar2(4000),
	c_date date, c_datetime date, c_timestamp timestamp,
	"comment" varchar(100) default 'comment'
)
PARTITION BY RANGE (c_integer)
(
	partition P_max values less than (maxvalue)
);



insert into "comment"(c_id,"comment") values(1,'hello');
insert into "comment"(c_id,"comment") values(2,'china');
update "comment" set "comment"=1000 where "comment"='hello';
delete from "comment" where "comment"='china';
select "comment" from "comment" where "comment"!='hello' order by "comment";

drop table "comment";
