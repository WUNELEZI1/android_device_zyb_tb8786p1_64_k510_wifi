LOCAL_PATH := $(call my-dir)

ifneq ($(filter tb8786p1_64_k510_wifi, $(TARGET_DEVICE)),)
include $(call all-subdir-makefiles)
endif