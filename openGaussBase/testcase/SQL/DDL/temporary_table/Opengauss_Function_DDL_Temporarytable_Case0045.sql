-- @testpoint: 创建临时表，字段名长度为63
-- @modify at: 2020-11-24
--建表
drop table if exists temp_table_045;
create  temporary table temp_table_045(qwertyuiopqasdfghjklzxcvbnmpolkijuyhtgfrdppoiuytrqwelkijhgfdmnb int);
--插入数据
insert into temp_table_045(qwertyuiopqasdfghjklzxcvbnmpolkijuyhtgfrdppoiuytrqwelkijhgfdmnb) values(generate_series(1,100));
--查询
select count(*) from temp_table_045;
--删表
drop table temp_table_045;

