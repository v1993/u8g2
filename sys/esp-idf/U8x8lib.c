/*

  ESP-IDF specific stuff

  Universal 8bit Graphics Library (https://github.com/olikraus/u8g2/)

  Copyright (c) 2016, olikraus@gmail.com
  Copyright (c) 2019, v19930312@gmail.com
  All rights reserved.

  Redistribution and use in source and binary forms, with or without modification,
  are permitted provided that the following conditions are met:

  * Redistributions of source code must retain the above copyright notice, this list
    of conditions and the following disclaimer.

  * Redistributions in binary form must reproduce the above copyright notice, this
    list of conditions and the following disclaimer in the documentation and/or other
    materials provided with the distribution.

  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND
  CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES,
  INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
  MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
  DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR
  CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
  SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
  NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
  LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
  CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
  STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
  ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
  ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

*/

#include <stdbool.h>
#include <string.h>

#include "U8x8lib.h"
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "freertos/queue.h"
#include "driver/gpio.h"
#include "driver/spi_common.h"
#include "driver/spi_master.h"
#include "driver/i2c.h"

#include "esp_log.h"

#define max(a,b) \
	({ __typeof__ (a) _a = (a); \
		__typeof__ (b) _b = (b); \
		_a > _b ? _a : _b; })

static const char* U8X8_TAG = "U8G2";

/*=============================================*/
/*=== GPIO & DELAY ===*/

#ifndef ESP_PLATFORM
#error "You compile U8G2 ESP-IDF only files not in ESP-IDF"
#endif

#ifndef U8X8_USE_PINS
#error "U8X8_USE_PINS not defined! Contact u8g2 devs and v1993 about this issue"
#endif

static unsigned long long u8x8_pintomask_espidf(unsigned long long pin) {
	return 1ULL << pin;
	};

static gpio_config_t u8x8_gpiodefault_espidf(unsigned long long pin) {
	gpio_config_t io_conf;
	io_conf.intr_type = GPIO_INTR_DISABLE;
	io_conf.pull_down_en = GPIO_PULLDOWN_DISABLE;
	io_conf.pull_up_en = GPIO_PULLUP_DISABLE;
	io_conf.pin_bit_mask = u8x8_pintomask_espidf(pin);
	return io_conf;
	};

static bool u8x8_setpininput_espidf(unsigned long long pin) {
	gpio_config_t io_conf = u8x8_gpiodefault_espidf(pin);
	io_conf.mode = GPIO_MODE_INPUT;
	io_conf.pull_up_en = GPIO_PULLUP_ENABLE;
	return gpio_config(&io_conf) == ESP_OK;
	};

static bool u8x8_setpinoutput_espidf(unsigned long long pin) {
	gpio_config_t io_conf = u8x8_gpiodefault_espidf(pin);
	io_conf.mode = GPIO_MODE_OUTPUT;
	return gpio_config(&io_conf) == ESP_OK;
	};

typedef enum {
	UNKNOWN,
	SPI,
	I2C
	} u8x8_device_type;

typedef struct {
	u8x8_device_type type;
	union {
		// SPI
		struct {
			spi_device_handle_t device;
			uint8_t* buffer;
			size_t bufsiz;
			uint8_t last_dc;
			} spi;
		// I2C
		struct {
			i2c_port_t port;
			i2c_cmd_handle_t cmd;
			uint8_t* bufstart; // Always points to same place
			uint8_t* bufptr;
			} i2c;
		};
	} u8x8_device_info;

