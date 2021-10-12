-- @testpoint: 创建一个有主键约束的表（表级）

DROP TABLE IF EXISTS tab_18;
CREATE TABLE IF not EXISTS tab_18
(id                      NUMBER(7),
 name              VARCHAR2(20),
 filename                  VARCHAR2(255),
 text                       VARCHAR2(2000),
 PRIMARY KEY (id)
 ) ;
insert into tab_18 values(1,'李','小龙','截拳道大师');
select * from tab_18;
DROP TABLE IF EXISTS tab_18;
 
