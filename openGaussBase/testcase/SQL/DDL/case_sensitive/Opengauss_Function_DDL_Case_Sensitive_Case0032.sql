--  @testpoint: --WITH语句验证视图以及视图字段大小写
with
VIEW_3 AS (SELECT A FROM view_3)
select * from VIEW_3;
with
ad as (select * from VIEW_3)
select * from ad;
with
AD as (select * from view_3)
select * from ad;
with
SYS_VIEWS AS (SELECT F FROM view_3)
SELECT * FROM SYS_VIEWS;