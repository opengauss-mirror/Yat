-- @testpoint: opengauss关键字privilege(非保留)，作为同义词对象名,部分测试点合理报错


--前置条件
drop table if exists privilege_test;
create table privilege_test(id int,name varchar(10));

--关键字不带引号-成功
drop synonym if exists privilege;
create synonym privilege for privilege_test;
insert into privilege values (1,'ada'),(2, 'bob');
update privilege set privilege.name='cici' where privilege.id=2;
select * from privilege;
drop synonym if exists privilege;

--关键字带双引号-成功
drop synonym if exists "privilege";
create synonym "privilege" for privilege_test;
insert into "privilege" values (1,'ada'),(2, 'bob');
update "privilege" set "privilege".name='cici' where "privilege".id=2;
select * from "privilege";
drop synonym if exists "privilege";

--关键字带单引号-合理报错
drop synonym if exists 'privilege';

--关键字带反引号-合理报错
drop synonym if exists `privilege`;

--清理环境
drop synonym if exists privilege;
drop synonym if exists "privilege";
drop table if exists privilege_test;