#ifdef U8X8_WITH_USER_PTR
		void* getUserPtr() { return u8x8_GetUserPtr(&u8x8); }
		void setUserPtr(void* p) { u8x8_SetUserPtr(&u8x8, p); }
#endif
