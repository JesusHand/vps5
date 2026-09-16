# ایمیج پایه رسمی Neko Firefox
FROM ghcr.io/m1k1o/neko/firefox:latest

# ---- تنظیمات احراز هویت ----
ENV NEKO_MEMBER_MULTIUSER_USER_PASSWORD=123456
ENV NEKO_MEMBER_MULTIUSER_ADMIN_PASSWORD=*

# ---- تنظیمات WebRTC (حیاتی برای Blitz.cloud) ----
# فعال‌سازی حالت ICE Lite برای سرورهای با IP عمومی
ENV NEKO_WEBRTC_ICELITE=1

# استفاده از یک پورت واحد UDP (8080) به‌جای بازه 52000-52100
# این کار باعث می‌شود نیازی به expose کردن پورت‌های UDP جداگانه نباشد
ENV NEKO_WEBRTC_UDPMUX=8080

# فعال‌سازی TCP Multiplexing روی همان پورت (به‌عنوان fallback برای شبکه‌های محدود)
ENV NEKO_WEBRTC_TCPMUX=8080

# ---- تنظیمات نمایشگر ----
ENV NEKO_DESKTOP_SCREEN=1920x1080@30

# ---- Expose کردن پورت اصلی ----
# Neko به‌طور پیش‌فرض روی 8080 گوش می‌دهد
EXPOSE 8080

# ایمیج پایه entrypoint و cmd لازم برای اجرای Firefox و سرور Neko را دارد
# نیازی به CMD جداگانه نیست
