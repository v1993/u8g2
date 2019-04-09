/*
  Uncomment this to enable AVR optimization for I2C
  This is disabled by default, because it will not correctly set the pullups.
  Instead the SW will always drive the I2C bus.
*/
//#define U8X8_USE_ARDUINO_AVR_SW_I2C_OPTIMIZATION


/* Assumption: All Arduino Boards have "SPI.h" */
#define U8X8_HAVE_HW_SPI

/* Assumption: All Arduino Boards have "Wire.h" */
#define U8X8_HAVE_HW_I2C

/* Undefine U8X8_HAVE_HW_SPI for those Boards without SPI.h */

#ifdef ARDUINO_AVR_DIGISPARK

#ifdef U8X8_HAVE_HW_SPI
#undef U8X8_HAVE_HW_SPI
#endif

#ifdef U8X8_HAVE_HW_I2C
#undef U8X8_HAVE_HW_I2C
#endif

#endif

#ifdef __AVR_ATtiny85__
#ifdef U8X8_HAVE_HW_SPI
#undef U8X8_HAVE_HW_SPI
#endif

#ifdef U8X8_HAVE_HW_I2C
#undef U8X8_HAVE_HW_I2C
#endif
#endif

/* ATmegaXXM1 do not have I2C */
#if defined(__AVR_ATmega16M1__) || defined(__AVR_ATmega32M1__) || defined(__AVR_ATmega64M1__)
#ifdef U8X8_HAVE_HW_I2C
#undef U8X8_HAVE_HW_I2C
#endif
#endif

/* ATmegaXXC1 do not have I2C */
#if defined(__AVR_ATmega16C1__) || defined(__AVR_ATmega32C1__) || defined(__AVR_ATmega64C1__)
#ifdef U8X8_HAVE_HW_I2C
#undef U8X8_HAVE_HW_I2C
#endif
#endif


/* define U8X8_HAVE_2ND_HW_I2C if the board has a second wire interface*/
#ifdef U8X8_HAVE_HW_I2C
#ifdef WIRE_INTERFACES_COUNT
#if WIRE_INTERFACES_COUNT > 1
#define U8X8_HAVE_2ND_HW_I2C
#endif
#endif
#endif /* U8X8_HAVE_HW_I2C */

/* define U8X8_HAVE_2ND_HW_SPI if the board has a second wire interface*/
/* As of writing this, I did not found any official board which supports this */
/* so this is not tested (May 2017), issue #224 */
/* fixed ifdef, #410, #377 */
/* meanwhile it is defined e.g. here: https://github.com/arduino/ArduinoCore-samd/blob/master/variants/mkrzero/variant.h#L91 */
/* so it should be available for mkrzero */

#ifdef SPI_INTERFACES_COUNT
#if SPI_INTERFACES_COUNT > 1
#define U8X8_HAVE_2ND_HW_SPI
#endif
#endif


extern "C" uint8_t u8x8_gpio_and_delay_arduino(u8x8_t* u8x8, uint8_t msg, uint8_t arg_int, void* arg_ptr);
extern "C" uint8_t u8x8_byte_arduino_8bit_8080mode(u8x8_t* u8x8, uint8_t msg, uint8_t arg_int, void* arg_ptr);
extern "C" uint8_t u8x8_byte_arduino_4wire_sw_spi(u8x8_t* u8x8, uint8_t msg, uint8_t arg_int, void* arg_ptr);
extern "C" uint8_t u8x8_byte_arduino_3wire_sw_spi(u8x8_t* u8x8, uint8_t msg, uint8_t arg_int, void* arg_ptr);
extern "C" uint8_t u8x8_byte_arduino_hw_spi(u8x8_t* u8g2, uint8_t msg, uint8_t arg_int, void* arg_ptr);
extern "C" uint8_t u8x8_byte_arduino_2nd_hw_spi(u8x8_t* u8x8, uint8_t msg, uint8_t arg_int, void* arg_ptr); /* #244 */
extern "C" uint8_t u8x8_byte_arduino_sw_i2c(u8x8_t* u8x8, uint8_t msg, uint8_t arg_int, void* arg_ptr);
extern "C" uint8_t u8x8_byte_arduino_hw_i2c(u8x8_t* u8x8, uint8_t msg, uint8_t arg_int, void* arg_ptr);
extern "C" uint8_t u8x8_byte_arduino_2nd_hw_i2c(u8x8_t* u8x8, uint8_t msg, uint8_t arg_int, void* arg_ptr);
extern "C" uint8_t u8x8_byte_arduino_ks0108(u8x8_t* u8x8, uint8_t msg, uint8_t arg_int, void* arg_ptr);

#ifdef U8X8_USE_PINS
void u8x8_SetPin_4Wire_SW_SPI(u8x8_t* u8x8, uint8_t clock, uint8_t data, uint8_t cs, uint8_t dc, uint8_t reset);
void u8x8_SetPin_3Wire_SW_SPI(u8x8_t* u8x8, uint8_t clock, uint8_t data, uint8_t cs, uint8_t reset);
void u8x8_SetPin_4Wire_HW_SPI(u8x8_t* u8x8, uint8_t cs, uint8_t dc, uint8_t reset);
void u8x8_SetPin_ST7920_HW_SPI(u8x8_t* u8x8, uint8_t cs, uint8_t reset);
void u8x8_SetPin_SW_I2C(u8x8_t* u8x8, uint8_t clock, uint8_t data, uint8_t reset);
void u8x8_SetPin_HW_I2C(u8x8_t* u8x8, uint8_t reset, uint8_t clock = U8X8_PIN_NONE, uint8_t data = U8X8_PIN_NONE);
void u8x8_SetPin_8Bit_6800(u8x8_t* u8x8, uint8_t d0, uint8_t d1, uint8_t d2, uint8_t d3, uint8_t d4, uint8_t d5, uint8_t d6, uint8_t d7, uint8_t enable, uint8_t cs, uint8_t dc, uint8_t reset);
void u8x8_SetPin_8Bit_8080(u8x8_t* u8x8, uint8_t d0, uint8_t d1, uint8_t d2, uint8_t d3, uint8_t d4, uint8_t d5, uint8_t d6, uint8_t d7, uint8_t wr, uint8_t cs, uint8_t dc, uint8_t reset);
void u8x8_SetPin_KS0108(u8x8_t* u8x8, uint8_t d0, uint8_t d1, uint8_t d2, uint8_t d3, uint8_t d4, uint8_t d5, uint8_t d6, uint8_t d7, uint8_t enable, uint8_t dc, uint8_t cs0, uint8_t cs1, uint8_t cs2, uint8_t reset);
void u8x8_SetPin_SED1520(u8x8_t* u8x8, uint8_t d0, uint8_t d1, uint8_t d2, uint8_t d3, uint8_t d4, uint8_t d5, uint8_t d6, uint8_t d7, uint8_t dc, uint8_t e1, uint8_t e2, uint8_t reset);
#endif
