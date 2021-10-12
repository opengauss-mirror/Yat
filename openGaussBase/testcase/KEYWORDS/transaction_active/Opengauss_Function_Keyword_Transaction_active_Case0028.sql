-- @testpoint: opengauss关键字transaction_active(非保留)，作为同义词对象名,部分测试点合理报错


--前置条件
drop table if exists explain_test;
create table explain_test(id int,name varchar(10));

--关键字不带引号-成功
drop synonym if exists transaction_active;
create synonym transaction_active for explain_test;
insert into transaction_active values (1,'ada'),(2, 'bob');
update transaction_active set transaction_active.name='cici' where transaction_active.id=2;
select * from transaction_active;
drop synonym if exists transaction_active;

--关键字带双引号-成功
drop synonym if exists "transaction_active";
create synonym "transaction_active" for explain_test;
drop synonym if exists "transaction_active";

--关键字带单引号-合理报错
drop synonym if exists 'transaction_active';
create synonym 'transaction_active' for explain_test;
insert into 'transaction_active' values (1,'ada'),(2, 'bob');
update 'transaction_active' set 'transaction_active'.name='cici' where 'transaction_active'.id=2;
select * from 'transaction_active';

--关键字带反引号-合理报错
drop synonym if exists `transaction_active`;
create synonym `transaction_active` for explain_test;
insert into `transaction_active` values (1,'ada'),(2, 'bob');
update `transaction_active` set `transaction_active`.name='cici' where `transaction_active`.id=2;
select * from `transaction_active`;

--清理环境
drop table if exists explain_test;