-- @testpoint: 表参数为表oid有权限和没有权限返回值校验
DROP USER IF EXISTS joe CASCADE;
CREATE USER joe PASSWORD 'Bigdata@123';
DROP table IF EXISTS table_test001;
create table table_test001(c int,d int); 
GRANT select,update ON table_test001 TO joe;

select has_table_privilege('joe', oid,'select') from PG_CLASS where relname = 'table_test001' ;
select has_table_privilege('joe', oid,'insert') from PG_CLASS where relname = 'table_test001' ;

DROP USER IF EXISTS joe CASCADE;
DROP table IF EXISTS table_test001;