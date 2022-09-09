n = int(input())
a = 1
b = 2
c = 1
ans = 1
for i in range(n-1):
    if (i % 2) == 1:
        ans += a/b
    else:
        ans -= a/b
    temp = c
    c = b
    b += temp
    a += 1

print("{:.6f}".format(ans))
