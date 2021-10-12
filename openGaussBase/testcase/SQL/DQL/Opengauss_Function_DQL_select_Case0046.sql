-- @testpoint: DQL语法，结合count(distinct *)

drop table if exists t_agg_join_001;
create table t_agg_join_001(id number,deptno number,name varchar2(20),sal number);
insert into t_agg_join_001 values(1,1,'1aa',120);
insert into t_agg_join_001 values(2,1,'2aa',300);
insert into t_agg_join_001 values(3,1,'3aa',100);
insert into t_agg_join_001 values(4,1,'4aa',99);
insert into t_agg_join_001 values(5,1,'5aa',90);
insert into t_agg_join_001 values(6,2,'6aa',87);
insert into t_agg_join_001 values(7,2,'7aa',500);
insert into t_agg_join_001 values(8,2,'8aa',200);
insert into t_agg_join_001 values(9,2,'9aa',20);
insert into t_agg_join_001 values(10,2,'10aa',30);
insert into t_agg_join_001 values(null,2,'10aa',30);
insert into t_agg_join_001 values(12,2,'10aa',null);

drop table if exists t_agg_join_003;
create table t_agg_join_003(id int,deptno int,name varchar(20),sal int,
id2 int,deptno2 int,name2 varchar(20),sal2 int,
id3 int,deptno3 int,name3 varchar(20),sal3 int,
id4 int,deptno4 int,name4 varchar(20),sal4 int);
insert into t_agg_join_003 values(1,1,'1aa',120,1,1,'1aa',120,1,1,'1aa',120,1,1,'1aa',120);
insert into t_agg_join_003 values(2,1,'2aa',300,2,1,'2aa',300,2,1,'2aa',300,2,1,'2aa',300);
insert into t_agg_join_003 values(3,1,'3aa',100,3,1,'3aa',100,3,1,'3aa',100,3,1,'3aa',100);
insert into t_agg_join_003 values(7,2,'7aa',500,7,2,'7aa',500,7,2,'7aa',500,7,2,'7aa',500);
insert into t_agg_join_003 values(8,2,'8aa',200,8,2,'8aa',200,8,2,'8aa',200,8,2,'8aa',200);
insert into t_agg_join_003 values(9,2,'9aa',20,9,2,'9aa',20,9,2,'9aa',20,9,2,'9aa',20);
insert into t_agg_join_003 values(null,2,'10aa',30,null,2,'10aa',30,null,2,'10aa',30,null,2,'10aa',30);


select count(distinct b.id), CORR(a.deptno,a.sal) from t_agg_join_001 a right join t_agg_join_003 b on a.name=b.name group by b.name2 order by 1;

drop table t_agg_join_001;
drop table t_agg_join_003;