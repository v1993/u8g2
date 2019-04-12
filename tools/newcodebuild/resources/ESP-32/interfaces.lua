-- This file describe ESP-IDF interfaces
-- Notes:
-- GPIO callback is common for all uC interfaces
-- pins - Used everywhere, opt sets count of optional pins
-- docpins - Override auto-generated pins description for docs

local interfaces = {
	gpiofunc = "u8x8_gpio_and_delay_espidf";

	-- SPI variations

	COM_4WSPI = {
		{
			name = "4W_SW_SPI";
			setpinfunc = "u8x8_SetPin_SPI";
			comfunc = "u8x8_byte_4wire_sw_spi";
			pins = {'clock', 'data', 'cs', 'dc', 'reset', opt = 1};
			info = "4-wire software emulated SPI";
		};
		{
			name = "4W_HW_HSPI";
			setpinfunc = "u8x8_SetPin_SPI_HW";
			comfunc = "u8x8_byte_espidf_hw_hspi";
			pins = {'clock', 'data', 'cs', 'dc', 'reset', opt = 1};
			info = "4-wire SPI using [HSPI bus and DMA channel 1](https://docs.espressif.com/projects/esp-idf/en/latest/api-reference/peripherals/spi_master.html)";
		};
		{
			name = "4W_HW_VSPI";
			setpinfunc = "u8x8_SetPin_SPI_HW";
			comfunc = "u8x8_byte_espidf_hw_vspi";
			pins = {'clock', 'data', 'cs', 'dc', 'reset', opt = 1};
			info = "4-wire SPI using [VSPI bus and DMA channel 2](https://docs.espressif.com/projects/esp-idf/en/latest/api-reference/peripherals/spi_master.html)";
		};
	};

	COM_3WSPI = {
		{
			name = "3W_SW_SPI";
			setpinfunc = "u8x8_SetPin_SPI_3wire";
			comfunc = "u8x8_byte_3wire_sw_spi";
			pins = {'clock', 'data', 'cs', 'reset', opt = 1};
			info = "3-wire software emulated SPI";
		};
	};

	COM_ST7920SPI = {
		{
			name = "SW_SPI";
			setpinfunc = "u8x8_SetPin_SPI_3wire";
			comfunc = "u8x8_byte_4wire_sw_spi";
			pins = {'clock', 'data', 'cs', 'reset', opt = 1};
			info = "3-wire software emulated SPI for ST7920 displays";
		};
		{
			name = "HW_HSPI";
			setpinfunc = "u8x8_SetPin_SPI_3wire_HW";
			comfunc = "u8x8_byte_espidf_hw_hspi";
			pins = {'clock', 'data', 'cs', 'reset', opt = 1};
			info = "3-wire SPI for ST7920 displays using [HSPI bus and DMA channel 1](https://docs.espressif.com/projects/esp-idf/en/latest/api-reference/peripherals/spi_master.html)";
		};
		{
			name = "HW_VSPI";
			setpinfunc = "u8x8_SetPin_SPI_3wire_HW";
			comfunc = "u8x8_byte_espidf_hw_vspi";
			pins = {'clock', 'data', 'cs', 'reset', opt = 1};
			info = "3-wire SPI for ST7920 displays using [VSPI bus and DMA channel 2](https://docs.espressif.com/projects/esp-idf/en/latest/api-reference/peripherals/spi_master.html)";
		};
	};

-- I²C have no variations

	COM_I2C = {
		{
			name = "SW_I2C";
			setpinfunc = "u8x8_SetPin_I2C";
			comfunc = "u8x8_byte_sw_i2c";
			pins = {'clock', 'data', 'reset', opt = 1};
			info = "Software emulated I²C";
		};
		{
			name = "HW_I2C_PORT0";
			setpinfunc = "u8x8_SetPin_I2C";
			comfunc = "u8x8_byte_espidf_hw_i2c_port0";
			pins = {'clock', 'data', 'reset', opt = 1};
			info = "Hardware I²C using [I²C port #0](https://docs.espressif.com/projects/esp-idf/en/latest/api-reference/peripherals/i2c.html)";
		};
		{
			name = "HW_I2C_PORT1";
			setpinfunc = "u8x8_SetPin_I2C";
			comfunc = "u8x8_byte_espidf_hw_i2c_port1";
			pins = {'clock', 'data', 'reset', opt = 1};
			info = "Hardware I²C using [I²C port #1](https://docs.espressif.com/projects/esp-idf/en/latest/api-reference/peripherals/i2c.html)";
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
			setpinfunc = "u8x8_SetPin_8Bit_8080";
			comfunc = "u8x8_byte_8bit_8080mode";
			pins = {'d0', 'd1', 'd2', 'd3', 'd4', 'd5', 'd6', 'd7', 'enable', 'cs', 'dc', 'reset', opt = 1};
			info = "8-bit parallel interface, 8080 protocol";
		};
	};

	COM_KS0108 = {
		{
			-- no "name" field. I'm sure they'll be fine…
			setpinfunc = "u8x8_SetPin_KS0108";
			comfunc = "u8x8_byte_ks0108";
			pins = {'d0', 'd1', 'd2', 'd3', 'd4', 'd5', 'd6', 'd7', 'enable', 'dc', 'cs0', 'cs1', 'cs2', 'reset', opt = 1};
			info = "special interface for KS0108 displays (software emulated)";
		};
	};

	COM_SED1520 = {
		{
			-- no "name" field. I'm sure they'll be fine…
			setpinfunc = "u8x8_SetPin_SED1520";
			comfunc = "u8x8_byte_sed1520";
			pins = {'d0', 'd1', 'd2', 'd3', 'd4', 'd5', 'd6', 'd7', 'dc', 'e1', 'e2', 'reset'};
			info = "special interface for SED1520 displays (software emulated)";
		};
	};
}

return interfaces