uint8_t u8x8_gpio_and_delay_espidf(u8x8_t* u8x8, uint8_t msg, uint8_t arg_int, U8X8_UNUSED void* arg_ptr) {
	uint8_t i;
	switch (msg) {
			case U8X8_MSG_GPIO_AND_DELAY_INIT:
				for (i = 0; i < U8X8_PIN_GPIO_CNT; i++) {
						if (u8x8->pins[i] != U8X8_PIN_NONE) {
								bool success = false;
								if (i < U8X8_PIN_OUTPUT_CNT) {
										ESP_LOGD(U8X8_TAG, "setting %u as output pin", u8x8->pins[i]);
										success = u8x8_setpinoutput_espidf(u8x8->pins[i]);
										}
								else {
										ESP_LOGD(U8X8_TAG, "setting %u as input pin", u8x8->pins[i]);
										success = u8x8_setpininput_espidf(u8x8->pins[i]);
										}
								if (!success) {
										ESP_LOGE(U8X8_TAG, "pin setting error");
										return 0;
										};
								}

						}
				u8x8->user_ptr = malloc(sizeof(u8x8_device_info));
				if (!u8x8->user_ptr) {
						ESP_LOGE(U8X8_TAG, "no memory");
						return 0;
						};
				((u8x8_device_info*) u8x8->user_ptr)->type = UNKNOWN;
				break;

			case U8X8_MSG_GPIO_AND_DELAY_FREE:
				;
				u8x8_device_info* info = u8x8->user_ptr;
				if (!info) { break; }
				switch (info->type) {
						case I2C:
							// NOTE: possible info->i2c.cmd leak in case of something?
							if (info->i2c.port != I2C_NUM_MAX) i2c_driver_delete(info->i2c.port);
							if (info->i2c.bufstart) free(info->i2c.bufstart);
							break;
						case SPI:
							// NOTE: we don't free bus; user can set up it manually and should deinit it manually too (if need to)
							if (info->spi.buffer) heap_caps_free(info->spi.buffer);

							spi_bus_remove_device(info->spi.device);
							break;
						case UNKNOWN:
							break; // It is eiter SW or bad object
						};
				free(info); // We check it for NULL in the beginning
				break;

			case U8X8_MSG_DELAY_NANO:
				ets_delay_us(arg_int == 0 ? 0 : 1);
				break;

			case U8X8_MSG_DELAY_10MICRO:
				/* not used at the moment */
				break;

			case U8X8_MSG_DELAY_100NANO:
				/* not used at the moment */
				break;

			case U8X8_MSG_DELAY_MILLI:
				vTaskDelay(arg_int);
				break;
			case U8X8_MSG_DELAY_I2C:
				/* arg_int is 1 or 4: 100KHz (5us) or 400KHz (1.25us) */
				ets_delay_us(arg_int <= 2 ? 5 : 2);
				break;
			case U8X8_MSG_GPIO_I2C_CLOCK:
			case U8X8_MSG_GPIO_I2C_DATA:
				;
				uint8_t pin = u8x8_GetPinValue(u8x8, msg);
				/*
				if ( arg_int == 0 )
				{
				    if (
				    (!u8x8_setpinoutput_espidf(pin)) ||
				    (gpio_set_level(pin, 0) != ESP_OK)
				    ) return 0;
				}
				else
				{
				    if (!u8x8_setpininput_espidf(pin)) return 0;
				}
				break;*/
				gpio_set_level(pin, arg_int);
				break;
			default:
				if (msg >= U8X8_MSG_GPIO(0)) {
						i = u8x8_GetPinValue(u8x8, msg);
						if (i != U8X8_PIN_NONE) {
								if (u8x8_GetPinIndex(u8x8, msg) < U8X8_PIN_OUTPUT_CNT) {
										gpio_set_level(i, arg_int);
										}
								else {
										u8x8_SetGPIOResult(u8x8, gpio_get_level(i));
										}
								}
						break;
						}

				return 0;
			}
	return 1;
	}

/*=============================================*/
/*=== 4 WIRE HARDWARE SPI ===*/

static const spi_host_device_t u8x8_spibuses[2] = {HSPI_HOST, VSPI_HOST};

static void u8x8_byte_espidf_hw_spi_transfer(u8x8_device_info* info) {
	if (info->spi.bufsiz == 0) { return; }

	if (info->spi.bufsiz > CONFIG_U8G2_SPI_MAX) {
			ESP_LOGE(U8X8_TAG, "too big SPI transaction: %zu bytes (limit: %zu bytes)", info->spi.bufsiz, CONFIG_U8G2_SPI_MAX);
			return;
			}
	spi_transaction_t transaction = {};
	transaction.flags = 0;
	transaction.length = (info->spi.bufsiz) * 8;   // Bits
	transaction.tx_buffer = info->spi.buffer;
	transaction.rx_buffer = NULL; // U8g2 don't care about feedback, bad guys!
	ESP_LOGV(U8X8_TAG, "Executing SPI transaction of size %zu bytes", info->spi.bufsiz);
	ESP_ERROR_CHECK_WITHOUT_ABORT(spi_device_polling_transmit(info->spi.device, &transaction));
	if (CONFIG_U8G2_SPI_PREALLOCATE == 0) {
			heap_caps_free(info->spi.buffer);
			info->spi.buffer = NULL;
			}
	else {
			info->spi.buffer = heap_caps_realloc(info->spi.buffer, CONFIG_U8G2_SPI_PREALLOCATE, MALLOC_CAP_DMA);
			}
	info->spi.bufsiz = 0;
	};

