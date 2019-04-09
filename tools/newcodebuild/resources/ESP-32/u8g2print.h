		void print(uint8_t v) {
			uint16_t e = cpp_next_cb(&(u8g2.u8x8), v);

			if (e < 0x0fffe) {
					tx += u8g2_DrawGlyph(&u8g2, tx, ty, e);
					}
			}

		void print(const std::string& str) {
			for (const auto& ch : str) { print(ch); }
			};
		template <typename T> void print(T data) {
			std::stringstream sstr;
			sstr << data;
			auto str = sstr.str();
			print(str);
			};
