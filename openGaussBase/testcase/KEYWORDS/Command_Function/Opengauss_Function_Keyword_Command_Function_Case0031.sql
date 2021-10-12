--  @testpoint:opengauss关键字command_function(非保留)，作为字段数据类型(合理报错)

--前置条件
drop table if exists command_function_test cascade;

--关键字不带引号-合理报错
create table command_function_test(id int,name command_function);

--关键字带双引号-合理报错
create table command_function_test(id int,name "command_function");

--关键字带单引号-合理报错
create table command_function_test(id int,name 'command_function');

--关键字带反引号-合理报错
create table command_function_test(id int,name `command_function`);
