-- @testpoint: 验证间隔分区表analyze分区语法，部分场景合理报错

drop table if exists t_b_analyze_par_0005;
create table t_b_analyze_par_0005(c1 int primary key,c2 timestamp)
partition by range(c2)
interval('1 day')
(
  partition p1 values less than ('1990-01-01 00:00:00'),
  partition p2 values less than ('1990-01-02 00:00:00'),
  partition p3 values less than ('1990-01-03 00:00:00'),
  partition p4 values less than ('1990-01-04 00:00:00'),
  partition p5 values less than ('1990-01-05 00:00:00'),
  partition p6 values less than ('1990-01-06 00:00:00'),
  partition p7 values less than ('1990-01-07 00:00:00'),
  partition p8 values less than ('1990-01-08 00:00:00'),
  partition p9 values less than ('1990-01-09 00:00:00'),
  partition p10 values less than ('1990-01-10 00:00:00')
) ;
create index i_b_analyze_par_0005_1 on t_b_analyze_par_0005 (c1) global;
create index i_b_analyze_par_0005_2 on t_b_analyze_par_0005 (c2) local;
insert into t_b_analyze_par_0005 values
  (1,'1990-01-01 00:00:00'),
  (2,'1990-01-02 00:00:00'),
  (3,'1990-01-03 00:00:00'),
  (4,'1990-01-04 00:00:00'),
  (5,'1990-01-05 00:00:00');

select relname,boundaries from pg_partition where parentid in (select oid from pg_class where relname = 't_b_analyze_par_0005') order by relname;

-- analyze一个分区，验证成功
alter table t_b_analyze_par_0005 analyze partition p2;
select * from t_b_analyze_par_0005 partition(p2) order by c1;
-- analyze多个分区，验证成功
alter table t_b_analyze_par_0005 analyze partition p3,p4;
select * from t_b_analyze_par_0005 partition(p3) order by c1;
select * from t_b_analyze_par_0005 partition(p4) order by c1;
-- analyze所有分区，验证成功
alter table t_b_analyze_par_0005 analyze partition all;
select * from t_b_analyze_par_0005 order by c1;
-- analyze无数据分区，验证成功
alter table t_b_analyze_par_0005 analyze partition p10;
select * from t_b_analyze_par_0005 partition(p10) order by c1;
-- analyze不存在分区，合理报错
alter table t_b_analyze_par_0005 analyze partition pnull;
select * from t_b_analyze_par_0005 order by c1;

select relname,boundaries from pg_partition where parentid in (select oid from pg_class where relname = 't_b_analyze_par_0005') order by relname;

-- 清理环境
drop table t_b_analyze_par_0005;

