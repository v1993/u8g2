		/* virtual function for print base class */
		size_t write(uint8_t v) {
			uint16_t e = cpp_next_cb(&(u8g2.u8x8), v);

			if (e < 0x0fffe)
				tx += u8g2_DrawGlyph(&u8g2, tx, ty, e);
			return 1;
			}

		size_t write(const uint8_t* buffer, size_t size) {
			size_t cnt = 0;
			while (size > 0) {
					cnt += write(*buffer++);
					size--;
					}
			return cnt;
			}
