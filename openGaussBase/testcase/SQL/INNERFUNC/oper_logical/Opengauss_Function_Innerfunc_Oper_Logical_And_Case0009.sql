-- @testpoint: opengauss逻辑操作符AND,两个都为null
drop table if exists ts_zhparser;
CREATE TABLE ts_zhparser(id int, index int);
INSERT INTO ts_zhparser(id) VALUES(2);
select index AND index FROM ts_zhparser; 
drop table if exists ts_zhparser;