-- @testpoint: 创建列名中含有中文字和特殊字符的表，合理报错
drop table if exists tab24;
drop table if exists tab23;
drop table if exists tab13;
drop table if exists tab26;
drop table if exists tab27;
CREATE table tab02(!和   NUMBER(7));
CREATE table tab03(@差别  NUMBER(7));
CREATE table tab04(%还不   NUMBER(7));
CREATE table tab05(你^我   NUMBER(7));
CREATE table tab06(哈&哈    NUMBER(7));
CREATE table tab07(雪*花    NUMBER(7));
CREATE table tab08(微/软   NUMBER(7));
CREATE table tab11(<你最棒>   NUMBER(7));
CREATE table tab12((厉害了 )  NUMBER(7));
CREATE table tab14({哇哈哈}   NUMBER(7));
CREATE table tab15('哦哦哦'    NUMBER(7));
CREATE table tab16(你说呢:   NUMBER(7));
CREATE table tab17(你说什么;   NUMBER(7));
CREATE table tabl8(没听见,  NUMBER(7));
CREATE table tab19(啊...   NUMBER(7));
CREATE table tab20(七-三   NUMBER(7));
CREATE table tab21(=四  NUMBER(7));
CREATE table tab22(一+一   NUMBER(7));
CREATE table tab24(所谓#   NUMBER(7));
CREATE table tab13("创建表"   NUMBER(7));
CREATE table tab23(a12$表   NUMBER(7));
CREATE table tab26(圆周率Π    NUMBER(7));
CREATE table tab27(创建表    NUMBER(7));
drop table if exists tab23;
drop table if exists tab13;
drop table if exists tab26;
drop table if exists tab27;
drop table if exists tab24;