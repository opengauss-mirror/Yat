--  @testpoint:openGauss关键字strip(非保留),删除tsvector类型单词中的position和权值
SELECT strip('fat:2,4 cat:3 rat:5A'::tsvector);
