-- @testpoint: 验证【列表】分区表【merge partition】时，update global index关键字对【btree】类型【唯一性多字段索引】的重建作用，合理报错

--创建分区表，插入样例数据，建立全局索引
drop table if exists test_ugi_018;
create table test_ugi_018
(
    c_id integer not null,
    c_name varchar(16) default 'omm',
    c_class varchar(20) not null
)
partition by LIST(c_id)
(
    partition p1 values (1,2,3),
    partition p2 values (4,5,6),
    partition p3 values (7,8,9),
    partition p4 values (10,11,12),
    partition p5 values (13,14,15),
    partition p6 values (16,17,18)
);

insert into test_ugi_018(c_id, c_class) select r, '1-1' from generate_series(1,3) as r;
insert into test_ugi_018(c_id, c_class) select r, '1-2' from generate_series(4,6) as r;
insert into test_ugi_018(c_id, c_class) select r, '1-3' from generate_series(7,9) as r;
insert into test_ugi_018(c_id, c_class) select r, '1-4' from generate_series(10,12) as r;
insert into test_ugi_018(c_id, c_class) select r, '1-5' from generate_series(13,15) as r;
insert into test_ugi_018(c_id, c_class) select r, '1-6' from generate_series(16,18) as r;

create unique index global_index_id_018 on test_ugi_018(c_id, c_name) global;

--创建exchange用的普通表
drop table if exists test_ugi_018_temp;
create table test_ugi_018_temp
(
    c_id integer not null,
    c_name varchar(16) default 'omm',
    c_class varchar(20) not null
);
insert into test_ugi_018_temp(c_id, c_class) select r, '1-4' from generate_series(10,12) as r;

--收集统计信息
analyse test_ugi_018;

--确认交换分区可以破坏全局索引，并使用alter index xxx rebuild重建索引global_index_id_018
--查看分区表（18行）、普通表的数据量（3行）
select count(*) from test_ugi_018;
select count(*) from test_ugi_018_temp;
--查看执行计划，确认走index scan
explain analyse select * from test_ugi_018 where c_id = 2;

--合并分区p2、p3，破坏全局索引
alter table test_ugi_018 merge partitions p2, p3 into partition p_merge;

--清理表
drop table test_ugi_018;
drop table test_ugi_018_temp;