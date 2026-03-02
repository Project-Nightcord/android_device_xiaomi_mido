#
# Copyright (C) 2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Platform
TARGET_BOARD_PLATFORM := msm8953

# Inherit from mithorium-common
$(call inherit-product, device/xiaomi/mithorium-common/mithorium.mk)
$(call inherit-product, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)

# Overlay
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay

PRODUCT_PACKAGES += \
    HapticOverlay

# Boot animation
TARGET_SCREEN_HEIGHT := 2160
TARGET_SCREEN_WIDTH := 1080

# Fingerprint
PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint@2.3-service.xiaomi_mido \
    liblzma.vendor:64

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.fingerprint.xml

# Screen density
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Audio configuration
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_platform_info_intcodec.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info_intcodec.xml \
    $(LOCAL_PATH)/audio/mixer_paths_mtp.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_mtp.xml

# Camera
PRODUCT_PACKAGES += \
    camera.msm8953

# Input
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/keylayout/,$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/)

# Power
$(call soong_config_set,qtipower,tap_to_wake_node,/sys/devices/platform/soc/78b7000.i2c/i2c-3/3-0020/input/input4/wake_gesture)

# Recovery
PRODUCT_COPY_FILES += \
    vendor/xiaomi/mido/proprietary/vendor/bin/hvdcp_opti:$(TARGET_COPY_OUT_RECOVERY)/root/system/bin/hvdcp_opti

# Rootdir
PRODUCT_PACKAGES += \
    init.xiaomi.device.rc \
    init.goodix.sh

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH) \
    hardware/xiaomi

# Inherit from vendor blobs
$(call inherit-product, vendor/xiaomi/mido/mido-vendor.mk)
