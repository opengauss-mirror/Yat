-- @testpoint: opengauss关键字command_function_code(非保留)，作为游标名，部分测试点合理报错

--前置条件
drop table if exists command_function_code_test cascade;
create table command_function_code_test(cid int,fid int);

--关键字不带引号-成功
start transaction;
cursor command_function_code for select * from command_function_code_test order by 1;
close command_function_code;
end;

--关键字带双引号-成功
start transaction;
cursor "command_function_code" for select * from command_function_code_test order by 1;
close "command_function_code";
end;

--关键字带单引号-合理报错
start transaction;
cursor 'command_function_code' for select * from command_function_code_test order by 1;
close 'command_function_code';
end;

--关键字带反引号-合理报错
start transaction;
cursor `command_function_code` for select * from command_function_code_test order by 1;
close `command_function_code`;
end;
drop table if exists command_function_code_test cascade;