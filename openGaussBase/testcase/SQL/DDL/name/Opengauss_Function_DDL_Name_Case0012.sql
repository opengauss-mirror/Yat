-- @testpoint: 序列名为65位（opengauss中没有明确长度限制，所以现在超出长度会截断并不会报错）


drop  SEQUENCE if exists SAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABBBB65A;
CREATE SEQUENCE  SAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABBBB65A START WITH 10;
drop  SEQUENCE if exists SAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABBBB65A;
