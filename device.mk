LOCAL_PATH := $(call my-dir)

# 包含TWRP基础配置
include vendor/twrp/config/common.mk

# 设备专属配置
PRODUCT_NAME := omni_tb8786p1_64_k510_wifi
PRODUCT_DEVICE := tb8786p1_64_k510_wifi
PRODUCT_BRAND := ZYB
PRODUCT_MODEL := ZPD1321
PRODUCT_MANUFACTURER := ZYB

# 版本信息（匹配实际设备）
PRODUCT_VERSION_MAJOR := 12
PRODUCT_VERSION_MINOR := 0
PRODUCT_VERSION_MAINTENANCE := 0

# 禁用不必要的功能
PRODUCT_SUPPORTS_BOOT_SUSPEND := false

# ========== 新增核心修改 ==========
# 1. 修复只读变量问题：初始化+追加赋值（兼容旧版引用）
PRODUCT_PROPERTY_OVERRIDES ?=
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.build.type=eng \
    ro.debuggable=1 \
    ro.secure=0 \
    ro.adb.secure=0

# 2. 符合AOSP规范：使用vendor分区属性（替代旧的PRODUCT_PROPERTY_OVERRIDES）
PRODUCT_VENDOR_PROPERTIES += \
    ro.vendor.twrp.version=3.7.0 \
    ro.vendor.twrp.device=tb8786p1_64_k510_wifi \
    persist.vendor.twrp.backup.enabled=true \
    ro.vendor.twrp.screen_size=1080x2400 \
    persist.vendor.twrp.usb.otg=true

# 3. 声明SEPolicy目录（关联你创建的selinux配置文件）
BOARD_VENDOR_SEPOLICY_DIRS += device/zyb/tb8786p1_64_k510_wifi/sepolicy