-- This file describe arduino interfaces
-- Notes:
-- GPIO callback is common for all uC interfaces
-- pins - Used everywhere, opt sets count of optional pins
-- docname - Override `name` in C++ docs (or use it if `name` is empty on propourse)
-- docpins - Override auto-generated pins description for docs

local interfaces = {
	gpiofunc = "u8x8_gpio_and_delay_arduino";

	-- SPI variations

	COM_4WSPI = {
		{
			name = "4W_SW_SPI";
			setpinfunc = "u8x8_SetPin_4Wire_SW_SPI";
			comfunc = "u8x8_byte_arduino_4wire_sw_spi";
			pins = {'clock', 'data', 'cs', 'dc', 'reset', opt = 1};
			info = "4-wire software emulated SPI";
		};
		{
			name = "4W_HW_SPI";
			setpinfunc = "u8x8_SetPin_4Wire_HW_SPI";
			comfunc = "u8x8_byte_arduino_hw_spi";
			pins = {'cs', 'dc', 'reset', opt = 1};
			info = "4-wire hardware SPI (based on Arduino SPI library)";
		};
		{
			name = "2ND_4W_HW_SPI";
			setpinfunc = "u8x8_SetPin_4Wire_HW_SPI";
			comfunc = "u8x8_byte_arduino_2nd_hw_spi";
			pins = {'cs', 'dc', 'reset', opt = 1};
			info = "If supported, second 4-wire hardware SPI (based on Arduino SPI library)";
		};
	};

	COM_3WSPI = {
		{
			name = "3W_SW_SPI";
			setpinfunc = "u8x8_SetPin_3Wire_SW_SPI";
			comfunc = "u8x8_byte_arduino_3wire_sw_spi";
			pins = {'clock', 'data', 'cs', 'reset', opt = 1};
			info = "3-wire software emulated SPI";
		};
	};

	COM_ST7920SPI = {
		{
			name = "SW_SPI";
			setpinfunc = "u8x8_SetPin_3Wire_SW_SPI";
			comfunc = "u8x8_byte_arduino_4wire_sw_spi";
			pins = {'clock', 'data', 'cs', 'reset', opt = 1};
			info = "3-wire software emulated SPI for ST7920 displays";
		};
		{
			name = "HW_SPI";
			setpinfunc = "u8x8_SetPin_ST7920_HW_SPI";
			comfunc = "u8x8_byte_arduino_hw_spi";
			pins = {'cs', 'reset', opt = 1};
			info = "3-wire hardware SPI for ST7920 displays (based on Arduino SPI library)";
		};
	};

-- I²C have no variations

	COM_I2C = {
		{
			name = "SW_I2C";
			setpinfunc = "u8x8_SetPin_SW_I2C";
			comfunc = "u8x8_byte_arduino_sw_i2c";
			pins = {'clock', 'data', 'reset', opt = 1};
			info = "Software emulated I2C/TWI";
		};
		{
			name = "HW_I2C";
			setpinfunc = "u8x8_SetPin_HW_I2C";
			comfunc = "u8x8_byte_arduino_hw_i2c";
			pins = {'reset', 'clock', 'data', opt = 3};
			docpins = "[reset [, clock, data]]";
			info = "Hardware I2C based on the Arduino Wire library";
		};
		{
			name = "2ND_HW_I2C";
			setpinfunc = "u8x8_SetPin_HW_I2C";
			comfunc = "u8x8_byte_arduino_2nd_hw_i2c";
			pins = {'reset', 'clock', 'data', opt = 3}; -- FIXME: is it right? I guess so, but not sure.
			docpins = "[reset [, clock, data]]";
			info = "If supported, use second hardware I2C (Arduino Wire lib)";
		};
	};

-- Other interfaces

	COM_6800 = {
		{
			name = "6800";
			setpinfunc = "u8x8_SetPin_8Bit_6800";
			comfunc = "u8x8_byte_8bit_6800mode";
			pins = {'d0', 'd1', 'd2', 'd3', 'd4', 'd5', 'd6', 'd7', 'enable', 'cs', 'dc', 'reset', opt = 1};
			info = "8-bit parallel interface, 6800 protocol";
		};
	};

	COM_8080 = {
		{
			name = "8080";
			setpinfunc = "u8x8_SetPin_8Bit_6800";
			comfunc = "u8x8_byte_arduino_8bit_8080mode";
			pins = {'d0', 'd1', 'd2', 'd3', 'd4', 'd5', 'd6', 'd7', 'enable', 'cs', 'dc', 'reset', opt = 1};
			info = "8-bit parallel interface, 8080 protocol";
		};
	};

	COM_KS0108 = {
		{
			-- no "name" field. I'm sure they'll be fine…
			setpinfunc = "u8x8_SetPin_KS0108";
			comfunc = "u8x8_byte_arduino_ks0108";
			pins = {'d0', 'd1', 'd2', 'd3', 'd4', 'd5', 'd6', 'd7', 'enable', 'dc', 'cs0', 'cs1', 'cs2', 'reset', opt = 1};
			info = "special interface for KS0108 displays (software emulated)";
		};
	};

	COM_SED1520 = {
		{
			-- no "name" field. I'm sure they'll be fine
			setpinfunc = "u8x8_SetPin_SED1520";
			comfunc = "u8x8_byte_sed1520";
			pins = {'d0', 'd1', 'd2', 'd3', 'd4', 'd5', 'd6', 'd7', 'dc', 'e1', 'e2', 'reset'};
			info = "special interface for SED1520 displays (software emulated)";
		};
	};
}

return interfaces
