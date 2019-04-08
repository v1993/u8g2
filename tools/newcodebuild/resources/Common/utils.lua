local mode_iter = function(w, h) -- for pref, bufsize, pages in mode_iter(w, h) do
	return coroutine.wrap(function()
		coroutine.yield("1", w*8, 1)
		coroutine.yield("2", w*2*8, 2)
		coroutine.yield("f", w*h*8, h)
	end)
end

local function memFunc(w, h, suff)
	return ('u8g2_m_%d_%d_%s'):format(w, h, suff)
end

local function setupFunc(controller, display, suff)
	return ('void u8g2_Setup_%s%s_%s_%s')
			:format(controller.name, controller.cad_shortname and '_'..controller.cad_shortname or '', display, suff)
end

return {
	mode_iter = mode_iter;
	memFunc = memFunc;
	setupFunc = setupFunc;
}
