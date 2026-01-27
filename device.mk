# 设备特定的 makefile
PRODUCT_MAKEFILES := \
    $(LOCAL_DIR)/omni_tb8786p1_64_k510_wifi.mk

# 预编译文件复制（备选位置，主文件已定义）
# PRODUCT_COPY_FILES += \
#    $(LOCAL_PATH)/prebuilt/Image.gz-dtb:kernel \
#    $(LOCAL_PATH)/dtb/mt6768.dtb:dtb.img

# MTK 平台特性
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery.fstab:recovery/root/etc/recovery.fstab