-- @testpoint: 创建带 DEFAULT常量值约束的行存表字段约束
DROP TABLE IF EXISTS tab_12;
CREATE TABLE tab_12
(id                     NUMBER(7) ,
 use_filename              VARCHAR2(20),
 filename                  VARCHAR2(255),
 text                       VARCHAR2(2000) DEFAULT 'qwer'
 )
 with(ORIENTATION=COLUMN);
insert into tab_12 values(1,'李','小龙','截拳道大师');
insert into tab_12 values(2,'zhang','小gou','空手道道大师');
insert into tab_12 (id,use_filename,filename)values(23,'wan123','xiaoxiao');
select * from  tab_12;

DROP TABLE IF EXISTS tab_12;