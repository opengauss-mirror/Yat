--  @testpoint:openGauss关键字message_text(非保留)，同时作为表名和列名带引号，并进行dml操作,message_text列的值最终显示为1000

drop table if exists "message_text";
create table "message_text"(
	c_id int, c_int int, c_integer integer, c_bool int, c_boolean int, c_bigint integer,
	c_real real, c_double real,
	c_decimal decimal(38), c_number number(38), c_numeric numeric(38),
	c_char char(50) default null, c_varchar varchar(20), c_varchar2 varchar2(4000),
	c_date date, c_datetime date, c_timestamp timestamp,
	"message_text" varchar(100) default 'message_text'
)
PARTITION BY RANGE (c_integer)
(
	partition P_max values less than (maxvalue)
);



insert into "message_text"(c_id,"message_text") values(1,'hello');
insert into "message_text"(c_id,"message_text") values(2,'china');
update "message_text" set "message_text"=1000 where "message_text"='hello';
delete from "message_text" where "message_text"='china';
select "message_text" from "message_text" where "message_text"!='hello' order by "message_text";

drop table "message_text";
