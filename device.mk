# ==============================================
# ZYBPAD ZPD1321 通用配置
# ==============================================
# 启用MTK硬件支持
TARGET_USES_MTK_HARDWARE := true

# 复制DTB文件到recovery
PRODUCT_COPY_FILES += \
    $(TARGET_KERNEL_DTB):kernel/dtb/mt6768.dtb

# 禁用不必要的验证
BOARD_SEPOLICY_DIRS += device/zyb/tb8786p1_64_k510_wifi/sepolicy