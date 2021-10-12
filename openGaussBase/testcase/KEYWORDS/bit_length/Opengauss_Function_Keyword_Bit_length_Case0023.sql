-- @testpoint: opengauss关键字bit_length非保留)，作为索引名，部分测试点合理报错
--前置条件，创建一个表
drop table if exists bit_length_test;
create table bit_length_test(id int,name varchar(10));

--关键字不带引号-成功
drop index if exists bit_length;
create index bit_length on bit_length_test(id);

--清理环境
drop index bit_length;

--关键字带双引号-成功
drop index if exists "bit_length";
create index "bit_length" on bit_length_test(id);

--清理环境
drop index "bit_length";

--关键字带单引号-合理报错
drop index if exists 'bit_length';

--关键字带反引号-合理报错
drop index if exists `bit_length`;
drop table if exists bit_length_test;