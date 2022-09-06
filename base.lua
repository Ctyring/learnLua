-- lua基础数据类型测试
-- 单行注释
--[[
    多行注释
]]
-- 关键字约定：_连接大写字母的名字被保留用于Lua内部使用 比如_VERSION
-- 八种基本类型：nil boolean number string function userdata thread table
-- nil类型只有一个值nil
-- boolean类型只有两个值false和true
-- number类型表示双精度类型的实浮点数
-- string类型表示不可变的字节数组
-- function类型表示由C或Lua编写的函数
-- userdata类型表示任意存储在变量中的C数据结构
-- thread类型表示执行的独立线路，用于执行协同程序
-- table类型表示Lua中的数组，用来存储任意类型的数据
-- lua中的变量不需要声明，只需要给变量赋值即可
-- lua中的变量默认为全局变量，如果要声明局部变量，需要使用local关键字
-- lua中的变量默认为nil
print("类型测试:")
print(type("Hello World")) -- string
print(type(10.4*3)) -- number
print(type(print)) -- function
print(type(type)) -- function
print(type(true)) -- boolean
print(type(nil)) -- nil
print(type(type(X))) -- string
-- nil测试
print("nil测试:")
print(type(a)) -- nil
-- nil测试
print("nil测试:")
print(nil == nil) -- true
print(nil == false) -- false
print(nil == 0) -- false
print(nil == "") -- false
print(nil == {}) -- false
print(nil == function() end) -- false
print(type(a) == nil) -- false 这里之所以为false是因为type(a)返回的是string类型
print(type(type(a)) == string) -- true
print(type(a) == type(nil)) -- true
print(type(a) == "nil") -- true
-- boolean
-- 只有false和nil为假，其他都为真
-- number
-- number类型有两种内部表现形式：整数和浮点数
-- lua中的整数没有长度限制，但是浮点数有长度限制
-- lua中的整数和浮点数都可以使用科学计数法表示
-- lua中的整数和浮点数都可以使用16进制表示
-- 程序员多数情况下可以选择忽略整数与浮点数之间的差异或者假设完全控制每个数字的内部表现方式。
print("number测试:")
print(0.1e1) -- 1
print(0.1e-1) -- 0.01
print(0xff) -- 255
-- string
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
print(tostring(10.4*3)) -- 31.2
print(tostring(print)) -- function: 0x7f8c0c0a0e60
-- 字符串转数字
print(tonumber("10")) -- 10
print(tonumber("10.4")) -- 10.4
print(tonumber("10.4*3")) -- nil
print(tonumber("hello")) -- nil

-- table
-- lua中的table是一种关联数组，数组的索引可以是数字或者字符串
-- lua中的table是一种动态结构，可以随时添加或者删除数组中的元素
-- lua中的table是一种引用类型，可以通过变量的引用来操作table
-- lua中的table是一种无序结构，不保证table中的元素按照某种顺序排列
-- lua中的table是一种弱引用类型，可以使用弱引用来访问table中的元素
-- lua中的table是一种支持元方法的类型，可以使用元方法来操作table
-- lua中的table是一种支持多维数组的类型
-- table的大小是不固定的，可以根据需要动态的增加或者删除元素
ctytable = {}
-- 指定值
ctytable["name"] = "cty"
ctytable[1] = "hello"
ctytable[2] = "world"
print("table测试:")
print(ctytable["name"]) -- cty
print(ctytable[1] .. ", " .. ctytable[2]) -- hello, world
-- table的基本操作
print("table的基本操作:")
-- table的长度
print(#ctytable) -- 2
-- table的遍历
for k, v in pairs(ctytable) do
    print(k, v)
end
-- table的连接
print("table的连接:")
print(table.concat(ctytable, ", ")) -- hello, world
-- table的插入
print("table的插入:")
table.insert(ctytable, 1, "lua")
for k, v in pairs(ctytable) do
    print(k, v)
end
-- table的移除
print("table的移除:")
table.remove(ctytable, 1)
for k, v in pairs(ctytable) do
    print(k, v)
end
-- table的排序
print("table的排序:")
table.sort(ctytable)
for k, v in pairs(ctytable) do
    print(k, v)
end
-- table的反转
print("table的反转:")
table.sort(ctytable, function(a, b) return a > b end)
for k, v in pairs(ctytable) do
    print(k, v)
end
-- table的清空
print("table的清空:")
ctytable2 = {}
ctytable2[2] = "haha"
ctytable2 = {}
for k, v in pairs(ctytable2) do
    print(k, v)
end
-- table的多维数组
print("table的多维数组:")
ctytable4 = {}
ctytable4[1] = {}
ctytable4[1][1] = "hello"
ctytable4[1][2] = "world"
ctytable4[2] = {}
ctytable4[2][1] = "lua"
ctytable4[2][2] = "cty"
for k, v in pairs(ctytable4) do
    print(k)
    for k2, v2 in pairs(v) do
        print(k2, v2)
    end
end
