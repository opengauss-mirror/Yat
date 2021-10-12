--  @testpoint:opengauss关键字constraint_catalog(非保留)，作为用户名

--关键字constraint_catalog作为用户名不带引号，创建成功
drop user if exists constraint_catalog;
CREATE USER constraint_catalog PASSWORD 'Bigdata@123';
drop user constraint_catalog;

--关键字constraint_catalog作为用户名加双引号，创建成功
drop user if exists "constraint_catalog";
CREATE USER "constraint_catalog" PASSWORD 'Bigdata@123';
drop user "constraint_catalog";
 
--关键字constraint_catalog作为用户名加单引号，合理报错
CREATE USER 'constraint_catalog' PASSWORD 'Bigdata@123';

--关键字constraint_catalog作为用户名加反引号，合理报错
CREATE USER `constraint_catalog` PASSWORD 'Bigdata@123';
