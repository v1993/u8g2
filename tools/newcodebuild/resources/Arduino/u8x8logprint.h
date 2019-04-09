		/* virtual function for print base class */
		size_t write(uint8_t v) {
			u8log_WriteChar(&u8log, v);
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
