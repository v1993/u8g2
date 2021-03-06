local function write_u8g2_d_memory_c(memobj)
	local u8g2_d_memory = assert(io.open(file_tmpname 'u8g2_d_memory.c', 'w'))

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
	local u8g2_d_setup_c = assert(io.open(file_tmpname 'u8g2_d_setup.c', 'w'))

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
	local str = file_read('resources/C/u8g2.template.h')
	local u8g2_h = assert(io.open(file_tmpname 'u8g2.h', 'w'))
	str = str:gsub('U8G2_CODEBUILD_DISCAIMER', [[
Please keep in mind that this file is auto-generated by codebuild.
  Edit `tools/codebuild/resources/C/u8g2.template.h` if you want to contribute changes.]])
	:gsub('// U8G2_CODEBUILD_MEMORY', memobj:getDecls())
	:gsub('// U8G2_CODEBUILD_SETUP', setupobj:getDecls())

	u8g2_h:write(str)
	u8g2_h:close()
end

local controllers = require 'resources/Common/controllers'
local memory = require 'resources/C/memory'
local setup = require 'resources/C/setup'

local memobj = memory.new()
local setupobj = setup.new()

-- Pure C part

local function build()
	-- FIXME: do this step in `main.lua`?
	for k,v in ipairs(controllers) do
		memobj:add(v.w, v.h)
		setupobj:add(v)
	end

	-- C implementations
	write_u8g2_d_memory_c(memobj)
	write_u8g2_d_setup_c(setupobj)

	-- C headers
	write_u8g2_h(memobj, setupobj)
end

local function csrc_install(fname)
	file_copy(file_tmpname(fname), '../../csrc/'..fname)
end

local function install()
	csrc_install 'u8g2.h'
	csrc_install 'u8g2_d_memory.c'
	csrc_install 'u8g2_d_setup.c'
end

local function clean()
	file_tmpclean 'u8g2.h'
	file_tmpclean 'u8g2_d_memory.c'
	file_tmpclean 'u8g2_d_setup.c'
end

return { build = build; install = install; clean = clean; }
