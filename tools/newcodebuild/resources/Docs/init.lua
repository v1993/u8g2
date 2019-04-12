local function write_u8g2setupc_md(u8g2setupcobj)
	local str = file_read('resources/Docs/u8g2setupc.template.md')
	local u8g2setupc_md = assert(io.open(file_tmpname 'u8g2setupc.md', 'w'))
	str = str
	:gsub('U8G2_CODEBUILD_HEADERS', u8g2setupcobj:getHeaders())
	:gsub('U8G2_CODEBUILD_REFERENCE', u8g2setupcobj:getReferences())

	u8g2setupc_md:write(str)
	u8g2setupc_md:close()
end

local function write_u8x8setupc_md(u8x8setupcobj)
	local str = file_read('resources/Docs/u8x8setupc.template.md')
	local u8x8setupc_md = assert(io.open(file_tmpname 'u8x8setupc.md', 'w'))
	str = str
	:gsub('U8G2_CODEBUILD_HEADERS', u8x8setupcobj:getHeaders())
	:gsub('U8G2_CODEBUILD_REFERENCE', u8x8setupcobj:getReferences())

	u8x8setupc_md:write(str)
	u8x8setupc_md:close()
end

local function write_u8g2setupcpp_md(ifacedocsArduino, ifacedocsESP32)
	local str = file_read('resources/Docs/u8g2setupcpp.template.md')
	local u8g2setupcpp_md = assert(io.open(file_tmpname 'u8g2setupcpp.md', 'w'))
	str = str
	:gsub('U8G2_CODEBUILD_ARDUINO_INTERFACES', ifacedocsArduino:getReferences())
	:gsub('U8G2_CODEBUILD_ESP32_INTERFACES', ifacedocsESP32:getReferences())

	u8g2setupcpp_md:write(str)
	u8g2setupcpp_md:close()
end

local function write_u8x8controllertable_md(controllers)
	local contrtabgen = require 'resources/Docs/u8x8controllertable'
	local file = assert(io.open(file_tmpname 'u8x8controllertable.md', 'w'))
	file:write(contrtabgen(controllers))
	file:close()
end

local controllers = require 'resources/Common/controllers'
local interfaces = require 'resources/Docs/interfaces'
local u8x8setupc  = require 'resources/Docs/u8x8setupc'
local u8g2setupc  = require 'resources/Docs/u8g2setupc'
local ifacedocs = require  'resources/Docs/ifacedocs'

local function build()
	local u8x8setupcobj = u8x8setupc.new()
	local u8g2setupcobj = u8g2setupc.new()
	for k,v in ipairs(controllers) do
		u8x8setupcobj:add(v, interfaces)
		u8g2setupcobj:add(v, interfaces)
	end
	write_u8x8setupc_md(u8x8setupcobj)
	write_u8g2setupc_md(u8g2setupcobj)

	local ifacedocsArduino = ifacedocs.new()
	local ifacedocsESP32 = ifacedocs.new()
	ifacedocsArduino:add(require 'resources/Arduino/interfaces')
	ifacedocsESP32:add(require 'resources/ESP-32/interfaces')

	write_u8g2setupcpp_md(ifacedocsArduino, ifacedocsESP32)
	write_u8x8controllertable_md(controllers)
end

local function docs_install(fname)
	file_copy(file_tmpname(fname), 'docs/'..fname)
end

local function install()
	docs_install 'u8x8setupc.md'
	docs_install 'u8g2setupc.md'
	docs_install 'u8g2setupcpp.md'
	docs_install 'u8x8controllertable.md'
end

local function clean()
	file_tmpclean 'u8x8setupc.md'
	file_tmpclean 'u8g2setupc.md'
	file_tmpclean 'u8g2setupcpp.md'
	file_tmpclean 'u8x8controllertable.md'
end

return { build = build; install = install; clean = clean; }
