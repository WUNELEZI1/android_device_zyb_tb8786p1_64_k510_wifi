# ==============================================
# ZYBPAD ZPD1321 设备定义
# ==============================================
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, device/zyb/tb8786p1_64_k510_wifi/BoardConfig.mk)

# 设备标识（和你的fastboot日志一致）
PRODUCT_NAME := omni_tb8786p1_64_k510_wifi
PRODUCT_DEVICE := tb8786p1_64_k510_wifi
PRODUCT_BRAND := ZYB
PRODUCT_MODEL := ZPD1321
PRODUCT_MANUFACTURER := ZYB

# Recovery特性
PRODUCT_COPY_FILES += \
    device/zyb/tb8786p1_64_k510_wifi/recovery.fstab:root/etc/recovery.fstab