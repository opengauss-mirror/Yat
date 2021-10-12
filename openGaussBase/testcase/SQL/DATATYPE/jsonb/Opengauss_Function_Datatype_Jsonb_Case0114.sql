-- @testpoint: Json不支持作为分区表的主键，合理报错

--分区表：Json不支持作为分区表的分区键
drop table if exists tab1141;
create table tab1141(id int,name varchar,message json)
partition by range(message)
(partition part_1 values less than(20),
 partition part_2 values less than(30),
 partition part_3 values less than(maxvalue));

--分区表：Json不支持作为分区表的主键
drop table if exists tab1142;
create table tab1142(id int,name varchar,message json primary key)
partition by range(message)
(partition part_1 values less than(20),
 partition part_2 values less than(30),
 partition part_3 values less than(maxvalue));

--清理数据
drop table if exists tab1141;
drop table if exists tab1142;