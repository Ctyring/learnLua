-- 局部变量
local a = 1
-- 代码块：局部变量的生效范围
do
    local a = 2
    print(a)
end -- 显式声明代码块
print(a)

-- 控制结构
if a < 0 then
    print("a < 0")
elseif a == 0 then
    print("a == 0")
else
    print("a == 0")
end

while a >= 1 do
    a = a - 1
    print(a)
end

repeat
    a = a + 1
    print(a)
until a >= 10

-- 数值型：开始，结束，步长
for i = 1, 10, 1 do
    print(i)
end

-- goto
::label::
print("goto label")
goto label
