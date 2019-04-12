
[tocstart]: # (toc start)

  * [Introduction](#introduction)
  * [Setup Function Reference](#setup-function-reference)
    * [SSD1305 128X32_NONAME](#ssd1305-128x32_noname)
    * [SSD1305 128X32_ADAFRUIT](#ssd1305-128x32_adafruit)
    * [SSD1305 128X64_ADAFRUIT](#ssd1305-128x64_adafruit)
    * [SSD1306 128X64_NONAME](#ssd1306-128x64_noname)
    * [SSD1306 128X64_VCOMH0](#ssd1306-128x64_vcomh0)
    * [SSD1306 128X64_ALT0](#ssd1306-128x64_alt0)
    * [SH1106 128X64_NONAME](#sh1106-128x64_noname)
    * [SH1106 128X64_VCOMH0](#sh1106-128x64_vcomh0)
    * [SH1106 128X64_WINSTAR](#sh1106-128x64_winstar)
    * [SH1106 72X40_WISE](#sh1106-72x40_wise)
    * [SH1106 64X32](#sh1106-64x32)
    * [SH1107 64X128](#sh1107-64x128)
    * [SH1107 SEEED_96X96](#sh1107-seeed_96x96)
    * [SH1107 128X128](#sh1107-128x128)
    * [SH1107 PIMORONI_128X128](#sh1107-pimoroni_128x128)
    * [SH1108 160X160](#sh1108-160x160)
    * [SH1122 256X64](#sh1122-256x64)
    * [SSD1306 128X32_UNIVISION](#ssd1306-128x32_univision)
    * [SSD1306 128X32_WINSTAR](#ssd1306-128x32_winstar)
    * [SSD1306 64X48_ER](#ssd1306-64x48_er)
    * [SSD1306 48X64_WINSTAR](#ssd1306-48x64_winstar)
    * [SSD1306 64X32_NONAME](#ssd1306-64x32_noname)
    * [SSD1306 64X32_1F](#ssd1306-64x32_1f)
    * [SSD1306 96X16_ER](#ssd1306-96x16_er)
    * [SSD1309 128X64_NONAME2](#ssd1309-128x64_noname2)
    * [SSD1309 128X64_NONAME0](#ssd1309-128x64_noname0)
    * [SSD1317 96X96](#ssd1317-96x96)
    * [SSD1318 128X96](#ssd1318-128x96)
    * [SSD1318 128X96_XCP](#ssd1318-128x96_xcp)
    * [SSD1325 NHD_128X64](#ssd1325-nhd_128x64)
    * [SSD0323 OS128064](#ssd0323-os128064)
    * [SSD1326 ER_256X32](#ssd1326-er_256x32)
    * [SSD1327 SEEED_96X96](#ssd1327-seeed_96x96)
    * [SSD1327 EA_W128128](#ssd1327-ea_w128128)
    * [SSD1327 MIDAS_128X128](#ssd1327-midas_128x128)
    * [SSD1329 128X96_NONAME](#ssd1329-128x96_noname)
    * [LD7032 60X32](#ld7032-60x32)
    * [ST7920 192X32](#st7920-192x32)
    * [ST7920 192X32](#st7920-192x32)
    * [ST7920 192X32](#st7920-192x32)
    * [ST7920 128X64](#st7920-128x64)
    * [ST7920 128X64](#st7920-128x64)
    * [ST7920 128X64](#st7920-128x64)
    * [LS013B7DH03 128X128](#ls013b7dh03-128x128)
    * [LS027B7DH01 400X240](#ls027b7dh01-400x240)
    * [LS013B7DH05 144X168](#ls013b7dh05-144x168)
    * [UC1701 EA_DOGS102](#uc1701-ea_dogs102)
    * [UC1701 MINI12864](#uc1701-mini12864)
    * [PCD8544 84X48](#pcd8544-84x48)
    * [PCF8812 96X65](#pcf8812-96x65)
    * [HX1230 96X68](#hx1230-96x68)
    * [UC1604 JLX19264](#uc1604-jlx19264)
    * [UC1608 ERC24064](#uc1608-erc24064)
    * [UC1608 ERC240120](#uc1608-erc240120)
    * [UC1608 240X128](#uc1608-240x128)
    * [UC1638 160X128](#uc1638-160x128)
    * [UC1610 EA_DOGXL160](#uc1610-ea_dogxl160)
    * [UC1611 EA_DOGM240](#uc1611-ea_dogm240)
    * [UC1611 EA_DOGXL240](#uc1611-ea_dogxl240)
    * [UC1611 EW50850](#uc1611-ew50850)
    * [ST7565 EA_DOGM128](#st7565-ea_dogm128)
    * [ST7565 64128N](#st7565-64128n)
    * [ST7565 ZOLEN_128X64](#st7565-zolen_128x64)
    * [ST7565 LM6059](#st7565-lm6059)
    * [ST7565 LX12864](#st7565-lx12864)
    * [ST7565 ERC12864](#st7565-erc12864)
    * [ST7565 ERC12864_ALT](#st7565-erc12864_alt)
    * [ST7565 NHD_C12864](#st7565-nhd_c12864)
    * [ST7565 JLX12864](#st7565-jlx12864)
    * [ST7565 NHD_C12832](#st7565-nhd_c12832)
    * [UC1601 128X32](#uc1601-128x32)
    * [ST7565 EA_DOGM132](#st7565-ea_dogm132)
    * [ST7567 PI_132X64](#st7567-pi_132x64)
    * [ST7567 JLX12864](#st7567-jlx12864)
    * [ST7567 ENH_DG128064](#st7567-enh_dg128064)
    * [ST7567 ENH_DG128064I](#st7567-enh_dg128064i)
    * [ST7567 64X32](#st7567-64x32)
    * [ST7586S S028HN118A](#st7586s-s028hn118a)
    * [ST7586S ERC240160](#st7586s-erc240160)
    * [ST7588 JLX12864](#st7588-jlx12864)
    * [ST75256 JLX256128](#st75256-jlx256128)
    * [ST75256 JLX256160](#st75256-jlx256160)
    * [ST75256 JLX256160_ALT](#st75256-jlx256160_alt)
    * [ST75256 JLX240160](#st75256-jlx240160)
    * [ST75256 JLX25664](#st75256-jlx25664)
    * [ST75256 JLX172104](#st75256-jlx172104)
    * [ST75256 JLX19296](#st75256-jlx19296)
    * [NT7534 TG12864R](#nt7534-tg12864r)
    * [IST3020 ERC19264](#ist3020-erc19264)
    * [SBN1661 122X32](#sbn1661-122x32)
    * [SED1520 122X32](#sed1520-122x32)
    * [KS0108 128X64](#ks0108-128x64)
    * [KS0108 ERM19264](#ks0108-erm19264)
    * [LC7981 160X80](#lc7981-160x80)
    * [LC7981 160X160](#lc7981-160x160)
    * [LC7981 240X128](#lc7981-240x128)
    * [LC7981 240X64](#lc7981-240x64)
    * [T6963 240X128](#t6963-240x128)
    * [T6963 240X64](#t6963-240x64)
    * [T6963 256X64](#t6963-256x64)
    * [T6963 128X64](#t6963-128x64)
    * [T6963 128X64_ALT](#t6963-128x64_alt)
    * [T6963 160X80](#t6963-160x80)
    * [SSD1322 NHD_256X64](#ssd1322-nhd_256x64)
    * [SSD1322 NHD_128X64](#ssd1322-nhd_128x64)
    * [SSD1606 172X72](#ssd1606-172x72)
    * [SSD1607 200X200](#ssd1607-200x200)
    * [SSD1607 GD_200X200](#ssd1607-gd_200x200)
    * [SSD1607 WS_200X200](#ssd1607-ws_200x200)
    * [IL3820 296X128](#il3820-296x128)
    * [IL3820 V2_296X128](#il3820-v2_296x128)
    * [SED1330 240X128](#sed1330-240x128)
    * [RA8835 NHD_240X128](#ra8835-nhd_240x128)
    * [RA8835 320X240](#ra8835-320x240)
    * [MAX7219 64X8](#max7219-64x8)
    * [MAX7219 32X8](#max7219-32x8)
    * [MAX7219 8X8](#max7219-8x8)
  * [Links](#links)

[tocend]: # (toc end)

# Introduction

[comment]: # (It's kinda lonely here…)

# Setup Function Reference

## SSD1305 128X32_NONAME
| Controller "ssd1305", Display "128x32_noname" | Descirption |
|---|---|
| u8x8_Setup(u8x8, u8x8_d_ssd1305_128x32_noname, u8x8_cad_001, u8x8_byte_4wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_ssd1305_128x32_noname, u8x8_cad_001, u8x8_byte_8bit_6800mode, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_ssd1305_128x32_noname, u8x8_cad_001, u8x8_byte_8bit_8080mode, uC specific); |

## SSD1305 128X32_ADAFRUIT
| Controller "ssd1305", Display "128x32_adafruit" | Descirption |
|---|---|
| u8x8_Setup(u8x8, u8x8_d_ssd1305_128x32_adafruit, u8x8_cad_001, u8x8_byte_4wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_ssd1305_128x32_adafruit, u8x8_cad_001, u8x8_byte_8bit_6800mode, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_ssd1305_128x32_adafruit, u8x8_cad_001, u8x8_byte_8bit_8080mode, uC specific); |

## SSD1305 128X64_ADAFRUIT
| Controller "ssd1305", Display "128x64_adafruit" | Descirption |
|---|---|
| u8x8_Setup(u8x8, u8x8_d_ssd1305_128x64_adafruit, u8x8_cad_001, u8x8_byte_4wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_ssd1305_128x64_adafruit, u8x8_cad_001, u8x8_byte_8bit_6800mode, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_ssd1305_128x64_adafruit, u8x8_cad_001, u8x8_byte_8bit_8080mode, uC specific); |

## SSD1306 128X64_NONAME
| Controller "ssd1306", Display "128x64_noname" | Descirption |
|---|---|
| u8x8_Setup(u8x8, u8x8_d_ssd1306_128x64_noname, u8x8_cad_001, u8x8_byte_4wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_ssd1306_128x64_noname, u8x8_cad_001, u8x8_byte_3wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_ssd1306_128x64_noname, u8x8_cad_001, u8x8_byte_8bit_6800mode, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_ssd1306_128x64_noname, u8x8_cad_001, u8x8_byte_8bit_8080mode, uC specific); |

## SSD1306 128X64_VCOMH0
| Controller "ssd1306", Display "128x64_vcomh0" | Descirption |
|---|---|
| u8x8_Setup(u8x8, u8x8_d_ssd1306_128x64_vcomh0, u8x8_cad_001, u8x8_byte_4wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_ssd1306_128x64_vcomh0, u8x8_cad_001, u8x8_byte_3wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_ssd1306_128x64_vcomh0, u8x8_cad_001, u8x8_byte_8bit_6800mode, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_ssd1306_128x64_vcomh0, u8x8_cad_001, u8x8_byte_8bit_8080mode, uC specific); |

## SSD1306 128X64_ALT0
| Controller "ssd1306", Display "128x64_alt0" | Descirption |
|---|---|
| u8x8_Setup(u8x8, u8x8_d_ssd1306_128x64_alt0, u8x8_cad_001, u8x8_byte_4wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_ssd1306_128x64_alt0, u8x8_cad_001, u8x8_byte_3wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_ssd1306_128x64_alt0, u8x8_cad_001, u8x8_byte_8bit_6800mode, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_ssd1306_128x64_alt0, u8x8_cad_001, u8x8_byte_8bit_8080mode, uC specific); |

## SH1106 128X64_NONAME
| Controller "sh1106", Display "128x64_noname" | Descirption |
|---|---|
| u8x8_Setup(u8x8, u8x8_d_sh1106_128x64_noname, u8x8_cad_001, u8x8_byte_4wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_sh1106_128x64_noname, u8x8_cad_001, u8x8_byte_3wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_sh1106_128x64_noname, u8x8_cad_001, u8x8_byte_8bit_6800mode, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_sh1106_128x64_noname, u8x8_cad_001, u8x8_byte_8bit_8080mode, uC specific); |

## SH1106 128X64_VCOMH0
| Controller "sh1106", Display "128x64_vcomh0" | Descirption |
|---|---|
| u8x8_Setup(u8x8, u8x8_d_sh1106_128x64_vcomh0, u8x8_cad_001, u8x8_byte_4wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_sh1106_128x64_vcomh0, u8x8_cad_001, u8x8_byte_3wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_sh1106_128x64_vcomh0, u8x8_cad_001, u8x8_byte_8bit_6800mode, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_sh1106_128x64_vcomh0, u8x8_cad_001, u8x8_byte_8bit_8080mode, uC specific); |

## SH1106 128X64_WINSTAR
| Controller "sh1106", Display "128x64_winstar" | Descirption |
|---|---|
| u8x8_Setup(u8x8, u8x8_d_sh1106_128x64_winstar, u8x8_cad_001, u8x8_byte_4wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_sh1106_128x64_winstar, u8x8_cad_001, u8x8_byte_3wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_sh1106_128x64_winstar, u8x8_cad_001, u8x8_byte_8bit_6800mode, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_sh1106_128x64_winstar, u8x8_cad_001, u8x8_byte_8bit_8080mode, uC specific); |

## SH1106 72X40_WISE
| Controller "sh1106", Display "72x40_wise" | Descirption |
|---|---|
| u8x8_Setup(u8x8, u8x8_d_sh1106_72x40_wise, u8x8_cad_001, u8x8_byte_4wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_sh1106_72x40_wise, u8x8_cad_001, u8x8_byte_3wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_sh1106_72x40_wise, u8x8_cad_001, u8x8_byte_8bit_6800mode, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_sh1106_72x40_wise, u8x8_cad_001, u8x8_byte_8bit_8080mode, uC specific); |

## SH1106 64X32
| Controller "sh1106", Display "64x32" | Descirption |
|---|---|
| u8x8_Setup(u8x8, u8x8_d_sh1106_64x32, u8x8_cad_001, u8x8_byte_4wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_sh1106_64x32, u8x8_cad_001, u8x8_byte_3wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_sh1106_64x32, u8x8_cad_001, u8x8_byte_8bit_6800mode, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_sh1106_64x32, u8x8_cad_001, u8x8_byte_8bit_8080mode, uC specific); |

## SH1107 64X128
| Controller "sh1107", Display "64x128" | Descirption |
|---|---|
| u8x8_Setup(u8x8, u8x8_d_sh1107_64x128, u8x8_cad_001, u8x8_byte_4wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_sh1107_64x128, u8x8_cad_001, u8x8_byte_3wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_sh1107_64x128, u8x8_cad_001, u8x8_byte_8bit_6800mode, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_sh1107_64x128, u8x8_cad_001, u8x8_byte_8bit_8080mode, uC specific); |

## SH1107 SEEED_96X96
| Controller "sh1107", Display "seeed_96x96" | Descirption |
|---|---|
| u8x8_Setup(u8x8, u8x8_d_sh1107_seeed_96x96, u8x8_cad_001, u8x8_byte_4wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_sh1107_seeed_96x96, u8x8_cad_001, u8x8_byte_3wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_sh1107_seeed_96x96, u8x8_cad_001, u8x8_byte_8bit_6800mode, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_sh1107_seeed_96x96, u8x8_cad_001, u8x8_byte_8bit_8080mode, uC specific); |

## SH1107 128X128
| Controller "sh1107", Display "128x128" | Descirption |
|---|---|
| u8x8_Setup(u8x8, u8x8_d_sh1107_128x128, u8x8_cad_001, u8x8_byte_4wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_sh1107_128x128, u8x8_cad_001, u8x8_byte_3wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_sh1107_128x128, u8x8_cad_001, u8x8_byte_8bit_6800mode, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_sh1107_128x128, u8x8_cad_001, u8x8_byte_8bit_8080mode, uC specific); |

## SH1107 PIMORONI_128X128
| Controller "sh1107", Display "pimoroni_128x128" | Descirption |
|---|---|
| u8x8_Setup(u8x8, u8x8_d_sh1107_pimoroni_128x128, u8x8_cad_001, u8x8_byte_4wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_sh1107_pimoroni_128x128, u8x8_cad_001, u8x8_byte_3wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_sh1107_pimoroni_128x128, u8x8_cad_001, u8x8_byte_8bit_6800mode, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_sh1107_pimoroni_128x128, u8x8_cad_001, u8x8_byte_8bit_8080mode, uC specific); |

## SH1108 160X160
| Controller "sh1108", Display "160x160" | Descirption |
|---|---|
| u8x8_Setup(u8x8, u8x8_d_sh1108_160x160, u8x8_cad_001, u8x8_byte_4wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_sh1108_160x160, u8x8_cad_001, u8x8_byte_3wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_sh1108_160x160, u8x8_cad_001, u8x8_byte_8bit_6800mode, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_sh1108_160x160, u8x8_cad_001, u8x8_byte_8bit_8080mode, uC specific); |

## SH1122 256X64
| Controller "sh1122", Display "256x64" | Descirption |
|---|---|
| u8x8_Setup(u8x8, u8x8_d_sh1122_256x64, u8x8_cad_001, u8x8_byte_4wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_sh1122_256x64, u8x8_cad_001, u8x8_byte_3wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_sh1122_256x64, u8x8_cad_001, u8x8_byte_8bit_6800mode, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_sh1122_256x64, u8x8_cad_001, u8x8_byte_8bit_8080mode, uC specific); |

## SSD1306 128X32_UNIVISION
| Controller "ssd1306", Display "128x32_univision" | Descirption |
|---|---|
| u8x8_Setup(u8x8, u8x8_d_ssd1306_128x32_univision, u8x8_cad_001, u8x8_byte_4wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_ssd1306_128x32_univision, u8x8_cad_001, u8x8_byte_3wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_ssd1306_128x32_univision, u8x8_cad_001, u8x8_byte_8bit_6800mode, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_ssd1306_128x32_univision, u8x8_cad_001, u8x8_byte_8bit_8080mode, uC specific); |

## SSD1306 128X32_WINSTAR
| Controller "ssd1306", Display "128x32_winstar" | Descirption |
|---|---|
| u8x8_Setup(u8x8, u8x8_d_ssd1306_128x32_winstar, u8x8_cad_001, u8x8_byte_4wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_ssd1306_128x32_winstar, u8x8_cad_001, u8x8_byte_3wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_ssd1306_128x32_winstar, u8x8_cad_001, u8x8_byte_8bit_6800mode, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_ssd1306_128x32_winstar, u8x8_cad_001, u8x8_byte_8bit_8080mode, uC specific); |

## SSD1306 64X48_ER
| Controller "ssd1306", Display "64x48_er" | Descirption |
|---|---|
| u8x8_Setup(u8x8, u8x8_d_ssd1306_64x48_er, u8x8_cad_001, u8x8_byte_4wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_ssd1306_64x48_er, u8x8_cad_001, u8x8_byte_3wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_ssd1306_64x48_er, u8x8_cad_001, u8x8_byte_8bit_6800mode, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_ssd1306_64x48_er, u8x8_cad_001, u8x8_byte_8bit_8080mode, uC specific); |

## SSD1306 48X64_WINSTAR
| Controller "ssd1306", Display "48x64_winstar" | Descirption |
|---|---|
| u8x8_Setup(u8x8, u8x8_d_ssd1306_48x64_winstar, u8x8_cad_001, u8x8_byte_4wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_ssd1306_48x64_winstar, u8x8_cad_001, u8x8_byte_3wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_ssd1306_48x64_winstar, u8x8_cad_001, u8x8_byte_8bit_6800mode, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_ssd1306_48x64_winstar, u8x8_cad_001, u8x8_byte_8bit_8080mode, uC specific); |

## SSD1306 64X32_NONAME
| Controller "ssd1306", Display "64x32_noname" | Descirption |
|---|---|
| u8x8_Setup(u8x8, u8x8_d_ssd1306_64x32_noname, u8x8_cad_001, u8x8_byte_4wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_ssd1306_64x32_noname, u8x8_cad_001, u8x8_byte_3wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_ssd1306_64x32_noname, u8x8_cad_001, u8x8_byte_8bit_6800mode, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_ssd1306_64x32_noname, u8x8_cad_001, u8x8_byte_8bit_8080mode, uC specific); |

## SSD1306 64X32_1F
| Controller "ssd1306", Display "64x32_1f" | Descirption |
|---|---|
| u8x8_Setup(u8x8, u8x8_d_ssd1306_64x32_1f, u8x8_cad_001, u8x8_byte_4wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_ssd1306_64x32_1f, u8x8_cad_001, u8x8_byte_3wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_ssd1306_64x32_1f, u8x8_cad_001, u8x8_byte_8bit_6800mode, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_ssd1306_64x32_1f, u8x8_cad_001, u8x8_byte_8bit_8080mode, uC specific); |

## SSD1306 96X16_ER
| Controller "ssd1306", Display "96x16_er" | Descirption |
|---|---|
| u8x8_Setup(u8x8, u8x8_d_ssd1306_96x16_er, u8x8_cad_001, u8x8_byte_4wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_ssd1306_96x16_er, u8x8_cad_001, u8x8_byte_3wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_ssd1306_96x16_er, u8x8_cad_001, u8x8_byte_8bit_6800mode, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_ssd1306_96x16_er, u8x8_cad_001, u8x8_byte_8bit_8080mode, uC specific); |

## SSD1309 128X64_NONAME2
| Controller "ssd1309", Display "128x64_noname2" | Descirption |
|---|---|
| u8x8_Setup(u8x8, u8x8_d_ssd1309_128x64_noname2, u8x8_cad_001, u8x8_byte_4wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_ssd1309_128x64_noname2, u8x8_cad_001, u8x8_byte_8bit_6800mode, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_ssd1309_128x64_noname2, u8x8_cad_001, u8x8_byte_8bit_8080mode, uC specific); |

## SSD1309 128X64_NONAME0
| Controller "ssd1309", Display "128x64_noname0" | Descirption |
|---|---|
| u8x8_Setup(u8x8, u8x8_d_ssd1309_128x64_noname0, u8x8_cad_001, u8x8_byte_4wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_ssd1309_128x64_noname0, u8x8_cad_001, u8x8_byte_8bit_6800mode, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_ssd1309_128x64_noname0, u8x8_cad_001, u8x8_byte_8bit_8080mode, uC specific); |

## SSD1317 96X96
| Controller "ssd1317", Display "96x96" | Descirption |
|---|---|
| u8x8_Setup(u8x8, u8x8_d_ssd1317_96x96, u8x8_cad_001, u8x8_byte_4wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_ssd1317_96x96, u8x8_cad_001, u8x8_byte_8bit_6800mode, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_ssd1317_96x96, u8x8_cad_001, u8x8_byte_8bit_8080mode, uC specific); |

## SSD1318 128X96
| Controller "ssd1318", Display "128x96" | Descirption |
|---|---|
| u8x8_Setup(u8x8, u8x8_d_ssd1318_128x96, u8x8_cad_001, u8x8_byte_4wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_ssd1318_128x96, u8x8_cad_001, u8x8_byte_3wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_ssd1318_128x96, u8x8_cad_001, u8x8_byte_8bit_6800mode, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_ssd1318_128x96, u8x8_cad_001, u8x8_byte_8bit_8080mode, uC specific); |

## SSD1318 128X96_XCP
| Controller "ssd1318", Display "128x96_xcp" | Descirption |
|---|---|
| u8x8_Setup(u8x8, u8x8_d_ssd1318_128x96_xcp, u8x8_cad_001, u8x8_byte_4wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_ssd1318_128x96_xcp, u8x8_cad_001, u8x8_byte_3wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_ssd1318_128x96_xcp, u8x8_cad_001, u8x8_byte_8bit_6800mode, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_ssd1318_128x96_xcp, u8x8_cad_001, u8x8_byte_8bit_8080mode, uC specific); |

## SSD1325 NHD_128X64
| Controller "ssd1325", Display "nhd_128x64" | Descirption |
|---|---|
| u8x8_Setup(u8x8, u8x8_d_ssd1325_nhd_128x64, u8x8_cad_001, u8x8_byte_4wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_ssd1325_nhd_128x64, u8x8_cad_001, u8x8_byte_3wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_ssd1325_nhd_128x64, u8x8_cad_001, u8x8_byte_8bit_6800mode, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_ssd1325_nhd_128x64, u8x8_cad_001, u8x8_byte_8bit_8080mode, uC specific); |

## SSD0323 OS128064
| Controller "ssd0323", Display "os128064" | Descirption |
|---|---|
| u8x8_Setup(u8x8, u8x8_d_ssd0323_os128064, u8x8_cad_001, u8x8_byte_4wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_ssd0323_os128064, u8x8_cad_001, u8x8_byte_3wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_ssd0323_os128064, u8x8_cad_001, u8x8_byte_8bit_6800mode, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_ssd0323_os128064, u8x8_cad_001, u8x8_byte_8bit_8080mode, uC specific); |

## SSD1326 ER_256X32
| Controller "ssd1326", Display "er_256x32" | Descirption |
|---|---|
| u8x8_Setup(u8x8, u8x8_d_ssd1326_er_256x32, u8x8_cad_001, u8x8_byte_4wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_ssd1326_er_256x32, u8x8_cad_001, u8x8_byte_3wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_ssd1326_er_256x32, u8x8_cad_001, u8x8_byte_8bit_6800mode, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_ssd1326_er_256x32, u8x8_cad_001, u8x8_byte_8bit_8080mode, uC specific); |

## SSD1327 SEEED_96X96
| Controller "ssd1327", Display "seeed_96x96" | Descirption |
|---|---|
| u8x8_Setup(u8x8, u8x8_d_ssd1327_seeed_96x96, u8x8_cad_001, u8x8_byte_4wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_ssd1327_seeed_96x96, u8x8_cad_001, u8x8_byte_3wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_ssd1327_seeed_96x96, u8x8_cad_001, u8x8_byte_8bit_6800mode, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_ssd1327_seeed_96x96, u8x8_cad_001, u8x8_byte_8bit_8080mode, uC specific); |

## SSD1327 EA_W128128
| Controller "ssd1327", Display "ea_w128128" | Descirption |
|---|---|
| u8x8_Setup(u8x8, u8x8_d_ssd1327_ea_w128128, u8x8_cad_001, u8x8_byte_4wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_ssd1327_ea_w128128, u8x8_cad_001, u8x8_byte_3wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_ssd1327_ea_w128128, u8x8_cad_001, u8x8_byte_8bit_6800mode, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_ssd1327_ea_w128128, u8x8_cad_001, u8x8_byte_8bit_8080mode, uC specific); |

## SSD1327 MIDAS_128X128
| Controller "ssd1327", Display "midas_128x128" | Descirption |
|---|---|
| u8x8_Setup(u8x8, u8x8_d_ssd1327_midas_128x128, u8x8_cad_001, u8x8_byte_4wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_ssd1327_midas_128x128, u8x8_cad_001, u8x8_byte_3wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_ssd1327_midas_128x128, u8x8_cad_001, u8x8_byte_8bit_6800mode, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_ssd1327_midas_128x128, u8x8_cad_001, u8x8_byte_8bit_8080mode, uC specific); |

## SSD1329 128X96_NONAME
| Controller "ssd1329", Display "128x96_noname" | Descirption |
|---|---|
| u8x8_Setup(u8x8, u8x8_d_ssd1329_128x96_noname, u8x8_cad_001, u8x8_byte_4wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_ssd1329_128x96_noname, u8x8_cad_001, u8x8_byte_8bit_6800mode, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_ssd1329_128x96_noname, u8x8_cad_001, u8x8_byte_8bit_8080mode, uC specific); |

## LD7032 60X32
| Controller "ld7032", Display "60x32" | Descirption |
|---|---|
| u8x8_Setup(u8x8, u8x8_d_ld7032_60x32, u8x8_cad_011, u8x8_byte_4wire_sw_spi, uC specific); |

## ST7920 192X32
| Controller "st7920", Display "192x32" | Descirption |
|---|---|
| u8x8_Setup(u8x8, u8x8_d_st7920_192x32, u8x8_cad_001, u8x8_byte_8bit_8080mode, uC specific); |

## ST7920 192X32
| Controller "st7920", Display "192x32" | Descirption |
|---|---|
| u8x8_Setup(u8x8, u8x8_d_st7920_192x32, u8x8_cad_001, u8x8_byte_8bit_6800mode, uC specific); |

## ST7920 192X32
| Controller "st7920", Display "192x32" | Descirption |
|---|---|
| u8x8_Setup(u8x8, u8x8_d_st7920_192x32, u8x8_cad_st7920_spi, u8x8_byte_4wire_sw_spi, uC specific); |

## ST7920 128X64
| Controller "st7920", Display "128x64" | Descirption |
|---|---|
| u8x8_Setup(u8x8, u8x8_d_st7920_128x64, u8x8_cad_001, u8x8_byte_8bit_8080mode, uC specific); |

## ST7920 128X64
| Controller "st7920", Display "128x64" | Descirption |
|---|---|
| u8x8_Setup(u8x8, u8x8_d_st7920_128x64, u8x8_cad_001, u8x8_byte_8bit_6800mode, uC specific); |

## ST7920 128X64
| Controller "st7920", Display "128x64" | Descirption |
|---|---|
| u8x8_Setup(u8x8, u8x8_d_st7920_128x64, u8x8_cad_st7920_spi, u8x8_byte_4wire_sw_spi, uC specific); |

## LS013B7DH03 128X128
| Controller "ls013b7dh03", Display "128x128" | Descirption |
|---|---|
| u8x8_Setup(u8x8, u8x8_d_ls013b7dh03_128x128, u8x8_cad_001, u8x8_byte_4wire_sw_spi, uC specific); |

## LS027B7DH01 400X240
| Controller "ls027b7dh01", Display "400x240" | Descirption |
|---|---|
| u8x8_Setup(u8x8, u8x8_d_ls027b7dh01_400x240, u8x8_cad_001, u8x8_byte_4wire_sw_spi, uC specific); |

## LS013B7DH05 144X168
| Controller "ls013b7dh05", Display "144x168" | Descirption |
|---|---|
| u8x8_Setup(u8x8, u8x8_d_ls013b7dh05_144x168, u8x8_cad_001, u8x8_byte_4wire_sw_spi, uC specific); |

## UC1701 EA_DOGS102
| Controller "uc1701", Display "ea_dogs102" | Descirption |
|---|---|
| u8x8_Setup(u8x8, u8x8_d_uc1701_ea_dogs102, u8x8_cad_001, u8x8_byte_4wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_uc1701_ea_dogs102, u8x8_cad_001, u8x8_byte_3wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_uc1701_ea_dogs102, u8x8_cad_001, u8x8_byte_8bit_6800mode, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_uc1701_ea_dogs102, u8x8_cad_001, u8x8_byte_8bit_8080mode, uC specific); |

## UC1701 MINI12864
| Controller "uc1701", Display "mini12864" | Descirption |
|---|---|
| u8x8_Setup(u8x8, u8x8_d_uc1701_mini12864, u8x8_cad_001, u8x8_byte_4wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_uc1701_mini12864, u8x8_cad_001, u8x8_byte_3wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_uc1701_mini12864, u8x8_cad_001, u8x8_byte_8bit_6800mode, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_uc1701_mini12864, u8x8_cad_001, u8x8_byte_8bit_8080mode, uC specific); |

## PCD8544 84X48
| Controller "pcd8544", Display "84x48" | Descirption |
|---|---|
| u8x8_Setup(u8x8, u8x8_d_pcd8544_84x48, u8x8_cad_001, u8x8_byte_4wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_pcd8544_84x48, u8x8_cad_001, u8x8_byte_3wire_sw_spi, uC specific); |

## PCF8812 96X65
| Controller "pcf8812", Display "96x65" | Descirption |
|---|---|
| u8x8_Setup(u8x8, u8x8_d_pcf8812_96x65, u8x8_cad_001, u8x8_byte_4wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_pcf8812_96x65, u8x8_cad_001, u8x8_byte_3wire_sw_spi, uC specific); |

## HX1230 96X68
| Controller "hx1230", Display "96x68" | Descirption |
|---|---|
| u8x8_Setup(u8x8, u8x8_d_hx1230_96x68, u8x8_cad_001, u8x8_byte_4wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_hx1230_96x68, u8x8_cad_001, u8x8_byte_3wire_sw_spi, uC specific); |

## UC1604 JLX19264
| Controller "uc1604", Display "jlx19264" | Descirption |
|---|---|
| u8x8_Setup(u8x8, u8x8_d_uc1604_jlx19264, u8x8_cad_001, u8x8_byte_4wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_uc1604_jlx19264, u8x8_cad_001, u8x8_byte_3wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_uc1604_jlx19264, u8x8_cad_001, u8x8_byte_8bit_6800mode, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_uc1604_jlx19264, u8x8_cad_001, u8x8_byte_8bit_8080mode, uC specific); |

## UC1608 ERC24064
| Controller "uc1608", Display "erc24064" | Descirption |
|---|---|
| u8x8_Setup(u8x8, u8x8_d_uc1608_erc24064, u8x8_cad_001, u8x8_byte_4wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_uc1608_erc24064, u8x8_cad_001, u8x8_byte_3wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_uc1608_erc24064, u8x8_cad_001, u8x8_byte_8bit_6800mode, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_uc1608_erc24064, u8x8_cad_001, u8x8_byte_8bit_8080mode, uC specific); |

## UC1608 ERC240120
| Controller "uc1608", Display "erc240120" | Descirption |
|---|---|
| u8x8_Setup(u8x8, u8x8_d_uc1608_erc240120, u8x8_cad_001, u8x8_byte_4wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_uc1608_erc240120, u8x8_cad_001, u8x8_byte_3wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_uc1608_erc240120, u8x8_cad_001, u8x8_byte_8bit_6800mode, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_uc1608_erc240120, u8x8_cad_001, u8x8_byte_8bit_8080mode, uC specific); |

## UC1608 240X128
| Controller "uc1608", Display "240x128" | Descirption |
|---|---|
| u8x8_Setup(u8x8, u8x8_d_uc1608_240x128, u8x8_cad_001, u8x8_byte_4wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_uc1608_240x128, u8x8_cad_001, u8x8_byte_3wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_uc1608_240x128, u8x8_cad_001, u8x8_byte_8bit_6800mode, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_uc1608_240x128, u8x8_cad_001, u8x8_byte_8bit_8080mode, uC specific); |

## UC1638 160X128
| Controller "uc1638", Display "160x128" | Descirption |
|---|---|
| u8x8_Setup(u8x8, u8x8_d_uc1638_160x128, u8x8_cad_011, u8x8_byte_4wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_uc1638_160x128, u8x8_cad_011, u8x8_byte_3wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_uc1638_160x128, u8x8_cad_011, u8x8_byte_8bit_6800mode, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_uc1638_160x128, u8x8_cad_011, u8x8_byte_8bit_8080mode, uC specific); |

## UC1610 EA_DOGXL160
| Controller "uc1610", Display "ea_dogxl160" | Descirption |
|---|---|
| u8x8_Setup(u8x8, u8x8_d_uc1610_ea_dogxl160, u8x8_cad_001, u8x8_byte_4wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_uc1610_ea_dogxl160, u8x8_cad_001, u8x8_byte_3wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_uc1610_ea_dogxl160, u8x8_cad_001, u8x8_byte_8bit_6800mode, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_uc1610_ea_dogxl160, u8x8_cad_001, u8x8_byte_8bit_8080mode, uC specific); |

## UC1611 EA_DOGM240
| Controller "uc1611", Display "ea_dogm240" | Descirption |
|---|---|
| u8x8_Setup(u8x8, u8x8_d_uc1611_ea_dogm240, u8x8_cad_001, u8x8_byte_4wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_uc1611_ea_dogm240, u8x8_cad_001, u8x8_byte_3wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_uc1611_ea_dogm240, u8x8_cad_001, u8x8_byte_8bit_6800mode, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_uc1611_ea_dogm240, u8x8_cad_001, u8x8_byte_8bit_8080mode, uC specific); |

## UC1611 EA_DOGXL240
| Controller "uc1611", Display "ea_dogxl240" | Descirption |
|---|---|
| u8x8_Setup(u8x8, u8x8_d_uc1611_ea_dogxl240, u8x8_cad_001, u8x8_byte_4wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_uc1611_ea_dogxl240, u8x8_cad_001, u8x8_byte_3wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_uc1611_ea_dogxl240, u8x8_cad_001, u8x8_byte_8bit_6800mode, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_uc1611_ea_dogxl240, u8x8_cad_001, u8x8_byte_8bit_8080mode, uC specific); |

## UC1611 EW50850
| Controller "uc1611", Display "ew50850" | Descirption |
|---|---|
| u8x8_Setup(u8x8, u8x8_d_uc1611_ew50850, u8x8_cad_001, u8x8_byte_4wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_uc1611_ew50850, u8x8_cad_001, u8x8_byte_3wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_uc1611_ew50850, u8x8_cad_001, u8x8_byte_8bit_6800mode, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_uc1611_ew50850, u8x8_cad_001, u8x8_byte_8bit_8080mode, uC specific); |

## ST7565 EA_DOGM128
| Controller "st7565", Display "ea_dogm128" | Descirption |
|---|---|
| u8x8_Setup(u8x8, u8x8_d_st7565_ea_dogm128, u8x8_cad_001, u8x8_byte_4wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_st7565_ea_dogm128, u8x8_cad_001, u8x8_byte_3wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_st7565_ea_dogm128, u8x8_cad_001, u8x8_byte_8bit_6800mode, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_st7565_ea_dogm128, u8x8_cad_001, u8x8_byte_8bit_8080mode, uC specific); |

## ST7565 64128N
| Controller "st7565", Display "64128n" | Descirption |
|---|---|
| u8x8_Setup(u8x8, u8x8_d_st7565_64128n, u8x8_cad_001, u8x8_byte_4wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_st7565_64128n, u8x8_cad_001, u8x8_byte_3wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_st7565_64128n, u8x8_cad_001, u8x8_byte_8bit_6800mode, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_st7565_64128n, u8x8_cad_001, u8x8_byte_8bit_8080mode, uC specific); |

## ST7565 ZOLEN_128X64
| Controller "st7565", Display "zolen_128x64" | Descirption |
|---|---|
| u8x8_Setup(u8x8, u8x8_d_st7565_zolen_128x64, u8x8_cad_001, u8x8_byte_4wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_st7565_zolen_128x64, u8x8_cad_001, u8x8_byte_3wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_st7565_zolen_128x64, u8x8_cad_001, u8x8_byte_8bit_6800mode, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_st7565_zolen_128x64, u8x8_cad_001, u8x8_byte_8bit_8080mode, uC specific); |

## ST7565 LM6059
| Controller "st7565", Display "lm6059" | Descirption |
|---|---|
| u8x8_Setup(u8x8, u8x8_d_st7565_lm6059, u8x8_cad_001, u8x8_byte_4wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_st7565_lm6059, u8x8_cad_001, u8x8_byte_3wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_st7565_lm6059, u8x8_cad_001, u8x8_byte_8bit_6800mode, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_st7565_lm6059, u8x8_cad_001, u8x8_byte_8bit_8080mode, uC specific); |

## ST7565 LX12864
| Controller "st7565", Display "lx12864" | Descirption |
|---|---|
| u8x8_Setup(u8x8, u8x8_d_st7565_lx12864, u8x8_cad_001, u8x8_byte_4wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_st7565_lx12864, u8x8_cad_001, u8x8_byte_3wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_st7565_lx12864, u8x8_cad_001, u8x8_byte_8bit_6800mode, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_st7565_lx12864, u8x8_cad_001, u8x8_byte_8bit_8080mode, uC specific); |

## ST7565 ERC12864
| Controller "st7565", Display "erc12864" | Descirption |
|---|---|
| u8x8_Setup(u8x8, u8x8_d_st7565_erc12864, u8x8_cad_001, u8x8_byte_4wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_st7565_erc12864, u8x8_cad_001, u8x8_byte_3wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_st7565_erc12864, u8x8_cad_001, u8x8_byte_8bit_6800mode, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_st7565_erc12864, u8x8_cad_001, u8x8_byte_8bit_8080mode, uC specific); |

## ST7565 ERC12864_ALT
| Controller "st7565", Display "erc12864_alt" | Descirption |
|---|---|
| u8x8_Setup(u8x8, u8x8_d_st7565_erc12864_alt, u8x8_cad_001, u8x8_byte_4wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_st7565_erc12864_alt, u8x8_cad_001, u8x8_byte_3wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_st7565_erc12864_alt, u8x8_cad_001, u8x8_byte_8bit_6800mode, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_st7565_erc12864_alt, u8x8_cad_001, u8x8_byte_8bit_8080mode, uC specific); |

## ST7565 NHD_C12864
| Controller "st7565", Display "nhd_c12864" | Descirption |
|---|---|
| u8x8_Setup(u8x8, u8x8_d_st7565_nhd_c12864, u8x8_cad_001, u8x8_byte_4wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_st7565_nhd_c12864, u8x8_cad_001, u8x8_byte_3wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_st7565_nhd_c12864, u8x8_cad_001, u8x8_byte_8bit_6800mode, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_st7565_nhd_c12864, u8x8_cad_001, u8x8_byte_8bit_8080mode, uC specific); |

## ST7565 JLX12864
| Controller "st7565", Display "jlx12864" | Descirption |
|---|---|
| u8x8_Setup(u8x8, u8x8_d_st7565_jlx12864, u8x8_cad_001, u8x8_byte_4wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_st7565_jlx12864, u8x8_cad_001, u8x8_byte_3wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_st7565_jlx12864, u8x8_cad_001, u8x8_byte_8bit_6800mode, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_st7565_jlx12864, u8x8_cad_001, u8x8_byte_8bit_8080mode, uC specific); |

## ST7565 NHD_C12832
| Controller "st7565", Display "nhd_c12832" | Descirption |
|---|---|
| u8x8_Setup(u8x8, u8x8_d_st7565_nhd_c12832, u8x8_cad_001, u8x8_byte_4wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_st7565_nhd_c12832, u8x8_cad_001, u8x8_byte_3wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_st7565_nhd_c12832, u8x8_cad_001, u8x8_byte_8bit_6800mode, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_st7565_nhd_c12832, u8x8_cad_001, u8x8_byte_8bit_8080mode, uC specific); |

## UC1601 128X32
| Controller "uc1601", Display "128x32" | Descirption |
|---|---|
| u8x8_Setup(u8x8, u8x8_d_uc1601_128x32, u8x8_cad_001, u8x8_byte_4wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_uc1601_128x32, u8x8_cad_001, u8x8_byte_3wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_uc1601_128x32, u8x8_cad_001, u8x8_byte_8bit_6800mode, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_uc1601_128x32, u8x8_cad_001, u8x8_byte_8bit_8080mode, uC specific); |

## ST7565 EA_DOGM132
| Controller "st7565", Display "ea_dogm132" | Descirption |
|---|---|
| u8x8_Setup(u8x8, u8x8_d_st7565_ea_dogm132, u8x8_cad_001, u8x8_byte_4wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_st7565_ea_dogm132, u8x8_cad_001, u8x8_byte_3wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_st7565_ea_dogm132, u8x8_cad_001, u8x8_byte_8bit_6800mode, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_st7565_ea_dogm132, u8x8_cad_001, u8x8_byte_8bit_8080mode, uC specific); |

## ST7567 PI_132X64
| Controller "st7567", Display "pi_132x64" | Descirption |
|---|---|
| u8x8_Setup(u8x8, u8x8_d_st7567_pi_132x64, u8x8_cad_001, u8x8_byte_4wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_st7567_pi_132x64, u8x8_cad_001, u8x8_byte_8bit_6800mode, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_st7567_pi_132x64, u8x8_cad_001, u8x8_byte_8bit_8080mode, uC specific); |

## ST7567 JLX12864
| Controller "st7567", Display "jlx12864" | Descirption |
|---|---|
| u8x8_Setup(u8x8, u8x8_d_st7567_jlx12864, u8x8_cad_001, u8x8_byte_4wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_st7567_jlx12864, u8x8_cad_001, u8x8_byte_8bit_6800mode, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_st7567_jlx12864, u8x8_cad_001, u8x8_byte_8bit_8080mode, uC specific); |

## ST7567 ENH_DG128064
| Controller "st7567", Display "enh_dg128064" | Descirption |
|---|---|
| u8x8_Setup(u8x8, u8x8_d_st7567_enh_dg128064, u8x8_cad_001, u8x8_byte_4wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_st7567_enh_dg128064, u8x8_cad_001, u8x8_byte_8bit_6800mode, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_st7567_enh_dg128064, u8x8_cad_001, u8x8_byte_8bit_8080mode, uC specific); |

## ST7567 ENH_DG128064I
| Controller "st7567", Display "enh_dg128064i" | Descirption |
|---|---|
| u8x8_Setup(u8x8, u8x8_d_st7567_enh_dg128064i, u8x8_cad_001, u8x8_byte_4wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_st7567_enh_dg128064i, u8x8_cad_001, u8x8_byte_8bit_6800mode, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_st7567_enh_dg128064i, u8x8_cad_001, u8x8_byte_8bit_8080mode, uC specific); |

## ST7567 64X32
| Controller "st7567", Display "64x32" | Descirption |
|---|---|
| u8x8_Setup(u8x8, u8x8_d_st7567_64x32, u8x8_cad_001, u8x8_byte_4wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_st7567_64x32, u8x8_cad_001, u8x8_byte_8bit_6800mode, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_st7567_64x32, u8x8_cad_001, u8x8_byte_8bit_8080mode, uC specific); |

## ST7586S S028HN118A
| Controller "st7586s", Display "s028hn118a" | Descirption |
|---|---|
| u8x8_Setup(u8x8, u8x8_d_st7586s_s028hn118a, u8x8_cad_011, u8x8_byte_4wire_sw_spi, uC specific); |

## ST7586S ERC240160
| Controller "st7586s", Display "erc240160" | Descirption |
|---|---|
| u8x8_Setup(u8x8, u8x8_d_st7586s_erc240160, u8x8_cad_011, u8x8_byte_4wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_st7586s_erc240160, u8x8_cad_011, u8x8_byte_3wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_st7586s_erc240160, u8x8_cad_011, u8x8_byte_8bit_6800mode, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_st7586s_erc240160, u8x8_cad_011, u8x8_byte_8bit_8080mode, uC specific); |

## ST7588 JLX12864
| Controller "st7588", Display "jlx12864" | Descirption |
|---|---|
| u8x8_Setup(u8x8, u8x8_d_st7588_jlx12864, u8x8_cad_001, u8x8_byte_4wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_st7588_jlx12864, u8x8_cad_001, u8x8_byte_3wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_st7588_jlx12864, u8x8_cad_001, u8x8_byte_8bit_6800mode, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_st7588_jlx12864, u8x8_cad_001, u8x8_byte_8bit_8080mode, uC specific); |

## ST75256 JLX256128
| Controller "st75256", Display "jlx256128" | Descirption |
|---|---|
| u8x8_Setup(u8x8, u8x8_d_st75256_jlx256128, u8x8_cad_011, u8x8_byte_4wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_st75256_jlx256128, u8x8_cad_011, u8x8_byte_3wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_st75256_jlx256128, u8x8_cad_011, u8x8_byte_8bit_6800mode, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_st75256_jlx256128, u8x8_cad_011, u8x8_byte_8bit_8080mode, uC specific); |

## ST75256 JLX256160
| Controller "st75256", Display "jlx256160" | Descirption |
|---|---|
| u8x8_Setup(u8x8, u8x8_d_st75256_jlx256160, u8x8_cad_011, u8x8_byte_4wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_st75256_jlx256160, u8x8_cad_011, u8x8_byte_3wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_st75256_jlx256160, u8x8_cad_011, u8x8_byte_8bit_6800mode, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_st75256_jlx256160, u8x8_cad_011, u8x8_byte_8bit_8080mode, uC specific); |

## ST75256 JLX256160_ALT
| Controller "st75256", Display "jlx256160_alt" | Descirption |
|---|---|
| u8x8_Setup(u8x8, u8x8_d_st75256_jlx256160_alt, u8x8_cad_011, u8x8_byte_4wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_st75256_jlx256160_alt, u8x8_cad_011, u8x8_byte_3wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_st75256_jlx256160_alt, u8x8_cad_011, u8x8_byte_8bit_6800mode, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_st75256_jlx256160_alt, u8x8_cad_011, u8x8_byte_8bit_8080mode, uC specific); |

## ST75256 JLX240160
| Controller "st75256", Display "jlx240160" | Descirption |
|---|---|
| u8x8_Setup(u8x8, u8x8_d_st75256_jlx240160, u8x8_cad_011, u8x8_byte_4wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_st75256_jlx240160, u8x8_cad_011, u8x8_byte_3wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_st75256_jlx240160, u8x8_cad_011, u8x8_byte_8bit_6800mode, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_st75256_jlx240160, u8x8_cad_011, u8x8_byte_8bit_8080mode, uC specific); |

## ST75256 JLX25664
| Controller "st75256", Display "jlx25664" | Descirption |
|---|---|
| u8x8_Setup(u8x8, u8x8_d_st75256_jlx25664, u8x8_cad_011, u8x8_byte_4wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_st75256_jlx25664, u8x8_cad_011, u8x8_byte_3wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_st75256_jlx25664, u8x8_cad_011, u8x8_byte_8bit_6800mode, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_st75256_jlx25664, u8x8_cad_011, u8x8_byte_8bit_8080mode, uC specific); |

## ST75256 JLX172104
| Controller "st75256", Display "jlx172104" | Descirption |
|---|---|
| u8x8_Setup(u8x8, u8x8_d_st75256_jlx172104, u8x8_cad_011, u8x8_byte_4wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_st75256_jlx172104, u8x8_cad_011, u8x8_byte_3wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_st75256_jlx172104, u8x8_cad_011, u8x8_byte_8bit_6800mode, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_st75256_jlx172104, u8x8_cad_011, u8x8_byte_8bit_8080mode, uC specific); |

## ST75256 JLX19296
| Controller "st75256", Display "jlx19296" | Descirption |
|---|---|
| u8x8_Setup(u8x8, u8x8_d_st75256_jlx19296, u8x8_cad_011, u8x8_byte_4wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_st75256_jlx19296, u8x8_cad_011, u8x8_byte_3wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_st75256_jlx19296, u8x8_cad_011, u8x8_byte_8bit_6800mode, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_st75256_jlx19296, u8x8_cad_011, u8x8_byte_8bit_8080mode, uC specific); |

## NT7534 TG12864R
| Controller "nt7534", Display "tg12864r" | Descirption |
|---|---|
| u8x8_Setup(u8x8, u8x8_d_nt7534_tg12864r, u8x8_cad_001, u8x8_byte_4wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_nt7534_tg12864r, u8x8_cad_001, u8x8_byte_8bit_6800mode, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_nt7534_tg12864r, u8x8_cad_001, u8x8_byte_8bit_8080mode, uC specific); |

## IST3020 ERC19264
| Controller "ist3020", Display "erc19264" | Descirption |
|---|---|
| u8x8_Setup(u8x8, u8x8_d_ist3020_erc19264, u8x8_cad_001, u8x8_byte_4wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_ist3020_erc19264, u8x8_cad_001, u8x8_byte_8bit_6800mode, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_ist3020_erc19264, u8x8_cad_001, u8x8_byte_8bit_8080mode, uC specific); |

## SBN1661 122X32
| Controller "sbn1661", Display "122x32" | Descirption |
|---|---|
| u8x8_Setup(u8x8, u8x8_d_sbn1661_122x32, u8x8_cad_001, u8x8_byte_sed1520, uC specific); |

## SED1520 122X32
| Controller "sed1520", Display "122x32" | Descirption |
|---|---|
| u8x8_Setup(u8x8, u8x8_d_sed1520_122x32, u8x8_cad_001, u8x8_byte_sed1520, uC specific); |

## KS0108 128X64
| Controller "ks0108", Display "128x64" | Descirption |
|---|---|
| u8x8_Setup(u8x8, u8x8_d_ks0108_128x64, u8x8_cad_001, u8x8_byte_ks0108, uC specific); |

## KS0108 ERM19264
| Controller "ks0108", Display "erm19264" | Descirption |
|---|---|
| u8x8_Setup(u8x8, u8x8_d_ks0108_erm19264, u8x8_cad_001, u8x8_byte_ks0108, uC specific); |

## LC7981 160X80
| Controller "lc7981", Display "160x80" | Descirption |
|---|---|
| u8x8_Setup(u8x8, u8x8_d_lc7981_160x80, u8x8_cad_100, u8x8_byte_8bit_6800mode, uC specific); |

## LC7981 160X160
| Controller "lc7981", Display "160x160" | Descirption |
|---|---|
| u8x8_Setup(u8x8, u8x8_d_lc7981_160x160, u8x8_cad_100, u8x8_byte_8bit_6800mode, uC specific); |

## LC7981 240X128
| Controller "lc7981", Display "240x128" | Descirption |
|---|---|
| u8x8_Setup(u8x8, u8x8_d_lc7981_240x128, u8x8_cad_100, u8x8_byte_8bit_6800mode, uC specific); |

## LC7981 240X64
| Controller "lc7981", Display "240x64" | Descirption |
|---|---|
| u8x8_Setup(u8x8, u8x8_d_lc7981_240x64, u8x8_cad_100, u8x8_byte_8bit_6800mode, uC specific); |

## T6963 240X128
| Controller "t6963", Display "240x128" | Descirption |
|---|---|
| u8x8_Setup(u8x8, u8x8_d_t6963_240x128, u8x8_cad_100, u8x8_byte_8bit_8080mode, uC specific); |

## T6963 240X64
| Controller "t6963", Display "240x64" | Descirption |
|---|---|
| u8x8_Setup(u8x8, u8x8_d_t6963_240x64, u8x8_cad_100, u8x8_byte_8bit_8080mode, uC specific); |

## T6963 256X64
| Controller "t6963", Display "256x64" | Descirption |
|---|---|
| u8x8_Setup(u8x8, u8x8_d_t6963_256x64, u8x8_cad_100, u8x8_byte_8bit_8080mode, uC specific); |

## T6963 128X64
| Controller "t6963", Display "128x64" | Descirption |
|---|---|
| u8x8_Setup(u8x8, u8x8_d_t6963_128x64, u8x8_cad_100, u8x8_byte_8bit_8080mode, uC specific); |

## T6963 128X64_ALT
| Controller "t6963", Display "128x64_alt" | Descirption |
|---|---|
| u8x8_Setup(u8x8, u8x8_d_t6963_128x64_alt, u8x8_cad_100, u8x8_byte_8bit_8080mode, uC specific); |

## T6963 160X80
| Controller "t6963", Display "160x80" | Descirption |
|---|---|
| u8x8_Setup(u8x8, u8x8_d_t6963_160x80, u8x8_cad_100, u8x8_byte_8bit_8080mode, uC specific); |

## SSD1322 NHD_256X64
| Controller "ssd1322", Display "nhd_256x64" | Descirption |
|---|---|
| u8x8_Setup(u8x8, u8x8_d_ssd1322_nhd_256x64, u8x8_cad_011, u8x8_byte_4wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_ssd1322_nhd_256x64, u8x8_cad_011, u8x8_byte_3wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_ssd1322_nhd_256x64, u8x8_cad_011, u8x8_byte_8bit_6800mode, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_ssd1322_nhd_256x64, u8x8_cad_011, u8x8_byte_8bit_8080mode, uC specific); |

## SSD1322 NHD_128X64
| Controller "ssd1322", Display "nhd_128x64" | Descirption |
|---|---|
| u8x8_Setup(u8x8, u8x8_d_ssd1322_nhd_128x64, u8x8_cad_011, u8x8_byte_4wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_ssd1322_nhd_128x64, u8x8_cad_011, u8x8_byte_3wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_ssd1322_nhd_128x64, u8x8_cad_011, u8x8_byte_8bit_6800mode, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_ssd1322_nhd_128x64, u8x8_cad_011, u8x8_byte_8bit_8080mode, uC specific); |

## SSD1606 172X72
| Controller "ssd1606", Display "172x72" | Descirption |
|---|---|
| u8x8_Setup(u8x8, u8x8_d_ssd1606_172x72, u8x8_cad_011, u8x8_byte_4wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_ssd1606_172x72, u8x8_cad_011, u8x8_byte_3wire_sw_spi, uC specific); |

## SSD1607 200X200
| Controller "ssd1607", Display "200x200" | Descirption |
|---|---|
| u8x8_Setup(u8x8, u8x8_d_ssd1607_200x200, u8x8_cad_011, u8x8_byte_4wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_ssd1607_200x200, u8x8_cad_011, u8x8_byte_3wire_sw_spi, uC specific); |

## SSD1607 GD_200X200
| Controller "ssd1607", Display "gd_200x200" | Descirption |
|---|---|
| u8x8_Setup(u8x8, u8x8_d_ssd1607_gd_200x200, u8x8_cad_011, u8x8_byte_4wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_ssd1607_gd_200x200, u8x8_cad_011, u8x8_byte_3wire_sw_spi, uC specific); |

## SSD1607 WS_200X200
| Controller "ssd1607", Display "ws_200x200" | Descirption |
|---|---|
| u8x8_Setup(u8x8, u8x8_d_ssd1607_ws_200x200, u8x8_cad_011, u8x8_byte_4wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_ssd1607_ws_200x200, u8x8_cad_011, u8x8_byte_3wire_sw_spi, uC specific); |

## IL3820 296X128
| Controller "il3820", Display "296x128" | Descirption |
|---|---|
| u8x8_Setup(u8x8, u8x8_d_il3820_296x128, u8x8_cad_011, u8x8_byte_4wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_il3820_296x128, u8x8_cad_011, u8x8_byte_3wire_sw_spi, uC specific); |

## IL3820 V2_296X128
| Controller "il3820", Display "v2_296x128" | Descirption |
|---|---|
| u8x8_Setup(u8x8, u8x8_d_il3820_v2_296x128, u8x8_cad_011, u8x8_byte_4wire_sw_spi, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_il3820_v2_296x128, u8x8_cad_011, u8x8_byte_3wire_sw_spi, uC specific); |

## SED1330 240X128
| Controller "sed1330", Display "240x128" | Descirption |
|---|---|
| u8x8_Setup(u8x8, u8x8_d_sed1330_240x128, u8x8_cad_100, u8x8_byte_8bit_6800mode, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_sed1330_240x128, u8x8_cad_100, u8x8_byte_8bit_8080mode, uC specific); |

## RA8835 NHD_240X128
| Controller "ra8835", Display "nhd_240x128" | Descirption |
|---|---|
| u8x8_Setup(u8x8, u8x8_d_ra8835_nhd_240x128, u8x8_cad_100, u8x8_byte_8bit_6800mode, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_ra8835_nhd_240x128, u8x8_cad_100, u8x8_byte_8bit_8080mode, uC specific); |

## RA8835 320X240
| Controller "ra8835", Display "320x240" | Descirption |
|---|---|
| u8x8_Setup(u8x8, u8x8_d_ra8835_320x240, u8x8_cad_100, u8x8_byte_8bit_6800mode, uC specific); |
| u8x8_Setup(u8x8, u8x8_d_ra8835_320x240, u8x8_cad_100, u8x8_byte_8bit_8080mode, uC specific); |

## MAX7219 64X8
| Controller "max7219", Display "64x8" | Descirption |
|---|---|
| u8x8_Setup(u8x8, u8x8_d_max7219_64x8, u8x8_cad_empty, u8x8_byte_4wire_sw_spi, uC specific); |

## MAX7219 32X8
| Controller "max7219", Display "32x8" | Descirption |
|---|---|
| u8x8_Setup(u8x8, u8x8_d_max7219_32x8, u8x8_cad_empty, u8x8_byte_4wire_sw_spi, uC specific); |

## MAX7219 8X8
| Controller "max7219", Display "8x8" | Descirption |
|---|---|
| u8x8_Setup(u8x8, u8x8_d_max7219_8x8, u8x8_cad_empty, u8x8_byte_4wire_sw_spi, uC specific); |

# Links
 * [U8g2 C Setup](u8g2setupc)
 * [U8g2 C++ Setup](u8g2setupcpp)
 * [U8x8 Function Reference](u8x8reference)
 * [U8x8 C Setup](u8x8setupc)
 * [U8x8 C++ Setup](u8x8setupcpp)
