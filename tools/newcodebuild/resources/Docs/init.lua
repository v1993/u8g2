local function write_u8g2setupc_md(u8g2setupc)
	local str = file_read('resources/Docs/u8g2setupc.template.md')
	local u8g2setupc_md = assert(io.open(file_tmpname 'u8g2setupc.md', 'w'))
	str = str
	:gsub('U8G2_CODEBUILD_HEADERS', u8g2setupc:getHeaders())
	:gsub('U8G2_CODEBUILD_REFERENCE', u8g2setupc:getReferences())

	u8g2setupc_md:write(str)
	u8g2setupc_md:close()
end

local controllers = require 'resources/Common/controllers'
local interfaces = require 'resources/Docs/interfaces'
--local u8x8  = require 'resources/Docs/U8x8lib'
local u8g2setupc  = require 'resources/Docs/u8g2setupc'

local function build()
	--local u8x8obj = u8x8.new()
	local u8g2setupcobj = u8g2setupc.new()
	for k,v in ipairs(controllers) do
		--u8x8obj:add(v, interfaces)
		u8g2setupcobj:add(v, interfaces)
	end
	print(u8g2setupcobj:getReferences())
	--write_U8x8lib_hpp(u8x8obj)
	write_u8g2setupc_md(u8g2setupcobj)
end

local function install()
end

local function clean()
	file_tmpclean 'u8g2setupc.md'
end

return { build = build; install = install; clean = clean; }
