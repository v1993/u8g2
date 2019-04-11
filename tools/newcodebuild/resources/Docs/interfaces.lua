-- This file describe cross-platform interfaces for docs generation
-- Notes:
-- GPIO callback is common for all uC interfaces
-- pins - Used everywhere, opt sets count of optional pins
-- docpins - Override auto-generated pins description for docs

local interfaces = {
	gpiofunc = "uC specific";

	-- SPI variations

	COM_4WSPI = {
		{
			name = "4W_SW_SPI";
			comfunc = "u8x8_byte_4wire_sw_spi";
			pins = {'clock', 'data', 'cs', 'dc', 'reset', opt = 1};
		};
	};

	COM_3WSPI = {
		{
			name = "3W_SW_SPI";
			comfunc = "u8x8_byte_3wire_sw_spi";
			pins = {'clock', 'data', 'cs', 'reset', opt = 1};
		};
	};

	COM_ST7920SPI = {
		{
			name = "SW_SPI";
			comfunc = "u8x8_byte_4wire_sw_spi";
			pins = {'clock', 'data', 'cs', 'reset', opt = 1};
		};
	};

-- I²C have no variations

	COM_I2C = {
		{
			name = "SW_I2C";
			comfunc = "u8x8_byte_sw_i2c";
			pins = {'clock', 'data', 'reset', opt = 1};
		};
	};

-- Other interfaces

	COM_6800 = {
		{
			name = "6800";
			comfunc = "u8x8_byte_8bit_6800mode";
			pins = {'d0', 'd1', 'd2', 'd3', 'd4', 'd5', 'd6', 'd7', 'enable', 'cs', 'dc', 'reset', opt = 1};
		};
	};

	COM_8080 = {
		{
			name = "8080";
			comfunc = "u8x8_byte_8bit_8080mode";
			pins = {'d0', 'd1', 'd2', 'd3', 'd4', 'd5', 'd6', 'd7', 'enable', 'cs', 'dc', 'reset', opt = 1};
		};
	};

	COM_KS0108 = {
		{
			-- no "name" field. I'm sure they'll be fine…
			comfunc = "u8x8_byte_ks0108";
			pins = {'d0', 'd1', 'd2', 'd3', 'd4', 'd5', 'd6', 'd7', 'enable', 'dc', 'cs0', 'cs1', 'cs2', 'reset', opt = 1};
		};
	};

	COM_SED1520 = {
		{
			-- no "name" field. I'm sure they'll be fine…
			comfunc = "u8x8_byte_sed1520";
			pins = {'d0', 'd1', 'd2', 'd3', 'd4', 'd5', 'd6', 'd7', 'dc', 'e1', 'e2', 'reset'};
		};
	};
}

return interfaces
