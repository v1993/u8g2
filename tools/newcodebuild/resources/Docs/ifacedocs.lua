-- This code is part of u8g2 project and is responsible for
-- generation of U8G2 interface docs of C++ part (all uCs)

local utils = require 'resources/Common/utils'
local ifacehelper = require 'resources/CXX/ifacehelper'

local ifacedocsgen = {
	add = function(s, interfaces) -- Main wrapper. Interfaces are uC-specific but use same format.
		for k, ifname in ipairs(utils.ifacelist) do
			local ifacelist = interfaces[ifname]
			if ifacelist then
				for k, iface in ipairs(ifacelist) do
					s:appendReference(iface)
				end
			end
		end
	end;
	appendReference = function(s, iface)
		s.references[#s.references+1] = ('| `%s` | %s | `U8G2_X_X%s(rotation, clock, %s)` |')
		:format(
			iface.name or '(no suffix)',
			iface.info,
			iface.name and '_'..iface.name or '',
			ifacehelper(iface):pinsDocs()
		)
	end;
	getReferences = function(s)
		return table.concat(s.references, '\n')
	end;
}

local newifacedocs = function()
	return setmetatable({
		references = {
			'| Communication | Description | Constructor |';
			'|---|---|---|';
		}
	}, { __index = ifacedocsgen })
end

return { new = newifacedocs }
