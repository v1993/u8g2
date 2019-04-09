/*

  U8x8lib.h(pp)

  U8G2_CODEBUILD_DISCAIMER

  C++ wrapper for the u8x8 library struct and C functions

  Universal 8bit Graphics Library (https://github.com/olikraus/u8g2/)

  Copyright (c) 2016, olikraus@gmail.com
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

#ifndef _U8X8LIB_HH
#define _U8X8LIB_HH

// U8G2_CODEBUILD_INCLUDES

// U8G2_CODEBUILD_OPTIONS

// U8G2_CODEBUILD_U8X8_CLASS
{
	protected:
		u8x8_t u8x8;
	public:
		uint8_t tx, ty;

		U8X8(void) { home();  }
		u8x8_t* getU8x8(void) { return &u8x8; }

		void sendF(const char* fmt, ...)
			{ va_list va; va_start(va, fmt); u8x8_cad_vsendf(&u8x8, fmt, va); va_end(va); }

		uint32_t getBusClock(void) { return u8x8.bus_clock; }
		void setBusClock(uint32_t clock_speed) { u8x8.bus_clock = clock_speed; }

		void setI2CAddress(uint8_t adr) { u8x8_SetI2CAddress(&u8x8, adr); }

		uint8_t getCols(void) { return u8x8_GetCols(&u8x8); }
		uint8_t getRows(void) { return u8x8_GetRows(&u8x8); }

		void drawTile(uint8_t x, uint8_t y, uint8_t cnt, uint8_t* tile_ptr) {
			u8x8_DrawTile(&u8x8, x, y, cnt, tile_ptr);
			}

// U8G2_CODEBUILD_USER_PTR

#ifdef U8X8_USE_PINS
		/* set the menu pins before calling begin() or initDisplay() */
		void setMenuSelectPin(uint8_t val) {
			u8x8_SetMenuSelectPin(&u8x8, val);
			}
		void setMenuPrevPin(uint8_t val) {
			u8x8_SetMenuPrevPin(&u8x8, val);
			}
		void setMenuNextPin(uint8_t val) {
			u8x8_SetMenuNextPin(&u8x8, val);
			}
		void setMenuUpPin(uint8_t val) {
			u8x8_SetMenuUpPin(&u8x8, val);
			}
		void setMenuDownPin(uint8_t val) {
			u8x8_SetMenuDownPin(&u8x8, val);
			}
		void setMenuHomePin(uint8_t val) {
			u8x8_SetMenuHomePin(&u8x8, val);
			}
#endif

		void initDisplay(void) {
			u8x8_InitDisplay(&u8x8);
			}

		void clearDisplay(void) {
			u8x8_ClearDisplay(&u8x8);
			}

		void fillDisplay(void) {
			u8x8_FillDisplay(&u8x8);
			}

		void setPowerSave(uint8_t is_enable) {
			u8x8_SetPowerSave(&u8x8, is_enable);
			}

		bool begin(void) {
			initDisplay(); clearDisplay(); setPowerSave(0); return 1;
			}

#ifdef U8X8_USE_PINS
		/* use U8X8_PIN_NONE if a pin is not required */
		bool begin(uint8_t menu_select_pin, uint8_t menu_next_pin, uint8_t menu_prev_pin, uint8_t menu_up_pin = U8X8_PIN_NONE, uint8_t menu_down_pin = U8X8_PIN_NONE, uint8_t menu_home_pin = U8X8_PIN_NONE) {
			setMenuSelectPin(menu_select_pin);
			setMenuNextPin(menu_next_pin);
			setMenuPrevPin(menu_prev_pin);
			setMenuUpPin(menu_up_pin);
			setMenuDownPin(menu_down_pin);
			setMenuHomePin(menu_home_pin);
			return begin();
			}
#endif

		void setFlipMode(uint8_t mode) {
			u8x8_SetFlipMode(&u8x8, mode);
			}

		void refreshDisplay(void) {			// Dec 16: Only required for SSD1606
			u8x8_RefreshDisplay(&u8x8);
			}

		void clearLine(uint8_t line) {
			u8x8_ClearLine(&u8x8, line);
			}

		void setContrast(uint8_t value) {
			u8x8_SetContrast(&u8x8, value);
			}

		void setInverseFont(uint8_t value) {
			u8x8_SetInverseFont(&u8x8, value);
			}

		void setFont(const uint8_t* font_8x8) {
			u8x8_SetFont(&u8x8, font_8x8);
			}

		void drawGlyph(uint8_t x, uint8_t y, uint8_t encoding) {
			u8x8_DrawGlyph(&u8x8, x, y, encoding);
			}

		void draw2x2Glyph(uint8_t x, uint8_t y, uint8_t encoding) {
			u8x8_Draw2x2Glyph(&u8x8, x, y, encoding);
			}

		void draw1x2Glyph(uint8_t x, uint8_t y, uint8_t encoding) {
			u8x8_Draw1x2Glyph(&u8x8, x, y, encoding);
			}

		void drawString(uint8_t x, uint8_t y, const char* s) {
			u8x8_DrawString(&u8x8, x, y, s);
			}

		void drawUTF8(uint8_t x, uint8_t y, const char* s) {
			u8x8_DrawUTF8(&u8x8, x, y, s);
			}

		void draw2x2String(uint8_t x, uint8_t y, const char* s) {
			u8x8_Draw2x2String(&u8x8, x, y, s);
			}

		void draw1x2String(uint8_t x, uint8_t y, const char* s) {
			u8x8_Draw1x2String(&u8x8, x, y, s);
			}

		void draw2x2UTF8(uint8_t x, uint8_t y, const char* s) {
			u8x8_Draw2x2UTF8(&u8x8, x, y, s);
			}

		void draw1x2UTF8(uint8_t x, uint8_t y, const char* s) {
			u8x8_Draw1x2UTF8(&u8x8, x, y, s);
			}

		uint8_t getUTF8Len(const char* s) {
			return u8x8_GetUTF8Len(&u8x8, s);
			}

