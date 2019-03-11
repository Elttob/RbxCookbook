-- Don't require a module until you start using it
-- (modules that return tables only)
-- Useful to avoid deadlocks
-- Use it just like regular require()

local function LazyRequire(mod)
	local proxy = {}
	local mt = {}

	function mt:__index(key)
		return require(mod)[key]
	end

	function mt:__newindex(key, val)
		require(mod)[key] = val
	end

	setmetatable(proxy, mt)
	return proxy
end