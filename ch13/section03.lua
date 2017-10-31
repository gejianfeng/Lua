print({})

Set = {}

local mt = {}

function Set.new(l)
	local set = {}

	setmetatable(set, mt)

	for _, v in pairs(l) do
		set[v] = true
	end

	return set
end

function Set.tostring(set)
	local l = {}

	for e in pairs(set) do
		l[#l + 1] = e
	end

	return "{" .. table.concat(l, ", ") .. "}"
end

mt.__tostring = Set.tostring

s1 = Set.new{10, 4, 5}
print(s1)

mt.__metatable = "not your business"

s1 = Set.new{}
print(getmetatable(s1))

setmetatable(s1, {})