#
# Copyright (C) 2024 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Inherit device config
$(call inherit-product, device/samsung/a12s/device.mk)

# Inherit LineageOS config
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

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

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="a12sxxx-user 13 TP1A.220624.014 A127FXXSDDXJ5 release-keys"

BUILD_FINGERPRINT := "samsung/a12sxxx/a12s:13/TP1A.220624.014/A127FXXSDDXJ5:user/release-keys"
