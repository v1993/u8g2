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

local controllers = require 'resources/Common/controllers'
local interfaces = require 'resources/Docs/interfaces'
local u8x8setupc  = require 'resources/Docs/u8x8setupc'
local u8g2setupc  = require 'resources/Docs/u8g2setupc'

local function build()
	local u8x8setupcobj = u8x8setupc.new()
	local u8g2setupcobj = u8g2setupc.new()
	for k,v in ipairs(controllers) do
		u8x8setupcobj:add(v, interfaces)
		u8g2setupcobj:add(v, interfaces)
	end
	write_u8x8setupc_md(u8x8setupcobj)
	write_u8g2setupc_md(u8g2setupcobj)
end

local function install()
end

local function clean()
	file_tmpclean 'u8x8setupc.md'
	file_tmpclean 'u8g2setupc.md'
end

return { build = build; install = install; clean = clean; }
