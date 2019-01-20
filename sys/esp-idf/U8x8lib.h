#pragma once
#include "u8x8.h"

#ifdef __cplusplus
extern "C" {
#endif

// GPIO

uint8_t u8x8_gpio_and_delay_espidf(u8x8_t *u8x8, uint8_t msg, uint8_t arg_int, void *arg_ptr); // GPIO callback

// HW SPI

uint8_t u8x8_byte_espidf_hw_hspi(u8x8_t *u8x8, uint8_t msg, uint8_t arg_int, void *arg_ptr); // HSPI, DMA channel 1
uint8_t u8x8_byte_espidf_hw_vspi(u8x8_t *u8x8, uint8_t msg, uint8_t arg_int, void *arg_ptr); // VSPI, DMA channel 2

// HW I2C

uint8_t u8x8_byte_espidf_hw_i2c_port0(u8x8_t *u8x8, uint8_t msg, uint8_t arg_int, void *arg_ptr); // I2C port 0
uint8_t u8x8_byte_espidf_hw_i2c_port1(u8x8_t *u8x8, uint8_t msg, uint8_t arg_int, void *arg_ptr); // I2C port 1

// C++ helpers

void u8x8_SetPin_4Wire_SW_SPI(u8x8_t *u8x8, uint8_t clock, uint8_t data, uint8_t cs, uint8_t dc, uint8_t reset);
void u8x8_SetPin_3Wire_SW_SPI(u8x8_t *u8x8, uint8_t clock, uint8_t data, uint8_t cs, uint8_t reset);
void u8x8_SetPin_4Wire_HW_SPI(u8x8_t *u8x8, uint8_t cs, uint8_t dc, uint8_t reset);
void u8x8_SetPin_ST7920_HW_SPI(u8x8_t *u8x8, uint8_t cs, uint8_t reset);
void u8x8_SetPin_SW_I2C(u8x8_t *u8x8, uint8_t clock, uint8_t data, uint8_t reset);
void u8x8_SetPin_HW_I2C(u8x8_t *u8x8, uint8_t reset, uint8_t clock, uint8_t data);
void u8x8_SetPin_8Bit_6800(u8x8_t *u8x8, uint8_t d0, uint8_t d1, uint8_t d2, uint8_t d3, uint8_t d4, uint8_t d5, uint8_t d6, uint8_t d7, uint8_t enable, uint8_t cs, uint8_t dc, uint8_t reset);
void u8x8_SetPin_8Bit_8080(u8x8_t *u8x8, uint8_t d0, uint8_t d1, uint8_t d2, uint8_t d3, uint8_t d4, uint8_t d5, uint8_t d6, uint8_t d7, uint8_t wr, uint8_t cs, uint8_t dc, uint8_t reset);
void u8x8_SetPin_KS0108(u8x8_t *u8x8, uint8_t d0, uint8_t d1, uint8_t d2, uint8_t d3, uint8_t d4, uint8_t d5, uint8_t d6, uint8_t d7, uint8_t enable, uint8_t dc, uint8_t cs0, uint8_t cs1, uint8_t cs2, uint8_t reset);
void u8x8_SetPin_SED1520(u8x8_t *u8x8, uint8_t d0, uint8_t d1, uint8_t d2, uint8_t d3, uint8_t d4, uint8_t d5, uint8_t d6, uint8_t d7, uint8_t dc, uint8_t e1, uint8_t e2, uint8_t reset);

#ifdef __cplusplus
}
#endif
