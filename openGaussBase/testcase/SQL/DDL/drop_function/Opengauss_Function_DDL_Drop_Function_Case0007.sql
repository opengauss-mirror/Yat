--  @testpoint:删除不存在的函数省略IF EXISTS 子句并且添加函数参数，合理报错
--从pg_proc表查询函数名是u_testfun35，该函数不存在
select proname from pg_proc where proname='u_testfun35';
--删除不存在的函数u_testfun35
drop FUNCTION  u_testfun35(i int);