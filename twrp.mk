# tb8786p1_64_k510_wifi TWRP 专属配置
TW_DEVICE_VERSION := 3.7.0-zyb
TW_DEVICE_MANUFACTURER := ZYB
TW_DEVICE_MODEL := ZPD1321
TW_DEVICE_FULL_NAME := tb8786p1_64_k510_wifi

# 平板存储路径适配
TW_EXTERNAL_STORAGE_PATH := "/sdcard"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "sdcard"
TW_INTERNAL_STORAGE_PATH := "/data/media/0"
TW_INTERNAL_STORAGE_MOUNT_POINT := "data"

# ========== 关键修复：解决 splash.xml 缺失问题 ==========
TW_SPLASH_PATH := none
TW_SKIP_SPLASH_IMAGE := true

# ========== 兼容 Android 12+ 构建系统 ==========
# 禁用可能触发只读变量的自动配置
TW_DISABLE_PRODUCT_VAR_ASSIGN := true

# ========== MTK 平板适配补充 ==========
TW_MTK := true
TW_MTK_DEVICE := true
TW_INCLUDE_MTK_APDB := true