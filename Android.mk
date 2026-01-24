#
# Copyright (C) 2025 The Android Open Source Project
# Copyright (C) 2025 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := $(call my-dir)

# 关键修复：改用 PRODUCT_DEVICE 避免 TARGET_DEVICE 触发只读变量冲突
ifeq ($(PRODUCT_DEVICE),tb8786p1_64_k510_wifi)

# 优先加载 TWRP 配置（改用 include 而非 inherit-product）
ifneq ($(wildcard $(LOCAL_PATH)/twrp.mk),)
    include $(LOCAL_PATH)/twrp.mk
endif

# 加载设备配置（改用 include 而非 inherit-product）
ifneq ($(wildcard $(LOCAL_PATH)/device.mk),)
    include $(LOCAL_PATH)/device.mk
endif

# MTK 平板 vendor_boot 构建
PRODUCT_BUILD_VENDOR_BOOT_IMAGE := true

# 平板模块过滤（排除手机组件）
PRODUCT_PACKAGES := \
    recovery \
    recoveryimage

# 包含设备目录下所有模块（安全写法）
include $(call all-subdir-makefiles)

endif