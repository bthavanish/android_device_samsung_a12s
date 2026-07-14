#
# Copyright (C) 2024 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/non_ab_device.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Inherit from a12s device
$(call inherit-product, device/samsung/a12s/device.mk)

# Screen
TARGET_SCREEN_HEIGHT := 1600
TARGET_SCREEN_WIDTH  := 720

# Device identifiers
PRODUCT_DEVICE       := a12s
PRODUCT_NAME         := lineage_a12s
PRODUCT_BRAND        := samsung
PRODUCT_MODEL        := SM-A127F
PRODUCT_MANUFACTURER := samsung

PRODUCT_GMS_CLIENTID_BASE := android-samsung-ss

BUILD_FINGERPRINT := samsung/a12snsxx/a12s:13/TP1A.220624.014/A127FXXSDDXJ5:user/release-keys
