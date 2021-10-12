-- @testpoint: 给数据库的赋予所有权限时查看各权限是否存在
DROP USER IF EXISTS joe CASCADE;
CREATE USER joe PASSWORD 'Bigdata@123';
DROP database IF EXISTS dbtest_001;
create database dbtest_001; 
GRANT ALL PRIVILEGES ON database dbtest_001 TO joe;
SELECT has_database_privilege('joe', 'dbtest_001','connect');
DROP USER IF EXISTS joe CASCADE;
DROP database IF EXISTS dbtest_001;