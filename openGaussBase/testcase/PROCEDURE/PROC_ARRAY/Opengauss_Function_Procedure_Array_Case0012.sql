-- @describe:存储过程中数组函数的使用 array_dims

--创建存储过程
CREATE OR REPLACE procedure pro_record_012() AS
declare
sqlstr varchar(1024);
begin
create table test_array_012(
items text,
id int
);
sqlstr := 'insert into test_array_012(select array_dims(ARRAY[[1,2,3,4,5],[6,7,8,9,10]]),5)';
execute immediate sqlstr;
end;
/

--调用存储过程
call pro_record_012();

--查看表数据
select * from test_array_012;

--删除表
drop table test_array_012;

--删除存储过程
drop procedure pro_record_012;