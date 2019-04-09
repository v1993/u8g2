-- This code is part of u8g2 project and is responsible for
-- generation of U8G2 constructors for C++ part (all uCs)

local utils = require 'resources/Common/utils'
local ifacehelper = require 'resources/CXX/ifacehelper'

local u8g2gen = {
	add = function(s, controller, interfaces) -- Main wrapper. Interfaces are uC-specific but use same format.
		if not controller.genclass then
			return
		end

		for k, display in ipairs(controller.displays) do
			for k, ifname in ipairs(controller.com) do
				local ifacelist = interfaces[ifname]
				if ifacelist then -- If this interface is available on uC
					for suff in utils.mode_iter(0, 0) do
						for k, iface in ipairs(ifacelist) do
							s:append(controller, display, iface, suff, interfaces.gpiofunc)
						end
					end
				end
			end
		end
	end;
	append = function(s, controller, display, iface, suff, gpiofunc) -- Internal part
		local ifhelper = ifacehelper(iface)
		local classname = ('U8G2_%s_%s_%s%s'):format(controller.name, display, suff, iface.name and '_'..iface.name or ''):upper()
		s.decls[#s.decls+1] = ([[
class %s: public U8G2 {
  public: %s(const u8g2_cb_t *rotation, %s) {
    %s(&u8g2, rotation, %s, %s);
    %s(getU8x8(), %s);
  }
};]]):format(
			classname,
			classname, ifhelper:pinsTyped(),
			utils.setupFunc(controller, display, suff), iface.comfunc, gpiofunc,
			iface.setpinfunc, ifhelper:pinsNormal()
		);
	end;
	getDecls = function(s)
		return table.concat(s.decls, '\n')
	end;
}

local newu8g2 = function()
	return setmetatable({
		decls  = {};
	}, { __index = u8g2gen })
end

return { new = newu8g2 }
