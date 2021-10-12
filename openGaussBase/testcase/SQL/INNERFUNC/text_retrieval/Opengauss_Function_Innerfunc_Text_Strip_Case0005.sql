-- @testpoint: 文本检索函数strip()处理被to_tsvector（）函数解析标准化之后的文本

drop table if exists ts_zhparser;
create table ts_zhparser(id int, body text);
insert into ts_zhparser values(2, 'cat dat');
select strip(to_tsvector(body)) from ts_zhparser;

--清理环境
drop table if exists ts_zhparser;