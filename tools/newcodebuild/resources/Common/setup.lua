-- This code is part of u8g2 project and responsible for
-- generation of u8g2_d_setup.c and its declarations in u8g2.h

local utils = require 'resources/Common/utils'

local setupgen = {
	add = function(s, controller) -- Main wrapper
		s.impls[#s.impls+1] = ('/* %s */'):format(controller.name);
		--for k, v in controller.displays do
		--	s:append_display(controller, v)
		--end
		for suff, bufsize, pages in utils.mode_iter(controller.w, controller.h) do
			s.impls[#s.impls+1] = ('/* %s %s */'):format(controller.name, suff);
			for k,v in ipairs(controller.displays) do
				s:append(controller, v, suff, bufsize, pages)
			end
		end
	end;
	append = function(s, controller, display, suff, bufsize, pages) -- Internal part
		local func_decl =
		('%s(u8g2_t *u8g2, const u8g2_cb_t *rotation, u8x8_msg_cb byte_cb, u8x8_msg_cb gpio_and_delay_cb)')
		:format(utils.setupFunc(controller, display, suff))
		s.decls[#s.decls+1] = func_decl..';'
		s.impls[#s.impls+1] = func_decl..'\n'..([[
{
  uint8_t tile_buf_height;
  uint8_t *buf;
  u8g2_SetupDisplay(u8g2, u8x8_d_%s_%s, %s, byte_cb, gpio_and_delay_cb);
  buf = %s(&tile_buf_height);
  u8g2_SetupBuffer(u8g2, buf, tile_buf_height, %s, rotation);
}]]):format(controller.name, display, controller.cad,
			utils.memFunc(controller.w, controller.h, suff),
			controller.hvline)
	end;
	getDecls = function(s)
		return table.concat(s.decls, '\n')
	end;
	getImpls = function(s)
		return table.concat(s.impls, '\n')
	end;
}

local newsetup = function()
	return setmetatable({
		decls  = {};
		impls  = {};
	}, { __index = setupgen })
end

return { new = newsetup }
