# ======== 强制启用 vendor_boot 相关构建模式 ========
# 在继承任何 TWRP 配置前定义，确保最高优先级
# 我们的目标不是构建完整img，而是让TWRP生成正确的recovery ramdisk
TW_BUILD_VENDOR_BOOT := true
# 禁用标准的recovery.img生成，避免冲突
TW_NO_BUILD_RECOVERY_IMAGE := true

$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, device/zyb/tb8786p1_64_k510_wifi/BoardConfig.mk)
$(call inherit-product, device/zyb/tb8786p1_64_k510_wifi/twrp.mk)
$(call inherit-product, vendor/twrp/config/common.mk)

# ======== 产品基础信息 ========
PRODUCT_NAME := omni_tb8786p1_64_k510_wifi
PRODUCT_DEVICE := tb8786p1_64_k510_wifi
PRODUCT_BRAND := ZYB
PRODUCT_MODEL := ZPD1321
PRODUCT_MANUFACTURER := ZYB

# ======== 设备指纹 (与fastboot getvar结果完全匹配) ========
PRODUCT_BUILD_FINGERPRINT := ZYB/vnd_tb8786p1_64_k510_wifi/tb8786p1_64_k510_wifi:12/SP1A.210812.016/737_748_749_743_744_745_746-236:user/release-keys

# ======== 关键系统属性 (与adb getprop结果匹配) ========
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

# ======== 复制关键预编译文件和配置 ========
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/Image.gz-dtb:$(TARGET_COPY_OUT_RAMDISK)/kernel \
    $(LOCAL_PATH)/dtb/mt6768.dtb:$(TARGET_COPY_OUT_RAMDISK)/dtb.img \
    $(LOCAL_PATH)/recovery.fstab:recovery/root/etc/recovery.fstab \
    $(LOCAL_PATH)/dynamic_partitions_opts.xml:dynamic_partitions_opts.xml

# ======== 构建属性覆盖 ========
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