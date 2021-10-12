-- @testpoint: opengauss关键字float(非保留)，自定义数据类型名为float 合理报错
--关键字float作为数据类型不带引号，创建成功
drop type if exists public.float;
CREATE TYPE public.float AS (f1 int, f2 text);
select typname from pg_type where typname ='public.float';
drop type public.float;


--关键字float作为数据类型加双引号，创建成功
drop type if exists "public.float";
CREATE TYPE "public.float" AS (f1 int, f2 text);
select typname from pg_type where typname ='public.float';
drop type "public.float";

--关键字float作为数据类型加单引号，合理报错
drop type if exists 'public.float';
CREATE TYPE 'public.float' AS (f1 int, f2 text);


--关键字float作为数据类型加反引号，合理报错
drop type if exists `public.float`;
CREATE TYPE `public.float` AS (f1 int, f2 text);