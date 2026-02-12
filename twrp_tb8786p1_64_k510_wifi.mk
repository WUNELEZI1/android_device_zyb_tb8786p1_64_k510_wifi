TW_THEME := portrait_mdpi
TW_SCREEN_WIDTH := 1200
TW_SCREEN_HEIGHT := 1920
TW_BUILD_VENDOR_BOOT := true
TW_NO_BUILD_RECOVERY_IMAGE := false
TW_SUPPORT_VENDOR_BOOT := true
TW_SUPPORT_BOOT_HEADER_V4 := true  # 添加这个

$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, device/zyb/tb8786p1_64_k510_wifi/BoardConfig.mk)
$(call inherit-product, device/zyb/tb8786p1_64_k510_wifi/twrp.mk)
$(call inherit-product, vendor/twrp/config/common.mk)

PRODUCT_NAME := twrp_tb8786p1_64_k510_wifi
PRODUCT_DEVICE := tb8786p1_64_k510_wifi
PRODUCT_BRAND := ZYB
PRODUCT_MODEL := ZPD1321
PRODUCT_MANUFACTURER := ZYB

# ========== 版本配置 (适配 TWRP-14/Android 14) ==========
PRODUCT_PLATFORM_VERSION := 14
PRODUCT_PLATFORM_SDK_VERSION := 34
PRODUCT_PLATFORM_VERSION_LAST_STABLE := 14
PRODUCT_SHIPPING_API_LEVEL := 34
PRODUCT_SECURITY_PATCH := 2024-09-05
PRODUCT_VENDOR_SECURITY_PATCH := 2024-09-05

# 构建指纹 - Android 14 格式
PRODUCT_BUILD_FINGERPRINT := ZYB/vnd_tb8786p1_64_k510_wifi/tb8786p1_64_k510_wifi:14/UP1A.240905.001/20240905:user/release-keys

PRODUCT_PROPERTY_OVERRIDES += \
    ro.twrp.version=3.7.0-zyb \
    ro.twrp.build.date=$(shell date +%Y%m%d) \
    ro.product.device=tb8786p1_64_k510_wifi \
    ro.product.name=vnd_tb8786p1_64_k510_wifi \
    ro.product.brand=ZYB \
    ro.product.model=ZPD1321 \
    ro.product.manufacturer=ZYB \
    ro.bootimage.build.id=UP1A.240905.001 \
    ro.bootimage.build.version.sdk=34 \
    ro.bootimage.build.version.release=14 \
    ro.build.version.security_patch=2024-09-05 \
    ro.build.fingerprint=$(PRODUCT_BUILD_FINGERPRINT) \
    ro.sf.lcd_density=320 \
    ro.zygote=zygote64_32 \
    ro.dynamic_partitions=true \
    ro.vndk.version=34 \
    ro.first_api_level=34

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/Image.gz-dtb:kernel \
    $(LOCAL_PATH)/dtb/mt6768.dtb:dtb.img \
    $(LOCAL_PATH)/recovery.fstab:recovery/root/etc/recovery.fstab \
    $(LOCAL_PATH)/dynamic_partitions_opts.xml:dynamic_partitions_opts.xml

PRODUCT_BUILD_PROP_OVERRIDES += \
    TARGET_DEVICE=tb8786p1_64_k510_wifi \
    PRODUCT_NAME=twrp_tb8786p1_64_k510_wifi \
    PLATFORM_VERSION=14 \
    BUILD_ID=UP1A.240905.001 \
    SECURITY_PATCH=2024-09-05 \
    FIRST_API_LEVEL=34 \
    VNDK_VERSION=34 \
    ROOT_MANAGER=1 \
    TW_DEVICE_VERSION=3.7.0-zyb