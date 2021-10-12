-- @testpoint: 文本检索函数strip()处理含有多个位置常量的tsvector类型

drop table if exists ts_zhparser;
create table ts_zhparser(id int, body text);
insert into ts_zhparser values(2, 'a:1 fat:2 cat:3 sat:4 on:5 a:6 mat:7 and:8 ate:9 a:10 fat:11 rat:12');
select strip(body :: tsvector) from ts_zhparser;

--清理环境
drop table if exists ts_zhparser;