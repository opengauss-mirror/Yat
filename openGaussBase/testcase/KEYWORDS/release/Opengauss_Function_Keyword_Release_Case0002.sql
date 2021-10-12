--  @testpoint:openGauss鍏抽敭瀛梤elease(闈炰繚鐣?浣滀负鍒楀悕甯﹀弻寮曞彿锛宺elease澶у皬鍐欐贩鍚堬紝寤鸿〃鎴愬姛

drop table if exists release_test;
create table release_test(
	c_id int, c_int int, c_integer integer, c_bool int, c_boolean int, c_bigint integer,
	c_real real, c_double real,
	c_decimal decimal(38), c_number number(38), c_numeric numeric(38),
	c_char char(50) default null, c_varchar varchar(20), c_varchar2 varchar2(4000),
	c_date date, c_datetime date, c_timestamp timestamp,
	"Release" char(50)
)
PARTITION BY RANGE (c_integer)
(
	partition P_max values less than (maxvalue)
);

select * from release_test;
drop table release_test;

--openGauss鍏抽敭瀛梤elease(闈炰繚鐣?浣滀负鍒楀悕甯﹀弻寮曞彿锛宺elease澶у皬鍐欏尮閰嶏紝寤鸿〃鎴愬姛
drop table if exists release_test;
create table release_test(
	c_id int, c_int int, c_integer integer, c_bool int, c_boolean int, c_bigint integer,
	c_real real, c_double real,
	c_decimal decimal(38), c_number number(38), c_numeric numeric(38),
	c_char char(50) default null, c_varchar varchar(20), c_varchar2 varchar2(4000),
	c_date date, c_datetime date, c_timestamp timestamp,
	"release" char(50)
)
PARTITION BY RANGE (c_integer)
(
	partition P_max values less than (maxvalue)
);

select * from release_test;
drop table release_test;