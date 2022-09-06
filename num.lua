-- 数值
-- 在lua中大多数情况下不需要区分整数和浮点数
print(1 == 1.0) -- true
print(0.2e3 == 200) -- true
-- 也可以区别开
print(math.type(1)) -- integer
print(math.type(1.0)) -- float
-- 数值运算
print(1 + 2) -- 3
print(1 - 2) -- -1
print(1 * 2) -- 2
print(1 / 2) -- 0.5
print(1 % 2) -- 1
print(2 ^ 2) -- 4
print(3 // 2) -- 1 floor除法
print(3.0 // 2) -- 1.0
-- 随机数
math.randomseed() -- 范围为0-1的随机实数
math.randomseed(6) -- 1-6的整数：模拟掷骰子
math.randomseed(1, 3) -- 1-3的整数
math.randomseed(os.time()) -- 设置随机种子
-- 取整
print(math.floor(1.2)) -- 1
print(math.ceil(3.3)) -- 4
print(math.modf(3.3)) -- 3, 0.3
