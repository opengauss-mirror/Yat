-- @testpoint: 创建普通hash分区表，验证支持的数据类型（时间日期类型）

--支持的时间日期类型timestamp without time zone
drop table if exists partition_hash_tab_t1;
create table partition_hash_tab_t1(p_id int,p_name char,p_date timestamp without time zone)
partition by hash(p_date)
(partition part_1,
 partition part_2);

--支持的时间日期类型timestamp with time zone
drop table if exists partition_hash_tab_t2;
create table partition_hash_tab_t2(p_id int,p_name char,p_date timestamp with time zone)
partition by hash(p_date)
(partition part_1,
 partition part_2,
 partition part_3);

--支持的时间日期类型date
drop table if exists partition_hash_tab_t3;
create table partition_hash_tab_t3(p_id int,p_name char,p_date date)
partition by hash(p_date)
(partition part_1,
 partition part_2,
 partition part_3,
 partition part_4,
 partition part_5);


--清理环境
drop table if exists partition_hash_tab_t1;
drop table if exists partition_hash_tab_t2;
drop table if exists partition_hash_tab_t3;
