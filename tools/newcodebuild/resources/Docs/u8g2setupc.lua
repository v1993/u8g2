-- This code is part of u8g2 project and is responsible for
-- generation of U8G2 docs for C part (all uCs)

local utils = require 'resources/Common/utils'
local ifacehelper = require 'resources/CXX/ifacehelper'

local u8g2setupcgen = {
	add = function(s, controller, interfaces) -- Main wrapper. Interfaces are uC-specific but use same format.
		if not controller.genclass then
			return
		end

		for k, display in ipairs(controller.displays) do
			local firstiface = true
			for k, ifname in ipairs(controller.com) do
				local ifacelist = interfaces[ifname]
				if ifacelist then -- If this interface is available on uC
					if firstiface then
						firstiface = false
						s:appendHeader(controller, display)
						-- Add section and table headers
						s.references[#s.references+1] = ('')
						s.references[#s.references+1] = ('## %s %s'):format(controller.name:upper(), display:upper())
						s.references[#s.references+1] = ('| Controller "%s", Display "%s" | Descirption |')
							:format(controller.name, display)
						s.references[#s.references+1] = ('|---|---|')
					end

					for k, iface in ipairs(ifacelist) do
						for suff, bufsize in utils.mode_iter(controller.w, controller.h) do
							s:appendReference(controller, display, iface, suff, bufsize, interfaces.gpiofunc)
						end
					end
				end
			end
		end
	end;
	appendHeader = function(s, controller, display) -- Internal part
		s.headers[#s.headers+1] =
		('    * [%s %s](#%s-%s)'):format(
			controller.name:upper(),
			display:upper(),
			controller.name,
			display
		)
	end;
	appendReference = function(s, controller, display, iface, suff, bufsize, gpiofunc)
		s.references[#s.references+1] = ('| %s(u8g2, rotation, %s, %s) | %s buffer, size = %d bytes |')
		:format(
			utils.setupFunc(controller, display, suff),
			iface.comfunc,
			gpiofunc,
			(suff == 'f' and 'full' or 'page'),
			bufsize
		)
	end;
	getHeaders = function(s)
		return table.concat(s.headers, '\n')
	end;
	getReferences = function(s)
		return table.concat(s.references, '\n')
	end;
}

local newu8g2setupc = function()
	return setmetatable({
		headers = {};
		references = {}
	}, { __index = u8g2setupcgen })
end

return { new = newu8g2setupc }
