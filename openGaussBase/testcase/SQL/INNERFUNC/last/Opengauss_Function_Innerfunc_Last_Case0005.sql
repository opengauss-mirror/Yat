-- @testpoint: last函数返回第一个输入，若无输入，则返回一个空行：分区表

--建表
--学生表
drop table if exists student;
drop table if exists score;
create table student(
s_id integer(20),
s_name varchar(20) ,
s_birth date,
s_sex varchar(10) )
partition by range(s_id)
(
partition p1 values less than(10),
partition p2 values less than(20),
partition p3 values less than(30),
partition p4 values less than(40),
partition p5 values less than(maxvalue)
);

--成绩表
create table score(
s_id integer(20),
c_id  integer(20),
s_score float(3))
partition by range(s_score)
(
partition p1 values less than(60),
partition p2 values less than(80),
partition p3 values less than(maxvalue)
);

--表中未插入数据，使用last函数，返回一个空行
select last(s_name) from student;
select last(s_name), last(s_id) from student;
select last(s_score) from score;
select last(c_id), last(s_score) from score;

--表中插入数据，使用last函数，返回最后一个输入
insert into student values (1,'zhaolei',null,'男');
insert into student values (2,'zhoumei','1991-12-01','女');
insert into student values (3,'zhuzhu','1991-06-01','男');
insert into student values (4,'lilei','1992-05-01','男');
insert into student values (null,'lihua','1991-03-01','男');
insert into student values (1,'zhangsan','1992-08-01','男');
insert into student values (2,'sunjin','1991-09-01','女');
insert into student values (3,'wangwu','1992-10-01','女');
insert into student values (4,null,'1990-11-01','女');
insert into student values (5,'ninghao','1993-12-01','女');
insert into score values(1, 101, 69.5),(1, 101, 80);
insert into score values(2, 102, 70),(2, 102, 82);
insert into score values(3, 103, 71),(3, 103, 93);
insert into score values(4, 104, 85),(4, 104, 85);
insert into score values(5, 105, 73),(5, 105, 91);
insert into score values(1, 106, null);
insert into score values(2, 107, 75);
insert into score values(3, null, 78);
insert into score values(4, 109, 86);
insert into score values(null, 110, 99);

--与group by，order by，having  结合使用
select  last(s_name order by s_id) from student;
select s_name, last(s_id) as id from student group by s_name order by s_name;
select s_birth, last(s_id ) from student group by s_birth order by s_birth;
select s_id, last(s_name) from student group by s_id having s_id > 5 order by s_id;
select last(s_name order by s_id) from student group by s_name;
select s_sex,last(s_birth) from student group by s_sex order by s_sex;
select  last(s_score order by s_score) from score;
select s_score, last(s_score) from score group by s_score order by s_score;
select st.s_id,last(sc.s_score) as chenji from score as sc ,student as st where st.s_sex = '女' group by st.s_id  order by st.s_id;
select sc.s_id,last(sc.s_score) from score as sc ,student as st where st.s_sex = '女' group by sc.s_id order by sc.s_id;
select sc.s_id,last(st.s_name) from score as sc inner join student as st on sc.s_id = st.s_id
where st.s_sex = '女' group by sc.s_id order by sc.s_id;

--输入包含null，并排序(nulls last,nulls last)
select last(s_name order by s_id nulls last) from student;
select s_name, last(s_birth order by s_birth  nulls last) from student group by s_name order by s_name;
select s_id, last(s_score order by s_score desc  nulls last) from score group by s_id;
select c_id, last(s_score order by s_score desc  NULLS last) from score group by c_id having c_id > 102 order by c_id;
select st.s_id,last(s_score order by s_score NULLS last) from score as sc inner join student as st on sc.s_id = st.s_id
where st.s_sex = '女' group by st.s_id order by st.s_id;

--与函数嵌套使用
select char_length(last(s_name order by s_name)) from student;
select isfinite(last(s_birth order by s_birth)) from student;
select ceil(last(s_score order by s_score)) from score;
select last(c_id order by s_id nulls first)as id,first(s_score) as score from score;

--清理环境
drop table if exists student cascade;
drop table if exists score cascade;