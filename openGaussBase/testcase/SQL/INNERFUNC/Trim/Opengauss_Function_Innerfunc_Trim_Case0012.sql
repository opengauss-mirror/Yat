-- @testpoint: 字符处理函数trim，入参方向输入错误，合理报错

select trim(left 'x' from 'xtomxx');

