-- @testpoint: isclosed函数测试
--图形是否为闭合路径
SELECT isclosed(path '((0,0),(1,1),(2,0))') AS RESULT;