#
# Copyright (C) 2025 The Android Open Source Project
# Copyright (C) 2025 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),tb8786p1_64_k510_wifi)

# 优先加载 TWRP 配置
ifneq ($(wildcard $(LOCAL_PATH)/twrp.mk),)
    $(call inherit-product, $(LOCAL_PATH)/twrp.mk)
endif

# 加载设备配置
ifneq ($(wildcard $(LOCAL_PATH)/device.mk),)
    $(call inherit-product, $(LOCAL_PATH)/device.mk)
endif

# MTK 平板 vendor_boot 构建
PRODUCT_BUILD_VENDOR_BOOT_IMAGE := true

# 平板模块过滤（排除手机组件）
PRODUCT_PACKAGES := \
    recovery \
    recoveryimage

# 包含设备目录下所有模块
include $(call all-makefiles-under,$(LOCAL_PATH))

endif