-- Lua语言通过table实现了一种简单、统一且高效的方式表示数组、集合记录和其他很多数据结构。
-- Lua还用table来表示包和对象。
-- 当调用函数Math.sin时，对于Lua来说，它从math这个table中检索字符串sin，这个字符串映射的值是函数sin。
-- Lua中的table本质上是一种辅助数组，它的索引可以是数字或这其他任何类型的值，nil除外。
-- 表永远是匿名的。
a = {}
b = a
a["x"] = 10
print(b["x"]) -- 10
-- 以上代码中，a和b都指向同一个table，因此修改a["x"]的值，b["x"]的值也会随之改变。
a = nil
print(b["x"]) -- 10
-- 以上代码中，a被设置为nil，但是b仍然指向table，因此b["x"]的值不会改变。
b = nil
-- 当程序中没有任何变量指向table时，table会被自动回收。
a = {}
a.x = 10
print(a["x"]) -- 10
-- 以上代码中，a.x和a["x"]是等价的。
x = "x"
a[x] = 20
print(a["x"]) -- 20
-- 注意区分带引号和不带引号的情况
-- 表构造器
-- Lua提供了一种简单的方法来创建table，即表构造器。
-- 表构造器是一种用大括号括起来的表达式，表达式的值是构造出的table。
a = {"one", "two", "three"}
print(a[2]) -- two
-- 这里注意索引是从1开始的，而不是0。
-- 记录式表
a = {
    x = 10,
    y = 20
}
print(a["x"]) -- 10
print(a.y) -- 20
-- 注意索引，要加引号
-- 第一种写法能提前判断表的大小，所以运行更快
-- 无论哪种写法都能随时增加或删除元素
a = {
    x = 0,
    y = "cty",
    c = "king"
}
b = {math.sin(0)}
a.z = "把z加入到a中"
a["k"] = "把k加入到a中"
a.x = nil -- 删除a中的x
-- 查看效果
for k, v in pairs(a) do
    print(k, v)
end
-- 这两种构造器都有局限性:比如不能使用负数初始化索引，不能使用不符合规范的表示初始化索引，不能使用表达式初始化索引。
-- 对于这类需求，可以采取更加通用的构造器
a = {
    ["cty"] = "king",
    ["/"] = "slash"
}
-- 数组，列表和序列都只需要使用整型作为索引即可，也不需要初始化
a = {}
for i = 1, 10 do
    a[i] = i
end
-- 序列：序列是一种特殊的数组，它的索引是连续的整数，从1开始。
-- 获取序列的长度
print(#a) -- 10
-- 这种方式只能用于连续的整数索引
-- 如果中间存在空洞(nil值)，建议将数组的长度存储在一个单独的变量中，出于历史原因，往往存在n中
a["n"] = 10
-- 表的遍历
-- pairs函数
-- pairs函数用于遍历表中的所有键值对，它的第一个参数是表，第二个参数是一个可选的初始值。
print("------cty---------")
for a, b in pairs(a) do
    print(a, b)
end
print("------cty---------")
-- pairs函数不能保证遍历的顺序，因此如果需要遍历的顺序是固定的，那么可以使用ipairs函数。
for a, b in ipairs(a) do
    print(a, b)
end
print("------cty---------")
-- 另一种遍历方式是使用数值型for循环(序列才可用)
for k = 1, #a do
    print(k, a[k])
end
print("------cty---------")
for k = 1, 4 do
    print(k, a[k])
end
-- 安全访问
-- 有时候，我们需要访问一个可能不存在的表中的元素，这时候就需要使用安全访问。
-- 安全访问的方式是使用and操作符，它的优先级比点操作符和索引操作符低。
-- 例如，如果我们想访问a.b.c，但是a可能为nil，那么可以使用a and a.b and a.b.c来访问。
-- 但是，这种方式有一个缺点，就是如果a.b为nil，那么a.b.c就会报错。
-- 为了解决这个问题，可以使用下面的方式
print("------cty---------")
a = ((a or {}).b or {}).c
print(a)