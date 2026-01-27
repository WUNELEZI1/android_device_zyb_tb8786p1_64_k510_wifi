LOCAL_PATH := $(call my-dir)

ifneq ($(filter tb8786p1_64_k510_wifi, $(TARGET_DEVICE)),)

# 包含所有子目录中的 makefile
include $(call all-subdir-makefiles)

# 注意：PRODUCT_COPY_FILES 现在定义在 omni_tb8786p1_64_k510_wifi.mk 中
# 此处不再重复定义

endif