-- @testpoint: 给模式赋予权限当权限参数privilege正确的时候查询
DROP USER IF EXISTS joe CASCADE;
CREATE USER joe PASSWORD 'Bigdata@123';
DROP SCHEMA IF EXISTS schema_test001;
create SCHEMA schema_test001; 
GRANT USAGE ON SCHEMA schema_test001 TO joe;
SELECT has_schema_privilege('joe', 'schema_test001','USAGE');
DROP USER IF EXISTS joe CASCADE;
DROP SCHEMA IF EXISTS schema_test001;