-- @testpoint: EXPLAIN PLAN语句中参数STATEMENT_ID测试，STATEMENT_ID超过30字节，合理报错
--建表
drop table if exists explain_t22;
create table explain_t22(a int, b int);
--插入数据
insert into explain_t22 values(generate_series(1,500),generate_series(500,10000));
--使用EXPLAIN PLAN语句， statement_id小于30字节,返回EXPLAIN SUCCESS
explain plan set statement_id='TPCH-Q4' for select count(*) from explain_t22;
--查询PLAN_TABLE，标签信息也存储于PLAN_TABLE中
SELECT statement_id,operation FROM PLAN_TABLE;
--使用EXPLAIN PLAN语句， statement_id等于30字节,返回EXPLAIN SUCCESS
explain plan set statement_id='TPCH-Q4YDSFDSJFDKVJKVCXKLDVGVM' for select max(b) from explain_t22;
--查询PLAN_TABLE，标签信息也存储于PLAN_TABLE中
SELECT statement_id,operation FROM PLAN_TABLE;
--使用EXPLAIN PLAN语句， statement_id等于31字节,合理报错,ERROR:  statement_id is too long. Input statement_id length=31, however max length=30
explain plan set statement_id='TPCH-Q4YDSFDSJFDKVJKVCXKLDVGVMG' for select min(b) from explain_t22;
--查询PLAN_TABLE,只有4条记录
SELECT statement_id,operation FROM PLAN_TABLE;
--清理PLAN_TABLE表信息
delete from PLAN_TABLE;
--删表
drop table explain_t22;