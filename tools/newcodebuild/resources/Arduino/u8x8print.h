		size_t write(uint8_t v);
		/* code extended and moved to .cpp file, issue 74 */

		size_t write(const uint8_t* buffer, size_t size) {
			size_t cnt = 0;
			while (size > 0) {
					cnt += write(*buffer++);
					size--;
					}
			return cnt;
			}
