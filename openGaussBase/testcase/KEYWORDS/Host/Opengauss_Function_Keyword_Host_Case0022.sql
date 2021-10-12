--  @testpoint:opengauss关键字Host(非保留)，作为用户组名


--关键字不带引号-成功
drop group if exists Host;
create group Host with password 'gauss@123';
drop group Host;

--关键字带双引号-成功
drop group if exists "Host";
create group "Host" with password 'gauss@123';
drop group "Host";

--关键字带单引号-合理报错
drop group if exists 'Host';
create group 'Host' with password 'gauss@123';

--关键字带反引号-合理报错
drop group if exists `Host`;
create group `Host` with password 'gauss@123';
