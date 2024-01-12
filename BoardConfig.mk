#
# Copyright (C) 2022 The Android Open Source Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/motorola/bangkk

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := holi
TARGET_NO_BOOTLOADER := true
TARGET_USES_UEFI := true

# Platform
BOARD_USES_QCOM_HARDWARE := true
QCOM_BOARD_PLATFORMS += holi
TARGET_BOARD_PLATFORM := holi
TARGET_BOARD_PLATFORM_GPU := qcom-adreno619
TARGET_USES_64_BIT_BINDER := true
TARGET_SUPPORTS_64_BIT_APPS := true
BUILD_BROKEN_DUP_RULES := true
TARGET_USES_QCOM_BSP := true

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := kryo660

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a75

# Enable CPUSets
ENABLE_CPUSETS := true
ENABLE_SCHEDBOOST := true

# GPT Utils
BOARD_PROVIDES_GPTUTILS := true

# Kernel
BOARD_KERNEL_CMDLINE := console=ttyMSM0,115200n8 \
                        earlycon=msm_geni_serial,0x04C8C000 \
                        androidboot.hardware=qcom \
                        androidboot.console=ttyMSM0 \
                        androidboot.memcg=1 \
                        lpm_levels.sleep_disabled=1 \
                        video=vfb:640x400,bpp=32,memsize=3072000 \
                        msm_rtb.filter=0x237 \
                        service_locator.enable=1 \
                        androidboot.hab.csv=0 \
                        androidboot.hab.product=bangkk \
                        androidboot.hab.cid=50 \
                        firmware_class.path=/vendor/firmware_mnt/image \
# For the love of all that is holy, please do not include this in your ROM unless you really want TWRP to not work correctly!
BOARD_KERNEL_CMDLINE += androidboot.fastboot=1
BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive

BOARD_BOOTIMG_HEADER_VERSION := 3
BOARD_KERNEL_PAGESIZE := 4096
BOARD_KERNEL_BASE          := 0x00000000
BOARD_KERNEL_OFFSET        := 0x00008000
BOARD_RAMDISK_OFFSET       := 0x01000000
BOARD_KERNEL_SECOND_OFFSET := 0x00000000
BOARD_KERNEL_TAGS_OFFSET   := 0x00000100
BOARD_DTB_OFFSET           := 0x01f00000

TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_HEADER_ARCH := arm64

#BOARD_KERNEL_SEPARATED_DTBO := true
#BOARD_INCLUDE_RECOVERY_DTBO := true
#TARGET_KERNEL_SOURCE := kernel/motorola/bangkk
#TARGET_KERNEL_CONFIG := vendor/bangkk_defconfig

BOARD_KERNEL_IMAGE_NAME := kernel
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/$(BOARD_KERNEL_IMAGE_NAME)
TARGET_PREBUILT_DTB := $(DEVICE_PATH)/prebuilt/dtb
BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)/prebuilt/dtbo.img

BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOTIMG_HEADER_VERSION)
BOARD_MKBOOTIMG_ARGS += --pagesize $(BOARD_KERNEL_PAGESIZE)
BOARD_MKBOOTIMG_ARGS += --base $(BOARD_KERNEL_BASE)
BOARD_MKBOOTIMG_ARGS += --kernel_offset $(BOARD_KERNEL_OFFSET)
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --second_offset $(BOARD_KERNEL_SECOND_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_MKBOOTIMG_ARGS += --dtb_offset $(BOARD_DTB_OFFSET)
BOARD_MKBOOTIMG_ARGS += --dtb $(TARGET_PREBUILT_DTB)

# File systems
BOARD_BOOTIMAGE_PARTITION_SIZE := 100663296
BOARD_DTBOIMG_PARTITION_SIZE := 25165824
BOARD_FLASH_BLOCK_SIZE := 262144 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_SYSTEMIMAGE_PARTITION_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs

# A/B device flags
TARGET_NO_RECOVERY := true
BOARD_USES_RECOVERY_AS_BOOT := true
BOARD_BUILD_SYSTEM_ROOT_IMAGE := false

# Recovery
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_HAS_NO_SELECT_BUTTON := true
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Use mke2fs to create ext4 images
TARGET_USES_MKE2FS := true

# Additional binaries & libraries needed for recovery
TARGET_RECOVERY_DEVICE_MODULES += \
    libdisplayconfig.qti \
    libion \
    libxml2 \
    vendor.display.config@1.0 \
    vendor.display.config@2.0
RECOVERY_LIBRARY_SOURCE_FILES += \
    $(TARGET_OUT_SHARED_LIBRARIES)/libion.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libxml2.so \
    $(TARGET_OUT_SYSTEM_EXT_SHARED_LIBRARIES)/libdisplayconfig.qti.so \
    $(TARGET_OUT_SYSTEM_EXT_SHARED_LIBRARIES)/vendor.display.config@1.0.so \
    $(TARGET_OUT_SYSTEM_EXT_SHARED_LIBRARIES)/vendor.display.config@2.0.so

# Avb
BOARD_AVB_ENABLE := true
BOARD_AVB_VBMETA_SYSTEM := system
BOARD_AVB_VBMETA_SYSTEM_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_VBMETA_SYSTEM_ALGORITHM := SHA256_RSA2048
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX_LOCATION := 1

# Encryption
PLATFORM_SECURITY_PATCH := 2099-12-31
VENDOR_SECURITY_PATCH := 2099-12-31
PLATFORM_VERSION := 99.87.36
PLATFORM_VERSION_LAST_STABLE := $(PLATFORM_VERSION)
BOARD_USES_METADATA_PARTITION := true
BOARD_SUPPRESS_SECURE_ERASE := true
TW_USE_FSCRYPT_POLICY := 1

# Fix for copying *.ko
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true

# TWRP Configuration
TW_THEME := portrait_hdpi
TW_EXTRA_LANGUAGES := true
TW_SCREEN_BLANK_ON_BOOT := true
TW_INPUT_BLACKLIST := "hbtp_vm"
RECOVERY_SDCARD_ON_DATA := true
TW_CUSTOM_CPU_TEMP_PATH := "/sys/devices/virtual/thermal/thermal_zone50/temp"
TARGET_RECOVERY_QCOM_RTC_FIX := true
TW_BRIGHTNESS_PATH := "/sys/class/backlight/panel0-backlight/brightness"
TARGET_USE_CUSTOM_LUN_FILE_PATH := /config/usb_gadget/g1/functions/mass_storage.0/lun.%d/file
TW_INCLUDE_REPACKTOOLS := true
TW_INCLUDE_FB2PNG := true
TW_MAX_BRIGHTNESS := 2047
TW_DEFAULT_BRIGHTNESS := 1000
TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_INCLUDE_NTFS_3G := true
TW_INCLUDE_RESETPROP := true
#TW_NO_SCREEN_BLANK := true
TW_HAS_EDL_MODE := true
TW_Y_OFFSET := 115
TW_H_OFFSET := -115

# Statusbar icons flags
TW_STATUS_ICONS_ALIGN := center
TW_CUSTOM_CLOCK_POS := 50
TW_CUSTOM_CPU_POS := 280
TW_CUSTOM_BATTERY_POS := 790

# Debug flags
TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD := true
RECOVERY_BINARY_SOURCE_FILES += $(TARGET_OUT_EXECUTABLES)/debuggerd
TARGET_RECOVERY_DEVICE_MODULES += libion
RECOVERY_BINARY_SOURCE_FILES += $(TARGET_OUT_EXECUTABLES)/strace

# Workaround for error copying vendor files to recovery ramdisk
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_VENDOR := vendor
TARGET_COPY_OUT_PRODUCT := product
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := ext4

# Kernel module loading
TW_LOAD_VENDOR_MODULES := $(shell echo \"$(shell ls $(DEVICE_PATH)/recovery/root/vendor/lib/modules/1.1)\")
TW_LOAD_VENDOR_BOOT_MODULES := true

# Include decryption support
TW_INCLUDE_CRYPTO := true

# For building with minimal manifest
ALLOW_MISSING_DEPENDENCIES := true

#
# For local builds only
#
# TWRP zip installer
ifneq ($(wildcard bootable/recovery/installer/.),)
    USE_RECOVERY_INSTALLER := true
    RECOVERY_INSTALLER_PATH := bootable/recovery/installer
endif

# Custom TWRP Versioning
ifneq ($(wildcard device/common/version-info/.),)
    CUSTOM_TWRP_VERSION_PREFIX := UNOFFICIAL

    include device/common/version-info/custom_twrp_version.mk

    ifeq ($(CUSTOM_TWRP_VERSION),)
        CUSTOM_TWRP_VERSION := $(shell date +%Y%m%d)-01
    endif
endif
#
# end local build flags
#
