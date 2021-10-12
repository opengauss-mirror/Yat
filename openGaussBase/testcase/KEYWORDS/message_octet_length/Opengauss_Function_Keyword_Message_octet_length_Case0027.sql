--  @testpoint:opengauss关键字message_octet_length非保留)，作为序列名


--关键字不带引号-成功
drop sequence if exists message_octet_length;
create sequence message_octet_length start 100 cache 50;
drop sequence message_octet_length;

--关键字带双引号-成功
drop sequence if exists "message_octet_length";
create sequence "message_octet_length" start 100 cache 50;
drop sequence "message_octet_length";

--关键字带单引号-合理报错
drop sequence if exists 'message_octet_length';
create sequence 'message_octet_length' start 100 cache 50;

--关键字带反引号-合理报错
drop sequence if exists `message_octet_length`;
create sequence `message_octet_length` start 100 cache 50;
