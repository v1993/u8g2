-- This code is part of u8g2 project and is responsible for
-- generation of U8X8 constructors for C++ part (all uCs)

local utils = require 'resources/Common/utils'
local ifacehelper = require 'resources/CXX/ifacehelper'

local u8x8gen = {
	add = function(s, controller, interfaces) -- Main wrapper. Interfaces are uC-specific but use same format.
		if not controller.genclass then
			return
		end

		for k, display in ipairs(controller.displays) do
			for k, ifname in ipairs(controller.com) do
				local ifacelist = interfaces[ifname]
				if ifacelist then -- If this interface is available on uC
					for k, iface in ipairs(ifacelist) do
						s:append(controller, display, iface, interfaces.gpiofunc)
					end
				end
			end
		end
	end;
	append = function(s, controller, display, iface, gpiofunc) -- Internal part
		local ifhelper = ifacehelper(iface)
		local classname = ('U8X8_%s_%s%s'):format(controller.name, display, iface.name and '_'..iface.name or ''):upper()
		s.decls[#s.decls+1] = ([[
class %s : public U8X8 {
  public: %s(%s) {
    u8x8_Setup(getU8x8(), u8x8_d_%s_%s, %s, %s, %s);
    %s(getU8x8(), %s);
  }
};]]):format(
			classname,
			classname, ifhelper:pinsTyped(),
			controller.name, display, controller.cad, iface.comfunc, gpiofunc,
			iface.setpinfunc, ifhelper:pinsNormal()
		);
	end;
	getDecls = function(s)
		return table.concat(s.decls, '\n')
	end;
}

local newu8x8 = function()
	return setmetatable({
		decls  = {};
	}, { __index = u8x8gen })
end

return { new = newu8x8 }
