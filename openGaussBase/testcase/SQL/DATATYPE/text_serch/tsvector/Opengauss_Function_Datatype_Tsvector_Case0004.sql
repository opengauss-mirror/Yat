-- @testpoint: 位置信息可以用于进行排名，相同词的重复位会被忽略掉

select 'a:1 fat:2 cat:3 sat:4 on:5 a:6 mat:7 and:8 ate:9 a:10 fat:11 rat:12'::tsvector;
