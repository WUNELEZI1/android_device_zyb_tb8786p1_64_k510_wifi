# 首先继承 TWRP 通用配置
$(call inherit-product, vendor/twrp/config/common.mk)

# 然后继承设备特定配置
$(call inherit-product, device/zyb/tb8786p1_64_k510_wifi/device.mk)

# 设备信息
PRODUCT_DEVICE := tb8786p1_64_k510_wifi
PRODUCT_NAME := omni_tb8786p1_64_k510_wifi
PRODUCT_BRAND := ZYB
PRODUCT_MODEL := ZPD1321
PRODUCT_MANUFACTURER := ZYB

# 编译属性
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=tb8786p1_64_k510_wifi \
    TARGET_DEVICE=tb8786p1_64_k510_wifi

# TWRP 设备标识
PRODUCT_PROPERTY_OVERRIDES += \
    ro.twrp.device=tb8786p1_64_k510_wifi