// U8G2_CODEBUILD_U8X8_PRINT

		void inverse(void) { setInverseFont(1); }
		void noInverse(void) { setInverseFont(0); }

		/* return 0 for no event or U8X8_MSG_GPIO_MENU_SELECT, */
		/* U8X8_MSG_GPIO_MENU_NEXT, U8X8_MSG_GPIO_MENU_PREV, */
		/* U8X8_MSG_GPIO_MENU_HOME */
		uint8_t getMenuEvent(void) { return u8x8_GetMenuEvent(&u8x8); }

		uint8_t userInterfaceSelectionList(const char* title, uint8_t start_pos, const char* sl) {
			return u8x8_UserInterfaceSelectionList(&u8x8, title, start_pos, sl);
			}
		uint8_t userInterfaceMessage(const char* title1, const char* title2, const char* title3, const char* buttons) {
			return u8x8_UserInterfaceMessage(&u8x8, title1, title2, title3, buttons);
			}
		uint8_t userInterfaceInputValue(const char* title, const char* pre, uint8_t* value, uint8_t lo, uint8_t hi, uint8_t digits, const char* post) {
			return u8x8_UserInterfaceInputValue(&u8x8, title, pre, value, lo, hi, digits, post);
			}

		/* LiquidCrystal compatible functions */
		void home(void) { tx = 0; ty = 0; }
		void clear(void) { clearDisplay(); home(); }
		void noDisplay(void) { u8x8_SetPowerSave(&u8x8, 1); }
		void display(void) { u8x8_SetPowerSave(&u8x8, 0); }
		void setCursor(uint8_t x, uint8_t y) { tx = x; ty = y; }

		void drawLog(uint8_t x, uint8_t y, class U8X8LOG& u8x8log);
	};

// U8G2_CODEBUILD_U8X8LOG_CLASS
{
	public:
		u8log_t u8log;

		/* the constructor does nothing, use begin() instead */
		U8X8LOG(void) { }

		/* connect to u8g2, draw to u8g2 whenever required */
		bool begin(class U8X8& u8x8, uint8_t width, uint8_t height, uint8_t* buf)  {
			u8log_Init(&u8log, width, height, buf);
			u8log_SetCallback(&u8log, u8log_u8x8_cb, u8x8.getU8x8());
			return true;
			}

		/* disconnected version, manual redraw required */
		bool begin(uint8_t width, uint8_t height, uint8_t* buf) {
			u8log_Init(&u8log, width, height, buf);
			return true;
			}

		void setLineHeightOffset(int8_t line_height_offset) {
			u8log_SetLineHeightOffset(&u8log, line_height_offset);
			}

		void setRedrawMode(uint8_t is_redraw_line_for_each_char) {
			u8log_SetRedrawMode(&u8log, is_redraw_line_for_each_char);
			}

// U8G2_CODEBUILD_U8X8LOG_PRINT

		void writeString(const char* s) { u8log_WriteString(&u8log, s); }
		void writeChar(uint8_t c) { u8log_WriteChar(&u8log, c); }
		void writeHex8(uint8_t b) { u8log_WriteHex8(&u8log, b); }
		void writeHex16(uint16_t v) { u8log_WriteHex16(&u8log, v); }
		void writeHex32(uint32_t v) { u8log_WriteHex32(&u8log, v); }
		void writeDec8(uint8_t v, uint8_t d) { u8log_WriteDec8(&u8log, v, d); }
		void writeDec16(uint8_t v, uint8_t d) { u8log_WriteDec16(&u8log, v, d); }
	};


/* u8log_u8x8.c */
inline void U8X8::drawLog(uint8_t x, uint8_t y, class U8X8LOG& u8x8log) {
	u8x8_DrawLog(&u8x8, x, y, &(u8x8log.u8log));
	}

class U8X8_NULL: public U8X8 {
	public: U8X8_NULL(void) : U8X8() {
			u8x8_Setup(getU8x8(), u8x8_d_null_cb, u8x8_cad_empty, u8x8_byte_empty, u8x8_dummy_cb);
			}
	};

#ifdef U8X8_USE_PINS

// constructor list start

// U8G2_CODEBUILD_CXX_CONSTRUCTORS

// constructor list end

#endif // U8X8_USE_PINS

#endif /* _U8X8LIB_HH */

// kate: indent-mode cstyle; indent-width 4; replace-tabs off; tab-width 4; 
