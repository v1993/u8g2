-- This code is part of u8g2 project and is responsible for
-- generation of U8X8 docs for C part (all uCs)

local utils = require 'resources/Common/utils'

local u8x8setupcgen = {
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
						s:appendReference(controller, display, iface, interfaces.gpiofunc)
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
	appendReference = function(s, controller, display, iface, gpiofunc)
		s.references[#s.references+1] = ('| u8x8_Setup(u8x8, %s, %s, %s, %s); |')
		:format(
			utils.u8x8DisplayCB(controller, display),
			controller.cad,
			iface.comfunc,
			gpiofunc
		)
	end;
	getHeaders = function(s)
		return table.concat(s.headers, '\n')
	end;
	getReferences = function(s)
		return table.concat(s.references, '\n')
	end;
}

local newu8x8setupc = function()
	return setmetatable({
		headers = {};
		references = {}
	}, { __index = u8x8setupcgen })
end

return { new = newu8x8setupc }
