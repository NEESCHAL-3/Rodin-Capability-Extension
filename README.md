# Rodin Capability Extension

A verified capability enablement module for **POCO X7 Pro / rodin**.

## Author

**NEESCHAL 🇳🇵**

## Features

- Pro Audio
- Unprocessed Audio Source
- Secure NFC

## What This Module Does

- Declares `android.hardware.audio.pro`
- Enables `config_supportAudioSourceUnprocessed`
- Declares `android.hardware.nfc.secure`
- Enables Secure NFC support and default state inside `com.android.nfc`
- Adds `rodin` to Secure NFC SKU support
- Normalizes rodin SKU properties:
  - `ro.boot.hardware.sku=rodin`
  - `ro.boot.product.hardware.sku=rodin`

## Verified Results

After install and reboot, expected checks:

    adb shell getprop ro.boot.hardware.sku
    adb shell cmd package has-feature android.hardware.audio.pro
    adb shell cmd overlay lookup android android:bool/config_supportAudioSourceUnprocessed
    adb shell cmd package has-feature android.hardware.nfc.secure
    adb shell cmd overlay lookup com.android.nfc com.android.nfc:bool/enable_secure_nfc_support
    adb shell cmd overlay lookup com.android.nfc com.android.nfc:bool/secure_nfc_default
    adb shell cmd overlay lookup com.android.nfc com.android.nfc:array/config_skuSupportsSecureNfc
    adb shell service call nfc 27

Expected key results:

    ro.boot.hardware.sku = rodin
    android.hardware.audio.pro = true
    config_supportAudioSourceUnprocessed = true
    android.hardware.nfc.secure = true
    enable_secure_nfc_support = true
    secure_nfc_default = true
    config_skuSupportsSecureNfc = rodin
    service call nfc 27 = 00000001

Secure NFC API verification:

    NfcAdapter.isSecureNfcSupported() = true
    NfcAdapter.isSecureNfcEnabled() = true

## Installation

1. Remove older test modules related to audio or NFC capability experiments.
2. Install `Rodin-CapabilityExtension-v1.0.zip` through Magisk, KernelSU, or a compatible module manager.
3. Reboot.
4. Run the verification commands above.

## Compatibility

Designed for **POCO X7 Pro / rodin** on HyperOS-based ROMs using `com.android.nfc` with the `NfcCustomization` overlay target.

## Disclaimer

Use at your own risk. Keep a recovery or module-removal method available before installing.
