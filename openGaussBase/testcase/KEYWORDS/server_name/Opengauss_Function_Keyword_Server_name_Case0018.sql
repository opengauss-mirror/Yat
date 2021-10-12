--  @testpoint:opengauss关键字server_name(非保留)，作为数据库名

--关键字不带引号-成功
drop database if exists server_name;
create database server_name;
drop database server_name;

--关键字带双引号-成功
drop database if exists "server_name";
create database "server_name";
drop database "server_name";

--关键字带单引号-合理报错
drop database if exists 'server_name';
create database 'server_name';

--关键字带反引号-合理报错
drop database if exists `server_name`;
create database `server_name`;

