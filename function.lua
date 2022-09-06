-- 函数的基本格式
-- function 函数名(参数列表)
--     函数体
-- end
function testHello(test)
    for k, v in pairs(test) do
        print(k, v)
    end
    print("cty is comming!")
end
testHello({
    name = "cty",
    age = 20
})
print("------cty---------")
-- 冒号操作符
-- 冒号操作符是一种特殊的语法糖，它可以让我们在调用方法时，不必显示地传入self参数。
-- 语法格式：
-- object:method(...)
-- 等价于
-- object.method(object, ...)
-- 例如：
local a = {
    name = "cty",
    age = 20,
    sayHello = function(self)
        print("hello, my name is " .. self.name)
    end
}
a:sayHello() -- hello, my name is cty
-- 等价于
a.sayHello(a) -- hello, my name is cty
-- 默认参数
-- 在Lua中，函数的参数是没有默认值的，如果没有传入参数，那么参数的值就是nil。
-- 但是，我们可以通过一些技巧来实现函数的默认参数。
-- 例如：
function testDefaultParam(a, b, c)
    a = a or 1
    b = b or 2
    c = c or 3
    print(a, b, c)
end
testDefaultParam(1, 2, 3) -- 1 2 3
-- 多返回值
-- 在Lua中，函数可以返回多个值，这些值用逗号分隔。
-- 例如：
function testMultiReturn()
    return 1, 2, 3
end
local a, b, c = testMultiReturn()
print(a, b, c) -- 1 2 3
print(testMultiReturn()) -- 1 2 3
print("------cty---------")
-- lua会根据函数的被调用情况调整返回值的数量。
-- 如果作为单独语句调用，返回值全丢弃
-- 如果作为表达式调用，只保留第一个返回值
-- 只有当一个函数是一系列表达式中的最后一个或者唯一的表达式时，才会产生尽可能多的返回值来匹配待赋值变量
-- 例如：
x, y, z = 1, testMultiReturn() -- x=1, y=1, z=2
x, y, z = testMultiReturn(), 1 -- x=1, y=1, z=nil
function testABC(a, b, c)
    print("a=", a, "b=", b, "c=", c)
end
testABC(5, testMultiReturn()) -- a=5, b=1, c=2
testABC(testMultiReturn(), 5) -- a=1, b=5, c=nil
t = {testMultiReturn()} -- t={1, 2, 3}
t = {testMultiReturn(), 5} -- t={1, 5}
print("------cty---------")
for k, v in pairs(t) do
    print(k, v)
end
print("------cty---------")
-- 可变长参数函数
function add(...)
    local a, b = ... -- 赋值
    local s = 0
    for _, v in ipairs {...} do
        s = s + v
    end
    -- 传参
    return add2(...)
end
function add2(...)
    local s = 0
    -- 遍历
    for _, v in ipairs {...} do
        s = s + v
    end
    return s
end
print(add(1, 2, 4, 5, 6))
-- {...} 表示一个由所有变长参数构成的数组
-- ... 被称为可变长参数表达式
-- 一个函数最多只能有一个可变长参数表达式并且必须位于参数列表的最后
-- 另一种遍历可变长参数的方法是使用参数select
-- select(n, ...) 返回第n个参数
-- select("#", ...) 返回可变长参数的个数
print("------cty---------")
function add3(...)
    local s = 0
    for i = 1, select("#", ...) do
        s = s + select(i, ...) -- 在加法中虽然返回多个，但只有第一个有效，在参数少时，这种方案甚至更快，因为避免了创建新表。但参数多了之后创建函数开销较大
    end
    return s
end
print(add3(1, 2, 3, 4, 5))
-- table.unpack和table.pack
-- table.unpack是一个函数，它接受一个数组作为参数，返回数组中所有元素
-- table.pack是一个函数，它接受一系列参数，返回一个数组，数组中包含所有参数
-- 例如：
print("------cty---------")
t = {1, 2, 3, 4, 5}
print(add3(table.unpack(t)))
print(add3(table.unpack(table.pack(1, 2, 3, 4, 5))))
-- 虽然unpack一般以数组的长度作为返回的元素个数，但是可以指定第二个参数，表示返回的元素个数
-- 例如：
arr = {"cty", "winner", "king", "ok", "best"}
print(table.unpack(arr, 2, 4)) -- winner king ok
-- 正确的尾调用
-- 尾调用是指一个函数的最后一个动作是调用另一个函数
-- 例如：
function A()
    return B()
end
-- 当被调用的函数执行结束后，调用者函数也会立即结束，因此不会保留任何调用者函数的栈帧
-- lua利用这个特点，使得进行尾调用时不使用任何额外的占空间，因此可以实现无限递归
-- 这种实现叫做尾调用消除(tail-call elimination)
-- 例如：
function foo(n)
    if (n > 0) then
        return foo(n - 1)
    end
end
-- 这个函数可以接受任何参数
-- foo(1234143245234523452345435)
-- 关于尾调用的一个重点是必须是最后一个动作，否则就不是尾调用
-- 例如：
-- return g(x) + 1 不是尾调用，还需要加法
-- return (g(x)) 不是尾调用，需要限制返回值为1个
-- return x or g(x) 不是尾调用，需要限制返回值为1个
-- return x[i].A(x[j] + 12, k + q) 是尾调用，是最后一个动作
