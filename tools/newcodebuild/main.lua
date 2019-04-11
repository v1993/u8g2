-- Generate template code and docs for u8g2 library
-- Originally written by Valeri Ochinski in 2019

-- Please, try to keep this code compatible with luajit, lua 5.2 and lua 5.3
-- Avoid usage of any libraries

package.path=package.path..';./?/init.lua'

if not ({xpcall(function(inp) return inp; end, print, true)})[2] then -- xpcall don't support args passtrough
	io.stderr('Lua 5.1 is not supported. Try newer version or LuaJIT.')
	return 1
end

local function pcall_message(func, ...) -- Print useful info into console if pcall failed
	local ok, err = xpcall(func, debug.traceback, ...)
	if not ok then
		io.stderr:write(err, '\n')
	end
	return ok, err
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
	'resources/Docs'   ; -- Various docs for wiki
	'resources/Arduino'; -- C++ for Arduino HAL
	'resources/ESP-32' ; -- C++ for native ESP-IDF
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

if pcall_message(build) then
	io.write('File generation done. Check them if you want to and press enter to install (type anything first to cancel): ')
	local inp = io.read()
	if inp and inp ~= '' then
		print('Installation cancelled.')
	else
		if not pcall_message(install) then
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
