-- @testpoint: opengauss关键字backward非保留)，作为索引名,部分测试点合理报错
--前置条件，创建一个表
drop table if exists backward_test;
create table backward_test(id int,name varchar(10));

--关键字不带引号-成功
drop index if exists backward;
create index backward on backward_test(id);

--清理环境
drop index backward;

--关键字带双引号-成功
drop index if exists "backward";
create index "backward" on backward_test(id);

--清理环境
drop index "backward";

--关键字带单引号-合理报错
drop index if exists 'backward';

--关键字带反引号-合理报错
drop index if exists `backward`;
drop table if exists backward_test;