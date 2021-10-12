--  @testpoint:建表指定两个字段是主键约束,使用insert..into语句
--预置条件enable_upsert_to_merge为off
drop table if exists mykey;
--建表指定name,id字段为联合主键
create table mykey
(
   name nvarchar2(20),
   id number ,
   address nvarchar2(50),
   primary key (name,id)
) ;
--常规插入一条数据
insert  into mykey values('lily',1,'shanxi');
select * from mykey;
--使用insert..into语句插入一条数据，主键name值重复，id不重复,合理报错，不能update联合主键其一
insert into mykey values('lily',2,'shandong') ON  DUPLICATE KEY UPDATE name='lily';
select * from mykey;
--使用insert..into语句插入一条数据，主键name值不重复，id值重复,合理报错，不能update联合主键其一
insert into mykey values('Tom',1,'shandong') ON DUPLICATE KEY UPDATE id=1;
--使用insert..into语句插入一条数据,主键name和id都重复，修改原有数据('lily',1,'shanxi')为('lily',1,'shandong')
insert into mykey values('lily',1,'shandong') ON DUPLICATE KEY UPDATE  address='shandong';
select * from mykey;
drop table mykey;
