-- @testpoint: 查看server_version,以字符串形式报告版本号

--通过show方式查看
show server_version;

--通过系统视图pg_settings查看
select setting from pg_settings where name='server_version';