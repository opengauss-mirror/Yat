-- @testpoint: 创建一个新的表空间，表空间名字不同，路径相同,合理报错

DROP TABLESPACE IF EXISTS ds_location1;
CREATE TABLESPACE ds_location1 RELATIVE LOCATION 'hdfs_tablespace/hdfs_tablespace_1';
CREATE TABLESPACE ds_location4 RELATIVE LOCATION 'hdfs_tablespace/hdfs_tablespace_1';
DROP TABLESPACE IF EXISTS ds_location1;
