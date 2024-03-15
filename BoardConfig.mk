#
# Copyright (C) 2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/xiaomi/spes

# For building with minimal manifest 
 ALLOW_MISSING_DEPENDENCIES := true

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a73

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a73

# A/B
AB_OTA_UPDATER := true
AB_OTA_PARTITIONS += \
    boot \
    dtbo \
    odm \
    product \
    system \
    system_ext \
    vbmeta \
    vbmeta_system \
    vendor \
    vendor_boot
BOARD_USES_RECOVERY_AS_BOOT := true 

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := bengal
TARGET_NO_BOOTLOADER := true

# Build Hack
BUILD_BROKEN_DUP_RULES := true
BUILD_BROKEN_MISSING_REQUIRED_MODULES := true

# Kernel
BOARD_BOOT_HEADER_VERSION := 3
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_CMDLINE += androidboot.console=ttyMSM0
BOARD_KERNEL_CMDLINE += androidboot.usbcontroller=4e00000.dwc3
BOARD_KERNEL_CMDLINE += androidboot.fstab_suffix=default
BOARD_KERNEL_CMDLINE += androidboot.hardware=qcom
BOARD_KERNEL_CMDLINE += androidboot.memcg=1
BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive
BOARD_KERNEL_CMDLINE += console=ttyMSM0,115200n8
BOARD_KERNEL_CMDLINE += earlycon=msm_geni_serial,0x4a90000
BOARD_KERNEL_CMDLINE += loop.max_part=7
BOARD_KERNEL_CMDLINE += lpm_levels.sleep_disabled=1
BOARD_KERNEL_CMDLINE += msm_rtb.filter=0x237
BOARD_KERNEL_CMDLINE += service_locator.enable=1
BOARD_KERNEL_CMDLINE += swiotlb=2048
BOARD_DTB_OFFSET := 0x01f00000
BOARD_KERNEL_OFFSET := 0x00008000
BOARD_KERNEL_TAGS_OFFSET := 0x00000100
BOARD_KERNEL_PAGESIZE := 4096
BOARD_RAMDISK_OFFSET := 0x01000000
BOARD_TAGS_OFFSET := 0x00000100

TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/Image.gz-dtb

BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOTIMG_HEADER_VERSION)
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_HEADER_ARCH := arm64
TARGET_KERNEL_SOURCE := kernel/xiaomi/spes
TARGET_KERNEL_CONFIG := spes_defconfig

# Partitions
BOARD_FLASH_BLOCK_SIZE := 262144
BOARD_BOOTIMAGE_PARTITION_SIZE := 134217728
BOARD_DTBOIMG_PARTITION_SIZE := 25165824
BOARD_USERDATAIMAGE_PARTITION_SIZE := 112419745792
BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE := 100663296

BOARD_SUPER_PARTITION_SIZE := 9126805504
BOARD_SUPER_PARTITION_GROUPS := qti_dynamic_partitions
BOARD_QTI_DYNAMIC_PARTITIONS_PARTITION_LIST := system system_ext odm product vendor
BOARD_QTI_DYNAMIC_PARTITIONS_SIZE := 9122611200

BOARD_USES_SYSTEM_EXTIMAGE := true
BOARD_USES_PRODUCTIMAGE := true

BOARD_ODMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEM_EXTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := ext4

BUILD_WITHOUT_VENDOR := true

TARGET_COPY_OUT_ODM := odm
TARGET_COPY_OUT_SYSTEM_EXT := system_ext
TARGET_COPY_OUT_VENDOR := vendor
TARGET_COPY_OUT_PRODUCT := product

# Userdata 
 BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs 
 TARGET_USERIMAGES_USE_EXT4 := true 
 TARGET_USERIMAGES_USE_F2FS := true 
 TARGET_USES_MKE2FS := true

# System as Root 
 BOARD_SUPPRESS_SECURE_ERASE := true
 BOARD_BUILD_SYSTEM_ROOT_IMAGE := false

# Metadata
 BOARD_USES_METADATA_PARTITION := true 
 BOARD_ROOT_EXTRA_FOLDERS += metadata 
  
# Use LZ4 Ramdisk compression instead of GZIP 
 BOARD_RAMDISK_USE_LZ4 := true

# Platform
BOARD_USES_QCOM_HARDWARE := true
TARGET_BOARD_PLATFORM := bengal

# Properties
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop

# Recovery
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
TARGET_RECOVERY_QCOM_RTC_FIX := true
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery/root/system/etc/recovery.fstab

# Display
TARGET_SCREEN_DENSITY := 440
TW_BRIGHTNESS_PATH := "/sys/class/leds/lcd-backlight/brightness"
TW_MAX_BRIGHTNESS := 2047
TW_DEFAULT_BRIGHTNESS := 500

# Vibrator
TW_SUPPORT_INPUT_AIDL_HAPTICS := true

