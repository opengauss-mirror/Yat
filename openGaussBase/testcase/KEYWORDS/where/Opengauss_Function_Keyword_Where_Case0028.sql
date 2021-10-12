-- @testpoint: opengauss关键字where(保留)，作为同义词对象名，部分测试点合理报错


--前置条件
drop table if exists where_test;
create table where_test(id int,name varchar(10));

--关键字不带引号-失败
drop synonym if exists where;
create synonym where for where_test;


--关键字带双引号-成功
drop synonym if exists "where";
create synonym "where" for where_test;
insert into "where" values (1,'ada'),(2, 'bob');
update "where" set "where".name='cici' where "where".id=2;
select * from "where";

--清理环境
drop synonym "where";

--关键字带单引号-合理报错
drop synonym if exists 'where';
create synonym 'where' for where_test;
insert into 'where' values (1,'ada'),(2, 'bob');
update 'where' set 'where'.name='cici' where 'where'.id=2;
select * from 'where';

--关键字带反引号-合理报错
drop synonym if exists `where`;
create synonym `where` for where_test;
insert into `where` values (1,'ada'),(2, 'bob');
update `where` set `where`.name='cici' where `where`.id=2;
select * from `where`;
drop table if exists where_test;