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

static const char* TAG = "U8G2";

/*=============================================*/
/*=== GPIO & DELAY ===*/

#ifndef ESP_PLATFORM
#error "You compile U8G2 ESP-IDF only files not in ESP-IDF"
#endif

#ifndef U8X8_USE_PINS
#error "U8X8_USE_PINS not defined! Contact u8g2 devs and v1993 about this issue"
#endif

static unsigned long long u8x8_pintomask_espidf(unsigned long long pin) { return 1ULL << pin; };

static gpio_config_t u8x8_gpiodefault_espidf(unsigned long long pin) {
	gpio_config_t io_conf;
	io_conf.intr_type = GPIO_PIN_INTR_DISABLE;
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

uint8_t u8x8_gpio_and_delay_espidf(u8x8_t *u8x8, uint8_t msg, uint8_t arg_int, U8X8_UNUSED void *arg_ptr)
{
    uint8_t i;
    switch(msg)
    {
    case U8X8_MSG_GPIO_AND_DELAY_INIT:
        for( i = 0; i < U8X8_PIN_CNT; i++ ) {
            if ( u8x8->pins[i] != U8X8_PIN_NONE )
            {
				bool success = false;
                if ( i < U8X8_PIN_OUTPUT_CNT )
                {
					ESP_LOGI(TAG, "setting %u as output pin", i); 
					success = u8x8_setpinoutput_espidf(u8x8->pins[i]);
                }
                else
                {
					ESP_LOGI(TAG, "setting %u as input pin", i); 
					success = u8x8_setpininput_espidf(u8x8->pins[i]);
                }
                if (!success) {ESP_LOGE(TAG, "pin error"); return 0;};
            }}

        break;

    case U8X8_MSG_DELAY_NANO:
        ets_delay_us(arg_int==0?0:1);
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
        ets_delay_us(arg_int<=2?5:2);
        break;
    case U8X8_MSG_GPIO_I2C_CLOCK:
    case U8X8_MSG_GPIO_I2C_DATA: ;
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
        if ( msg >= U8X8_MSG_GPIO(0) )
        {
            i = u8x8_GetPinValue(u8x8, msg);
            if ( i != U8X8_PIN_NONE )
            {
                if ( u8x8_GetPinIndex(u8x8, msg) < U8X8_PIN_OUTPUT_CNT )
                {
                    gpio_set_level(i, arg_int);
                }
                else
                {
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

typedef struct {
	spi_device_handle_t device;
	uint8_t* buffer;
	size_t bufsiz;
} u8x8_spi_info;

static uint8_t u8x8_byte_espidf_hw_spi_universal(u8x8_t *u8x8, uint8_t msg, uint8_t arg_int, void *arg_ptr, uint8_t host)
// It can work with any of two SPIs
{
//#ifdef U8X8_HAVE_HW_SPI
	u8x8_spi_info* info = u8x8->user_ptr;
    switch(msg)
    {
    case U8X8_MSG_BYTE_SEND: ;

		// We add stuff into buffer and then send it in one transaction
		size_t oldsize = info->bufsiz;
		info->bufsiz += arg_int;
		info->buffer = heap_caps_realloc(info->buffer, info->bufsiz, MALLOC_CAP_DMA); // FIXME: MALLOC_CAP_32BIT may crash stuff
		memcpy(info->buffer + oldsize, arg_ptr, arg_int);

        break;
    case U8X8_MSG_BYTE_INIT:
		u8x8->user_ptr = malloc(sizeof(u8x8_spi_info)); // FIXME: free in destructor
		info = u8x8->user_ptr;
		info->device = NULL;
		info->buffer = NULL;
		info->bufsiz = 0;
		spi_bus_config_t busconf;
		busconf.mosi_io_num = u8x8->pins[U8X8_PIN_I2C_DATA];
		busconf.miso_io_num = -1;
		busconf.sclk_io_num = u8x8->pins[U8X8_PIN_I2C_CLOCK];
		busconf.quadwp_io_num = -1;
		busconf.quadhd_io_num = -1;
		busconf.max_transfer_sz = 0; // FIXME: add it into config
		busconf.flags = 0; // FIXME: add stuff here?
        if ( u8x8->bus_clock == 0 ) 	/* issue 769 */
            u8x8->bus_clock = u8x8->display_info->sck_clock_hz;
        /* disable chipselect */
        //u8x8_gpio_SetCS(u8x8, u8x8->display_info->chip_disable_level);

		spi_bus_initialize(u8x8_spibuses[host], &busconf, host+1); // NOTE: user can set up it manually

		spi_device_interface_config_t conf;
		conf.command_bits = 0;
		conf.address_bits = 0;
		conf.dummy_bits = 0; // FIXME: Hmmm, may cause problems?
		conf.mode = u8x8->display_info->spi_mode;
		conf.duty_cycle_pos = 0; // I'm not sure
		conf.clock_speed_hz = APB_CLK_FREQ / u8x8->bus_clock; // TODO: add setting to overclock displays :)
		conf.input_delay_ns = 0;
		conf.spics_io_num = u8x8->pins[U8X8_MSG_GPIO_CS];
		conf.flags = SPI_DEVICE_POSITIVE_CS | SPI_DEVICE_NO_DUMMY;
		if (u8x8->display_info->chip_enable_level) conf.flags |= SPI_DEVICE_POSITIVE_CS; // FIXME: may be right in complete reverse
		conf.queue_size = 0; // Polling only
		spi_bus_add_device(u8x8_spibuses[host], &conf, &(info->device)); // FIXME: remove in destructor

		break;

    case U8X8_MSG_BYTE_SET_DC:
        u8x8_gpio_SetDC(u8x8, arg_int);
        break;

    case U8X8_MSG_BYTE_START_TRANSFER:

		// Nothing to do here
        break;

    case U8X8_MSG_BYTE_END_TRANSFER: ;
		// Docs says that it's better to have 32-bit aligned memory
		// Doing it here should make stuff faster
		info->buffer = heap_caps_realloc(info->buffer, info->bufsiz, MALLOC_CAP_DMA | MALLOC_CAP_32BIT);
		spi_transaction_t transaction;
		transaction.flags = SPI_TRANS_MODE_DIO;
		transaction.length = (info->bufsiz)*8; // Bits
		transaction.tx_buffer = info->buffer;
		transaction.rx_buffer = NULL; // U8g2 don't care about feedback, bad guys!
		spi_device_polling_transmit(info->device, &transaction);
		free(info->buffer);
		info->buffer = NULL;
		info->bufsiz = 0;

        break;
    default:
        return 0;
    }

    return 1;
}

uint8_t u8x8_byte_espidf_hw_hspi(u8x8_t *u8x8, uint8_t msg, uint8_t arg_int, void *arg_ptr) {
	return u8x8_byte_espidf_hw_spi_universal(u8x8, msg, arg_int, arg_ptr, 0);
};

uint8_t u8x8_byte_espidf_hw_vspi(u8x8_t *u8x8, uint8_t msg, uint8_t arg_int, void *arg_ptr) {
	return u8x8_byte_espidf_hw_spi_universal(u8x8, msg, arg_int, arg_ptr, 1);
};

/*=============================================*/
/*=== HARDWARE I2C ===*/

typedef struct {
	i2c_cmd_handle_t cmd;
	uint8_t* bufstart; // Always points to same place
	uint8_t* bufptr;
} u8x8_i2c_info;

static uint8_t u8x8_byte_espidf_hw_i2c_universal(u8x8_t *u8x8, uint8_t msg, uint8_t arg_int, void *arg_ptr, i2c_port_t port)
{
    switch(msg)
    {
    case U8X8_MSG_BYTE_SEND: {
		u8x8_i2c_info* info = u8x8->user_ptr;
		memcpy(info->bufptr, arg_ptr, arg_int);
		i2c_master_write(info->cmd, info->bufptr, arg_int, true);
		info->bufptr += arg_int;}
        break;
    case U8X8_MSG_BYTE_INIT:
		u8x8->user_ptr = malloc(sizeof(u8x8_i2c_info));
		u8x8_i2c_info* info = u8x8->user_ptr;
		info->bufstart = malloc(32); // It should be enough

        if ( u8x8->bus_clock == 0 ) 	/* issue 769 */
            u8x8->bus_clock = u8x8->display_info->i2c_bus_clock_100kHz * 100000UL;
        /* for ESP8266/ESP32, Wire.begin has two more arguments: clock and data */
            // second argument for the wire lib is the clock pin. In u8g2, the first argument of the  clock pin in the clock/data pair
		//Wire.begin(u8x8->pins[U8X8_PIN_I2C_DATA], u8x8->pins[U8X8_PIN_I2C_CLOCK]);
		//break;
		gpio_reset_pin(u8x8->pins[U8X8_PIN_I2C_DATA]);
		gpio_reset_pin(u8x8->pins[U8X8_PIN_I2C_CLOCK]);
		i2c_config_t busconf;
		busconf.mode = I2C_MODE_MASTER;
		busconf.sda_io_num = u8x8->pins[U8X8_PIN_I2C_DATA];
		busconf.sda_pullup_en = GPIO_PULLUP_ENABLE;
		busconf.scl_io_num = u8x8->pins[U8X8_PIN_I2C_CLOCK];
		busconf.scl_pullup_en = GPIO_PULLUP_ENABLE;
		busconf.master.clk_speed = u8x8->bus_clock;
		if (i2c_param_config(port, &busconf) != ESP_OK) ESP_LOGE(TAG, "i2c_param_config failed");
		if (i2c_driver_install(port, I2C_MODE_MASTER, 0, 0, 0) != ESP_OK) ESP_LOGE(TAG, "i2c_driver_install failed");
		ESP_LOGV(TAG, "HW I2C init complete");
		break;
    case U8X8_MSG_BYTE_SET_DC:
        break;
    case U8X8_MSG_BYTE_START_TRANSFER: {
        /* not sure when the setClock function was introduced, but it is there since 1.6.0 */
        /* if there is any error with Wire.setClock() just remove this function call */
        //Wire.setClock(u8x8->bus_clock);
        //Wire.beginTransmission(u8x8_GetI2CAddress(u8x8)>>1);
        u8x8_i2c_info* info = u8x8->user_ptr;
        info->cmd = i2c_cmd_link_create();
        i2c_master_start(info->cmd);
        i2c_master_write_byte(info->cmd, u8x8_GetI2CAddress(u8x8) | I2C_MASTER_WRITE, true);
        info->bufptr = info->bufstart;
        ESP_LOGV(TAG, "Display addr: %03X", u8x8_GetI2CAddress(u8x8) >> 1); }
        break;
    case U8X8_MSG_BYTE_END_TRANSFER: {
		u8x8_i2c_info* info = u8x8->user_ptr;
		ESP_LOGV(TAG, "HW I2C sending");
        i2c_master_stop(info->cmd);
        esp_err_t err = i2c_master_cmd_begin(port, info->cmd, portMAX_DELAY);
        if (err != ESP_OK) ESP_LOGE(TAG, "i2c_master_cmd_begin failed: %s", esp_err_to_name(err));
        ESP_LOGV(TAG, "HW I2C sending completed");
        i2c_cmd_link_delete(info->cmd);
        }
        break;
    default:
        return 0;
    }
    return 1;
}

uint8_t u8x8_byte_espidf_hw_i2c_port0(u8x8_t *u8x8, uint8_t msg, uint8_t arg_int, void *arg_ptr) {
	return u8x8_byte_espidf_hw_i2c_universal(u8x8, msg, arg_int, arg_ptr, 0);
};

uint8_t u8x8_byte_espidf_hw_i2c_port1(u8x8_t *u8x8, uint8_t msg, uint8_t arg_int, void *arg_ptr) {
	return u8x8_byte_espidf_hw_i2c_universal(u8x8, msg, arg_int, arg_ptr, 1);
};

/*
  use U8X8_PIN_NONE as value for "reset", if there is no reset line
*/

void u8x8_SetPin_4Wire_SW_SPI(u8x8_t *u8x8, uint8_t clock, uint8_t data, uint8_t cs, uint8_t dc, uint8_t reset)
{
    u8x8_SetPin(u8x8, U8X8_PIN_SPI_CLOCK, clock);
    u8x8_SetPin(u8x8, U8X8_PIN_SPI_DATA, data);
    u8x8_SetPin(u8x8, U8X8_PIN_CS, cs);
    u8x8_SetPin(u8x8, U8X8_PIN_DC, dc);
    u8x8_SetPin(u8x8, U8X8_PIN_RESET, reset);
}

void u8x8_SetPin_3Wire_SW_SPI(u8x8_t *u8x8, uint8_t clock, uint8_t data, uint8_t cs, uint8_t reset)
{
    u8x8_SetPin(u8x8, U8X8_PIN_SPI_CLOCK, clock);
    u8x8_SetPin(u8x8, U8X8_PIN_SPI_DATA, data);
    u8x8_SetPin(u8x8, U8X8_PIN_CS, cs);
    u8x8_SetPin(u8x8, U8X8_PIN_RESET, reset);
}

/*
  use U8X8_PIN_NONE as value for "reset", if there is no reset line
*/
void u8x8_SetPin_4Wire_HW_SPI(u8x8_t *u8x8, uint8_t cs, uint8_t dc, uint8_t reset)
{
    u8x8_SetPin(u8x8, U8X8_PIN_CS, cs);
    u8x8_SetPin(u8x8, U8X8_PIN_DC, dc);
    u8x8_SetPin(u8x8, U8X8_PIN_RESET, reset);
}

void u8x8_SetPin_ST7920_HW_SPI(u8x8_t *u8x8, uint8_t cs, uint8_t reset)
{
    u8x8_SetPin(u8x8, U8X8_PIN_CS, cs);
    u8x8_SetPin(u8x8, U8X8_PIN_RESET, reset);
}

void u8x8_SetPin_SW_I2C(u8x8_t *u8x8, uint8_t clock, uint8_t data, uint8_t reset)
{
    u8x8_SetPin(u8x8, U8X8_PIN_I2C_CLOCK, clock);
    u8x8_SetPin(u8x8, U8X8_PIN_I2C_DATA, data);
    u8x8_SetPin(u8x8, U8X8_PIN_RESET, reset);
}

void u8x8_SetPin_HW_I2C(u8x8_t *u8x8, uint8_t reset, uint8_t clock, uint8_t data)
{
    u8x8_SetPin(u8x8, U8X8_PIN_RESET, reset);
    u8x8_SetPin(u8x8, U8X8_PIN_I2C_CLOCK, clock);
    u8x8_SetPin(u8x8, U8X8_PIN_I2C_DATA, data);
}

void u8x8_SetPin_8Bit_6800(u8x8_t *u8x8, uint8_t d0, uint8_t d1, uint8_t d2, uint8_t d3, uint8_t d4, uint8_t d5, uint8_t d6, uint8_t d7, uint8_t enable, uint8_t cs, uint8_t dc, uint8_t reset)
{
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

void u8x8_SetPin_8Bit_8080(u8x8_t *u8x8, uint8_t d0, uint8_t d1, uint8_t d2, uint8_t d3, uint8_t d4, uint8_t d5, uint8_t d6, uint8_t d7, uint8_t wr, uint8_t cs, uint8_t dc, uint8_t reset)
{
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

void u8x8_SetPin_KS0108(u8x8_t *u8x8, uint8_t d0, uint8_t d1, uint8_t d2, uint8_t d3, uint8_t d4, uint8_t d5, uint8_t d6, uint8_t d7, uint8_t enable, uint8_t dc, uint8_t cs0, uint8_t cs1, uint8_t cs2, uint8_t reset)
{
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

void u8x8_SetPin_SED1520(u8x8_t *u8x8, uint8_t d0, uint8_t d1, uint8_t d2, uint8_t d3, uint8_t d4, uint8_t d5, uint8_t d6, uint8_t d7, uint8_t dc, uint8_t e1, uint8_t e2, uint8_t reset)
{
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

