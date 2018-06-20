#
# Copyright (C) 2012 The Android Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# WARNING: Everything listed here will be built on ALL platforms,
# including x86, the emulator, and the SDK.  Modules must be uniquely
# named (liblights.tuna), and must build everywhere, or limit themselves
# to only building on ARM if they include assembly. Individual makefiles
# are responsible for having their own logic, for fine-grained control.

# Platform
TARGET_BOARD_PLATFORM := mt6753
TARGET_NO_BOOTLOADER := true
TARGET_BUILD_VARIANT := eng
# FORCE_32_BIT := true

# Architecture
ifeq ($(FORCE_32_BIT),true)
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := cortex-a53
else
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a53

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53

TARGET_CPU_ABI_LIST_64_BIT := $(TARGET_CPU_ABI)
TARGET_CPU_ABI_LIST_32_BIT := $(TARGET_2ND_CPU_ABI),$(TARGET_2ND_CPU_ABI2)
TARGET_CPU_ABI_LIST := $(TARGET_CPU_ABI_LIST_64_BIT),$(TARGET_CPU_ABI_LIST_32_BIT)
endif

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := mt6753

# Recovery
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4

# Kernel
BOARD_KERNEL_BASE := 0x40000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_RAMDISK_OFFSET := 0x04000000
BOARD_TAGS_OFFSET := 0xE000000
# TARGET_KERNEL_SOURCE := kernel-3.18

ifeq ($(FORCE_32_BIT),true)
TARGET_KERNEL_ARCH := arm
BOARD_KERNEL_IMAGE_NAME := zImage-dtb
TARGET_KERNEL_CONFIG := m8pro_twrp_defconfig
BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,32N2 androidboot.selinux=permissive
BOARD_KERNEL_OFFSET := 0x00008000
KERNEL_TOOLCHAIN_PREFIX:=$(ANDROID_BUILD_TOP)/prebuilts/gcc/linux-x86/arm/linaro-6.3.1_arm-linux-gnueabi/bin/arm-linux-gnueabi-
else
TARGET_KERNEL_ARCH := arm64
# BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
# TARGET_KERNEL_CONFIG := m8pro_twrp_defconfig
TARGET_PREBUILT_KERNEL := device/Infinix/X571/kernel
BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,64N2 androidboot.selinux=permissive
BOARD_KERNEL_OFFSET = 0x00080000
TARGET_USES_64_BIT_BINDER := true
endif
BOARD_MKBOOTIMG_ARGS := --base $(BOARD_KERNEL_BASE) --pagesize $(BOARD_KERNEL_PAGESIZE) --kernel_offset $(BOARD_KERNEL_OFFSET) --ramdisk_offset $(BOARD_RAMDISK_OFFSET) --tags_offset $(BOARD_TAGS_OFFSET)

# Partitions
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216
BOARD_FLASH_BLOCK_SIZE := 131072

# recovery__TWRP 3.2.1
TARGET_RECOVERY_FSTAB := device/Infinix/X571/recovery.fstab
BOARD_HAS_NO_SELECT_BUTTON := true
TW_CUSTOM_THEME := device/Infinix/X571/theme
TW_USE_MODEL_HARDWARE_ID_FOR_DEVICE_ID := true
TW_DEFAULT_LANGUAGE := ru
ifeq ($(FORCE_32_BIT),true)
TW_DEVICE_VERSION := OREO by NasreIrma
else
TW_DEVICE_VERSION := OREO-64 by NasreIrma
endif
RECOVERY_SDCARD_ON_DATA := true
TW_DEFAULT_EXTERNAL_STORAGE := true
TW_BRIGHTNESS_PATH := /sys/class/leds/lcd-backlight/brightness
TW_MAX_BRIGHTNESS := 255
TW_ALWAYS_RMRF := false
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/mt_usb/musb-hdrc.0.auto/gadget/lun%d/file
TW_MTP_DEVICE := /dev/mtp_usb
TW_CUSTOM_CPU_TEMP_PATH := /sys/devices/virtual/thermal/thermal_zone1/temp

