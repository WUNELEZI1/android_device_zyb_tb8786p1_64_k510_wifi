# 设备配置
PRODUCT_MAKEFILES := \
    $(LOCAL_DIR)/omni_tb8786p1_64_k510_wifi.mk

# 继承TWRP通用配置
$(call inherit-product, vendor/twrp/config/common.mk)

# 继承MTK平台配置
$(call inherit-product-if-exists, vendor/mediatek/mt6768/mt6768-vendor.mk)

# 设备特性
PRODUCT_COPY_FILES += \
    $(LOCAL_DIR)/recovery.fstab:recovery/root/system/etc/recovery.fstab \
    $(LOCAL_DIR)/dtb/mt6768.dtb:dtb.img

# 预编译内核
PRODUCT_COPY_FILES += \
    $(LOCAL_DIR)/prebuilt/Image.gz-dtb:kernel

# 设备属性
PRODUCT_DEVICE := tb8786p1_64_k510_wifi
PRODUCT_NAME := omni_tb8786p1_64_k510_wifi
PRODUCT_BRAND := ZYB
PRODUCT_MODEL := ZPD1321
PRODUCT_MANUFACTURER := ZYB

# 修复A/B更新
PRODUCT_PACKAGES += \
    update_engine \
    update_verifier