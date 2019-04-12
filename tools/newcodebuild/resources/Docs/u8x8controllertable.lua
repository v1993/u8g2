local header = [[
# Introduction

This table's propourse is to show which interfaces and buffering modes are available for each device.
Please note that full framebuffer mode is always available.

# Table
]]

local utils = require 'resources/Common/utils'

local function tickbox(bool)
	return bool and '☑' or '☐' -- NOTE: html codes could be used too
end

local function tabgen(controllers)
	local datatab = { indexes = {} }
	local restab = { header }
	local addres = function(str)
		restab[#restab+1] = str
	end

	local getnam = function(controller, display)
		return ('%s %s'):format(controller.name, display)
	end

	local getfield = function(name)
		local res = datatab[name]
		if res then return res end
		res = {}
		datatab.indexes[#datatab.indexes+1] = name
		datatab[name] = res
		return res
	end

	for k, controller in ipairs(controllers) do
		for k, display in ipairs(controller.displays) do
			local id = getnam(controller, display)
			local row = getfield(id)
			for k, ifacename in ipairs(controller.com) do
				print(ifacename)
				row[ifacename] = true
			end
			for suff in utils.mode_iter(controller.w, controller.h) do
				row[('`%s` buffer'):format(suff)] = true
			end
		end
	end

	local cmptable = {'`1` buffer', '`2` buffer'}
	do
		local headers = { 'Controller/display', '`1` buffer', '`2` buffer' }
		for k, ifacename in ipairs(utils.ifacelist) do
			cmptable[#cmptable+1] = ifacename
			headers[#headers+1] = ifacename:sub(5) -- Cut 'COM_' part
		end
		addres(table.concat(headers, '|'))
		local separator = {'---'}
		for i=1,#headers-1 do
			separator[i+1] = ':---:'
		end
		addres(table.concat(separator, '|'))
	end

	for k, id in ipairs(datatab.indexes) do
		local datarow = datatab[id]
		local row = {id}
		for k, val in ipairs(cmptable) do
			row[#row+1] = tickbox(datarow[val])
		end
		addres(table.concat(row, '|'))
	end

	return table.concat(restab, '\n')
end

return tabgen
