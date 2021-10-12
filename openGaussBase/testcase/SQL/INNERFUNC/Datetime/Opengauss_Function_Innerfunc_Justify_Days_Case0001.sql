--  @testpoint: justify_days 不足一个月的天数
drop table if exists test_date01;
create table test_date01 (clo1 interval );
insert into test_date01 values ('1 year 33 months 29 days 1.5 hours 3 m 4 s');
select justify_days(clo1) from test_date01;
SELECT justify_days(interval  '1 year 33 months 29 days 1.5 hours 3 m 4 s');
drop table if exists test_date01;