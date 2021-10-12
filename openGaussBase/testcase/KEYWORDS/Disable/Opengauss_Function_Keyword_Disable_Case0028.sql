-- @testpoint: opengauss关键字disable(非保留)，作为同义词对象名，部分测试点合理报错


--前置条件
drop table if exists disable_test;
create table disable_test(id int,name varchar(10));

--关键字不带引号-成功
drop synonym if exists disable;
create synonym disable for disable_test;
insert into disable values (1,'ada'),(2, 'bob');
update disable set disable.name='cici' where disable.id=2;
select * from disable;
drop synonym if exists disable;

--关键字带双引号-成功
drop synonym if exists "disable";
create synonym "disable" for disable_test;
drop synonym if exists "disable";

--关键字带单引号-合理报错
drop synonym if exists 'disable';
create synonym 'disable' for disable_test;
insert into 'disable' values (1,'ada'),(2, 'bob');
update 'disable' set 'disable'.name='cici' where 'disable'.id=2;
select * from 'disable';

--关键字带反引号-合理报错
drop synonym if exists `disable`;
create synonym `disable` for disable_test;
insert into `disable` values (1,'ada'),(2, 'bob');
update `disable` set `disable`.name='cici' where `disable`.id=2;
select * from `disable`;
drop table if exists disable_test;