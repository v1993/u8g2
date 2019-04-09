local controllers = {
	{
		name = "ssd1305";
		w = 16; h = 4;
		hvline = "u8g2_ll_hvline_vertical_top_lsb";
		cad = "u8x8_cad_001";
		genclass = true;
		com = {"COM_4WSPI";"COM_6800";"COM_8080";};
		displays = {
			"128x32_noname";
			"128x32_adafruit";
		};
	};
	{
		name = "ssd1305";
		w = 16; h = 4;
		hvline = "u8g2_ll_hvline_vertical_top_lsb";
		cad = "u8x8_cad_ssd13xx_i2c";
		cad_shortname = "i2c";
		genclass = true;
		com = {"COM_I2C;"};
		displays = {
			"128x32_noname";
			"128x32_adafruit";
		};
	};
	{
		name = "ssd1305";
		w = 16; h = 8;
		hvline = "u8g2_ll_hvline_vertical_top_lsb";
		cad = "u8x8_cad_001";
		genclass = true;
		com = {"COM_4WSPI";"COM_6800";"COM_8080";};
		displays = {
			"128x64_adafruit";
		};
	};
	{
		name = "ssd1305";
		w = 16; h = 8;
		hvline = "u8g2_ll_hvline_vertical_top_lsb";
		cad = "u8x8_cad_ssd13xx_i2c";
		cad_shortname = "i2c";
		genclass = true;
		com = {"COM_I2C;"};
		displays = {
			"128x64_adafruit";
		};
	};
	{
		name = "ssd1306";
		w = 16; h = 8;
		hvline = "u8g2_ll_hvline_vertical_top_lsb";
		cad = "u8x8_cad_001";
		genclass = true;
		com = {"COM_4WSPI";"COM_3WSPI";"COM_6800";"COM_8080";};
		displays = {
			"128x64_noname";
			"128x64_vcomh0";
			"128x64_alt0";
		};
	};
	{
		name = "ssd1306";
		w = 16; h = 8;
		hvline = "u8g2_ll_hvline_vertical_top_lsb";
		cad = "u8x8_cad_ssd13xx_fast_i2c";
		cad_shortname = "i2c";
		genclass = true;
		com = {"COM_I2C;"};
		displays = {
			"128x64_noname";
			"128x64_vcomh0";
			"128x64_alt0";
		};
	};
	{
		name = "sh1106";
		w = 16; h = 8;
		hvline = "u8g2_ll_hvline_vertical_top_lsb";
		cad = "u8x8_cad_001";
		note = "Not tested";
		genclass = true;
		com = {"COM_4WSPI";"COM_3WSPI";"COM_6800";"COM_8080";};
		displays = {
			"128x64_noname";
			"128x64_vcomh0";
			"128x64_winstar";
		};
	};
	{
		name = "sh1106";
		w = 16; h = 8;
		hvline = "u8g2_ll_hvline_vertical_top_lsb";
		cad = "u8x8_cad_ssd13xx_i2c";
		cad_shortname = "i2c";
		note = "Not tested";
		genclass = true;
		com = {"COM_I2C;"};
		displays = {
			"128x64_noname";
			"128x64_vcomh0";
			"128x64_winstar";
		};
	};
	{
		name = "sh1106";
		w = 9; h = 5;
		hvline = "u8g2_ll_hvline_vertical_top_lsb";
		cad = "u8x8_cad_001";
		note = "Not tested";
		genclass = true;
		com = {"COM_4WSPI";"COM_3WSPI";"COM_6800";"COM_8080";};
		displays = {
			"72x40_wise";
		};
	};
	{
		name = "sh1106";
		w = 9; h = 5;
		hvline = "u8g2_ll_hvline_vertical_top_lsb";
		cad = "u8x8_cad_ssd13xx_i2c";
		cad_shortname = "i2c";
		note = "Not tested";
		genclass = true;
		com = {"COM_I2C;"};
		displays = {
			"72x40_wise";
		};
	};
	{
		name = "sh1106";
		w = 8; h = 4;
		hvline = "u8g2_ll_hvline_vertical_top_lsb";
		cad = "u8x8_cad_001";
		note = "Not tested";
		genclass = true;
		com = {"COM_4WSPI";"COM_3WSPI";"COM_6800";"COM_8080";};
		displays = {
			"64x32";
		};
	};
	{
		name = "sh1106";
		w = 8; h = 4;
		hvline = "u8g2_ll_hvline_vertical_top_lsb";
		cad = "u8x8_cad_ssd13xx_i2c";
		cad_shortname = "i2c";
		note = "Not tested";
		genclass = true;
		com = {"COM_I2C;"};
		displays = {
			"64x32";
		};
	};
	{
		name = "sh1107";
		w = 8; h = 16;
		hvline = "u8g2_ll_hvline_vertical_top_lsb";
		cad = "u8x8_cad_001";
		note = "Not tested";
		genclass = true;
		com = {"COM_4WSPI";"COM_3WSPI";"COM_6800";"COM_8080";};
		displays = {
			"64x128";
		};
	};
	{
		name = "sh1107";
		w = 8; h = 16;
		hvline = "u8g2_ll_hvline_vertical_top_lsb";
		cad = "u8x8_cad_ssd13xx_i2c";
		cad_shortname = "i2c";
		note = "Not tested";
		genclass = true;
		com = {"COM_I2C;"};
		displays = {
			"64x128";
		};
	};
	{
		name = "sh1107";
		w = 12; h = 12;
		hvline = "u8g2_ll_hvline_vertical_top_lsb";
		cad = "u8x8_cad_001";
		note = "Not tested";
		genclass = true;
		com = {"COM_4WSPI";"COM_3WSPI";"COM_6800";"COM_8080";};
		displays = {
			"seeed_96x96";
		};
	};
	{
		name = "sh1107";
		w = 12; h = 12;
		hvline = "u8g2_ll_hvline_vertical_top_lsb";
		cad = "u8x8_cad_ssd13xx_i2c";
		cad_shortname = "i2c";
		note = "Not tested";
		genclass = true;
		com = {"COM_I2C;"};
		displays = {
			"seeed_96x96";
		};
	};
	{
		name = "sh1107";
		w = 16; h = 16;
		hvline = "u8g2_ll_hvline_vertical_top_lsb";
		cad = "u8x8_cad_001";
		note = "Not tested";
		genclass = true;
		com = {"COM_4WSPI";"COM_3WSPI";"COM_6800";"COM_8080";};
		displays = {
			"128x128";
			"pimoroni_128x128";
		};
	};
	{
		name = "sh1107";
		w = 16; h = 16;
		hvline = "u8g2_ll_hvline_vertical_top_lsb";
		cad = "u8x8_cad_ssd13xx_i2c";
		cad_shortname = "i2c";
		note = "Not tested";
		genclass = true;
		com = {"COM_I2C;"};
		displays = {
			"128x128";
			"pimoroni_128x128";
		};
	};
	{
		name = "sh1108";
		w = 20; h = 20;
		hvline = "u8g2_ll_hvline_vertical_top_lsb";
		cad = "u8x8_cad_001";
		note = "Not tested";
		genclass = true;
		com = {"COM_4WSPI";"COM_3WSPI";"COM_6800";"COM_8080";};
		displays = {
			"160x160";
		};
	};
	{
		name = "sh1108";
		w = 20; h = 20;
		hvline = "u8g2_ll_hvline_vertical_top_lsb";
		cad = "u8x8_cad_ssd13xx_i2c";
		cad_shortname = "i2c";
		note = "Not tested";
		genclass = true;
		com = {"COM_I2C;"};
		displays = {
			"160x160";
		};
	};
	{
		name = "sh1122";
		w = 32; h = 8;
		hvline = "u8g2_ll_hvline_horizontal_right_lsb";
		cad = "u8x8_cad_001";
		genclass = true;
		com = {"COM_4WSPI";"COM_3WSPI";"COM_6800";"COM_8080";};
		displays = {
			"256x64";
		};
	};
	{
		name = "sh1122";
		w = 32; h = 8;
		hvline = "u8g2_ll_hvline_horizontal_right_lsb";
		cad = "u8x8_cad_ssd13xx_i2c";
		cad_shortname = "i2c";
		genclass = true;
		com = {"COM_I2C;"};
		displays = {
			"256x64";
		};
	};
	{
		name = "ssd1306";
		w = 16; h = 4;
		hvline = "u8g2_ll_hvline_vertical_top_lsb";
		cad = "u8x8_cad_001";
		genclass = true;
		com = {"COM_4WSPI";"COM_3WSPI";"COM_6800";"COM_8080";};
		displays = {
			"128x32_univision";
			"128x32_winstar";
		};
	};
	{
		name = "ssd1306";
		w = 16; h = 4;
		hvline = "u8g2_ll_hvline_vertical_top_lsb";
		cad = "u8x8_cad_ssd13xx_fast_i2c";
		cad_shortname = "i2c";
		genclass = true;
		com = {"COM_I2C;"};
		displays = {
			"128x32_univision";
			"128x32_winstar";
		};
	};
	{
		name = "ssd1306";
		w = 8; h = 6;
		hvline = "u8g2_ll_hvline_vertical_top_lsb";
		cad = "u8x8_cad_001";
		genclass = true;
		com = {"COM_4WSPI";"COM_3WSPI";"COM_6800";"COM_8080";};
		displays = {
			"64x48_er";
		};
	};
	{
		name = "ssd1306";
		w = 8; h = 6;
		hvline = "u8g2_ll_hvline_vertical_top_lsb";
		cad = "u8x8_cad_ssd13xx_fast_i2c";
		cad_shortname = "i2c";
		genclass = true;
		com = {"COM_I2C;"};
		displays = {
			"64x48_er";
		};
	};
	{
		name = "ssd1306";
		w = 6; h = 8;
		hvline = "u8g2_ll_hvline_vertical_top_lsb";
		cad = "u8x8_cad_001";
		genclass = true;
		com = {"COM_4WSPI";"COM_3WSPI";"COM_6800";"COM_8080";};
		displays = {
			"48x64_winstar";
		};
	};
	{
		name = "ssd1306";
		w = 6; h = 8;
		hvline = "u8g2_ll_hvline_vertical_top_lsb";
		cad = "u8x8_cad_ssd13xx_fast_i2c";
		cad_shortname = "i2c";
		genclass = true;
		com = {"COM_I2C;"};
		displays = {
			"48x64_winstar";
		};
	};
	{
		name = "ssd1306";
		w = 8; h = 4;
		hvline = "u8g2_ll_hvline_vertical_top_lsb";
		cad = "u8x8_cad_001";
		genclass = true;
		com = {"COM_4WSPI";"COM_3WSPI";"COM_6800";"COM_8080";};
		displays = {
			"64x32_noname";
			"64x32_1f";
		};
	};
	{
		name = "ssd1306";
		w = 8; h = 4;
		hvline = "u8g2_ll_hvline_vertical_top_lsb";
		cad = "u8x8_cad_ssd13xx_fast_i2c";
		cad_shortname = "i2c";
		genclass = true;
		com = {"COM_I2C;"};
		displays = {
			"64x32_noname";
			"64x32_1f";
		};
	};
	{
		name = "ssd1306";
		w = 12; h = 2;
		hvline = "u8g2_ll_hvline_vertical_top_lsb";
		cad = "u8x8_cad_001";
		genclass = true;
		com = {"COM_4WSPI";"COM_3WSPI";"COM_6800";"COM_8080";};
		displays = {
			"96x16_er";
		};
	};
	{
		name = "ssd1306";
		w = 12; h = 2;
		hvline = "u8g2_ll_hvline_vertical_top_lsb";
		cad = "u8x8_cad_ssd13xx_fast_i2c";
		cad_shortname = "i2c";
		genclass = true;
		com = {"COM_I2C;"};
		displays = {
			"96x16_er";
		};
	};
	{
		name = "ssd1309";
		w = 16; h = 8;
		hvline = "u8g2_ll_hvline_vertical_top_lsb";
		cad = "u8x8_cad_001";
		genclass = true;
		com = {"COM_4WSPI";"COM_6800";"COM_8080";};
		displays = {
			"128x64_noname2";
		};
	};
	{
		name = "ssd1309";
		w = 16; h = 8;
		hvline = "u8g2_ll_hvline_vertical_top_lsb";
		cad = "u8x8_cad_ssd13xx_i2c";
		cad_shortname = "i2c";
		genclass = true;
		com = {"COM_I2C;"};
		displays = {
			"128x64_noname2";
		};
	};
	{
		name = "ssd1309";
		w = 16; h = 8;
		hvline = "u8g2_ll_hvline_vertical_top_lsb";
		cad = "u8x8_cad_001";
		genclass = true;
		com = {"COM_4WSPI";"COM_6800";"COM_8080";};
		displays = {
			"128x64_noname0";
		};
	};
	{
		name = "ssd1309";
		w = 16; h = 8;
		hvline = "u8g2_ll_hvline_vertical_top_lsb";
		cad = "u8x8_cad_ssd13xx_i2c";
		cad_shortname = "i2c";
		genclass = true;
		com = {"COM_I2C;"};
		displays = {
			"128x64_noname0";
		};
	};
	{
		name = "ssd1317";
		w = 12; h = 12;
		hvline = "u8g2_ll_hvline_vertical_top_lsb";
		cad = "u8x8_cad_001";
		genclass = true;
		com = {"COM_4WSPI";"COM_6800";"COM_8080";};
		displays = {
			"96x96";
		};
	};
	{
		name = "ssd1317";
		w = 12; h = 12;
		hvline = "u8g2_ll_hvline_vertical_top_lsb";
		cad = "u8x8_cad_ssd13xx_i2c";
		cad_shortname = "i2c";
		genclass = true;
		com = {"COM_I2C;"};
		displays = {
			"96x96";
		};
	};
	{
		name = "ssd1318";
		w = 16; h = 12;
		hvline = "u8g2_ll_hvline_vertical_top_lsb";
		cad = "u8x8_cad_001";
		genclass = true;
		com = {"COM_4WSPI";"COM_3WSPI";"COM_6800";"COM_8080";};
		displays = {
			"128x96";
			"128x96_xcp";
		};
	};
	{
		name = "ssd1318";
		w = 16; h = 12;
		hvline = "u8g2_ll_hvline_vertical_top_lsb";
		cad = "u8x8_cad_ssd13xx_fast_i2c";
		cad_shortname = "i2c";
		genclass = true;
		com = {"COM_I2C;"};
		displays = {
			"128x96";
			"128x96_xcp";
		};
	};
	{
		name = "ssd1325";
		w = 16; h = 8;
		hvline = "u8g2_ll_hvline_vertical_top_lsb";
		cad = "u8x8_cad_001";
		genclass = true;
		com = {"COM_4WSPI";"COM_3WSPI";"COM_6800";"COM_8080";};
		displays = {
			"nhd_128x64";
		};
	};
	{
		name = "ssd1325";
		w = 16; h = 8;
		hvline = "u8g2_ll_hvline_vertical_top_lsb";
		cad = "u8x8_cad_ssd13xx_i2c";
		cad_shortname = "i2c";
		genclass = true;
		com = {"COM_I2C;"};
		displays = {
			"nhd_128x64";
		};
	};
	{
		name = "ssd0323";
		w = 16; h = 8;
		hvline = "u8g2_ll_hvline_vertical_top_lsb";
		cad = "u8x8_cad_001";
		genclass = true;
		com = {"COM_4WSPI";"COM_3WSPI";"COM_6800";"COM_8080";};
		displays = {
			"os128064";
		};
	};
	{
		name = "ssd0323";
		w = 16; h = 8;
		hvline = "u8g2_ll_hvline_vertical_top_lsb";
		cad = "u8x8_cad_ssd13xx_i2c";
		cad_shortname = "i2c";
		genclass = true;
		com = {"COM_I2C;"};
		displays = {
			"os128064";
		};
	};
	{
		name = "ssd1326";
		w = 32; h = 4;
		hvline = "u8g2_ll_hvline_vertical_top_lsb";
		cad = "u8x8_cad_001";
		genclass = true;
		com = {"COM_4WSPI";"COM_3WSPI";"COM_6800";"COM_8080";};
		displays = {
			"er_256x32";
		};
	};
	{
		name = "ssd1326";
		w = 32; h = 4;
		hvline = "u8g2_ll_hvline_vertical_top_lsb";
		cad = "u8x8_cad_ssd13xx_i2c";
		cad_shortname = "i2c";
		genclass = true;
		com = {"COM_I2C;"};
		displays = {
			"er_256x32";
		};
	};
	{
		name = "ssd1327";
		w = 12; h = 12;
		hvline = "u8g2_ll_hvline_vertical_top_lsb";
		cad = "u8x8_cad_001";
		genclass = true;
		com = {"COM_4WSPI";"COM_3WSPI";"COM_6800";"COM_8080";};
		displays = {
			"seeed_96x96";
		};
	};
	{
		name = "ssd1327";
		w = 12; h = 12;
		hvline = "u8g2_ll_hvline_vertical_top_lsb";
		cad = "u8x8_cad_ssd13xx_i2c";
		cad_shortname = "i2c";
		genclass = true;
		com = {"COM_I2C;"};
		displays = {
			"seeed_96x96";
		};
	};
	{
		name = "ssd1327";
		w = 16; h = 16;
		hvline = "u8g2_ll_hvline_vertical_top_lsb";
		cad = "u8x8_cad_001";
		genclass = true;
		com = {"COM_4WSPI";"COM_3WSPI";"COM_6800";"COM_8080";};
		displays = {
			"ea_w128128";
			"midas_128x128";
		};
	};
	{
		name = "ssd1327";
		w = 16; h = 16;
		hvline = "u8g2_ll_hvline_vertical_top_lsb";
		cad = "u8x8_cad_ssd13xx_i2c";
		cad_shortname = "i2c";
		genclass = true;
		com = {"COM_I2C;"};
		displays = {
			"ea_w128128";
			"midas_128x128";
		};
	};
	{
		name = "ssd1329";
		w = 16; h = 12;
		hvline = "u8g2_ll_hvline_vertical_top_lsb";
		cad = "u8x8_cad_001";
		genclass = true;
		com = {"COM_4WSPI";"COM_6800";"COM_8080";};
		displays = {
			"128x96_noname";
		};
	};
	{
		name = "ld7032";
		w = 8; h = 4;
		hvline = "u8g2_ll_hvline_horizontal_right_lsb";
		cad = "u8x8_cad_011";
		genclass = true;
		com = {"COM_4WSPI";};
		displays = {
			"60x32";
		};
	};
	{
		name = "ld7032";
		w = 8; h = 4;
		hvline = "u8g2_ll_hvline_horizontal_right_lsb";
		cad = "u8x8_cad_ld7032_i2c";
		cad_shortname = "i2c";
		genclass = true;
		com = {"COM_I2C;"};
		displays = {
			"60x32";
		};
	};
	{
		name = "st7920";
		w = 24; h = 4;
		hvline = "u8g2_ll_hvline_horizontal_right_lsb";
		cad = "u8x8_cad_001";
		cad_shortname = "p";
		genclass = true;
		com = {"COM_8080";};
		displays = {
			"192x32";
		};
	};
	{
		name = "st7920";
		w = 24; h = 4;
		hvline = "u8g2_ll_hvline_horizontal_right_lsb";
		cad = "u8x8_cad_001";
		genclass = true;
		com = {"COM_6800";};
		displays = {
			"192x32";
		};
	};
	{
		name = "st7920";
		w = 24; h = 4;
		hvline = "u8g2_ll_hvline_horizontal_right_lsb";
		cad = "u8x8_cad_st7920_spi";
		cad_shortname = "s";
		genclass = true;
		com = {"COM_ST7920SPI";};
		displays = {
			"192x32";
		};
	};
	{
		name = "st7920";
		w = 16; h = 8;
		hvline = "u8g2_ll_hvline_horizontal_right_lsb";
		cad = "u8x8_cad_001";
		cad_shortname = "p";
		genclass = true;
		com = {"COM_8080";};
		displays = {
			"128x64";
		};
	};
	{
		name = "st7920";
		w = 16; h = 8;
		hvline = "u8g2_ll_hvline_horizontal_right_lsb";
		cad = "u8x8_cad_001";
		genclass = true;
		com = {"COM_6800";};
		displays = {
			"128x64";
		};
	};
	{
		name = "st7920";
		w = 16; h = 8;
		hvline = "u8g2_ll_hvline_horizontal_right_lsb";
		cad = "u8x8_cad_st7920_spi";
		cad_shortname = "s";
		genclass = true;
		com = {"COM_ST7920SPI";};
		displays = {
			"128x64";
		};
	};
	{
		name = "ls013b7dh03";
		w = 16; h = 16;
		hvline = "u8g2_ll_hvline_horizontal_right_lsb";
		cad = "u8x8_cad_001";
		genclass = true;
		com = {"COM_4WSPI";};
		displays = {
			"128x128";
		};
	};
	{
		name = "ls027b7dh01";
		w = 50; h = 30;
		hvline = "u8g2_ll_hvline_horizontal_right_lsb";
		cad = "u8x8_cad_001";
		genclass = true;
		com = {"COM_4WSPI";};
		displays = {
			"400x240";
		};
	};
	{
		name = "ls013b7dh05";
		w = 18; h = 21;
		hvline = "u8g2_ll_hvline_horizontal_right_lsb";
		cad = "u8x8_cad_001";
		genclass = true;
		com = {"COM_4WSPI";};
		displays = {
			"144x168";
		};
	};
	{
		name = "uc1701";
		w = 13; h = 8;
		hvline = "u8g2_ll_hvline_vertical_top_lsb";
		cad = "u8x8_cad_001";
		genclass = true;
		com = {"COM_4WSPI";"COM_3WSPI";"COM_6800";"COM_8080";};
		displays = {
			"ea_dogs102";
		};
	};
	{
		name = "uc1701";
		w = 16; h = 8;
		hvline = "u8g2_ll_hvline_vertical_top_lsb";
		cad = "u8x8_cad_001";
		genclass = true;
		com = {"COM_4WSPI";"COM_3WSPI";"COM_6800";"COM_8080";};
		displays = {
			"mini12864";
		};
	};
	{
		name = "pcd8544";
		w = 11; h = 6;
		hvline = "u8g2_ll_hvline_vertical_top_lsb";
		cad = "u8x8_cad_001";
		note = "No HW flip";
		genclass = true;
		com = {"COM_4WSPI";"COM_3WSPI";};
		displays = {
			"84x48";
		};
	};
	{
		name = "pcf8812";
		w = 12; h = 9;
		hvline = "u8g2_ll_hvline_vertical_top_lsb";
		cad = "u8x8_cad_001";
		note = "No HW flip";
		genclass = true;
		com = {"COM_4WSPI";"COM_3WSPI";};
		displays = {
			"96x65";
		};
	};
	{
		name = "hx1230";
		w = 12; h = 9;
		hvline = "u8g2_ll_hvline_vertical_top_lsb";
		cad = "u8x8_cad_001";
		note = "No HW flip";
		genclass = true;
		com = {"COM_4WSPI";"COM_3WSPI";};
		displays = {
			"96x68";
		};
	};
	{
		name = "uc1604";
		w = 24; h = 8;
		hvline = "u8g2_ll_hvline_vertical_top_lsb";
		cad = "u8x8_cad_001";
		genclass = true;
		com = {"COM_4WSPI";"COM_3WSPI";"COM_6800";"COM_8080";};
		displays = {
			"jlx19264";
		};
	};
	{
		name = "uc1604";
		w = 24; h = 8;
		hvline = "u8g2_ll_hvline_vertical_top_lsb";
		cad = "u8x8_cad_uc16xx_i2c";
		cad_shortname = "i2c";
		genclass = true;
		com = {"COM_I2C;"};
		displays = {
			"jlx19264";
		};
	};
	{
		name = "uc1608";
		w = 30; h = 8;
		hvline = "u8g2_ll_hvline_vertical_top_lsb";
		cad = "u8x8_cad_001";
		genclass = true;
		com = {"COM_4WSPI";"COM_3WSPI";"COM_6800";"COM_8080";};
		displays = {
			"erc24064";
		};
	};
	{
		name = "uc1608";
		w = 30; h = 8;
		hvline = "u8g2_ll_hvline_vertical_top_lsb";
		cad = "u8x8_cad_uc16xx_i2c";
		cad_shortname = "i2c";
		genclass = true;
		com = {"COM_I2C;"};
		displays = {
			"erc24064";
		};
	};
	{
		name = "uc1608";
		w = 30; h = 15;
		hvline = "u8g2_ll_hvline_vertical_top_lsb";
		cad = "u8x8_cad_001";
		genclass = true;
		com = {"COM_4WSPI";"COM_3WSPI";"COM_6800";"COM_8080";};
		displays = {
			"erc240120";
		};
	};
	{
		name = "uc1608";
		w = 30; h = 15;
		hvline = "u8g2_ll_hvline_vertical_top_lsb";
		cad = "u8x8_cad_uc16xx_i2c";
		cad_shortname = "i2c";
		genclass = true;
		com = {"COM_I2C;"};
		displays = {
			"erc240120";
		};
	};
	{
		name = "uc1608";
		w = 30; h = 16;
		hvline = "u8g2_ll_hvline_vertical_top_lsb";
		cad = "u8x8_cad_001";
		genclass = true;
		com = {"COM_4WSPI";"COM_3WSPI";"COM_6800";"COM_8080";};
		displays = {
			"240x128";
		};
	};
	{
		name = "uc1608";
		w = 30; h = 16;
		hvline = "u8g2_ll_hvline_vertical_top_lsb";
		cad = "u8x8_cad_uc16xx_i2c";
		cad_shortname = "i2c";
		genclass = true;
		com = {"COM_I2C;"};
		displays = {
			"240x128";
		};
	};
	{
		name = "uc1638";
		w = 20; h = 16;
		hvline = "u8g2_ll_hvline_vertical_top_lsb";
		cad = "u8x8_cad_011";
		genclass = true;
		com = {"COM_4WSPI";"COM_3WSPI";"COM_6800";"COM_8080";};
		displays = {
			"160x128";
		};
	};
	{
		name = "uc1610";
		w = 20; h = 13;
		hvline = "u8g2_ll_hvline_vertical_top_lsb";
		cad = "u8x8_cad_001";
		note = "3W SPI not tested";
		genclass = true;
		com = {"COM_4WSPI";"COM_3WSPI";"COM_6800";"COM_8080";};
		displays = {
			"ea_dogxl160";
		};
	};
	{
		name = "uc1610";
		w = 20; h = 13;
		hvline = "u8g2_ll_hvline_vertical_top_lsb";
		cad = "u8x8_cad_uc16xx_i2c";
		cad_shortname = "i2c";
		note = "3W SPI not tested, I2C not tested";
		genclass = true;
		com = {"COM_I2C;"};
		displays = {
			"ea_dogxl160";
		};
	};
	{
		name = "uc1611";
		w = 30; h = 8;
		hvline = "u8g2_ll_hvline_vertical_top_lsb";
		cad = "u8x8_cad_001";
		genclass = true;
		com = {"COM_4WSPI";"COM_3WSPI";"COM_6800";"COM_8080";};
		displays = {
			"ea_dogm240";
		};
	};
	{
		name = "uc1611";
		w = 30; h = 8;
		hvline = "u8g2_ll_hvline_vertical_top_lsb";
		cad = "u8x8_cad_uc16xx_i2c";
		cad_shortname = "i2c";
		genclass = true;
		com = {"COM_I2C;"};
		displays = {
			"ea_dogm240";
		};
	};
	{
		name = "uc1611";
		w = 30; h = 16;
		hvline = "u8g2_ll_hvline_vertical_top_lsb";
		cad = "u8x8_cad_001";
		genclass = true;
		com = {"COM_4WSPI";"COM_3WSPI";"COM_6800";"COM_8080";};
		displays = {
			"ea_dogxl240";
		};
	};
	{
		name = "uc1611";
		w = 30; h = 16;
		hvline = "u8g2_ll_hvline_vertical_top_lsb";
		cad = "u8x8_cad_uc16xx_i2c";
		cad_shortname = "i2c";
		genclass = true;
		com = {"COM_I2C;"};
		displays = {
			"ea_dogxl240";
		};
	};
	{
		name = "uc1611";
		w = 30; h = 20;
		hvline = "u8g2_ll_hvline_vertical_top_lsb";
		cad = "u8x8_cad_001";
		note = "240x160, active high chip select";
		genclass = true;
		com = {"COM_4WSPI";"COM_3WSPI";"COM_6800";"COM_8080";};
		displays = {
			"ew50850";
		};
	};
	{
		name = "uc1611";
		w = 30; h = 20;
		hvline = "u8g2_ll_hvline_vertical_top_lsb";
		cad = "u8x8_cad_uc16xx_i2c";
		cad_shortname = "i2c";
		note = "240x160, active high chip select";
		genclass = true;
		com = {"COM_I2C;"};
		displays = {
			"ew50850";
		};
	};
	{
		name = "st7565";
		w = 16; h = 8;
		hvline = "u8g2_ll_hvline_vertical_top_lsb";
		cad = "u8x8_cad_001";
		genclass = true;
		com = {"COM_4WSPI";"COM_3WSPI";"COM_6800";"COM_8080";};
		displays = {
			"ea_dogm128";
			"64128n";
			"zolen_128x64";
			"lm6059";
			"lx12864";
			"erc12864";
			"erc12864_alt";
			"nhd_c12864";
			"jlx12864";
		};
	};
	{
		name = "st7565";
		w = 16; h = 4;
		hvline = "u8g2_ll_hvline_vertical_top_lsb";
		cad = "u8x8_cad_001";
		genclass = true;
		com = {"COM_4WSPI";"COM_3WSPI";"COM_6800";"COM_8080";};
		displays = {
			"nhd_c12832";
		};
	};
	{
		name = "uc1601";
		w = 16; h = 4;
		hvline = "u8g2_ll_hvline_vertical_top_lsb";
		cad = "u8x8_cad_001";
		genclass = true;
		com = {"COM_4WSPI";"COM_3WSPI";"COM_6800";"COM_8080";};
		displays = {
			"128x32";
		};
	};
	{
		name = "uc1601";
		w = 16; h = 4;
		hvline = "u8g2_ll_hvline_vertical_top_lsb";
		cad = "u8x8_cad_uc16xx_i2c";
		cad_shortname = "i2c";
		genclass = true;
		com = {"COM_I2C;"};
		displays = {
			"128x32";
		};
	};
	{
		name = "st7565";
		w = 17; h = 4;
		hvline = "u8g2_ll_hvline_vertical_top_lsb";
		cad = "u8x8_cad_001";
		genclass = true;
		com = {"COM_4WSPI";"COM_3WSPI";"COM_6800";"COM_8080";};
		displays = {
			"ea_dogm132";
		};
	};
	{
		name = "st7567";
		w = 17; h = 8;
		hvline = "u8g2_ll_hvline_vertical_top_lsb";
		cad = "u8x8_cad_001";
		genclass = true;
		com = {"COM_4WSPI";"COM_6800";"COM_8080";};
		displays = {
			"pi_132x64";
		};
	};
	{
		name = "st7567";
		w = 16; h = 8;
		hvline = "u8g2_ll_hvline_vertical_top_lsb";
		cad = "u8x8_cad_001";
		genclass = true;
		com = {"COM_4WSPI";"COM_6800";"COM_8080";};
		displays = {
			"jlx12864";
			"enh_dg128064";
			"enh_dg128064i";
		};
	};
	{
		name = "st7567";
		w = 8; h = 4;
		hvline = "u8g2_ll_hvline_vertical_top_lsb";
		cad = "u8x8_cad_001";
		genclass = true;
		com = {"COM_4WSPI";"COM_6800";"COM_8080";};
		displays = {
			"64x32";
		};
	};
	{
		name = "st7567";
		w = 8; h = 4;
		hvline = "u8g2_ll_hvline_vertical_top_lsb";
		cad = "u8x8_cad_ssd13xx_i2c";
		cad_shortname = "i2c";
		genclass = true;
		com = {"COM_I2C;"};
		displays = {
			"64x32";
		};
	};
	{
		name = "st7586s";
		w = 48; h = 17;
		hvline = "u8g2_ll_hvline_horizontal_right_lsb";
		cad = "u8x8_cad_011";
		genclass = true;
		com = {"COM_4WSPI";};
		displays = {
			"s028hn118a";
		};
	};
	{
		name = "st7586s";
		w = 30; h = 20;
		hvline = "u8g2_ll_hvline_horizontal_right_lsb";
		cad = "u8x8_cad_011";
		genclass = true;
		com = {"COM_4WSPI";"COM_3WSPI";"COM_6800";"COM_8080";};
		displays = {
			"erc240160";
		};
	};
	{
		name = "st7588";
		w = 16; h = 8;
		hvline = "u8g2_ll_hvline_vertical_top_lsb";
		cad = "u8x8_cad_001";
		genclass = true;
		com = {"COM_4WSPI";"COM_3WSPI";"COM_6800";"COM_8080";};
		displays = {
			"jlx12864";
		};
	};
	{
		name = "st7588";
		w = 16; h = 8;
		hvline = "u8g2_ll_hvline_vertical_top_lsb";
		cad = "u8x8_cad_ssd13xx_i2c";
		cad_shortname = "i2c";
		genclass = true;
		com = {"COM_I2C;"};
		displays = {
			"jlx12864";
		};
	};
	{
		name = "st75256";
		w = 32; h = 16;
		hvline = "u8g2_ll_hvline_vertical_top_lsb";
		cad = "u8x8_cad_011";
		genclass = true;
		com = {"COM_4WSPI";"COM_3WSPI";"COM_6800";"COM_8080";};
		displays = {
			"jlx256128";
		};
	};
	{
		name = "st75256";
		w = 32; h = 16;
		hvline = "u8g2_ll_hvline_vertical_top_lsb";
		cad = "u8x8_cad_st75256_i2c";
		cad_shortname = "i2c";
		genclass = true;
		com = {"COM_I2C;"};
		displays = {
			"jlx256128";
		};
	};
	{
		name = "st75256";
		w = 32; h = 20;
		hvline = "u8g2_ll_hvline_vertical_top_lsb";
		cad = "u8x8_cad_011";
		genclass = true;
		com = {"COM_4WSPI";"COM_3WSPI";"COM_6800";"COM_8080";};
		displays = {
			"jlx256160";
			"jlx256160_alt";
		};
	};
	{
		name = "st75256";
		w = 32; h = 20;
		hvline = "u8g2_ll_hvline_vertical_top_lsb";
		cad = "u8x8_cad_st75256_i2c";
		cad_shortname = "i2c";
		genclass = true;
		com = {"COM_I2C;"};
		displays = {
			"jlx256160";
		};
	};
	{
		name = "st75256";
		w = 30; h = 20;
		hvline = "u8g2_ll_hvline_vertical_top_lsb";
		cad = "u8x8_cad_011";
		genclass = true;
		com = {"COM_4WSPI";"COM_3WSPI";"COM_6800";"COM_8080";};
		displays = {
			"jlx240160";
		};
	};
	{
		name = "st75256";
		w = 30; h = 20;
		hvline = "u8g2_ll_hvline_vertical_top_lsb";
		cad = "u8x8_cad_st75256_i2c";
		cad_shortname = "i2c";
		genclass = true;
		com = {"COM_I2C;"};
		displays = {
			"jlx240160";
		};
	};
	{
		name = "st75256";
		w = 32; h = 8;
		hvline = "u8g2_ll_hvline_vertical_top_lsb";
		cad = "u8x8_cad_011";
		genclass = true;
		com = {"COM_4WSPI";"COM_3WSPI";"COM_6800";"COM_8080";};
		displays = {
			"jlx25664";
		};
	};
	{
		name = "st75256";
		w = 32; h = 8;
		hvline = "u8g2_ll_hvline_vertical_top_lsb";
		cad = "u8x8_cad_st75256_i2c";
		cad_shortname = "i2c";
		genclass = true;
		com = {"COM_I2C;"};
		displays = {
			"jlx25664";
		};
	};
	{
		name = "st75256";
		w = 22; h = 13;
		hvline = "u8g2_ll_hvline_vertical_top_lsb";
		cad = "u8x8_cad_011";
		genclass = true;
		com = {"COM_4WSPI";"COM_3WSPI";"COM_6800";"COM_8080";};
		displays = {
			"jlx172104";
		};
	};
	{
		name = "st75256";
		w = 22; h = 13;
		hvline = "u8g2_ll_hvline_vertical_top_lsb";
		cad = "u8x8_cad_st75256_i2c";
		cad_shortname = "i2c";
		genclass = true;
		com = {"COM_I2C;"};
		displays = {
			"jlx172104";
		};
	};
	{
		name = "st75256";
		w = 24; h = 12;
		hvline = "u8g2_ll_hvline_vertical_top_lsb";
		cad = "u8x8_cad_011";
		genclass = true;
		com = {"COM_4WSPI";"COM_3WSPI";"COM_6800";"COM_8080";};
		displays = {
			"jlx19296";
		};
	};
	{
		name = "st75256";
		w = 24; h = 12;
		hvline = "u8g2_ll_hvline_vertical_top_lsb";
		cad = "u8x8_cad_st75256_i2c";
		cad_shortname = "i2c";
		genclass = true;
		com = {"COM_I2C;"};
		displays = {
			"jlx19296";
		};
	};
	{
		name = "nt7534";
		w = 16; h = 8;
		hvline = "u8g2_ll_hvline_vertical_top_lsb";
		cad = "u8x8_cad_001";
		genclass = true;
		com = {"COM_4WSPI";"COM_6800";"COM_8080";};
		displays = {
			"tg12864r";
		};
	};
	{
		name = "ist3020";
		w = 24; h = 8;
		hvline = "u8g2_ll_hvline_vertical_top_lsb";
		cad = "u8x8_cad_001";
		genclass = true;
		com = {"COM_4WSPI";"COM_6800";"COM_8080";};
		displays = {
			"erc19264";
		};
	};
	{
		name = "sbn1661";
		w = 16; h = 4;
		hvline = "u8g2_ll_hvline_vertical_top_lsb";
		cad = "u8x8_cad_001";
		genclass = true;
		com = {"COM_SED1520";};
		displays = {
			"122x32";
		};
	};
	{
		name = "sed1520";
		w = 16; h = 4;
		hvline = "u8g2_ll_hvline_vertical_top_lsb";
		cad = "u8x8_cad_001";
		genclass = true;
		com = {"COM_SED1520";};
		displays = {
			"122x32";
		};
	};
	{
		name = "ks0108";
		w = 16; h = 8;
		hvline = "u8g2_ll_hvline_vertical_top_lsb";
		cad = "u8x8_cad_001";
		genclass = true;
		com = {"COM_KS0108";};
		displays = {
			"128x64";
		};
	};
	{
		name = "ks0108";
		w = 24; h = 8;
		hvline = "u8g2_ll_hvline_vertical_top_lsb";
		cad = "u8x8_cad_001";
		genclass = true;
		com = {"COM_KS0108";};
		displays = {
			"erm19264";
		};
	};
	{
		name = "lc7981";
		w = 20; h = 10;
		hvline = "u8g2_ll_hvline_horizontal_right_lsb";
		cad = "u8x8_cad_100";
		note = "U8x8 not supported, no powerdown, no HW flip, no constrast";
		genclass = true;
		com = {"COM_6800";};
		displays = {
			"160x80";
		};
	};
	{
		name = "lc7981";
		w = 20; h = 20;
		hvline = "u8g2_ll_hvline_horizontal_right_lsb";
		cad = "u8x8_cad_100";
		note = "U8x8 not supported, no powerdown, no HW flip, no constrast";
		genclass = true;
		com = {"COM_6800";};
		displays = {
			"160x160";
		};
	};
	{
		name = "lc7981";
		w = 30; h = 16;
		hvline = "u8g2_ll_hvline_horizontal_right_lsb";
		cad = "u8x8_cad_100";
		note = "U8x8 not supported, no powerdown, no HW flip, no constrast";
		genclass = true;
		com = {"COM_6800";};
		displays = {
			"240x128";
		};
	};
	{
		name = "lc7981";
		w = 30; h = 8;
		hvline = "u8g2_ll_hvline_horizontal_right_lsb";
		cad = "u8x8_cad_100";
		note = "U8x8 not supported, no powerdown, no HW flip, no constrast";
		genclass = true;
		com = {"COM_6800";};
		displays = {
			"240x64";
		};
	};
	{
		name = "t6963";
		w = 30; h = 16;
		hvline = "u8g2_ll_hvline_horizontal_right_lsb";
		cad = "u8x8_cad_100";
		genclass = true;
		com = {"COM_8080";};
		displays = {
			"240x128";
		};
	};
	{
		name = "t6963";
		w = 30; h = 8;
		hvline = "u8g2_ll_hvline_horizontal_right_lsb";
		cad = "u8x8_cad_100";
		genclass = true;
		com = {"COM_8080";};
		displays = {
			"240x64";
		};
	};
	{
		name = "t6963";
		w = 32; h = 8;
		hvline = "u8g2_ll_hvline_horizontal_right_lsb";
		cad = "u8x8_cad_100";
		note = "Not tested";
		genclass = true;
		com = {"COM_8080";};
		displays = {
			"256x64";
		};
	};
	{
		name = "t6963";
		w = 16; h = 8;
		hvline = "u8g2_ll_hvline_horizontal_right_lsb";
		cad = "u8x8_cad_100";
		note = "Not tested";
		genclass = true;
		com = {"COM_8080";};
		displays = {
			"128x64";
			"128x64_alt";
		};
	};
	{
		name = "t6963";
		w = 20; h = 10;
		hvline = "u8g2_ll_hvline_horizontal_right_lsb";
		cad = "u8x8_cad_100";
		note = "Not tested";
		genclass = true;
		com = {"COM_8080";};
		displays = {
			"160x80";
		};
	};
	{
		name = "ssd1322";
		w = 32; h = 8;
		hvline = "u8g2_ll_hvline_vertical_top_lsb";
		cad = "u8x8_cad_011";
		note = "Requires U8G2_16BIT (see u8g2.h)";
		genclass = true;
		com = {"COM_4WSPI";"COM_3WSPI";"COM_6800";"COM_8080";};
		displays = {
			"nhd_256x64";
		};
	};
	{
		name = "ssd1322";
		w = 16; h = 8;
		hvline = "u8g2_ll_hvline_vertical_top_lsb";
		cad = "u8x8_cad_011";
		genclass = true;
		com = {"COM_4WSPI";"COM_3WSPI";"COM_6800";"COM_8080";};
		displays = {
			"nhd_128x64";
		};
	};
	{
		name = "ssd1606";
		w = 22; h = 9;
		hvline = "u8g2_ll_hvline_vertical_top_lsb";
		cad = "u8x8_cad_011";
		note = "Partly supported by U8x8, no HW flip, no contrast setting";
		genclass = true;
		com = {"COM_4WSPI";"COM_3WSPI";};
		displays = {
			"172x72";
		};
	};
	{
		name = "ssd1607";
		w = 25; h = 25;
		hvline = "u8g2_ll_hvline_vertical_top_lsb";
		cad = "u8x8_cad_011";
		note = "Partly supported by U8x8, no HW flip, no contrast setting, v2 includes an optimized LUT";
		genclass = true;
		com = {"COM_4WSPI";"COM_3WSPI";};
		displays = {
			"200x200";
			"gd_200x200";
			"ws_200x200";
		};
	};
	{
		name = "il3820";
		w = 37; h = 16;
		hvline = "u8g2_ll_hvline_vertical_top_lsb";
		cad = "u8x8_cad_011";
		note = "Partly supported by U8x8, no HW flip, no contrast setting, V2 produces lesser screen-flicker";
		genclass = true;
		com = {"COM_4WSPI";"COM_3WSPI";};
		displays = {
			"296x128";
			"v2_296x128";
		};
	};
	{
		name = "sed1330";
		w = 30; h = 16;
		hvline = "u8g2_ll_hvline_horizontal_right_lsb";
		cad = "u8x8_cad_100";
		note = "Not tested, might work for RA8835 and SED1335 also";
		genclass = true;
		com = {"COM_6800";"COM_8080";};
		displays = {
			"240x128";
		};
	};
	{
		name = "ra8835";
		w = 30; h = 16;
		hvline = "u8g2_ll_hvline_horizontal_right_lsb";
		cad = "u8x8_cad_100";
		note = "Tested with RA8835";
		genclass = true;
		com = {"COM_6800";"COM_8080";};
		displays = {
			"nhd_240x128";
		};
	};
	{
		name = "ra8835";
		w = 40; h = 30;
		hvline = "u8g2_ll_hvline_horizontal_right_lsb";
		cad = "u8x8_cad_100";
		note = "not tested";
		genclass = true;
		com = {"COM_6800";"COM_8080";};
		displays = {
			"320x240";
		};
	};
	{
		name = "max7219";
		w = 8; h = 1;
		hvline = "u8g2_ll_hvline_horizontal_right_lsb";
		cad = "u8x8_cad_empty";
		genclass = true;
		com = {"COM_4WSPI";};
		displays = {
			"64x8";
		};
	};
	{
		name = "max7219";
		w = 4; h = 1;
		hvline = "u8g2_ll_hvline_horizontal_right_lsb";
		cad = "u8x8_cad_empty";
		genclass = true;
		com = {"COM_4WSPI";};
		displays = {
			"32x8";
		};
	};
	{
		name = "max7219";
		w = 1; h = 1;
		hvline = "u8g2_ll_hvline_horizontal_right_lsb";
		cad = "u8x8_cad_empty";
		genclass = true;
		com = {"COM_4WSPI";};
		displays = {
			"8x8";
		};
	};
	{
		name = "a2printer";
		w = 48; h = 30;
		hvline = "u8g2_ll_hvline_horizontal_right_lsb";
		cad = "u8x8_cad_empty";
		genclass = false;
		com = {"COM_UART";};
		displays = {
			"384x240";
		};
	};
}

return controllers
