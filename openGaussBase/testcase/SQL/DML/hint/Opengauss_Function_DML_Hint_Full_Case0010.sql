-- @testpoint: update语句带full测试
update /*+FULL(hint1_index_00000)*/ hint2_index_00000 t1
set t1.CUSTOMER_ID=t1.CUSTOMER_ID+1,t1.CREDIT_LIMIT=t1.CUSTOMER_ID
where t1.CUSTOMER_ID>2;

update /*+FULL(hint_index_00000)*/ hint2_index_00000 t1
set t1.CUSTOMER_ID=t1.CUSTOMER_ID+1,t1.CREDIT_LIMIT=t1.CUSTOMER_ID
where t1.CUSTOMER_ID>2;

update hint2_index_00000 t1
set t1.CUSTOMER_ID=t1.CUSTOMER_ID+1,t1.CREDIT_LIMIT=t1.CUSTOMER_ID
where t1.CUSTOMER_ID>2;

drop table if exists hint_index_00000 CASCADE;
drop table if exists hint2_index_00000;
