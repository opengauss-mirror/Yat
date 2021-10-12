-- @testpoint: 创建本地临时表分区表，合理报错
-- @modify at: 2020-11-24
--建表
drop table if exists temp_table_059;
create temporary table temp_table_059
  (
      cd_demo_sk                integer               not null,
      cd_gender                 char(1)                       ,
      cd_marital_status         char(1)                       ,
      cd_education_status       char(20)                      ,
      cd_purchase_estimate      integer                       ,
      cd_credit_rating          char(10)                      ,
      cd_dep_count              integer                       ,
      cd_dep_employed_count     integer                       ,
      cd_dep_college_count      integer
  )
  partition by range (cd_demo_sk)
  (
  partition temp_table_0591 values less than (1000),
  partition temp_table_0592 values less than (7700),
  partition temp_table_0593 values less than (33700),
  partition temp_table_0594 values less than (57300),
  partition temp_table_0595 values less than (135700),
  partition temp_table_0596 values less than (203300),
  partition temp_table_0597 values less than (208700),
  partition temp_table_0598 values less than (238700),
  partition temp_table_0599 values less than (268700),
  partition temp_table_05910 values less than (298700),
  partition temp_table_05911 values less than (338700),
  partition temp_table_05912 values less than (368700),
  partition temp_table_05913 values less than (398700),
  partition temp_table_05914 values less than (438700),
  partition temp_table_05915 values less than (maxvalue)
  );
--清理环境:no need to clean