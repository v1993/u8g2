		void print(char ch) {
			u8log_WriteChar(&u8log, ch);
			};

		void print(const std::string& str) {
			for (const auto& ch : str) { print(ch); }
			};

		template <typename T> void print(T data) {
			std::stringstream sstr;
			sstr << data;
			auto str = sstr.str();
			print(str);
			};
