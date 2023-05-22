-- @testpoint: 创建快照后使用kmeans算子结合快照创建model

--step1:建表并插入数据;expect: 建表并插入数据成功
drop table if exists t_snapshot_tab_0006;
create table t_snapshot_tab_0006(id integer not null,"position" double precision[] not null,closest_centroid integer not null, l1_distance double precision not null, l2_distance double precision not null,l2_squared_distance double precision not null,linf_distance double precision not null );
insert into t_snapshot_tab_0006 values(214,'{82.2331969052000034,52.153098620199998,64.0339866000999933,-.325398639699999981,64.6012142075999947,81.5399670644999952,59.6012626708999989}',3,10.0679804578999992,4.35061571650000012,18.9278571126999999,2.38415523010000019),(215,'{83.2331969052000034,52.153098620199998,64.0339866000999933,-.325398639699999981,64.6012142075999947,81.5399670644999952,59.6012626708999989}',3,10.0679804578999992,4.35061571650000012,18.9278571126999999,2.38415523010000019);

--step2:创建快照;expect: 创建成功
create snapshot s_snapshot_s1@1.0 as select * from t_snapshot_tab_0006;

--step3:创建训练集与测试集;expect: 创建训练集与测试集成功
sample snapshot s_snapshot_s1@1.0 stratify by position as _test at ratio .2,as _train at ratio .8 comment is 'training';

--step4:创建model;expect: 创建成功
create model m_model_snapshot_0006 using kmeans from (select position from s_snapshot_s1@1.0) with max_iterations=50,num_features = 7;

--step5:查找系统表;expect: 返回创建model的信息
select hyperparametersvalues from gs_model_warehouse where modelname='m_model_snapshot_0006';

--step6:清理环境;expect: 清理成功
purge snapshot s_snapshot_s1_train@1.0;
purge snapshot s_snapshot_s1_test@1.0;
purge snapshot s_snapshot_s1@1.0;
drop model m_model_snapshot_0006;
drop table t_snapshot_tab_0006;