-- @testpoint: 多次to_clob

select to_clob(to_char(to_clob(to_char(4))));