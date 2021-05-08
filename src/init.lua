--[[
	Credit to einsteinK.
	Credit to Stravant for LBI.
	
	Credit to the creators of all the other modules used in this.
	
	Sceleratis was here and decided modify some things.
	
	einsteinK was here again to fix a bug in LBI for if-statements
--]]

local waitDeps = {
	'FiOne';
	'LuaK';
	'LuaP';
	'LuaU';
	'LuaX';
	'LuaY';
	'LuaZ';
}

for i,v in ipairs(waitDeps) do script:WaitForChild(v) end

local luaX = require(script.LuaX)
local luaY = require(script.LuaY)
local luaZ = require(script.LuaZ)
local luaU = require(script.LuaU)
local rerubi = require(script.FiOne)

luaX:init()
local LuaState = {}
return function(str,env)
	local f,writer,buff,name
	pcall(function()
		name = (env.script.Name)
	end)
	
	local ran,error = pcall(function()
		local zio = luaZ:init(luaZ:make_getS(str), nil)
		if not zio then return error() end
		local func = luaY:parser(LuaState, zio, nil, name or "nil")
		writer, buff = luaU:make_setS()
		luaU:dump(LuaState, func, writer, buff)
		f = rerubi(buff.data, env)
	end)
	
	if ran then
		return f,buff.data
	else
		return nil,error
	end
end