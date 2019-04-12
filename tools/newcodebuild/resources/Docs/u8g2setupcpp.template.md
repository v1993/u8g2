
[tocstart]: # (toc start)

  * [Introduction](#introduction)
    * [Constructor Name](#constructor-name)
    * [Buffer Size](#buffer-size)
    * [Communication](#communication)
    * [Rotation](#rotation)
    * [Wiring](#wiring)
    * [16 Bit Mode](#16-bit-mode)
  * [Links](#links)

[tocend]: # (toc end)

# Introduction

To setup u8g2, use the correct constructor for your display.
The constructor name defines display type, controller, RAM buffer size and communication protocol.
If your display is not exactly available, try a constructor with the same display controller name.

The arguments of the constructor define the rotation of the display and how the display is connected to the Arduino board.
This is the "Hello World" example for the Arduino C++ interface:

```CXX
#include <Arduino.h>
#include <SPI.h>
#include <U8g2lib.h>

/* Constructor */
U8G2_UC1701_DOGS102_1_4W_SW_SPI u8g2(U8G2_R0, /* clock=*/ 13, /* data=*/ 11, /* cs=*/ 10, /* dc=*/ 9, /* reset=*/ 8);

/* u8g2.begin() is required and will sent the setup/init sequence to the display */
void setup(void) {
  u8g2.begin();
}

/* draw something on the display with the `firstPage()`/`nextPage()` loop*/
void loop(void) {
  u8g2.firstPage();
  do {
    u8g2.setFont(u8g2_font_ncenB14_tr);
    u8g2.drawStr(0,20,"Hello World!");
  } while ( u8g2.nextPage() );
  delay(1000);
}
```

This is ESP-IDF C++ version:
```CXX
#include <U8g2lib.hpp>

/* Constructor */
U8G2_UC1701_DOGS102_F_4W_SW_SPI u8g2(U8G2_R0, /* clock=*/ 13, /* data=*/ 11, /* cs=*/ 10, /* dc=*/ 9, /* reset=*/ 8);

extern "C" void app_main() {
	// Setup display
	u8g2.begin();
	while (true) {
		u8g2.setFont(u8g2_font_ncenB14_tr);
		u8g2.drawStr(0,20,"Hello World!");
		u8g2.sendBuffer();
		vTaskDelay(1000 / portTICK_PERIOD_MS);
	}
}
```
You may notice how similiar they are. In fact, Arduino and ESP-IDF share most parts of C++ code with expection for constructors due to different requiments.

## Constructor Name

The name of the Arduino C++ constructor has the following parts:

| No | Description | Example |
|---|---|---|
| 1 | Prefix | `U8G2` |
| 2 | Display Controller | `UC1701` |
| 3 | Display Name | `DOGS102` |
| 4 | Buffer Size | `1`, `2` or `F` (full frame buffer) |
| 5 | Communication | `4W_SW_SPI` |

These parts are connect with `_`. The full constructor name for the example will be `U8G2_UC1701_DOGS102_1_4W_SW_SPI`.

## Buffer Size

| Buffer | Description |
|---|---|
| `1` | Only one page of the display memory is stored in the microcontroller RAM. Use a [firstPage()](u8g2reference#firstpage)/[nextPage()](u8g2reference#nextpage) loop for drawing on the display. |
| `2` | Same as `1`, but maintains two pages in the microcontroller RAM. This will be up to two times faster than `1`. |
| `F` | Keep a copy of the full display frame buffer in the microcontroller RAM. Use  [clearBuffer()](u8g2reference#clearbuffer) to clear the RAM and [sendBuffer()](u8g2reference#sendbuffer) to transfer the microcontroller RAM to the display.  |

The full buffer `F` option can be used only, if there is sufficient RAM available in the microcontroller: it is great option for some Arduino boards and most useful one on ESP-32 ones due to (realtively) large amount of memory. Use option `1` or `2` on a microcontroller with a small amount of RAM. Please also note that `1` or `2` constructors may be ommited because they require same or bigger amount of memory than full buffer does. It means that you can eiter use page loop or `sendBuffer()`/`clearBuffer()` with `F` option instead of omited one. 
The [u8x8 API](u8x8setupcpp) can be used if there is not even RAM for one page.

## Communication

The communication protocol is part of the constructor name (see above). They differ for Arduino and ESP-IDF.
The following communication protocols are supported on Arduino:

U8G2_CODEBUILD_ARDUINO_INTERFACES

Those ones are available on ESP-IDF:

U8G2_CODEBUILD_ESP32_INTERFACES

Please note that sometimes order of pins may differ for HW and SW versions of constructors. If you have some but not all optional pins connected (like in Arduino HW I2C interface when your board can remap I2C pins and you don't have reset pin) use `U8X8_PIN_NONE` for ones you have to skip, like this:

```CXX
/* Arduino example, don't apply to ESP-IDF */
U8G2_SSD1306_128X64_NONAME_F_SW_I2C u8g2(U8X8_PIN_NONE, 5, 6);
```

**Check out [this table](u8x8controllertable) to see which interfaces are supported for each controller/display pair.**

## Rotation

The software emulated display rotation is the first argument of the constructor.

| Rotation/Mirror | Description  |
|---|---|
| `U8G2_R0` | No rotation, landscape |
| `U8G2_R1` | 90 degree clockwise rotation |
| `U8G2_R2` | 180 degree clockwise rotation |
| `U8G2_R3` | 270 degree clockwise rotation |
| `U8G2_MIRROR` | No rotation, landscape, display content is mirrored (v2.6.x) |

If supported `U8G2_R2` is identical to `u8g2::setFlipMode(1)`.

## Wiring

| Pin Argument | Description | Datasheet Names |
|---|---|---|
| clock | SPI or I2C clock line | SCL, SCLK, ... |
| data | SPI or I2C data line | SDA, MOSI, SDIN, ... |
| d0 ... d7 | Data lines of the parallel interface | D0 ... D7 |
| cs | Chip select line | CS | 
| dc | Data/command selection line (register select) | D/C, A0, RS, ... |
| enable | "Write" for the 8080 interface, "enable" for the 6800 interface | 8080: WR, 6800: E |
| reset | Reset line | |

In some cases a pin is not required, although it is mentioned as non-optional in the constructor. In this case, use `U8X8_PIN_NONE` instead of the pin number. Example: `cs` pin for the ST7920 8080 interface.

In the reference section below, optional pins are enclosed in "[" and "]". The "[" and "]" never appear in the constructor.
Example: The "reset" pin number can be skipped if the display has its own reset circuit.

[comment]: # (In fact, it is about C too. Or better put in common FAQ?)

## 16 Bit Mode

*Skip this section if you use ESP-IDF version. It always work in 16bit mode.* 
U8g2 is configured for 8 bit mode by default. For any device with a pixel width
of 256 or higher, you must uncomment (remove the `//`) from the following line in `u8g2.h`:

```C
//#define U8G2_16BIT
```

# Links
 * [U8g2 C Setup](u8g2setupc)
 * [U8g2 C++ Setup](u8g2setupcpp)
 * [U8x8 Function Reference](u8x8reference)
 * [U8x8 C Setup](u8x8setupc)
 * [U8x8 C++ Setup](u8x8setupcpp)
