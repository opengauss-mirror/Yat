-- @testpoint: opengauss关键字constraint_catalog(非保留)，作为游标名，部分测试点合理报错

--前置条件
drop table if exists constraint_catalog_test cascade;
create table constraint_catalog_test(cid int,fid int);

--关键字不带引号-成功
start transaction;
cursor constraint_catalog for select * from constraint_catalog_test order by 1;
close constraint_catalog;
end;

--关键字带双引号-成功
start transaction;
cursor "constraint_catalog" for select * from constraint_catalog_test order by 1;
close "constraint_catalog";
end;

--关键字带单引号-合理报错
start transaction;
cursor 'constraint_catalog' for select * from constraint_catalog_test order by 1;
close 'constraint_catalog';
end;

--关键字带反引号-合理报错
start transaction;
cursor `constraint_catalog` for select * from constraint_catalog_test order by 1;
close `constraint_catalog`;
end;

--清理环境
drop table if exists constraint_catalog_test cascade;
