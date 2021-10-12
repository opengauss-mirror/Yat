-- @testpoint: 列存普通表创建唯一索引，删除原有字段

--测试点一:列存普通表,删除原有字段后,创建唯一索引,插入数据
--step1:测试点一,创建列存普通表   expect:成功
drop table if exists t_columns_unique_index_0065_01;
create table t_columns_unique_index_0065_01(id1 int,id2 int,id3 int) with(orientation=column);

--step2:测试点一,删除原有字段   expect:成功
alter table t_columns_unique_index_0065_01 drop id3;

--step3:测试点一,添加唯一索引   expect:成功
create unique index i_columns_unique_index_0065_01 on t_columns_unique_index_0065_01 using btree(id1,id2);

--step4:测试点一,插入数据   expect:成功
insert into t_columns_unique_index_0065_01 values(generate_series(1,100),generate_series(1,100));

--step5:测试点一,查看数据   expect:成功
select count(*) from t_columns_unique_index_0065_01;

--step6:测试点一,清理环境   expect:成功
drop table t_columns_unique_index_0065_01 cascade;


--测试点二:列存普通表,创建唯一索引后,删除原有字段,插入数据
--step1:测试点二,创建列存普通表   expect:成功
drop table if exists t_columns_unique_index_0065_02;
create table t_columns_unique_index_0065_02(id1 int,id2 int) with(orientation=column);

--step2:测试点二,创建唯一索引   expect:成功
create unique index i_columns_unique_index_0065_02 on t_columns_unique_index_0065_02 using btree(id1,id2);

--step3:测试点二,删除原有字段   expect:成功
alter table t_columns_unique_index_0065_02 drop id2;

--step4:测试点二,插入数据   expect:成功
insert into t_columns_unique_index_0065_02 values(generate_series(1,100));

--step5:测试点二,查看数据   expect:成功
select count(*) from t_columns_unique_index_0065_02;

--step6:测试点二,清理环境   expect:成功
drop table t_columns_unique_index_0065_02 cascade;

