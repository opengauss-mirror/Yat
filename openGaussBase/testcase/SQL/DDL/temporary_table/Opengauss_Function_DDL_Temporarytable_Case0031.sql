-- @testpoint: 创建临时表应用指定表空间
-- @modify at: 2020-11-24
--创建表空间
drop tablespace if exists tablespace_table_031;
create tablespace tablespace_table_031  relative location 'tablespace/tablespace_2YTR';
--创建临时表
drop table if exists temp_table_031 cascade;
create  temporary table temp_table_031(c_id int,c_d_id int not null,c_w_id int not null,c_first varchar(16) not null,
c_middle char(2),c_last varchar(16) not null,c_street_1 varchar(20) not null,c_street_2 varchar(20),
c_city varchar(20) not null,c_state char(2) not null,c_zip char(9) not null,c_phone char(16) not null,c_since timestamp,
c_credit char(2) not null,c_credit_lim numeric(12,2),c_discount numeric(4,4),c_balance numeric(12,2),
c_ytd_payment real not null,c_payment_cnt number not null,c_delivery_cnt bool not null,c_end date not null,c_data clob,
c_text blob,c_clob clob) tablespace tablespace_table_031;
--删表
drop table temp_table_031 cascade;
--删除表空间
drop tablespace tablespace_table_031 ;
