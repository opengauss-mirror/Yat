--  @testpoint:opengauss关键字condition_number(非保留)，作为用户名


--关键字condition_number作为视图名，不带引号，创建成功
CREATE or replace VIEW condition_number AS
SELECT * FROM pg_tablespace WHERE spcname = 'pg_default';

--关键字condition_number作为视图名，加双引号，创建成功
CREATE  or replace VIEW "condition_number" AS
SELECT * FROM pg_tablespace WHERE spcname = 'pg_default';
drop VIEW "condition_number";

--关键字condition_number作为视图名，加单引号，合理报错
CREATE or replace VIEW 'condition_number' AS
SELECT * FROM pg_tablespace WHERE spcname = 'pg_default';

--关键字condition_number作为视图名，加反引号，合理报错
CREATE or replace VIEW `condition_number` AS
SELECT * FROM pg_tablespace WHERE spcname = 'pg_default';

