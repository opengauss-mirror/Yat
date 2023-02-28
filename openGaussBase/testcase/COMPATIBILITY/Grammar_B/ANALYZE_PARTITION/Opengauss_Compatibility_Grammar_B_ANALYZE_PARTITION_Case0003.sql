-- @testpoint: 验证analyze分区语法对全局临时表执行，合理报错
drop table if exists t_b_analyze_par_0003;
create global temp table t_b_analyze_par_0003(c1 int,c2 text);
insert into t_b_analyze_par_0003 values(1,'a'),(2,'b'),(3,'c');
-- 原语法合理报错
alter table t_b_analyze_par_0003 analyze partition p1;
alter table t_b_analyze_par_0003 analyze partition p1,p2;
alter table t_b_analyze_par_0003 analyze partition all;
drop table t_b_analyze_par_0003;
