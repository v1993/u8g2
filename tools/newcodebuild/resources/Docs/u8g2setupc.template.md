
[tocstart]: # (toc start)

  * [Introduction](#introduction)
  * [Setup Function Reference](#setup-function-reference)
U8G2_CODEBUILD_HEADERS
  * [Links](#links)

[tocend]: # (toc end)

# Introduction

U8g2 can be used as C-library with any microcontroller. The setup sequence usually looks like this:

```
u8g2_t u8g2; // a structure which will contain all the data for one display
...
u8g2_Setup_ssd1306_i2c_128x64_noname_2(&u8g2, U8G2_R0, u8x8_byte_sw_i2c, u8x8_gpio_and_delay_lpc11u3x);  // init u8g2 structure
u8g2_InitDisplay(&u8g2); // send init sequence to the display, display is in sleep mode after this,
u8g2_SetPowerSave(&u8g2, 0); // wake up display
```
All available setup procedure are listed in the rest of the document. Each setup 
procedure requires four arguments:

 1. U8g2: Pointer to an empty u8g2 structure (see the example above)
 2. Rotation: Rotation procedure, see below
 3. Byte communication procedure: Either one of the existing procedures or a custom procedure for the target controller.
 4. Lowlevel delay and GPIO procedure: This must be a custom procedure.
 
For the second argument, the following constants are available:
 
| Rotation/Mirror | Description  |
|---|---|
| `U8G2_R0` | No rotation, landscape |
| `U8G2_R1` | 90 degree clockwise rotation |
| `U8G2_R2` | 180 degree clockwise rotation |
| `U8G2_R3` | 270 degree clockwise rotation |
| `U8G2_MIRROR` | No rotation, landscape, display content is mirrored (v2.6.x) |

For the third argument, several "bitbanging" procedures are available:

| Byte Procedure | Description  |
|---|---|
| u8x8_byte_4wire_sw_spi | Standard 8-bit SPI communication with "four pins" (SCK, MOSI, DC, CS) | 
| u8x8_byte_3wire_sw_spi | 9-bit communication with "three pins" (SCK, MOSI, CS) | 
| u8x8_byte_8bit_6800mode | Parallel interface, 6800 format |  
| u8x8_byte_8bit_8080mode | Parallel interface, 8080 format  | 
| u8x8_byte_sw_i2c | Two wire, I2C communication | 
| u8x8_byte_ks0108 | Special interface for KS0108 controller | 

Of course the target display must support this interface, this means you can not use
the SPI interface with a display which does not support SPI.

The last argument is discussed here: [Porting-to-new-MCU-platform](Porting-to-new-MCU-platform)


# Setup Function Reference
U8G2_CODEBUILD_REFERENCE

# Links
 * [U8g2 C Setup](u8g2setupc)
 * [U8g2 C++ Setup](u8g2setupcpp)
 * [U8x8 Function Reference](u8x8reference)
 * [U8x8 C Setup](u8x8setupc)
 * [U8x8 C++ Setup](u8x8setupcpp)
 
