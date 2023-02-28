-- @testpoint: 验证list-hash分区表analyze分区语法(主表指定非默认tablespace)，部分场景合理报错

drop tablespace if exists ts_b_analyze_par_0046;
create tablespace ts_b_analyze_par_0046 relative location 'ts_b_analyze_par_0046';
drop table if exists t_b_analyze_par_0046;
create table t_b_analyze_par_0046(c1 char(1),c2 int,c3 int primary key)
tablespace ts_b_analyze_par_0046
partition by list(c1) subpartition by hash(c2) 
(
  partition p1 values ('a','b')
  (
    subpartition p1_1,
    subpartition p1_2
  ),
  partition p2 values ('c','d')
  (
    subpartition p2_1,
    subpartition p2_2
  ),
  partition p3 values ('e','f')
  (
    subpartition p3_1,
    subpartition p3_2
  )
);
create index i_b_analyze_par_0046_1 on t_b_analyze_par_0046 (c1) global;
create index i_b_analyze_par_0046_2 on t_b_analyze_par_0046 (c2) local;
insert into t_b_analyze_par_0046 values
  ('a',1,1),
  ('b',2,2),
  ('c',3,3),
  ('d',4,4);

select relname,boundaries,parttype from pg_partition where parentid in (select parentid from pg_partition where relname = 't_b_analyze_par_0046') or parentid in (select oid from pg_partition where parentid in (select parentid from pg_partition where relname = 't_b_analyze_par_0046')) order by relname;

-- analyze一个分区，验证成功
alter table t_b_analyze_par_0046 analyze partition p1;
select * from t_b_analyze_par_0046 partition(p1) order by c1;
-- analyze多个分区，验证成功
alter table t_b_analyze_par_0046 analyze partition p1,p2;
select * from t_b_analyze_par_0046 partition(p1) order by c1;
select * from t_b_analyze_par_0046 partition(p2) order by c1;
-- analyze所有分区，验证成功
alter table t_b_analyze_par_0046 analyze partition all;
select * from t_b_analyze_par_0046 order by c1;
-- analyze无数据分区，验证成功
alter table t_b_analyze_par_0046 analyze partition p3;
select * from t_b_analyze_par_0046 partition(p3) order by c1;
-- analyze不存在分区，合理报错
alter table t_b_analyze_par_0046 analyze partition pnull;
-- analyze二级分区，合理报错
alter table t_b_analyze_par_0046 analyze partition p1_1;
alter table t_b_analyze_par_0046 analyze subpartition p1_1;
alter table t_b_analyze_par_0046 analyze subpartition p1_1,p1_2;
alter table t_b_analyze_par_0046 analyze subpartition all;
select * from t_b_analyze_par_0046 order by c1;

select relname,boundaries,parttype from pg_partition where parentid in (select parentid from pg_partition where relname = 't_b_analyze_par_0046') or parentid in (select oid from pg_partition where parentid in (select parentid from pg_partition where relname = 't_b_analyze_par_0046')) order by relname;

-- 清理环境
drop table t_b_analyze_par_0046;
drop tablespace ts_b_analyze_par_0046;

