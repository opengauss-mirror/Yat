--  @testpoint:opengauss关键字backward(非保留)，作为游标名
--前置条件
drop table if exists backward_test cascade;
create table backward_test(cid int,fid int);

--关键字不带引号-成功
start transaction;
cursor backward for select * from backward_test order by 1;
close backward;
end;

--关键字带双引号-成功
start transaction;
cursor "backward" for select * from backward_test order by 1;
close "backward";
end;

--关键字带单引号-合理报错
start transaction;
cursor 'backward' for select * from backward_test order by 1;
close 'backward';
end;

--关键字带反引号-合理报错
start transaction;
cursor `backward` for select * from backward_test order by 1;
close `backward`;
end;

--清理环境
drop table backward_test;