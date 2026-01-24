$(call inherit-product, vendor/twrp/config/common.mk)
$(call inherit-product, device/zyb/tb8786p1_64_k510_wifi/device.mk)

# 设备信息（严格匹配你的平板）
PRODUCT_DEVICE := tb8786p1_64_k510_wifi
PRODUCT_NAME := omni_tb8786p1_64_k510_wifi
PRODUCT_BRAND := ZYB
PRODUCT_MODEL := ZPD1321
PRODUCT_MANUFACTURER := ZYB

# 编译属性（设备专属）
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=tb8786p1_64_k510_wifi \
    TARGET_DEVICE=tb8786p1_64_k510_wifi \
    PRODUCT_MANUFACTURER=ZYB \
    PRODUCT_MODEL=ZPD1321 \
    BUILD_FINGERPRINT=ZYB/ZPD1321/tb8786p1_64_k510_wifi:12/SP2A.220405.004/eng.root.20260124.023613:user/release-keys

# TWRP 设备标识
PRODUCT_PROPERTY_OVERRIDES += \
    ro.twrp.device=tb8786p1_64_k510_wifi \
    ro.build.product=tb8786p1_64_k510_wifi \
    ro.mediatek.platform=mt6768 \
    ro.boot.hardware=mt6768

# 强制 Recovery 打包
PRODUCT_PACKAGES += \
    recovery \
    recoveryimage