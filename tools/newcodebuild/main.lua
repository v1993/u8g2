-- Please, try to keep code compatible with lua 5.1, 5.2 and 5.3

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

local function write_u8g2_d_setup_c(setupobj)
	local u8g2_d_setup_c = assert(io.open('output/u8g2_d_setup.c', 'w'))

	u8g2_d_setup_c:write([[
/* u8g2_d_setup.c */
/* generated code, codebuild, u8g2 project */

#include "u8g2.h"

]], setupobj:getImpls(), '\n', [[
/* end of generated code */
]])
	u8g2_d_setup_c:close()
end


local function write_u8g2_h(memobj, setupobj)
	local str = file_read('resources/Common/u8g2.template.h')
	local u8g2_h = assert(io.open('output/u8g2.h', 'w'))
	str = str:gsub('// U8G2_CODEBUILD_MEMORY', memobj:getDecls())
	:gsub('// U8G2_CODEBUILD_SETUP', setupobj:getDecls())

	u8g2_h:write(str)
	u8g2_h:close()
end

local controllers = require 'resources/Common/controllers'
local memory = require 'resources/Common/memory'
local setup = require 'resources/Common/setup'

local memobj = memory.new()
local setupobj = setup.new()

-- Pure C part

for k,v in ipairs(controllers) do
	memobj:add(v.w, v.h)
	setupobj:add(v)
end

-- C implementations
write_u8g2_d_memory_c(memobj)
write_u8g2_d_setup_c(setupobj)

-- C headers
write_u8g2_h(memobj, setupobj)

--print(memobj:getDecls())
