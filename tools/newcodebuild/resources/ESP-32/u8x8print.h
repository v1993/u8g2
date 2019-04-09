		void print(const char& ch) {
			if (ch == '\n') {
					ty += u8x8_pgm_read(u8x8.font + 3);
					tx = 0;
					}
			else {
					u8x8_DrawGlyph(&u8x8, tx, ty, ch);
					tx += u8x8_pgm_read(u8x8.font + 2);
					}
			}

		void print(const std::string& str) {
			for (const auto& ch : str) { print(ch); }
			}

		template <typename T> void print(T data) {
			std::stringstream sstr;
			sstr << data;
			auto str = sstr.str();
			print(str);
			}
