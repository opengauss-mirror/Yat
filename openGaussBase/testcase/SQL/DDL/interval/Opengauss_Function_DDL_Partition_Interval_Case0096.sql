-- @testpoint: interval分区,ALTER TABLE DROP PARTITION分区不存在时合理报错
drop table if exists my_ptb1;

create table my_ptb1(
col_1 smallint,
col_2 char(30),
col_3 int,
col_4 date,
col_5 boolean,
col_6 nchar(30),
col_7 float
)
partition by range (col_4) interval ('1 month')
(partition my_ptb1_p1 values less than ('2020-03-01'),
partition my_ptb1_p2 values less than ('2020-04-01'));

insert into my_ptb1 values (1,'aaa',1,'2020-02-23',true,'aaa',1.1);
insert into my_ptb1 values (2,'bbb',2,'2020-03-23',false,'bbb',2.2);
insert into my_ptb1 values (3,'ccc',3,'2020-04-23',true,'ccc',3.3);
insert into my_ptb1 values (4,'ddd',4,'2020-05-23',false,'ddd',4.4);

select relname, parttype, partstrategy, boundaries,reltablespace from pg_partition
where parentid = (select oid from pg_class where relname = 'my_ptb1') order by relname;

alter table my_ptb1 drop partition my_ptb1_p8;
alter table my_ptb1 drop partition sys_p9;
alter table my_ptb1 drop partition for ('2023-04-01');

select relname, parttype, partstrategy, boundaries,reltablespace from pg_partition
where parentid = (select oid from pg_class where relname = 'my_ptb1') order by relname;

drop table if exists my_ptb1;