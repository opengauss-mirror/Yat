--  @testpoint:opengauss关键字character_set_name(非保留)，作为用户名
--关键字character_set_name作为用户名不带引号，创建成功
drop user if exists character_set_name;
CREATE USER character_set_name PASSWORD 'Bigdata@123';

--清理环境
drop user character_set_name;

--关键字character_set_name作为用户名加双引号，创建成功
drop user if exists "character_set_name";
CREATE USER "character_set_name" PASSWORD 'Bigdata@123';

--清理环境
drop user "character_set_name";

--关键字character_set_name作为用户名加单引号，合理报错
CREATE USER 'character_set_name' PASSWORD 'Bigdata@123';

--关键字character_set_name作为用户名加反引号，合理报错
CREATE USER `character_set_name` PASSWORD 'Bigdata@123';
