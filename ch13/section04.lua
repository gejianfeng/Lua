Window = {}
Window.prototype = {x = 0, width = 100, height = 100}
Window.mt = {}

function Window.new(o)
	setmetatable(o, Window.mt)
	return o
end

Window.mt.__index = function(table, key)
	return Window.prototype[key]
end

w = Window.new{x = 10, y = 20}
print(w.width)

function SetDefault(t, d)
	local mt = {__index = function() return d end}
	setmetatable(t, mt)
end

tab = {x = 10, y = 20}
print(tab.x, tab.z)
SetDefault(tab, 0)
print(tab.x, tab.z)

t = {}

local _t = t

t = {}

local mt = {
	__index = function(t, k)
		print("* access to element " .. tostring(k))
		return _t[k]
	end,

	__newindex = function(t, k, v)
		print("* update of element " .. tostring(k) .. " to " .. tostring(v))
		_t[k] = v
	end
}

setmetatable(t, mt)

t[2] = "hello"
print(t[2])

function ReadOnly(t)
	local proxy = {}
	
	local mt = {
		__index = t,
		__newindex = function(t, k, v)
			error("attempt to update a read-only table", 2)
		end
	}

	setmetatable(proxy, mt)
	return proxy
end

days = ReadOnly{"Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"}
print(day[1])
days[2] = "Noday"