static uint8_t u8x8_byte_espidf_hw_spi_universal(u8x8_t* u8x8, uint8_t msg, uint8_t arg_int, void* arg_ptr, uint8_t host)
// It can work with any of two SPIs
	{
	u8x8_device_info* info = u8x8->user_ptr;
	switch (msg) {
			case U8X8_MSG_BYTE_SEND:
				;
				ESP_LOGV(U8X8_TAG, "Appending buffer");
				// We add stuff into buffer and then send it in one transaction
				//if (info->spi.bufsiz != 0)
				//	hexDump("Old buf", info->spi.buffer, info->spi.bufsiz);
				size_t oldsize = info->spi.bufsiz;
				uint8_t* oldptr = info->spi.buffer;
				info->spi.bufsiz += arg_int;
				//hexDump("Appending", arg_ptr, arg_int);
				if (info->spi.buffer == NULL || info->spi.bufsiz > CONFIG_U8G2_SPI_PREALLOCATE) {
						info->spi.buffer = heap_caps_realloc(info->spi.buffer, max(info->spi.bufsiz, CONFIG_U8G2_SPI_PREALLOCATE), MALLOC_CAP_DMA);
						}
				if (!info->spi.buffer) { if (oldptr) { heap_caps_free(oldptr); } info->spi.bufsiz = 0; return 1; };
				memcpy(info->spi.buffer + oldsize, arg_ptr, arg_int);
				//hexDump("New buf", info->spi.buffer, info->spi.bufsiz);

				break;
			case U8X8_MSG_BYTE_INIT:
				;
				info->type = SPI;
				info->spi.device = NULL;
				info->spi.bufsiz = 0;
				if (CONFIG_U8G2_SPI_PREALLOCATE != 0) {
						info->spi.buffer = heap_caps_malloc(CONFIG_U8G2_SPI_PREALLOCATE, MALLOC_CAP_DMA);
						// If it returns NULL, continue. However, things will likely get bad soon…
						}
				else {
						info->spi.buffer = NULL;
						}
				info->spi.last_dc = 255; // Default value, always differ from actual one
				spi_bus_config_t busconf = {};
				busconf.mosi_io_num = u8x8->pins[U8X8_PIN_SPI_DATA_HW];
				busconf.miso_io_num = -1;
				busconf.sclk_io_num = u8x8->pins[U8X8_PIN_SPI_CLOCK_HW];
				busconf.quadwp_io_num = -1;
				busconf.quadhd_io_num = -1;
				busconf.max_transfer_sz = CONFIG_U8G2_SPI_MAX;
				busconf.flags = 0;
				if (u8x8->bus_clock == 0) {	/* issue 769 */
						u8x8->bus_clock = u8x8->display_info->sck_clock_hz;
						}
				/* disable chipselect */
				//u8x8_gpio_SetCS(u8x8, u8x8->display_info->chip_disable_level);

				if (spi_bus_initialize(u8x8_spibuses[host], &busconf, host + 1) != ESP_OK) { // NOTE: user can set up it manually
						ESP_LOGI(U8X8_TAG, "failed to setup SPI bus. Ignore this message if you did it manually.");
						}

				spi_device_interface_config_t conf = {};
				conf.command_bits = 0;
				conf.address_bits = 0;
				conf.dummy_bits = 0;
				conf.mode = u8x8->display_info->spi_mode;
				conf.duty_cycle_pos = 0; // I'm not sure
				conf.clock_speed_hz = u8x8->bus_clock;
				conf.input_delay_ns = 0;
				conf.spics_io_num = u8x8->pins[U8X8_PIN_CS_HW];
				conf.flags = SPI_DEVICE_NO_DUMMY;
				if (u8x8->display_info->chip_enable_level) {
						conf.flags |= SPI_DEVICE_POSITIVE_CS;
						}
				conf.queue_size = 1; // I only use polling transactions, but ok
				ESP_ERROR_CHECK_WITHOUT_ABORT(spi_bus_add_device(u8x8_spibuses[host], &conf, & (info->spi.device)));

				break;

			case U8X8_MSG_BYTE_SET_DC:
				if (u8x8->pins[U8X8_PIN_DC] != U8X8_PIN_NONE) { // 4 wire SPI only
						ESP_LOGV(U8X8_TAG, "DC value: %d", arg_int);
						if (info->spi.last_dc != arg_int) { u8x8_byte_espidf_hw_spi_transfer(info); }
						u8x8_gpio_SetDC(u8x8, arg_int);
						}
				break;

			case U8X8_MSG_BYTE_START_TRANSFER:
				ESP_LOGV(U8X8_TAG, "SPI transaction start (formally)");
				// Nothing to do here
				break;

			case U8X8_MSG_BYTE_END_TRANSFER:
				u8x8_byte_espidf_hw_spi_transfer(info);
				break;
			default:
				return 0;
			}

	return 1;
	}

