--  @testpoint:opengauss关键字bitvar(非保留)，作为游标名
--前置条件
drop table if exists bitvar_test cascade;
create table bitvar_test(cid int,fid int);

--关键字不带引号-成功
start transaction;
cursor bitvar for select * from bitvar_test order by 1;
close bitvar;
end;

--关键字带双引号-成功
start transaction;
cursor "bitvar" for select * from bitvar_test order by 1;
close "bitvar";
end;

--关键字带单引号-合理报错
start transaction;
cursor 'bitvar' for select * from bitvar_test order by 1;
close 'bitvar';
end;

--关键字带反引号-合理报错
start transaction;
cursor `bitvar` for select * from bitvar_test order by 1;
close `bitvar`;
end;

--清理环境
drop table bitvar_test;