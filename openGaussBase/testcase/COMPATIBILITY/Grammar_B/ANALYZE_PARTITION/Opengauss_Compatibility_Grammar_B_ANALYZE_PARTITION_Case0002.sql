-- @testpoint: 验证analyze分区语法对临时表执行，合理报错
drop table if exists t_b_analyze_par_0002;
create temp table t_b_analyze_par_0002(c1 int,c2 text);
insert into t_b_analyze_par_0002 values(1,'a'),(2,'b'),(3,'c');
-- 合理报错
alter table t_b_analyze_par_0002 analyze partition p1;
alter table t_b_analyze_par_0002 analyze partition p1,p2;
alter table t_b_analyze_par_0002 analyze partition all;
drop table t_b_analyze_par_0002;

