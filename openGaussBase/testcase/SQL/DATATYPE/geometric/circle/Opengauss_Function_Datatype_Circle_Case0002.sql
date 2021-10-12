-- @testpoint: circle类型，使用<(x,y),r>方式插入负数坐标值(圆心)

drop table if exists test_circle02;
create table test_circle02 (name circle);
insert into test_circle02 values (circle '<(-1,-1),2>');
insert into test_circle02 values (circle '<(-1.2,-1.3),2.5>');
insert into test_circle02 values (circle '<(-11.233,-10),22>');
select * from test_circle02;
drop table test_circle02;