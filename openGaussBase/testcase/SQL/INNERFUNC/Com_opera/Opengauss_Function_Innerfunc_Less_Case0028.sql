-- @testpoint: opengauss比较操作符<,比较类型:path
drop table if exists ts_zhparser;
CREATE TABLE ts_zhparser(col path, col1 path);
INSERT INTO ts_zhparser VALUES(path'(1,1),(2,2),(3,3)',path'(1,1),(2,2),(4,4)');
select * from ts_zhparser where col < col1;
drop table if exists ts_zhparser;