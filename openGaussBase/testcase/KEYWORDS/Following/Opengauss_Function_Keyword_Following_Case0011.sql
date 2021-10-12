--  @testpoint:openGauss关键字following(非保留)，同时作为表名和列名带引号，并进行dml操作,following列的值最终显示为1000

drop table if exists "following";
create table "following"(
	c_id int, c_int int, c_integer integer, c_bool int, c_boolean int, c_bigint integer,
	c_real real, c_double real,
	c_decimal decimal(38), c_number number(38), c_numeric numeric(38),
	c_char char(50) default null, c_varchar varchar(20), c_varchar2 varchar2(4000),
	c_date date, c_datetime date, c_timestamp timestamp,
	"following" varchar(100) default 'following'
)
PARTITION BY RANGE (c_integer)
(
	partition P_max values less than (maxvalue)
);



insert into "following"(c_id,"following") values(1,'hello');
insert into "following"(c_id,"following") values(2,'china');
update "following" set "following"=1000 where "following"='hello';
delete from "following" where "following"='china';
select "following" from "following" where "following"!='hello' order by "following";

drop table "following";
