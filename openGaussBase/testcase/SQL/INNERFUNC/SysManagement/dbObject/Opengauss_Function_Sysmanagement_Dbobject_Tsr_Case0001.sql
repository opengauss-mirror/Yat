-- @testpoint: pg_table_size(regclass)指定的表使用的磁盘空间，不计索引（但是包含TOAST，自由空间映射和可见性映射）。

create schema tpcds;
CREATE TABLE tpcds.ship_mode_t1
(
    SM_SHIP_MODE_SK           INTEGER               NOT NULL,
    SM_SHIP_MODE_ID           CHAR(16)              NOT NULL,
    SM_TYPE                   CHAR(30)                      ,
    SM_CODE                   CHAR(10)                      ,
    SM_CARRIER                CHAR(20)                      ,
    SM_CONTRACT               CHAR(20)
);

select pg_table_size('tpcds.ship_mode_t1'::regclass);
CREATE UNIQUE INDEX ds_ship_mode_t1_index1 ON tpcds.ship_mode_t1(SM_SHIP_MODE_SK);
select pg_table_size('tpcds.ship_mode_t1'::regclass);

insert into tpcds.ship_mode_t1 values(10,'a','b','c','d','e');
select pg_table_size('tpcds.ship_mode_t1'::regclass);

delete from tpcds.ship_mode_t1 where SM_SHIP_MODE_SK = 10;
select pg_table_size('tpcds.ship_mode_t1'::regclass);

drop index tpcds.ds_ship_mode_t1_index1;
select pg_table_size('tpcds.ship_mode_t1'::regclass);

drop table tpcds.ship_mode_t1;
drop schema tpcds;
