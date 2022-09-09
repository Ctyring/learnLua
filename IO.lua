-- 简单IO模型
-- io.input() -- 改变当前的输入流
-- io.output() -- 改变当前的输出流
-- 简单IO模型不能处理异常
-- io.write -- 输出到当前输出流，可以使用多个参数
a, b, c = 1, 2, 3
io.write(a, b, c)
io.write(string.format("%d %d %d\n", a, b, c))
-- 原则上只在用完即弃的测试代码中使用print
-- io.read -- 从当前输入流读取字符串
-- t = io.read("n") -- 读取一个数字
-- io.write(t)
-- t = io.read("a") -- 读取整个文件
-- io.write(t)
io.read("l") -- 读取下一行（丢弃换行符）
io.read("L") -- 读取下一行（保留换行符）
io.read(num) -- 以字符串读取num个字符
io.lines() -- 以迭代器的方式读取文件
local count = 0
for line in io.lines() do
    count = count + 1
end

-- 完整IO模型
-- io.open -- 打开文件
-- io.close -- 关闭文件
-- io.flush -- 刷新缓冲区
-- io.tmpfile -- 创建临时文件
-- io.type -- 检查文件类型
-- io.output("newoutput") -- 改变当前输出流
local temp = io.input()
io.input("newinput")
io.input():close() -- 关闭当前输入流
io.input(temp) -- 恢复此前输入流
-- io.seek 文件位置
function func(file)
    local curr = file:seek() -- 返回当前位置
    local size = file:seek("end") -- 返回文件大小
    file:seek("set", curr) -- 恢复当前位置
    return size();
end

-- 运行程序命令
-- os.execute -- 运行一个系统命令
-- os.exit -- 退出程序
-- os.getenv -- 获取环境变量
-- os.remove -- 删除文件
