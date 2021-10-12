-- @testpoint: 验证匿名块内变量是否区分大小写

drop table if exists stu;
create table stu(
sno int primary key,
sname varchar2(20),
sage number(2),
ssex varchar2(5)
);

insert into stu values (001,'张三',23,'男');
insert into stu values (002,'李四',23,'男');
insert into stu values (003,'吴鹏',25,'男');
insert into stu values (004,'琴沁',20,'女');
insert into stu values (005,'王丽',20,'女');
insert into stu values (006,'李波',21,'男');
insert into stu values (007,'刘玉',21,'男');
insert into stu values (008,'萧蓉',21,'女');
insert into stu values (009,'陈萧晓',23,'女');
insert into stu values (010,'陈美',22,'女');

declare
v_name varchar(9);
begin
select sname into v_name from stu where sname='刘玉';
raise info ':%',V_NAME;
end;
/

--清理环境
drop table stu;