uint8_t u8x8_byte_espidf_hw_hspi(u8x8_t* u8x8, uint8_t msg, uint8_t arg_int, void* arg_ptr) {
	return u8x8_byte_espidf_hw_spi_universal(u8x8, msg, arg_int, arg_ptr, 0);
	};

uint8_t u8x8_byte_espidf_hw_vspi(u8x8_t* u8x8, uint8_t msg, uint8_t arg_int, void* arg_ptr) {
	return u8x8_byte_espidf_hw_spi_universal(u8x8, msg, arg_int, arg_ptr, 1);
	};

/*=============================================*/
/*=== HARDWARE I2C ===*/

static uint8_t u8x8_byte_espidf_hw_i2c_universal(u8x8_t* u8x8, uint8_t msg, uint8_t arg_int, void* arg_ptr, i2c_port_t port) {
	u8x8_device_info* info = u8x8->user_ptr;
	switch (msg) {
			case U8X8_MSG_BYTE_SEND:
				memcpy(info->i2c.bufptr, arg_ptr, arg_int);
				i2c_master_write(info->i2c.cmd, info->i2c.bufptr, arg_int, true);
				info->i2c.bufptr += arg_int;
				break;
			case U8X8_MSG_BYTE_INIT:
				info->type = I2C;
				info->i2c.port = I2C_NUM_MAX; // In case of failure
				info->i2c.bufstart = malloc(32);    // It should be enough
				if (!info->i2c.bufstart) return 0; // We are in trouble, my friend…

				if (u8x8->bus_clock == 0) {	/* issue 769 */
						u8x8->bus_clock = u8x8->display_info->i2c_bus_clock_100kHz * 100000UL;
						}

				gpio_reset_pin(u8x8->pins[U8X8_PIN_I2C_DATA]);
				gpio_reset_pin(u8x8->pins[U8X8_PIN_I2C_CLOCK]);
				i2c_config_t busconf;
				busconf.mode = I2C_MODE_MASTER;
				busconf.sda_io_num = u8x8->pins[U8X8_PIN_I2C_DATA];
				busconf.sda_pullup_en = GPIO_PULLUP_ENABLE;
				busconf.scl_io_num = u8x8->pins[U8X8_PIN_I2C_CLOCK];
				busconf.scl_pullup_en = GPIO_PULLUP_ENABLE;
				busconf.master.clk_speed = u8x8->bus_clock;
				if (i2c_param_config(port, &busconf) != ESP_OK) {
						ESP_LOGE(U8X8_TAG, "i2c_param_config failed");
						}
				if (i2c_driver_install(port, I2C_MODE_MASTER, 0, 0, 0) != ESP_OK) {
						ESP_LOGE(U8X8_TAG, "i2c_driver_install failed");
						}
				info->i2c.port = port;
				ESP_LOGV(U8X8_TAG, "HW I2C init complete");
				break;
			case U8X8_MSG_BYTE_SET_DC:
				break;
			case U8X8_MSG_BYTE_START_TRANSFER:
				/* not sure when the setClock function was introduced, but it is there since 1.6.0 */
				/* if there is any error with Wire.setClock() just remove this function call */
				//Wire.setClock(u8x8->bus_clock);
				//Wire.beginTransmission(u8x8_GetI2CAddress(u8x8)>>1);
				info->i2c.cmd = i2c_cmd_link_create();
				i2c_master_start(info->i2c.cmd);
				i2c_master_write_byte(info->i2c.cmd, u8x8_GetI2CAddress(u8x8) | I2C_MASTER_WRITE, true);
				info->i2c.bufptr = info->i2c.bufstart;
				ESP_LOGV(U8X8_TAG, "Display addr: %03X", u8x8_GetI2CAddress(u8x8) >> 1);
				break;
			case U8X8_MSG_BYTE_END_TRANSFER:
				ESP_LOGV(U8X8_TAG, "HW I2C sending");
				i2c_master_stop(info->i2c.cmd);
				esp_err_t err = i2c_master_cmd_begin(port, info->i2c.cmd, portMAX_DELAY);
				if (err != ESP_OK) {
						ESP_LOGE(U8X8_TAG, "i2c_master_cmd_begin failed: %s", esp_err_to_name(err));
						}
				ESP_LOGV(U8X8_TAG, "HW I2C sending completed");
				i2c_cmd_link_delete(info->i2c.cmd);
				break;
			default:
				return 0;
			}
	return 1;
	}

