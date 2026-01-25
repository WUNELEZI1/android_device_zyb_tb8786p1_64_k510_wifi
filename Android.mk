LOCAL_PATH := $(call my-dir)

ifneq ($(filter tb8786p1_64_k510_wifi, $(TARGET_DEVICE)),)

# 优先加载配置
include $(call all-subdir-makefiles)

# 复制预编译文件（使用已有的内核/dtb）
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/Image.gz-dtb:kernel \
    $(LOCAL_PATH)/dtb/mt6768.dtb:dtb.img \
    $(LOCAL_PATH)/recovery.fstab:recovery/root/etc/recovery.fstab

# MTK必需配置
PRODUCT_BUILD_VENDOR_BOOT_IMAGE := true
PRODUCT_BUILD_BOOT_IMAGE := true

endif