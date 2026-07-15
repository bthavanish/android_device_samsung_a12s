#
# Copyright (C) 2024 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#
# BoardConfig.mk — Samsung Galaxy A12s (SM-A127F/DS)

DEVICE_PATH := device/samsung/a12s
BOARD_VENDOR := samsung

# Inherit common Exynos 850 config
include device/samsung/exynos850-common/BoardConfigCommon.mk

# OTA assert
TARGET_OTA_ASSERT_DEVICE := a12s

# A12s is an A/BOTA-LESS (A-only) dynamic-partition device.
# board_config.mk defaults AB_OTA_UPDATER to true, which builds the super
# partition as A/B (system_a/system_b). Stock firmware and the fstab are
# A-only, so force A-only super (partitions named system/vendor/...).
AB_OTA_UPDATER := false

# Kernel
TARGET_KERNEL_CONFIG := exynos850-a12snsxx_defconfig
TARGET_KERNEL_SOURCE := kernel/samsung/a12s

# Kernel - use prebuilt kernel for reliable boot
TARGET_FORCE_PREBUILT_KERNEL := true
ifeq ($(TARGET_FORCE_PREBUILT_KERNEL),true)
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilts/kernel
TARGET_PREBUILT_DTB := $(DEVICE_PATH)/prebuilts/dtb.img
BOARD_MKBOOTIMG_ARGS += --dtb $(TARGET_PREBUILT_DTB)
BOARD_INCLUDE_DTB_IN_BOOTIMG :=
BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)/prebuilts/dtbo.img
BOARD_KERNEL_SEPARATED_DTBO :=
endif

# Kernel cmdline
BOARD_KERNEL_CMDLINE := androidboot.hardware=exynos850 androidboot.selinux=enforce loop.max_part=7

# Partition sizes (matching stock firmware)
BOARD_BOOTIMAGE_PARTITION_SIZE := 46137344
BOARD_DTBOIMG_PARTITION_SIZE := 8388608
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67108864
BOARD_CACHEIMAGE_PARTITION_SIZE := 209715200

# Super partition
BOARD_SUPER_PARTITION_SIZE := 5557452800
BOARD_SAMSUNG_DYNAMIC_PARTITIONS_SIZE := 2642411520
BOARD_SAMSUNG_DYNAMIC_PARTITIONS_PARTITION_LIST := \
    system \
    system_ext \
    vendor \
    product \
    odm

# Display (720p)
TARGET_SCREEN_DENSITY := 280

# System props
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop
TARGET_PRODUCT_PROP += $(DEVICE_PATH)/product.prop

# Recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/fstab.exynos850
BOARD_INCLUDE_RECOVERY_DTBO := true

# Security patch
VENDOR_SECURITY_PATCH := 2024-10-01

# VINTF
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/manifest.xml
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE += $(DEVICE_PATH)/compatibility_matrix.xml

# Inherit the proprietary files (use -include so build doesn't fail if missing)
-include vendor/samsung/a12s/BoardConfigVendor.mk
