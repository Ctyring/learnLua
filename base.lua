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
