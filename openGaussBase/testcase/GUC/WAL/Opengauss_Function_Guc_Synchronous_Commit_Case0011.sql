-- @testpoint: 查询系统表pg_settings，检查参数的合法取值
--查看当前值以及有效取值，会隐藏同义功能词,enumvals取值local,remote_receive,remote_write,remote_apply,on,off
select name,vartype,enumvals from pg_settings where name = 'synchronous_commit';