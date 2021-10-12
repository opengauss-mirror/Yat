--  @testpoint:opengauss关键字than(非保留)，作为数据库名

--关键字不带引号-成功
drop database if exists than;
create database than;
drop database than;

--关键字带双引号-成功
drop database if exists "than";
create database "than";
drop database "than";

--关键字带单引号-合理报错
drop database if exists 'than';
create database 'than';

--关键字带反引号-合理报错
drop database if exists `than`;
create database `than`;

