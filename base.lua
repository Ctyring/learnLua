-- lua基础数据类型测试
-- 单行注释
--[[
    多行注释
]] -- 关键字约定：_连接大写字母的名字被保留用于Lua内部使用 比如_VERSION
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
print(type(10.4 * 3)) -- number
print(type(print)) -- function
print(type(type)) -- function
print(type(true)) -- boolean
print(type(nil)) -- nil
print(type(type(X))) -- string
-- boolean
-- 只有false和nil为假，其他都为真

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
table.sort(ctytable, function(a, b)
    return a > b
end)
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
