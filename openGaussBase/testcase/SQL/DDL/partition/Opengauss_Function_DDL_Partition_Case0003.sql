-- @testpoint: list分区表(不支持)合理报错
drop table if exists tp3;
create table tp3
(
c_id int,
c_d_id int not null,
c_w_id int not null,
c_first varchar(32) not null,
c_middle char(2),
c_last varchar(32) not null,
c_street_1 varchar(40) not null,
c_street_2 varchar(40),
c_city varchar(40) not null,
c_state char(2) not null,
c_zip char(9) not null,
c_phone char(32) not null,
c_since timestamp,
c_credit char(2) not null,
c_credit_lim numeric(12,2),
c_discount numeric(4,4),
c_balance numeric(12,2),
c_ytd_payment real not null,
c_payment_cnt number not null,
c_delivery_cnt bool not null,
c_end date not null,
c_vchar varchar(1000),
c_data clob,
c_text blob
) 
partition by list COLUMNS (c_d_id,c_w_id)
(
partition part_1 values((1,1),(2,2),(3,3),(4,4)),
partition part_2 values((5,5),(6,6),(7,7)),
partition part_3 values((8,8),(9,9)),
partition part_4 values(default)
);

