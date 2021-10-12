-- @testpoint: 表和锁（ROW SHARE）
drop table if exists table_2;
create table table_2(id int,sname char(20),city varchar(20),number number);
START TRANSACTION;
LOCK TABLE table_2 IN ROW SHARE MODE;
select * from table_2;
DELETE FROM table_2;
COMMIT;
DROP TABLE if exists table_2;