uint8_t u8x8_byte_espidf_hw_i2c_port0(u8x8_t* u8x8, uint8_t msg, uint8_t arg_int, void* arg_ptr) {
	return u8x8_byte_espidf_hw_i2c_universal(u8x8, msg, arg_int, arg_ptr, 0);
	};

uint8_t u8x8_byte_espidf_hw_i2c_port1(u8x8_t* u8x8, uint8_t msg, uint8_t arg_int, void* arg_ptr) {
	return u8x8_byte_espidf_hw_i2c_universal(u8x8, msg, arg_int, arg_ptr, 1);
	};

/*
  use U8X8_PIN_NONE as value for "reset", if there is no reset line
*/

void u8x8_SetPin_SPI(u8x8_t* u8x8, uint8_t clock, uint8_t data, uint8_t cs, uint8_t dc, uint8_t reset) {
	u8x8_SetPin(u8x8, U8X8_PIN_SPI_CLOCK, clock);
	u8x8_SetPin(u8x8, U8X8_PIN_SPI_DATA, data);
	u8x8_SetPin(u8x8, U8X8_PIN_CS, cs);
	u8x8_SetPin(u8x8, U8X8_PIN_DC, dc);
	u8x8_SetPin(u8x8, U8X8_PIN_RESET, reset);
	}

void u8x8_SetPin_SPI_HW(u8x8_t* u8x8, uint8_t clock, uint8_t data, uint8_t cs, uint8_t dc, uint8_t reset) {
	u8x8_SetPin(u8x8, U8X8_PIN_SPI_CLOCK_HW, clock);
	u8x8_SetPin(u8x8, U8X8_PIN_SPI_DATA_HW, data);
	u8x8_SetPin(u8x8, U8X8_PIN_CS_HW, cs);
	u8x8_SetPin(u8x8, U8X8_PIN_DC, dc);
	u8x8_SetPin(u8x8, U8X8_PIN_RESET, reset);
	}

void u8x8_SetPin_SPI_3wire(u8x8_t* u8x8, uint8_t clock, uint8_t data, uint8_t cs, uint8_t reset) {
	u8x8_SetPin_SPI(u8x8, clock, data, cs, U8X8_PIN_NONE, reset);
	}

void u8x8_SetPin_SPI_3wire_HW(u8x8_t* u8x8, uint8_t clock, uint8_t data, uint8_t cs, uint8_t reset) {
	u8x8_SetPin_SPI_HW(u8x8, clock, data, cs, U8X8_PIN_NONE, reset);
	}

/*
  use U8X8_PIN_NONE as value for "reset", if there is no reset line
*/

void u8x8_SetPin_I2C(u8x8_t* u8x8, uint8_t clock, uint8_t data, uint8_t reset) {
	u8x8_SetPin(u8x8, U8X8_PIN_I2C_CLOCK, clock);
	u8x8_SetPin(u8x8, U8X8_PIN_I2C_DATA, data);
	u8x8_SetPin(u8x8, U8X8_PIN_RESET, reset);
	}

void u8x8_SetPin_8Bit_6800(u8x8_t* u8x8, uint8_t d0, uint8_t d1, uint8_t d2, uint8_t d3, uint8_t d4, uint8_t d5, uint8_t d6, uint8_t d7, uint8_t enable, uint8_t cs, uint8_t dc, uint8_t reset) {
	u8x8_SetPin(u8x8, U8X8_PIN_D0, d0);
	u8x8_SetPin(u8x8, U8X8_PIN_D1, d1);
	u8x8_SetPin(u8x8, U8X8_PIN_D2, d2);
	u8x8_SetPin(u8x8, U8X8_PIN_D3, d3);
	u8x8_SetPin(u8x8, U8X8_PIN_D4, d4);
	u8x8_SetPin(u8x8, U8X8_PIN_D5, d5);
	u8x8_SetPin(u8x8, U8X8_PIN_D6, d6);
	u8x8_SetPin(u8x8, U8X8_PIN_D7, d7);
	u8x8_SetPin(u8x8, U8X8_PIN_E, enable);
	u8x8_SetPin(u8x8, U8X8_PIN_CS, cs);
	u8x8_SetPin(u8x8, U8X8_PIN_DC, dc);
	u8x8_SetPin(u8x8, U8X8_PIN_RESET, reset);
	}

