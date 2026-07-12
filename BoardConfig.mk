#
# Copyright (C) 2024 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#
# BoardConfig.mk — Samsung Galaxy A12s (SM-A127F/DS)

DEVICE_PATH := device/samsung/a12s
BOARD_VENDOR := samsung

# Inherit common Exynos 850 config
include device/samsung/exynos850-common/BoardConfigCommon.mk

# Kernel build glue
TARGET_SOC                    := exynos850
KERNEL_DEFCONFIG              := exynos850-a12snsxx_defconfig
TARGET_KERNEL                 := samsung/a12s


# Kernel
TARGET_KERNEL_SOURCE := kernel/samsung/a12s
TARGET_KERNEL_CONFIG := exynos850-a12snsxx_defconfig

# Device-specific kernel cmdline
BOARD_KERNEL_CMDLINE := androidboot.hardware=exynos850 androidboot.selinux=enforce loop.max_part=7

# DTBO
BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)/prebuilts/dtbo.img

# Super partition size
BOARD_SUPER_PARTITION_SIZE := 5343657984
BOARD_SAMSUNG_DYNAMIC_PARTITIONS_SIZE := $(shell expr $(BOARD_SUPER_PARTITION_SIZE) - 4194304)

# Partition filesystem types
BOARD_SYSTEMIMAGE_PARTITION_TYPE   := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_PARTITION_TYPE   := ext4
BOARD_PRODUCTIMAGE_PARTITION_TYPE  := ext4
BOARD_ODMIMAGE_PARTITION_TYPE      := ext4

TARGET_COPY_OUT_VENDOR  := vendor
TARGET_COPY_OUT_PRODUCT := product
TARGET_COPY_OUT_ODM     := odm

# System props
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# AVB
BOARD_AVB_BOOT_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_BOOT_ALGORITHM := SHA256_RSA2048
BOARD_AVB_BOOT_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_BOOT_ROLLBACK_INDEX_LOCATION := 1

# Vendor blobs use PRODUCT_COPY_FILES (pre-Android-14 style)
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true

# Display (720p)
TARGET_SCREEN_DENSITY := 280

# Device-specific sepolicy
BOARD_VENDOR_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/vendor

# Recovery fstab
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/fstab.exynos850

# Security patch
VENDOR_SECURITY_PATCH := 2024-10-01
