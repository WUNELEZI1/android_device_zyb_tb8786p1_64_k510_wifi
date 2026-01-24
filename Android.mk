#
# Copyright (C) 2025 The Android Open Source Project
# Copyright (C) 2025 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := $(call my-dir)

# 仅在编译目标设备时执行
ifeq ($(TARGET_DEVICE),tb8786p1_64_k510_wifi)

# ========== 核心修复：添加 TWRP 特定产品包 ==========
# 这行是关键，它会确保包含 TWRP 的 recovery/vendor_boot 构建规则
$(call inherit-product, $(LOCAL_PATH)/twrp.mk)

# ========== 强制声明 vendor_boot 构建目标 ==========
# 明确告诉构建系统需要生成 vendor_boot.img
PRODUCT_BUILD_VENDOR_BOOT_IMAGE := true

# ========== 关键：设置 recovery 模块为 TW 版本 ==========
# 这确保使用 TeamWin 的 recovery 实现，而不是 AOSP 的默认 recovery
TARGET_RECOVERY_IS_MULTIROM := false
TW_USE_TOOLBOX := true

# ========== 包含其他必要的 makefile 文件 ==========
# 这行保留，用于包含你 device tree 目录下的其他模块（如 kernel、dtb等）
include $(call all-makefiles-under,$(LOCAL_PATH))

endif