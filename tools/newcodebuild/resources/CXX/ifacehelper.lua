-- This code is part of u8g2 project and is responsible for
-- generation of u8g2_d_memory.c and its declarations in u8g2.h

--local utils = require 'resources/Common/utils'

local ifacefuncs = {
	-- Utils
	lastreq = function(s)
		return #s.iface.pins - (s.iface.pins.opt or 0) -- Number of last required pin
	end;
	-- Public
	pinsTyped = function(s)
		local arr = {}
		local lastreq = s:lastreq()
		for k,v in ipairs(s.iface.pins) do
			arr[#arr+1] = ('uint8_t %s%s'):format(v, k > lastreq and ' = U8X8_PIN_NONE' or '')
		end
		return table.concat(arr, ', ')
	end;
	pinsNormal = function(s)
		local arr = {}
		local lastreq = s:lastreq()
		for k,v in ipairs(s.iface.pins) do
			arr[#arr+1] = v
		end
		return table.concat(arr, ', ')
	end;
	pinsDocs = function(s)
		if s.iface.docpins  then
			return s.iface.docpins
		end

		local arr = {}
		local lastreq = s:lastreq()
		local haveopt = s.iface.pins.opt and s.iface.pins.opt > 0
		for k,v in ipairs(s.iface.pins) do
			arr[#arr+1] = v..((haveopt and k == lastreq) and ' [' or '')
		end
		if haveopt then
			arr[#arr] = arr[#arr]..']'
		end
		return table.concat(arr, ', ')
	end;
}

return function(iface)
	return setmetatable({
		iface = iface;
	}, { __index = ifacefuncs })
end
