TW_DEVICE_VERSION := 3.7.0-zyb
TW_DEVICE_MANUFACTURER := ZYB
TW_DEVICE_MODEL := ZPD1321
TW_DEVICE_FULL_NAME := tb8786p1_64_k510_wifi

# 存储配置
TW_EXTERNAL_STORAGE_PATH := "/sdcard"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "sdcard"
TW_INTERNAL_STORAGE_PATH := "/data/media/0"
TW_INTERNAL_STORAGE_MOUNT_POINT := "data"

# Splash配置
TW_SPLASH_PATH := $(DEVICE_PATH)/twres
TW_SKIP_SPLASH_IMAGE := true
TW_DISABLE_SPLASH := true
TW_NO_SPLASH := true

TW_DISABLE_PRODUCT_VAR_ASSIGN := true

# MTK平台专属配置
TW_MTK := true
TW_MTK_DEVICE := true
TW_INCLUDE_MTK_APDB := true

# vendor_boot ramdisk配置
TW_VENDOR_BOOT_RAMDISK_TYPE := raw
TW_VENDOR_BOOT_RAMDISK_COMPRESSION := gzip

# 禁用TWRP内核规则
TW_IGNORE_KERNEL_REPLACE := true

# 注意：此处不定义TW_THEME，已在主文件定义

# 追加属性
PRODUCT_PROPERTY_OVERRIDES += \
    ro.twrp.version=3.7.0-zyb \
    ro.twrp.build.date=$(shell date +%Y%m%d) \
    ro.build.fingerprint=$(PRODUCT_BUILD_FINGERPRINT)