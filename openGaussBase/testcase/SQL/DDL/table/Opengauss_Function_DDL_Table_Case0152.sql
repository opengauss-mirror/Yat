-- @testpoint: 创建列类型是UUID类型的表
drop table if exists table_2;
create table table_2(a UUID);
insert into table_2 values('{a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11}');
insert into table_2 values('a1eebc999c0b4ef8bb6d6bb9bd380a11');
insert into table_2 values('a2eebc99-9c0b-4ef8-bb6d-6bb9bd380a11');
select * from table_2;
drop table if exists table_2;