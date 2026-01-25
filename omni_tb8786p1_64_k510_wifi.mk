# 修复：替换不存在的device.mk，直接继承BoardConfig.mk
$(call inherit-product, device/zyb/tb8786p1_64_k510_wifi/BoardConfig.mk)

# TWRP核心配置（强制声明，确保编译系统识别）
PRODUCT_PROPERTY_OVERRIDES += \
    ro.twrp.version=3.7.0 \
    ro.twrp.screen_width=1200 \
    ro.twrp.screen_height=1920 \
    ro.twrp.theme=portrait_hdpi

# TWRP基础配置
$(call inherit-product, vendor/twrp/config/common.mk)

# 产品信息（保留你的配置）
PRODUCT_NAME := omni_tb8786p1_64_k510_wifi
PRODUCT_DEVICE := tb8786p1_64_k510_wifi
PRODUCT_BRAND := ZYB
PRODUCT_MODEL := ZPD1321
PRODUCT_MANUFACTURER := ZYB

# 强制绑定编译变量（关键：确保lunch识别设备）
PRODUCT_BUILD_PROP_OVERRIDES += \
    TARGET_DEVICE=tb8786p1_64_k510_wifi \
    PRODUCT_NAME=omni_tb8786p1_64_k510_wifi