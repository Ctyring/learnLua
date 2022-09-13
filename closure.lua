-- 词法定界
-- lua语言可以访问包含其自身的外部函数中的变量
-- 第一类值
-- lua中的函数与其他常见类型的值具有同等权限。一个程序可以将某个函数作为参数传递给另一个函数，也可以将函数作为另一个函数的返回值返回。
-- 第一类值示例
a = {
    p = print
}
a.p("hello, this is cty")
foo = function(x)
    return 2 * x
end
-- 等效于
function foo(x)
    return 2 * x
end
-- 函数的定义实际上就是创建类型为"function"的值，
-- 在lua语言中所有函数都是匿名的，当我们讨论函数名时，实际上指的是保存这个函数的变量名
-- 一个使用函数作为参数的例子
network = {{
    name = "grauna",
    IP = "127.0.0.1"
}, {
    name = "arraial",
    IP = "127.0.0.2"
}, {
    name = "lua",
    IP = "127.0.0.3"
}, {
    name = "derain",
    IP = "128.0.0.1"
}}
table.sort(network, function(a, b)
    return (a.name > b.name)
end)
-- 像sort这种函数被称为高阶函数

-- 定义表中函数
Lib = {}
Lib.foo = function(x)
    return x + 1
end
Lib.goo = function(x)
    return x - 1
end
-- 也可以这样写
Lib = {
    foo = function(x)
        return x + 1
    end,
    goo = function(x)
        return x - 1
    end
}
-- 还可以这样写
Lib = {}
function Lib.foo(x)
    return x + 1;
end
function Lib.goo(x)
    return x - 1;
end
-- 定义局部函数
local function foo(x)
    return x + 1
end
-- 如果是递归函数的话，要先声明一下
local foo
foo = function(x)
    if x <= 1 then
        return 1
    end
    return x + foo(x - 1)
end
print(foo(10))
-- 词法定界
-- 当一个函数A被函数B包含时，A可以访问B的所有局部变量。
function newCounter()
    local i = 0
    return function()
        i = i + 1
        return i
    end
end
c1 = newCounter()
-- 函数作为第一类值，能够逃逸出他们变量的原始定界范围
-- 闭包
-- 闭包是指函数和其所引用的外部环境的组合
print(c1()) -- 1
print(c1()) -- 2
c2 = newCounter()
print(c2()) -- 1
print(c2()) -- 2
print(c2()) -- 3
-- 闭包还可以用来重新定义函数，甚至预定义函数
-- 重定义sin函数
do
    local oldSin = math.sin
    local k = math.pi / 180
    math.sin = function(x)
        return oldSin(x * k)
    end
end
-- 旧的sin就无法再调用了
print(math.sin(90)) -- 1
-- 构建安全的运行时环境：沙盒
-- 通过闭包重定义io.open限制一个程序能访问的文件
do
    local oldOpen = io.open
    local accessOk = function(filename, mode)
        -- 检查文件名是否合法
        return true
    end
    io.open = function(filename, mode)
        if accessOk(filename, mode) then
            return oldOpen(filename, mode)
        else
            return nil, "access denied"
        end
    end
end
