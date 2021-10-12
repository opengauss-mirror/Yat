--  @testpoint:创建表指定两个字段为复合唯一约束，使用insert..nothing语句
--预置条件enable_upsert_to_merge为off

drop table if exists mykey_4g;
--建表指定id，name为唯一约束
create table mykey_4g
(
   name nvarchar2(20)  ,
   id number  ,
   address nvarchar2(50),
   constraint unique_n_i unique(name,id)
) ;
--使用insert常规插入两条数据，唯一约束name列重复，插入两条数据
 insert into mykey_4g values('a',1,'yy'),('a',2,'yy');
 select * from mykey_4g;
 --使用insert常规插入两条数据，唯一约束id列重复，插入两条数据
 insert into mykey_4g values('b',1,'yy'),('c',1,'yy');
  select * from mykey_4g;
  --使用insert常规插入一条数据,唯一约束name和id列都重复，合理报错
  insert into mykey_4g values('b',1,'yy');
  --使用insert..nothing语句，插入一条数据，唯一约束name和id列都重复,直接返回
  insert into mykey_4g values('b',1,'xx')ON DUPLICATE KEY UPDATE nothing;
  select * from mykey_4g;
  --使用insert..nothing语句，插入一条数据，唯一约束name列不重复，新增一条数据
  insert into mykey_4g values('d',1,'xx')ON DUPLICATE KEY UPDATE  nothing ;
  select * from mykey_4g;
  drop table mykey_4g;