-- @testpoint: 建表后，插入数据，查看，更新数据，查询

drop table if exists tbl_05;
create table tbl_05(
id int,
c_varchar varchar(1025) not null default '汉字中国高斯汉字中国高斯汉字中国高斯汉字中国高斯汉字中国高斯汉字中国高斯汉字中国高斯汉字中国高斯汉字中国高斯汉字中国高斯汉字中国高斯汉字中国高斯汉字中国高斯汉字中国高斯汉字中国高斯汉字中国高斯汉字中国高斯汉字中国高斯汉字中国高斯汉字中国高斯汉字中国高斯汉字中国高斯汉字中国高斯汉字中国高斯汉字中国高斯汉字中国高斯汉字中国高斯汉字中国高斯汉字中国高斯汉字中国高斯汉字中国高斯汉字中国高斯汉字中国高斯汉字中国高斯汉字中国高斯汉字中国高斯汉字中国高斯汉字中国高斯汉字中国高斯汉字中国高斯汉字中国高斯汉字中国高斯汉字中国高斯汉字中国高斯汉字中国高斯汉字中国高斯汉字中国高斯汉字中国高斯汉字中国高斯汉字中国高斯汉字中国高斯汉字中国高斯汉字中国高斯汉字中国高斯汉字中国高斯汉字中国高斯汉字中国12');
insert into tbl_05 values(1,default),(2,'aaaaaaadddsfdsfdsfdfsfdsffffffffffffffffffssssdsdsadsdddddddddddsdsdsdsdaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadddsfdsfdsfdfsfdsffffffffffffffffffssssdsdsadsdddddddddddsdsdsdsdaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadddsfdsfdsfdfsfdsffffffffffffffffffssssdsdsadsdddddddddddsdsdsdsdaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadddsfdsfdsfdfsfdsffffffffffffffffffssssdsdsadsdddddddddddsdsdsdsdaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadddsfdsfdsfdfsfdsffffffffffffffffffssssdsdsadsdddddddddddsdsdsdsdaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadddsfdsfdsfdfsfdsffffffffffffffffffssssdsdsadsdddddddddddsdsdsdsdaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadddsfdsfdsfdfsfdsffffffffffffffffffssssdsdsadsdddddddddddsdsdsdsdaaaaaabcd');
select * from tbl_05 order by id;
--更新为1024成功
update tbl_05 set c_varchar = 'aaaaaaadddsfdsfdsfdfsfdsffffffffffffffffffssssdsdsadsdddddddddddsdsdsdsdaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadddsfdsfdsfdfsfdsffffffffffffffffffssssdsdsadsdddddddddddsdsdsdsdaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadddsfdsfdsfdfsfdsffffffffffffffffffssssdsdsadsdddddddddddsdsdsdsdaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadddsfdsfdsfdfsfdsffffffffffffffffffssssdsdsadsdddddddddddsdsdsdsdaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadddsfdsfdsfdfsfdsffffffffffffffffffssssdsdsadsdddddddddddsdsdsdsdaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadddsfdsfdsfdfsfdsffffffffffffffffffssssdsdsadsdddddddddddsdsdsdsdaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadddsfdsfdsfdfsfdsffffffffffffffffffssssdsdsadsdddddddddddsdsdsdsdaaaaaabc5' where id =1;
select * from tbl_05 order by id;
--更新为1025成功
update tbl_05 set c_varchar = 'aaaaaaadddsfdsfdsfdfsfdsffffffffffffffffffssssdsdsadsdddddddddddsdsdsdsdaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadddsfdsfdsfdfsfdsffffffffffffffffffssssdsdsadsdddddddddddsdsdsdsdaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadddsfdsfdsfdfsfdsffffffffffffffffffssssdsdsadsdddddddddddsdsdsdsdaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadddsfdsfdsfdfsfdsffffffffffffffffffssssdsdsadsdddddddddddsdsdsdsdaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadddsfdsfdsfdfsfdsffffffffffffffffffssssdsdsadsdddddddddddsdsdsdsdaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadddsfdsfdsfdfsfdsffffffffffffffffffssssdsdsadsdddddddddddsdsdsdsdaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadddsfdsfdsfdfsfdsffffffffffffffffffssssdsdsadsdddddddddddsdsdsdsdaaaaaabc55' where id =1;
select * from tbl_05 order by id;
drop table tbl_05;