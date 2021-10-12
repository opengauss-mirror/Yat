-- @testpoint: 创建普通list分区表，指定表空间

--创建表空间
drop tablespace if exists part_tabspace;
create tablespace part_tabspace relative location 'tablespace/part_tablespace';

--创建list分区表，指定表空间
drop table if exists partition_list_tab01;
create table partition_list_tab01(p_id int,p_name varchar,p_age int)
tablespace part_tabspace
partition by list(p_id)
(partition part_1 values(10),
 partition part_2 values(20),
 partition part_3 values(30));

--循环插入多条数据
create or replace procedure insert_partition_list()
as
insert_str varchar;
begin
    for i in 0..5 loop
        insert_str = 'insert into partition_list_tab01 values(20),(20),(30),(20);';
        execute immediate insert_str;
    end loop;
end;
/
call insert_partition_list();

--查看数据
select count(*) from partition_list_tab01 partition for ('20');

--查看分区是否在分配的表空间内
select relname, spcname from pg_tablespace t join pg_partition p
on t.oid = p.reltablespace where t.oid in
(select distinct reltablespace from PG_PARTITION where parentid =
(select oid from pg_class where relname='partition_list_tab01')) order by relname asc;

--清理环境
drop table partition_list_tab01;
drop tablespace part_tabspace;
drop procedure if exists insert_partition_list;