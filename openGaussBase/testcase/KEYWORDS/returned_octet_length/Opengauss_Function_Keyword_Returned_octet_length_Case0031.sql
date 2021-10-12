--  @testpoint:opengauss关键字returned_octet_length(非保留)，作为字段数据类型(合理报错)

--前置条件
drop table if exists returned_octet_length_test cascade;

--关键字不带引号-合理报错
create table returned_octet_length_test(id int,name returned_octet_length);

--关键字带双引号-合理报错
create table returned_octet_length_test(id int,name "returned_octet_length");

--关键字带单引号-合理报错
create table returned_octet_length_test(id int,name 'returned_octet_length');

--关键字带反引号-合理报错
create table returned_octet_length_test(id int,name `returned_octet_length`);
