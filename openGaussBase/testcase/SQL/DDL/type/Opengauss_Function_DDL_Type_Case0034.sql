--  @testpoint:为枚举类型增加一个新值，new_enum_value已存在，合理报错
--创建枚举类型
drop type if exists bugstatus3 cascade;
CREATE TYPE bugstatus3 AS ENUM ('create', 'modify', 'closed');
--为枚举类型增加一个新值，new_enum_value已存在,合理报错
ALTER TYPE bugstatus3 ADD VALUE 'create' BEFORE 'closed';
--删除类型
drop type bugstatus3 cascade;