-- @testpoint: opengauss关键字natural(保留)，作为存储过程名,部分测试点合理报错

--关键字不带引号-成功
create or replace procedure natural() is
V1 BLOB;
begin
  IF V1 is NULL then
  raise info 'V1 is NULL';
  else
  raise info 'V1 is not NULL';
  end if;
end;
/

--清理环境
drop procedure natural;

--关键字带双引号-成功
create or replace procedure "natural"() is
V1 BLOB;
begin
  IF V1 is NULL then
  raise info 'V1 is NULL';
  else
  raise info 'V1 is not NULL';
  end if;
end;
/

--清理环境
drop procedure "natural";

--关键字带单引号-合理报错
create or replace procedure 'natural'() is
V1 BLOB;
begin
  IF V1 is NULL then
  raise info 'V1 is NULL';
  else
  raise info 'V1 is not NULL';
  end if;
end;
/

--关键字带反引号-合理报错
create or replace procedure `natural`() is
V1 BLOB;
begin
  IF V1 is NULL then
  raise info 'V1 is NULL';
  else
  raise info 'V1 is not NULL';
  end if;
end;
/
