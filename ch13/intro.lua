t = {}
print(getmetatable(t))

t1 = {}
setmetatable(t, t1)
assert(getmetatable(t) == t1)

print(getmetatable("hi"))
print(getmetatable(10))