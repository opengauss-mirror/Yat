-- @testpoint: uuid数据类型转换至varchar2（多次转换）

drop table if exists test_uuid_10;
create table test_uuid_10 (id uuid);
insert into test_uuid_10 values ('a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11');
--多次修改字段类型为varchar2
alter table test_uuid_10 alter column id TYPE varchar2(200);
alter table test_uuid_10 alter column id TYPE varchar2(200);
alter table test_uuid_10 alter column id TYPE varchar2(200);
--查看字段信息修改是否成功
select format_type(a.atttypid,a.atttypmod) as type from pg_class as c,pg_attribute as a where c.relname = 'test_uuid_10' and a.attrelid = c.oid and a.attnum>0;
select * from test_uuid_10;
drop table test_uuid_10;