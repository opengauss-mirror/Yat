-- @testpoint: instr函数参数与btrim结合使用
SELECT instr(btrim('kasfgkjsdf','df'),'k',1,2) from sys_dummy;

