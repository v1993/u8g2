local controllers = require 'resources/Common/controllers'
local interfaces = require 'resources/Arduino/interfaces'
local u8x8  = require 'resources/CXX/U8x8lib'
local u8g2  = require 'resources/CXX/U8g2lib'

local u8x8obj = u8x8.new()
local u8g2obj = u8g2.new()
--local setupobj = setup.new()

local function build()
	for k,v in ipairs(controllers) do
		u8x8obj:add(v, interfaces)
		u8g2obj:add(v, interfaces)
	end
end

local function csrc_install(fname)
	file_copy(file_tmpname(fname), '../../csrc/'..fname)
end

local function install()
	-- TODO: Add install
end

return { build = build; install = install; }
