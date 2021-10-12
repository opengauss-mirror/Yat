-- @testpoint: 插入不同数据后,对其中一个字段创建唯一约束，update唯一约束列的值为已存在的值，合理报错
-- @modify at: 2020-11-23
--建表
drop table if exists test_unique_constraint029;
create table test_unique_constraint029(
netypeid int not null,
counterid int not null,
granulityperiod smallint not null,
name nvarchar2(4) not null,
description nvarchar2(4000),
description_set nvarchar2(100),
source_class_id bigint not null,
source_attribute_id bigint,
custom boolean default true,
tenant_id varchar(20) default null,
strings blob,
userid int,
activedstoffset number(5) not null,
queryfrequency int default 0 not null
);
--创建复合唯一约束
alter table test_unique_constraint029 add constraint personidywertyff unique (netypeid,counterid);
--bool类型列插入不同数据
insert into test_unique_constraint029 values(1,1,1,26,56,8,290,0,false,10,'1010',7779,2630,1);
insert into test_unique_constraint029 values(2,2,-25,26,56,8,290,0,true,10,'1010',7779,2630,1);
--custom列，创建唯一约束
alter table test_unique_constraint029 add constraint custom_constr unique (custom);
--update第一条数据中的bool类型字段为true，更新失败
update test_unique_constraint029 set custom=false where netypeid=2;
--删表
drop table test_unique_constraint029;