void u8x8_SetPin_8Bit_8080(u8x8_t* u8x8, uint8_t d0, uint8_t d1, uint8_t d2, uint8_t d3, uint8_t d4, uint8_t d5, uint8_t d6, uint8_t d7, uint8_t wr, uint8_t cs, uint8_t dc, uint8_t reset) {
	u8x8_SetPin(u8x8, U8X8_PIN_D0, d0);
	u8x8_SetPin(u8x8, U8X8_PIN_D1, d1);
	u8x8_SetPin(u8x8, U8X8_PIN_D2, d2);
	u8x8_SetPin(u8x8, U8X8_PIN_D3, d3);
	u8x8_SetPin(u8x8, U8X8_PIN_D4, d4);
	u8x8_SetPin(u8x8, U8X8_PIN_D5, d5);
	u8x8_SetPin(u8x8, U8X8_PIN_D6, d6);
	u8x8_SetPin(u8x8, U8X8_PIN_D7, d7);
	u8x8_SetPin(u8x8, U8X8_PIN_E, wr);
	u8x8_SetPin(u8x8, U8X8_PIN_CS, cs);
	u8x8_SetPin(u8x8, U8X8_PIN_DC, dc);
	u8x8_SetPin(u8x8, U8X8_PIN_RESET, reset);
	}

void u8x8_SetPin_KS0108(u8x8_t* u8x8, uint8_t d0, uint8_t d1, uint8_t d2, uint8_t d3, uint8_t d4, uint8_t d5, uint8_t d6, uint8_t d7, uint8_t enable, uint8_t dc, uint8_t cs0, uint8_t cs1, uint8_t cs2, uint8_t reset) {
	u8x8_SetPin(u8x8, U8X8_PIN_D0, d0);
	u8x8_SetPin(u8x8, U8X8_PIN_D1, d1);
	u8x8_SetPin(u8x8, U8X8_PIN_D2, d2);
	u8x8_SetPin(u8x8, U8X8_PIN_D3, d3);
	u8x8_SetPin(u8x8, U8X8_PIN_D4, d4);
	u8x8_SetPin(u8x8, U8X8_PIN_D5, d5);
	u8x8_SetPin(u8x8, U8X8_PIN_D6, d6);
	u8x8_SetPin(u8x8, U8X8_PIN_D7, d7);
	u8x8_SetPin(u8x8, U8X8_PIN_E, enable);
	u8x8_SetPin(u8x8, U8X8_PIN_DC, dc);
	u8x8_SetPin(u8x8, U8X8_PIN_CS, cs0);
	u8x8_SetPin(u8x8, U8X8_PIN_CS1, cs1);
	u8x8_SetPin(u8x8, U8X8_PIN_CS2, cs2);
	u8x8_SetPin(u8x8, U8X8_PIN_RESET, reset);
	}

void u8x8_SetPin_SED1520(u8x8_t* u8x8, uint8_t d0, uint8_t d1, uint8_t d2, uint8_t d3, uint8_t d4, uint8_t d5, uint8_t d6, uint8_t d7, uint8_t dc, uint8_t e1, uint8_t e2, uint8_t reset) {
	u8x8_SetPin(u8x8, U8X8_PIN_D0, d0);
	u8x8_SetPin(u8x8, U8X8_PIN_D1, d1);
	u8x8_SetPin(u8x8, U8X8_PIN_D2, d2);
	u8x8_SetPin(u8x8, U8X8_PIN_D3, d3);
	u8x8_SetPin(u8x8, U8X8_PIN_D4, d4);
	u8x8_SetPin(u8x8, U8X8_PIN_D5, d5);
	u8x8_SetPin(u8x8, U8X8_PIN_D6, d6);
	u8x8_SetPin(u8x8, U8X8_PIN_D7, d7);
	u8x8_SetPin(u8x8, U8X8_PIN_E, e1);
	u8x8_SetPin(u8x8, U8X8_PIN_CS, e2);
	u8x8_SetPin(u8x8, U8X8_PIN_DC, dc);
	u8x8_SetPin(u8x8, U8X8_PIN_RESET, reset);
	}

// kate: indent-mode cstyle; indent-width 4; replace-tabs off; tab-width 4; 

