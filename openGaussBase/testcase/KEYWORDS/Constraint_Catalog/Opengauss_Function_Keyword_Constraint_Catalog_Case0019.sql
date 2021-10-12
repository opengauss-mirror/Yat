-- @testpoint: opengauss关键字constraint_catalog(非保留)，作为外部数据源名，部分测试点合理报错

--关键字不带引号-成功
drop data source if exists constraint_catalog;
create data source constraint_catalog;

--关键字带双引号-成功
drop data source if exists "constraint_catalog";
create data source "constraint_catalog";

--关键字带单引号-合理报错
drop data source if exists 'constraint_catalog';
create data source 'constraint_catalog';

--关键字带反引号-合理报错
drop data source if exists `constraint_catalog`;
create data source `constraint_catalog`;

--清理环境
drop data source if exists constraint_catalog;
drop data source if exists "constraint_catalog";

