-- This code is part of u8g2 project and responsible for
-- generation of u8g2_d_memory.c and its declarations in u8g2.h

local utils = require 'resources/Common/utils'

local memgen = {
	add = function(s, w, h) -- Main wrapper
		local id = string.format("%d_%d", w, h)
		if not s.cached[id] then
			s.cached[id] = true
			for suff, bufsize, pages in utils.mode_iter(w, h) do
				s:append(w, h, suff, bufsize, pages)
			end
		end
	end;
	append = function(s, w, h, suff, buf_len, rows) -- Internal part
		local func_decl = ('uint8_t *%s(uint8_t *page_cnt)'):format(utils.memFunc(w, h, suff))
		s.decls[#s.decls+1] = func_decl..';'
		s.impls[#s.impls+1] = func_decl..'\n'..([[
{
  static uint8_t buf[%d];
  *page_cnt = %d;
  return buf;
}]]):format(buf_len, rows)
	end;
	getDecls = function(s)
		return table.concat(s.decls, '\n')
	end;
	getImpls = function(s)
		return table.concat(s.impls, '\n')
	end;
}

local newmem = function()
	return setmetatable({
		cached = {};
		decls  = {};
		impls  = {};
	}, { __index = memgen })
end

return { new = newmem }
