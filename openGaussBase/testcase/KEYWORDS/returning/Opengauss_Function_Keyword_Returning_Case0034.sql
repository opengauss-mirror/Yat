--  @testpoint:opengauss关键字returning(保留)，作为游标名

--前置条件
drop table if exists returning_test cascade;
create table returning_test(cid int,fid int);

--关键字不带引号-失败
start transaction;
cursor returning for select * from returning_test order by 1;
close returning;
end;

--关键字带双引号-成功
start transaction;
cursor "returning" for select * from returning_test order by 1;
close "returning";
end;

--关键字带单引号-合理报错
start transaction;
cursor 'returning' for select * from returning_test order by 1;
close 'returning';
end;

--关键字带反引号-合理报错
start transaction;
cursor `returning` for select * from returning_test order by 1;
close `returning`;
end;

--清理环境
drop table returning_test cascade;