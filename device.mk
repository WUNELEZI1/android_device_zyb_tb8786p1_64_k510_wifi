# 设备配置
# 注意：PRODUCT_MAKEFILES 应放在 AndroidProducts.mk 中，此处移除避免重复定义

# 继承TWRP通用配置（改用 include 避免变量冲突）
include vendor/twrp/config/common.mk

# 继承MTK平台配置（兼容写法）
-include vendor/mediatek/mt6768/mt6768-vendor.mk

# 设备特性（修复路径：适配 Recovery 根目录）
PRODUCT_COPY_FILES += \
    $(LOCAL_DIR)/recovery.fstab:$(TARGET_RECOVERY_ROOT_OUT)/etc/recovery.fstab \
    $(LOCAL_DIR)/dtb/mt6768.dtb:$(TARGET_OUT_INTERMEDIATES)/dtb.img

# 预编译内核（使用标准路径）
PRODUCT_COPY_FILES += \
    $(LOCAL_DIR)/prebuilt/Image.gz-dtb:$(TARGET_OUT_INTERMEDIATES)/kernel

# ========== 关键修复：移除只读变量直接赋值 ==========
# 原错误配置已删除：PRODUCT_DEVICE/PRODUCT_NAME/PRODUCT_BRAND/PRODUCT_MODEL/PRODUCT_MANUFACTURER
# 这些变量已移至 omni_tb8786p1_64_k510_wifi.mk 中定义，此处仅声明属性
PRODUCT_PROPERTY_OVERRIDES += \
    ro.product.device=tb8786p1_64_k510_wifi \
    ro.product.name=omni_tb8786p1_64_k510_wifi \
    ro.product.brand=ZYB \
    ro.product.model=ZPD1321 \
    ro.product.manufacturer=ZYB

# 修复A/B更新（仅保留必要模块，避免冲突）
PRODUCT_PACKAGES += \
    update_engine \
    update_verifier

# ========== 兼容 Android 12+ 构建系统 ==========
# 禁用动态分区自动配置
BOARD_BUILD_SYSTEM_ROOT_IMAGE := false
BOARD_USES_VIRTUAL_AB := false
AB_OTA_UPDATER := false