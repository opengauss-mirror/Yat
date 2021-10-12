-- @testpoint: opengauss关键字sqlcode(非保留)，作为游标名，部分测试点合理报错

--前置条件
drop table if exists explain_test cascade;
create table explain_test(cid int,fid int);

--关键字不带引号-成功
start transaction;
cursor sqlcode for select * from explain_test order by 1;
close sqlcode;
end;

--关键字带双引号-成功
start transaction;
cursor "sqlcode" for select * from explain_test order by 1;
close "sqlcode";
end;

--关键字带单引号-合理报错
start transaction;
cursor 'sqlcode' for select * from explain_test order by 1;
close 'sqlcode';
end;

--关键字带反引号-合理报错
start transaction;
cursor `sqlcode` for select * from explain_test order by 1;
close `sqlcode`;
end;
drop table if exists explain_test cascade;