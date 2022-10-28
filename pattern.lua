-- 模式匹配相关的函数
-- string.find(s, pattern, init, plain) 字符串 匹配串 开始位置 是否纯文本(不转义)
s = "hello world"
print(string.find(s, "hello", 1, true))
-- string.match(s, pattern, init) 字符串 匹配串 开始位置
date = "Today is 17/7/1990"
d = string.match(date, "%d+/%d+/%d+")
print(d) -- 17/7/1990
-- string.gsub(s, pattern, repl, n) 字符串 匹配串 替换串 替换次数
s = string.gsub("Lua is cute", "cute", "great")
print(s) -- Lua is great
-- string.gmatch(s, pattern) 字符串 匹配串
-- 返回一个函数，每次调用这个函数，返回一个匹配串
s = "hello world from cty"
words = {}
for word in string.gmatch(s, "%a+") do
    words[#words + 1] = word
end
for i = 1, #words do
    print(words[i])
end
-- lua中的字符分类
-- %a 字母 %c 控制字符 %d 数字 %l 小写字母 %p 标点符号 %s 空白字符 %u 大写字母 %w 单词字符 %x 十六进制数字 %z 空字符
-- 这些类的大小表示类的补集 %A 非字母
-- 魔法字符
-- . ^ $ ( ) [ ] * + - ? %
-- . 匹配除换行符以外的任意字符
-- ^ 匹配字符串的开始
-- $ 匹配字符串的结束
-- () 捕获匹配的子串
-- [] 匹配字符集合
-- * 匹配前一个字符0次或多次
-- + 匹配前一个字符1次或多次，匹配最长序列
-- - 匹配前一个字符0次或多次，匹配最短序列
-- ? 匹配前一个字符0次或1次
-- % 转义魔法字符
-- 模式修饰符
-- i 忽略大小写
-- m 多行模式
-- s 单行模式
-- x 忽略空白字符
-- u UTF-8模式
-- 示例：
-- %a+ 匹配一个或多个字母
-- %a* 匹配0个或多个字母
-- %a? 匹配0个或1个字母
-- %a-%d+ 匹配一个或多个字母后面跟一个或多个数字

-- 捕获机制使用()来实现
pari = "name = cty, age = 18"
name, age = string.match(pari, "name = (%a+), age = (%d+)")
print(name, age) -- cty 18
-- 替换 使用string.gsub
-- string.gsub(s, pattern, repl, n) 字符串 匹配串 替换串 替换次数
-- 第三个参数可以是一个函数，函数的参数是匹配串，返回值是替换串
-- repl可以是一个表，表的键是匹配串，值是替换串
-- 示例：
s = "hello world"
s = string.gsub(s, "(%w+)", "%1 %1")
print(s) -- hello hello world world
s = "hello world"
s = string.gsub(s, "(%w+)", {
    hello = "this",
    world = "cty"
})
print(s) -- this cty
s = "hello world"
s = string.gsub(s, "(%w+)", function(w)
    return w .. " " .. w
end)
print(s) -- hello hello world world
