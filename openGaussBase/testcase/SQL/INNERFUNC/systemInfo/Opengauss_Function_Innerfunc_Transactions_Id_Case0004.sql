-- @testpoint: 函数slice(hstore, text[])，提取hstore的子集

select slice('a=>1,b=>2,c=>3'::hstore, array['b','c','x']);
