--  @testpoint:建表后再增加唯一约束，使用insert..nothing语句
--预置条件enable_upsert_to_merge为off
drop table if exists mykey_3b;
--建表不指定唯一约束
create table mykey_3b
(
   name nvarchar2(20) ,
   id number  ,
   address nvarchar2(50)
) ;
--未指定唯一约束使用insert..nothing语句，正常插入
insert into mykey_3b values('dacong',2,'guangdong') on DUPLICATE KEY UPDATE nothing;
select * from mykey_3b;
--给id列添加唯一约束
alter table mykey_3b add constraint unique_id unique(id);
--常规插入一条数据
insert into mykey_3b values('wangyun',3,'chongqing');
select * from mykey_3b;
--使用insert..nothing语句，主键重复，直接返回
insert into mykey_3b values('lisa1',2,'yunnan') on DUPLICATE KEY UPDATE  nothing;
select * from mykey_3b;
--使用insert..nothing语句，主键不重复，新增一条数据
insert into mykey_3b values('lisa1',4,'yunnan') on DUPLICATE KEY UPDATE  nothing;
select * from mykey_3b;
drop table mykey_3b;