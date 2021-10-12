-- @testpoint: opengauss关键字contains(非保留)，作为视图名，部分测试点合理报错


--关键字contains作为视图名，不带引号，创建成功
CREATE or replace VIEW contains AS
SELECT * FROM pg_tablespace WHERE spcname = 'pg_default';
drop VIEW contains;

--关键字contains作为视图名，加双引号，创建成功
CREATE  or replace VIEW "contains" AS
SELECT * FROM pg_tablespace WHERE spcname = 'pg_default';
drop VIEW "contains";

--关键字contains作为视图名，加单引号，合理报错
CREATE or replace VIEW 'contains' AS
SELECT * FROM pg_tablespace WHERE spcname = 'pg_default';

--关键字contains作为视图名，加反引号，合理报错
CREATE or replace VIEW `contains` AS
SELECT * FROM pg_tablespace WHERE spcname = 'pg_default';

