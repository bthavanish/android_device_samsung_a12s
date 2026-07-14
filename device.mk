#
# Copyright (C) 2024 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# API levels
PRODUCT_SHIPPING_API_LEVEL := 34

# Kernel is 4.19 — override FCM kernel version check for SDK 36
PRODUCT_OTA_ENFORCE_VINTF_KERNEL_REQUIREMENTS := false

# Inherit common Exynos 850
$(call inherit-product, device/samsung/exynos850-common/exynos850-common.mk)

# fastbootd
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.1-impl-mock \
    fastbootd

# Overlays
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay
PRODUCT_ENFORCE_RRO_TARGETS := *
PRODUCT_USE_DYNAMIC_PARTITION_SIZE := true

# Rootdir / init
PRODUCT_PACKAGES += \
    fstab.exynos850 \
    fstab.exynos850.vendor \
    init.exynos850.rc \
    init.exynos850.usb.rc \
    ueventd.exynos850.rc

# Copy fstab to ramdisk for first_stage_mount
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/fstab.exynos850:$(TARGET_COPY_OUT_RAMDISK)/fstab.exynos850

# Fingerprint (side-mounted, A12s uses side-key fingerprint)
PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint-service.samsung

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.fingerprint.xml

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += $(LOCAL_PATH)

# Inherit the proprietary files
$(call inherit-product, vendor/samsung/a12s/a12s-vendor.mk)
