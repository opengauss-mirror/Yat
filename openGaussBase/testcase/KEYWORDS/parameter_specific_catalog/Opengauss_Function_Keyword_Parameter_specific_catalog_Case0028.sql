-- @testpoint: opengauss关键字parameter_specific_catalog(非保留)，作为同义词对象名,合理报错


--前置条件
drop table if exists explain_test;
create table explain_test(id int,name varchar(10));

--关键字不带引号-成功
drop synonym if exists parameter_specific_catalog;
create synonym parameter_specific_catalog for explain_test;
insert into parameter_specific_catalog values (1,'ada'),(2, 'bob');
update parameter_specific_catalog set parameter_specific_catalog.name='cici' where parameter_specific_catalog.id=2;
select * from parameter_specific_catalog;

--关键字带双引号-成功
drop synonym if exists "parameter_specific_catalog";
create synonym "parameter_specific_catalog" for explain_test;


--关键字带单引号-合理报错
drop synonym if exists 'parameter_specific_catalog';
create synonym 'parameter_specific_catalog' for explain_test;
insert into 'parameter_specific_catalog' values (1,'ada'),(2, 'bob');
update 'parameter_specific_catalog' set 'parameter_specific_catalog'.name='cici' where 'parameter_specific_catalog'.id=2;
select * from 'parameter_specific_catalog';

--关键字带反引号-合理报错
drop synonym if exists `parameter_specific_catalog`;
create synonym `parameter_specific_catalog` for explain_test;
insert into `parameter_specific_catalog` values (1,'ada'),(2, 'bob');
update `parameter_specific_catalog` set `parameter_specific_catalog`.name='cici' where `parameter_specific_catalog`.id=2;
select * from `parameter_specific_catalog`;
--清理环境
drop synonym if exists "parameter_specific_catalog";
drop synonym if exists parameter_specific_catalog;
drop table if exists explain_test;