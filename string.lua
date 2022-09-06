-- Lua中的字符串是不可变值，因此，字符串的操作都是返回新的字符串，而不是修改原字符串
-- 例如
local a = "hello cty"
local b = string.upper(a)
print(a) -- hello cty
print(b) -- HELLO CTY
-- Lua中的字符串是自动内存管理对象
-- lua中的字符串可以用一对单引号或者双引号来表示
-- lua中的字符串可以用两个方括号来表示，两个方括号之间的字符串可以包含任意的字符，包括换行符
print("string测试:")
s = [[
    hello, world
    cty is comming
]]
print(s)
-- 字符串连接
print("字符串连接：")
print("Hello" .. "World") -- HelloWorld
-- 字符串长度
print("字符串长度：")
print(#"Hello World") -- 11
-- 字符串截取
print("字符串截取：")
print(string.sub("hello, world", 1, 5)) -- hello
-- 字符串查找
print("字符串查找：")
print(string.find("hello, world", "world")) -- 8 12
print(type(string.find("hello, world", "world"))) -- table
-- 字符串替换
print("字符串替换：")
print(string.gsub("hello, world", "world", "cty")) -- hello, cty 1
print(type(string.gsub("hello, world", "world", "cty"))) -- table
-- 字符串格式化
print("字符串格式化：")
print(string.format("the value is:%d", 4)) -- the value is:4
-- 字符串分割
print("字符串分割：")
for word in string.gmatch("hello lua this is cty", "%a+") do
    print(word)
end
-- 字符串转换
print("字符串转换：")
-- 其他转字符串
print(tostring(10)) -- 10
print(tostring(10.4 * 3)) -- 31.2
print(tostring(print)) -- function: 0x7f8c0c0a0e60
-- 字符串转数字
print(tonumber("10")) -- 10
print(tonumber("10.4")) -- 10.4
print(tonumber("10.4*3")) -- nil
print(tonumber("hello")) -- nil
-- 指定任意进制
print(tonumber("10", 2)) -- 2
print(tonumber("10", 8)) -- 8
print(tonumber("10", 10)) -- 10
print(tonumber("A", 16)) -- 10
-- 字符串参与数值运算时，会先转换为数字
print("10" + 1) -- 11
-- 字符串编码
print("字符串编码：")
-- string.byte(string, i) 返回第i个字节的编码
print(string.byte("abc", 1)) -- 97
