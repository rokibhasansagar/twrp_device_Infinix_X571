# Release name
PRODUCT_RELEASE_NAME := X571

# Inherit from our custom product configuration
$(call inherit-product, vendor/omni/config/common.mk)

$(call inherit-product, device/Infinix/X571/full_X571.mk)

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := X571
PRODUCT_NAME := omni_X571
PRODUCT_BRAND := Infinix
PRODUCT_MODEL := Infinix NOTE 4 Pro
PRODUCT_MANUFACTURER := Infinix

PRODUCT_BUILD_PROP_OVERRIDES += \
	TARGET_DEVICE="X571" \
	PRODUCT_NAME="X571"

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

#Allow_missing_dependencies
ALLOW_MISSING_DEPENDENCIES=true
