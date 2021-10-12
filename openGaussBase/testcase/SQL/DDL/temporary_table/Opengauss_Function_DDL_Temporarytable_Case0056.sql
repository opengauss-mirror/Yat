-- @testpoint: 创建全局临时表，使用基本数据类型
-- @modify at: 2020-11-24
--建表
drop table if exists temp_table_056;
create global TEMPORARY table temp_table_056(
COL_1 bigint,
COL_2 TIMESTAMP WITHOUT TIME ZONE,
COL_3 bool,COL_4 decimal,COL_5 text,
COL_6 smallint,
COL_7 char(30),
COL_8 double precision,
COL_9 text,
COL_10 character varying(30),
COL_11 bool,
COL_12 bytea,
COL_13 real,
COL_14 numeric,
COL_15 blob,
COL_16 integer,COL_17 int,
COL_18 TIMESTAMP WITH TIME ZONE,
COL_19 binary_integer,
COL_20 interval day to second ,
COL_21 boolean,
COL_22 nchar(30),
COL_23 bigint,
COL_24 nchar(100),
COL_25 character(1000),
OL_26 text,
COL_27 float,
COL_28 double precision,
COL_29 bigint,
COL_30  TIMESTAMP WITH TIME ZONE,
COL_31 TIMESTAMP,
COL_32 clob,
COL_33 interval year to month,
COL_34 character(30),
COL_35 smallint,
COL_36 blob,
COL_37 char(300),
COL_38 float,
COL_39 raw(100),
COL_40 clob ,
COL_41 binary_double,
COL_42 number(6,2),
COL_43 decimal(6,2),
COL_44 varchar2(50),
COL_45 varchar(30),
COL_46 nvarchar2(100),
COL_47 numeric(12,6),
COL_48 varchar2(50),
COL_49 date,
COL_50 clob ,
COL_51 integer,
COL_52 binary_double,
COL_53 decimal(12,6),
COL_54 raw(8000),
COL_55 clob,
COL_56 varchar2(8000),
COL_57 date,
COL_58 number(12,6),
COL_59 nvarchar2(4000),
COL_60 clob,
COL_61 blob,
COL_62 date,
COL_63 blob,
COL_64 varchar(1000),
COL_65 date
)on commit preserve rows;

--插入数据
insert into temp_table_056 values(
0,rpad('abc','10','e'),353848,rpad('abc','10','exc'),lpad('abc','30','a@123&^%djgk'),lpad('abc','20','a@123&^%djgk'),9745.548,-99,3141.5,to_timestamp('2019-01-04 16:33:47.123456','YYYY-MM-DD HH24:MI:SS.FFFFFF'),
1.0E+100,3.14,4445.25,rpad('abc','10','&'),lpad('abc','10','&'),'abc&GDsh',125563.141592,rpad('abc','10','e'),'2019-01-03 14:14:12','a@123汉字&^%djgk',
--查询
select count(*) from temp_table_056;
--删表
drop table temp_table_056;

