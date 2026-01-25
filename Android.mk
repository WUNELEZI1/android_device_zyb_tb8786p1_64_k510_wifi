# tb8786p1_64_k510_wifi Android.mk
LOCAL_PATH := $(call my-dir)

ifneq ($(filter tb8786p1_64_k510_wifi, $(TARGET_DEVICE)),)

# 优先加载配置
include $(call all-subdir-makefiles)

# 核心模块（编译vendor_boot/boot，无独立recovery）
PRODUCT_PACKAGES += \
    vendor_bootimage \
    bootimage

# 设备属性（匹配解包的build.prop）
PRODUCT_PROPERTY_OVERRIDES += \
    ro.product.device=tb8786p1_64_k510_wifi \
    ro.product.name=vnd_tb8786p1_64_k510_wifi \
    ro.product.brand=ZYB \
    ro.product.model=ZPD1321 \
    ro.product.manufacturer=ZYB \
    ro.bootimage.build.id=SP1A.210812.016 \
    ro.bootimage.build.version.sdk=31 \
    ro.bootimage.build.version.release=12

# 复制预编译文件（使用你已有的内核/dtb）
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/Image.gz-dtb:kernel \
    $(LOCAL_PATH)/dtb/mt6768.dtb:dtb.img \
    $(LOCAL_PATH)/recovery.fstab:recovery/root/etc/recovery.fstab

# MTK必需配置
PRODUCT_BUILD_VENDOR_BOOT_IMAGE := true
PRODUCT_BUILD_BOOT_IMAGE := true

endif