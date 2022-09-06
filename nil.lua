-- nil测试
print("nil测试:")
print(type(a)) -- nil
print(nil == nil) -- true
print(nil == false) -- false
print(nil == 0) -- false
print(nil == "") -- false
print(nil == {}) -- false
print(nil == function()
end) -- false
print(type(a) == nil) -- false 这里之所以为false是因为type(a)返回的是string类型
print(type(type(a)) == string) -- true
print(type(a) == type(nil)) -- true
print(type(a) == "nil") -- true
