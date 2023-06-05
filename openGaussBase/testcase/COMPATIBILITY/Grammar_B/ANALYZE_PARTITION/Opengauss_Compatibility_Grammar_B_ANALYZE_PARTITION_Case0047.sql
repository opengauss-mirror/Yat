-- @testpoint: 验证has-range分区表analyze分区语法，部分场景合理报错

drop table if exists t_b_analyze_par_0047;
create table t_b_analyze_par_0047(c1 int primary key,c2 int,c3 int)
partition by hash(c1) subpartition by range(c2) 
(
  partition p1
  (
    subpartition p1_1 values less than (100),
    subpartition p1_2 values less than (200)
  ),
  partition p2
  (
    subpartition p2_1 values less than (100),
    subpartition p2_2 values less than (200)
  ),
  partition p3
  (
    subpartition p3_1 values less than (100),
    subpartition p3_2 values less than (200)
  )
);
create index i_b_analyze_par_0047_1 on t_b_analyze_par_0047 (c1) global;
create index i_b_analyze_par_0047_2 on t_b_analyze_par_0047 (c2) local;
insert into t_b_analyze_par_0047 values
  (1,1,1),
  (2,101,2),
  (7,1,3),
  (4,101,4),
  (5,1,5),
  (19,101,6);

select relname,boundaries,parttype from pg_partition where parentid in (select parentid from pg_partition where relname = 't_b_analyze_par_0047') or parentid in (select oid from pg_partition where parentid in (select parentid from pg_partition where relname = 't_b_analyze_par_0047')) order by relname;

-- analyze一个分区，验证成功
alter table t_b_analyze_par_0047 analyze partition p1;
-- analyze多个分区，验证成功
alter table t_b_analyze_par_0047 analyze partition p1,p2;
-- analyze所有分区，验证成功
alter table t_b_analyze_par_0047 analyze partition all;
-- analyze无数据分区，验证成功
alter table t_b_analyze_par_0047 analyze partition p3;
-- analyze不存在分区，合理报错
alter table t_b_analyze_par_0047 analyze partition pnull;
-- analyze二级分区，合理报错
alter table t_b_analyze_par_0047 analyze partition p1_1;
alter table t_b_analyze_par_0047 analyze subpartition p1_1;
alter table t_b_analyze_par_0047 analyze subpartition p1_1,p1_2;
alter table t_b_analyze_par_0047 analyze subpartition all;
select * from t_b_analyze_par_0047 order by c1;

select relname,boundaries,parttype from pg_partition where parentid in (select parentid from pg_partition where relname = 't_b_analyze_par_0047') or parentid in (select oid from pg_partition where parentid in (select parentid from pg_partition where relname = 't_b_analyze_par_0047')) order by relname;

-- 清理环境
drop table t_b_analyze_par_0047;
