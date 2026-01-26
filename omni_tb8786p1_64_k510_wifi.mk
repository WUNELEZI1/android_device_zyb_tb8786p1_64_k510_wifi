$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, device/zyb/tb8786p1_64_k510_wifi/BoardConfig.mk)
$(call inherit-product, device/zyb/tb8786p1_64_k510_wifi/twrp.mk)
$(call inherit-product, vendor/twrp/config/common.mk)

PRODUCT_BUILD_BOOT_IMAGE := false
PRODUCT_BUILD_VENDOR_BOOT_IMAGE := true

# 修正BUILD_FINGERPRINT（匹配设备fastboot指纹）
PRODUCT_BUILD_FINGERPRINT := ZYB/vnd_tb8786p1_64_k510_wifi/tb8786p1_64_k510_wifi:13/SP1A.210812.016/737_748_749_743_744_745_746-236:eng/test-keys

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
    ro.build.fingerprint=$(PRODUCT_BUILD_FINGERPRINT)

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/Image.gz-dtb:kernel \
    $(LOCAL_PATH)/dtb/mt6768.dtb:dtb.img \
    $(LOCAL_PATH)/recovery.fstab:recovery/root/etc/recovery.fstab

PRODUCT_PACKAGES += \
    vendorbootimage

PRODUCT_NAME := omni_tb8786p1_64_k510_wifi
PRODUCT_DEVICE := tb8786p1_64_k510_wifi
PRODUCT_BRAND := ZYB
PRODUCT_MODEL := ZPD1321
PRODUCT_MANUFACTURER := ZYB

# 关键：通过PRODUCT_BUILD_PROP_OVERRIDES指定只读变量
PRODUCT_BUILD_PROP_OVERRIDES += \
    TARGET_DEVICE=tb8786p1_64_k510_wifi \
    PRODUCT_NAME=omni_tb8786p1_64_k510_wifi \
    BUILD_FINGERPRINT=$(PRODUCT_BUILD_FINGERPRINT) \
    PLATFORM_VERSION=13 \
    BUILD_ID=SP1A.210812.016 \
    SECURITY_PATCH=2024-05-05