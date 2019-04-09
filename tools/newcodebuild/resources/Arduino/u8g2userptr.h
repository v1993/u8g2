#ifdef U8X8_WITH_USER_PTR
		void* getUserPtr() { return u8g2_GetUserPtr(&u8g2); }
		void setUserPtr(void* p) { u8g2_SetUserPtr(&u8g2, p); }
#endif