# Configure Status bar icons for regular TWRP builds only 
 ifneq ($(OF_HIDE_NOTCH),1) 
     TW_DEVICE_VERSION := Norikhsan90 
     TW_STATUS_ICONS_ALIGN := center 
     TW_CUSTOM_CPU_POS := "300" 
     TW_CUSTOM_CLOCK_POS := "70" 
     TW_CUSTOM_BATTERY_POS := "790" 
 endif

# UEFI 
 TARGET_USES_UEFI := true 
  
# VNDK Treble 
 BOARD_VNDK_VERSION := current

# Verified Boot
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3
BOARD_AVB_VBMETA_SYSTEM := product system system_ext
BOARD_AVB_VBMETA_SYSTEM_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_VBMETA_SYSTEM_ALGORITHM := SHA256_RSA2048
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX_LOCATION := 1

# Crypto 
 TW_INCLUDE_CRYPTO := true 
 TW_INCLUDE_CRYPTO_FBE := true 
 TW_INCLUDE_FBE_METADATA_DECRYPT := true 
 TW_FIX_DECRYPTION_ON_DATA_MEDIA := true 
 BOARD_USES_QCOM_FBE_DECRYPTION := true
  
 # Security patch level
 PLATFORM_SECURITY_PATCH := 2099-12-31
 VENDOR_SECURITY_PATCH := 2099-12-31
 PLATFORM_VERSION := 99.87.36
 PLATFORM_VERSION_LAST_STABLE := $(PLATFORM_VERSION)
 VENDOR_SECURITY_PATCH := $(PLATFORM_SECURITY_PATCH) 
 BOOT_SECURITY_PATCH := $(PLATFORM_SECURITY_PATCH) 
  
# Tool 
 TW_INCLUDE_REPACKTOOLS := true 
 TW_INCLUDE_RESETPROP := true 
 TW_INCLUDE_LIBRESETPROP := true 
 TW_INCLUDE_LPDUMP := true 

 # include python, for ABX conversion 
 TW_INCLUDE_PYTHON := true

# TWRP Configuration 
 TW_FRAMERATE := 60 
 TW_THEME := portrait_hdpi 
 TW_INCLUDE_NTFS_3G    := true 
 TW_INCLUDE_FUSE_EXFAT := true 
 TW_INCLUDE_FUSE_NTFS  := true 
 TW_INPUT_BLACKLIST := "hbtp_vm" 
 TW_EXTRA_LANGUAGES := true 
 TW_NO_SCREEN_BLANK := true 
 TW_SCREEN_BLANK_ON_BOOT := true 
 BOARD_HAS_NO_SELECT_BUTTON := true 
 TW_EXCLUDE_APEX := true 
 RECOVERY_SDCARD_ON_DATA := true 

# Removes the loop block errors after flashing ZIPs (Workaround) 
 TW_IGNORE_LOGICAL_MOUNT_ERRORS := true
 TW_LOOP_DEVICE_ERRORS_TO_LOG := true

# USB Configuration 
 TW_EXCLUDE_DEFAULT_USB_INIT := true 
 TARGET_USE_CUSTOM_LUN_FILE_PATH := /config/usb_gadget/g1/functions/mass_storage.usb0/lun.%d/file 
  
 # Screenshoot  
 TW_INCLUDE_FB2PNG := true 
  
 # This device support fastbootd, do *NOT* remove! 
 TW_INCLUDE_FASTBOOTD := true 
  
 # Log 
 TWRP_INCLUDE_LOGCAT := true 
 TARGET_USES_LOGD := true

# SHRP flags
# maintainer
SHRP_MAINTAINER := "Tapin Recovery Instraller"

# device
SHRP_DEVICE_CODE := spes
SHRP_PATH := device/xiaomi/spes
SHRP_REC_TYPE := Normal
SHRP_REC := /dev/block/platform/bootdevice/by-name/boot
SHRP_HAS_RECOVERY_AS_BOOT := true
SHRP_DEVICE_TYPE := V-A/B
SHRP_AB := true

# mount points
SHRP_INTERNAL := /sdcard
SHRP_EXTERNAL := /sdcard1
SHRP_OTG := /usb_otg

# theming
SHRP_DARK := true

# "SHRP Express"
SHRP_EXPRESS := true
SHRP_EXPRESS_USE_DATA := true

# status bar padding
SHRP_STATUSBAR_RIGHT_PADDING := 64
SHRP_STATUSBAR_LEFT_PADDING := 64

# skip all addons
SHRP_SKIP_DEFAULT_ADDON_1 := true
SHRP_SKIP_DEFAULT_ADDON_2 := true
SHRP_SKIP_DEFAULT_ADDON_3 := true
SHRP_SKIP_DEFAULT_ADDON_4 := true
SHRP_EXCLUDE_MAGISK_FLASH := true

# flashlight
SHRP_FLASH := 1
