#
# Copyright (C) 2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# For building with minimal manifest 
 ALLOW_MISSING_DEPENDENCIES := true

# Enable virtual A/B OTA
ENABLE_VIRTUAL_AB := true
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)

# Enable project quotas and casefolding for emulated storage without sdcardfs
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# Boot control
PRODUCT_PACKAGES += \
    android.hardware.boot@1.2-impl-qti \
    android.hardware.boot@1.2-impl-qti.recovery \
    android.hardware.boot@1.2-service

# Dynamic Partitions 
 PRODUCT_USE_DYNAMIC_PARTITIONS := true

# API
PRODUCT_TARGET_VNDK_VERSION := 32
PRODUCT_SHIPPING_API_LEVEL := 31

# A/B
AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_vendor=true \
    POSTINSTALL_PATH_vendor=bin/checkpoint_gc \
    FILESYSTEM_TYPE_vendor=ext4 \
    POSTINSTALL_OPTIONAL_vendor=true

PRODUCT_PACKAGES += \
    otapreopt_script \
    checkpoint_gc

# f2fs utilities
PRODUCT_PACKAGES += \
    sg_write_buffer \
    f2fs_io \
    check_f2fs

# Fastbootd
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.1-impl-mock \
    fastbootd

# FUSE passthrough
PRODUCT_SYSTEM_PROPERTIES += \
    persist.sys.fuse.passthrough.enable=true

# Init scripts
PRODUCT_PACKAGES += \
    init.recovery.qcom.sh \
    init.recovery.qcom.rc

# Update engine
PRODUCT_PACKAGES += \
    update_engine \
    update_engine_sideload \
    update_verifier

PRODUCT_PACKAGES_DEBUG += \
    update_engine_client

PRODUCT_PACKAGES += \
    qcom_decrypt \
    qcom_decrypt_fbe

PRODUCT_SOONG_NAMESPACES += \
    vendor/qcom/opensource/commonsys-intf/display

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
 
# Modul
TARGET_RECOVERY_DEVICE_MODULES += libion vendor.display.config@1.0 vendor.display.config@2.0 libdisplayconfig.qti vendor.qti.hardware.vibrator.service vendor.qti.hardware.vibrator.impl libqtivibratoreffect

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

# Tool 
 TW_INCLUDE_REPACKTOOLS := true 
 TW_INCLUDE_RESETPROP := true 
 TW_INCLUDE_LIBRESETPROP := true 

# USB Configuration 
 TW_EXCLUDE_DEFAULT_USB_INIT := true 
  
 # Screenshoot  
 TW_INCLUDE_FB2PNG := true 
  
 # This device support fastbootd, do *NOT* remove! 
 TW_INCLUDE_FASTBOOTD := true 
  
 # Log 
 TWRP_INCLUDE_LOGCAT := true 
 TARGET_USES_LOGD := true

RECOVERY_BINARY_SOURCE_FILES += \
    $(TARGET_OUT_VENDOR_EXECUTABLES)/hw/vendor.qti.hardware.vibrator.service

# OF_DEFAULT_KEYMASTER_VERSION This is to specify the default version for the keymaster services used for decryption
 OF_DEFAULT_KEYMASTER_VERSION := 4.1
 TW_FORCE_KEYMASTER_VER := true

# Vibrator
 TW_SUPPORT_INPUT_AIDL_HAPTICS := true

RECOVERY_LIBRARY_SOURCE_FILES += \
    $(TARGET_OUT_SHARED_LIBRARIES)/libion.so \
    $(TARGET_OUT_SYSTEM_EXT_SHARED_LIBRARIES)/vendor.display.config@1.0.so \
    $(TARGET_OUT_SYSTEM_EXT_SHARED_LIBRARIES)/vendor.display.config@2.0.so \
    $(TARGET_OUT_SYSTEM_EXT_SHARED_LIBRARIES)/libdisplayconfig.qti.so \
    $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)/vendor.qti.hardware.vibrator.impl.so \
    $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)/libqtivibratoreffect.so
