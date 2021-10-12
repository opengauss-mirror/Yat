--  @testpoint:opengauss关键字read(非保留)，作为表空间名


--关键字不带引号，创建成功
drop tablespace if exists read;
CREATE TABLESPACE read RELATIVE LOCATION 'hdfs_tablespace/hdfs_tablespace_1';
drop tablespace read;
 
--关键字带双引号，创建成功
drop tablespace if exists "read";
CREATE TABLESPACE "read" RELATIVE LOCATION 'hdfs_tablespace/hdfs_tablespace_1'; 
drop tablespace "read";

--关键字带单引号，合理报错
drop tablespace if exists 'read';
 

--关键字带反引号，合理报错
drop tablespace if exists `read`;


