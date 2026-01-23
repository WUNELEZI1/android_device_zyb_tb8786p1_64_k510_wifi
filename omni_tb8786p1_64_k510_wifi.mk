# 继承TWRP产品配置
$(call inherit-product, vendor/twrp/config/common.mk)

# 继承设备配置
$(call inherit-product, device/zyb/tb8786p1_64_k510_wifi/device.mk)

# 设备信息
PRODUCT_DEVICE := tb8786p1_64_k510_wifi
PRODUCT_NAME := omni_tb8786p1_64_k510_wifi
PRODUCT_BRAND := ZYB
PRODUCT_MODEL := ZPD1321
PRODUCT_MANUFACTURER := ZYB

# 编译类型
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=tb8786p1_64_k510_wifi \
    TARGET_DEVICE=tb8786p1_64_k510_wifi

# 版本信息
PRODUCT_PROPERTY_OVERRIDES += \
    ro.twrp.device=tb8786p1_64_k510_wifi \
    ro.twrp.board=mt6768 \
    ro.twrp.platform=mt6768 \
    ro.twrp.version=$(shell date +%Y%m%d)