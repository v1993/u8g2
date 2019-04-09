-- Generate template code and docs for u8g2 library
-- Originally written by Valeri Ochinski in 2019

-- Please, try to keep this code compatible with lua 5.1, 5.2 and 5.3
-- Avoid usage of any libraries

package.path=package.path..';./?/init.lua'

mask = function(tab)
	local newtab = {}
	for k,v in ipairs(tab) do
		newtab[v] = true
	end
	return newtab
end

file_read = function(fname)
	local f = assert(io.open(fname, 'r'))
	local res = f:read '*a'
	f:close()
	return res
end

file_copy = function(src, dst)
	print(('Copying `%s` to `%s`'):format(src, dst))
	local fi = assert(io.open(src, 'r'))
	local fo = assert(io.open(dst, 'w'))
	fo:write(fi:read('*a'))
	fo:close()
	fi:close()
end

file_tmpname = function(fname) return 'output/'..fname end

file_tmpclean = function(fname)
	fname = file_tmpname(fname)
	print('Removing '..fname)
	os.remove(fname)
end

local modules = {
	'resources/C'      ; -- Cross-platform part
	'resources/Arduino'; -- C++ for Arduino HAL
	'resources/ESP-32';  -- C++ for native ESP-IDF
}

local modules_loaded = {}

print('Loading modules')

for k, v in ipairs(modules) do
	modules_loaded[k] = require(v)
end

local function build()
	for k,v in ipairs(modules_loaded) do
		v.build()
	end
end

local function install()
	for k,v in ipairs(modules_loaded) do
		v.install()
	end
end

print('Generating files')

if pcall(build) then
	io.write('File generation done. Check them if you want to and press enter to install (type anything first to cancel): ')
	local inp = io.read()
	if inp and inp ~= '' then
		print('Installation cancelled.')
	else
		if not pcall(install) then
			print('Installation failed!')
		end
	end
else
	print('Build failed!')
end

print('Cleaning up…')

for k,v in ipairs(modules_loaded) do
	v.clean()
end

--print(memobj:getDecls())
