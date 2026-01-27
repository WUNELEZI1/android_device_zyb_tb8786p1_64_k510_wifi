LOCAL_PATH := $(call my-dir)

# 如果当前编译的设备是 tb8786p1_64_k510_wifi
ifneq ($(filter tb8786p1_64_k510_wifi, $(TARGET_DEVICE)),)

# 包含所有子目录中的 makefile (例如 sepolicy 目录下的)
include $(call all-subdir-makefiles)

# 复制预编译的内核和DTB文件
# 注意：这些 PRODUCT_COPY_FILES 现在定义在 omni_tb8786p1_64_k510_wifi.mk 中
# 此处不再重复定义，避免冲突

endif