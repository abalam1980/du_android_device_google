# Copyright (C) 2018-2020 The Dirty Unicorns Project
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
# This file is the build configuration for an aosp Android
# build for marlin hardware. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps). Except for a few implementation
# details, it only fundamentally contains two inherit-product
# lines, aosp and gzosp, hence its name.
#

# Inherit some common gzosp stuff.
$(call inherit-product, vendor/gzosp/config/common_full_phone.mk)

# Inherit from those products. Most specific first.
$(call inherit-product, device/google/coral/aosp_flame.mk)

-include device/google/coral/device-gzosp.mk

PRODUCT_BRAND := google
PRODUCT_DEVICE := flame
PRODUCT_MODEL := Pixel 4
PROSUCT_NAME := gzosp_flame
PRODUCT_MANUFACTURER := Google

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME="flame" \
    PRIVATE_BUILD_DESC="flame-user RP1A.201105.002 6869500 release-keys"

BUILD_FINGERPRINT := "google/flame/flame:11/RP1A.201105.002/6869500:user/release-keys"

$(call inherit-product-if-exists, vendor/google/flame/flame-vendor.mk)
$(call inherit-product-if-exists, vendor/pixelgapps/pixel-gapps.mk)