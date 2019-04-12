local ifacelist = {
	'COM_4WSPI';
	'COM_3WSPI';
	'COM_ST7920SPI';
	'COM_I2C';
	'COM_6800';
	'COM_8080';
	'COM_KS0108';
	'COM_SED1520';
	'COM_UART'; -- Let it be there
};

local mode_iter = function(w, h) -- for suff, bufsize, pages in mode_iter(w, h) do
	local buf1 = w*8
	local buf2 = w*2*8
	local buff = w*h*8
	return coroutine.wrap(function()
		-- Who need page buffer when full one is same or even smaller?
		if buf1 < buff then
			coroutine.yield("1", buf1, 1)
			if buf2 < buff then
				coroutine.yield("2", buf2, 2)
			end
		end
		coroutine.yield("f", buff, h)
	end)
end

local function memFunc(w, h, suff)
	return ('u8g2_m_%d_%d_%s'):format(w, h, suff)
end

local function setupFunc(controller, display, suff)
	return ('u8g2_Setup_%s%s_%s_%s')
			:format(controller.name, controller.cad_shortname and '_'..controller.cad_shortname or '', display, suff)
end

local function u8x8DisplayCB(controller, display)
	return ('u8x8_d_%s_%s')
		:format(controller.name, display)
end

return {
	ifacelist = ifacelist;
	mode_iter = mode_iter;
	memFunc = memFunc;
	setupFunc = setupFunc;
	u8x8DisplayCB = u8x8DisplayCB;
}
