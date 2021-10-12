-- @testpoint: opengauss关键字deferrable(保留)，作为数据库名，关键字带单引号、反引号、不带引号时，合理报错

--关键字不带引号-失败
drop database if exists deferrable;
create database deferrable;

--关键字带双引号-成功
drop database if exists "deferrable";
create database "deferrable";

--关键字带单引号-合理报错
drop database if exists 'deferrable';
create database 'deferrable';

--关键字带反引号-合理报错
drop database if exists `deferrable`;
create database `deferrable`;

--清理环境
drop database "deferrable";