# 包含设备配置
$(call inherit-product, device/zyb/tb8786p1_64_k510_wifi/device.mk)

# TWRP配置
$(call inherit-product, vendor/twrp/config/common.mk)

# 产品信息
PRODUCT_NAME := omni_tb8786p1_64_k510_wifi
PRODUCT_DEVICE := tb8786p1_64_k510_wifi
PRODUCT_BRAND := ZYB
PRODUCT_MODEL := ZPD1321
PRODUCT_MANUFACTURER := ZYB