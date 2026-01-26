$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, device/zyb/tb8786p1_64_k510_wifi/BoardConfig.mk)
$(call inherit-product, device/zyb/tb8786p1_64_k510_wifi/twrp.mk)
$(call inherit-product, vendor/twrp/config/common.mk)

# 仅构建vendor_boot
PRODUCT_BUILD_BOOT_IMAGE := false
PRODUCT_BUILD_VENDOR_BOOT_IMAGE := true

# 原厂指纹（完全匹配fastboot getvar vendor-fingerprint）
PRODUCT_BUILD_FINGERPRINT := ZYB/vnd_tb8786p1_64_k510_wifi/tb8786p1_64_k510_wifi:12/SP1A.210812.016/737_748_749_743_744_745_746-236:user/release-keys

# 产品属性（匹配adb getprop+fastboot）
PRODUCT_PROPERTY_OVERRIDES += \
    ro.twrp.version=3.7.0-zyb \
    ro.twrp.screen_width=1200 \
    ro.twrp.screen_height=1920 \
    ro.twrp.theme=portrait_hdpi \
    ro.twrp.build.date=$(shell date +%Y%m%d) \
    ro.product.device=tb8786p1_64_k510_wifi \
    ro.product.name=vnd_tb8786p1_64_k510_wifi \
    ro.product.brand=ZYB \
    ro.product.model=ZPD1321 \
    ro.product.manufacturer=ZYB \
    ro.bootimage.build.id=SP1A.210812.016 \
    ro.bootimage.build.version.sdk=33 \
    ro.bootimage.build.version.release=13 \
    ro.build.version.security_patch=2024-05-05 \
    ro.build.fingerprint=$(PRODUCT_BUILD_FINGERPRINT) \
    ro.sf.lcd_density=320 \
    ro.zygote=zygote64_32 \
    ro.dynamic_partitions=true \
    ro.vndk.version=31 \
    ro.first_api_level=34

# 复制核心文件
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/Image.gz-dtb:kernel \
    $(LOCAL_PATH)/dtb/mt6768.dtb:dtb.img \
    $(LOCAL_PATH)/recovery.fstab:recovery/root/etc/recovery.fstab \
    $(LOCAL_PATH)/dynamic_partitions_opts.xml:dynamic_partitions_opts.xml

# 编译依赖
PRODUCT_PACKAGES += \
    vendorbootimage

# 产品标识
PRODUCT_NAME := omni_tb8786p1_64_k510_wifi
PRODUCT_DEVICE := tb8786p1_64_k510_wifi
PRODUCT_BRAND := ZYB
PRODUCT_MODEL := ZPD1321
PRODUCT_MANUFACTURER := ZYB

# 覆盖编译属性（指定只读变量）
PRODUCT_BUILD_PROP_OVERRIDES += \
    TARGET_DEVICE=tb8786p1_64_k510_wifi \
    PRODUCT_NAME=omni_tb8786p1_64_k510_wifi \
    BUILD_FINGERPRINT=$(PRODUCT_BUILD_FINGERPRINT) \
    PLATFORM_VERSION=13 \
    BUILD_ID=SP1A.210812.016 \
    SECURITY_PATCH=2024-05-05 \
    FIRST_API_LEVEL=34 \
    VNDK_VERSION=31 \
    ROOT_MANAGER=1 \
    TW_DEVICE_VERSION=3.7.0-zyb