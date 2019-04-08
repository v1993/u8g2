mask = function(tab)
	local newtab = {}
	for k,v in ipairs(tab) do
		newtab[v] = true
	end
	return newtab
end

local file_read = function(fname)
	local f = assert(io.open(fname, 'r'))
	local res = f:read '*a'
	f:close()
	return res
end

local function write_u8g2_d_memory_c(memobj)
	local u8g2_d_memory = assert(io.open('output/u8g2_d_memory.c', 'w'))

	u8g2_d_memory:write([[
/* u8g2_d_memory.c */
/* generated code, codebuild, u8g2 project */

#include "u8g2.h"

]], memobj:getImpls(), '\n', [[
/* end of generated code */
]])
	u8g2_d_memory:close()
end

local function write_u8g2_h(memobj)
	local u8g2_h = assert(io.open('output/u8g2.h', 'w'))
	local str = file_read('resources/Common/u8g2.h')
	str = str:gsub('// U8G2_CODEBUILD_MEMORY', memobj:getDecls())

	u8g2_h:write(str)
	u8g2_h:close()
end

local controllers = require 'resources/Common/controllers'
local memory = require 'resources/Common/memory'

local memobj = memory.new()

for k,v in ipairs(controllers) do
	memobj:add(v.w, v.h)
end

write_u8g2_d_memory_c(memobj)
write_u8g2_h(memobj)

print(memobj:getDecls())
