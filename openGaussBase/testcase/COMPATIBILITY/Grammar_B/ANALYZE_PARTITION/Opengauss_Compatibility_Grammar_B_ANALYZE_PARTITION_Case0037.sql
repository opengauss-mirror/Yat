-- @testpoint: 验证list-range分区表analyze分区语法(segment=on)，部分场景合理报错

drop table if exists t_b_analyze_par_0037;
create table t_b_analyze_par_0037(c1 int,c2  char(1),c3 int primary key)
with (segment=on)
partition by list(c2) subpartition by range(c1) 
(
  partition p1 values ('a')
  (
    subpartition p1_1 values less than (100),
    subpartition p1_2 values less than (200)
  ),
  partition p2 values ('b')
  (
    subpartition p2_1 values less than (100),
    subpartition p2_2 values less than (200)
  ),
  partition p3 values ('c')
  (
    subpartition p3_1 values less than (100),
    subpartition p3_2 values less than (200)
  )
);
create index i_b_analyze_par_0037_1 on t_b_analyze_par_0037 (c1) global;
create index i_b_analyze_par_0037_2 on t_b_analyze_par_0037 (c2) local;
insert into t_b_analyze_par_0037 values
  (1,'a',1),
  (101,'a',2),
  (2,'b',3),
  (102,'b',4);

select relname,boundaries,parttype from pg_partition where parentid in (select parentid from pg_partition where relname = 't_b_analyze_par_0037') or parentid in (select oid from pg_partition where parentid in (select parentid from pg_partition where relname = 't_b_analyze_par_0037')) order by relname;

-- analyze一个分区，验证成功
alter table t_b_analyze_par_0037 analyze partition p1;
select * from t_b_analyze_par_0037 partition(p1) order by c1;
-- analyze多个分区，验证成功
alter table t_b_analyze_par_0037 analyze partition p1,p2;
select * from t_b_analyze_par_0037 partition(p1) order by c1;
select * from t_b_analyze_par_0037 partition(p2) order by c1;
-- analyze所有分区，验证成功
alter table t_b_analyze_par_0037 analyze partition all;
select * from t_b_analyze_par_0037 order by c1;
-- analyze无数据分区，验证成功
alter table t_b_analyze_par_0037 analyze partition p3;
select * from t_b_analyze_par_0037 partition(p3) order by c1;
-- analyze不存在分区，合理报错
alter table t_b_analyze_par_0037 analyze partition pnull;
-- analyze二级分区，合理报错
alter table t_b_analyze_par_0037 analyze partition p1_1;
alter table t_b_analyze_par_0037 analyze subpartition p1_1;
alter table t_b_analyze_par_0037 analyze subpartition p1_1,p1_2;
alter table t_b_analyze_par_0037 analyze subpartition all;
select * from t_b_analyze_par_0037 order by c1;

select relname,boundaries,parttype from pg_partition where parentid in (select parentid from pg_partition where relname = 't_b_analyze_par_0037') or parentid in (select oid from pg_partition where parentid in (select parentid from pg_partition where relname = 't_b_analyze_par_0037')) order by relname;

-- 清理环境
drop table t_b_analyze_par_0037;
