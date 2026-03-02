#
# Copyright (C) 2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_n_mr1.mk)

# Inherit some common LineageOS stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Inherit from mido device
$(call inherit-product, device/xiaomi/mido/device.mk)

# Kernel
TARGET_KERNEL_VERSION := 4.19

# neverallows
SELINUX_IGNORE_NEVERALLOWS := true

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := mido
PRODUCT_NAME := lineage_mido
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := Redmi Note 4
PRODUCT_MANUFACTURER := Xiaomi

# Build Name
BUILD_USERNAME := RenzAlt
BUILD_HOSTNAME := nigo-at25

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="mido-user 7.0 NRD90M V11.0.2.0.NCFMIXM release-keys" \
    BuildFingerprint=xiaomi/mido/mido:7.0/NRD90M/V11.0.2.0.NCFMIXM:user/release-keys
