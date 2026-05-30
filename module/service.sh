#!/system/bin/sh

sleep 10

DEVICE="$(getprop ro.product.device)"
VENDOR_DEVICE="$(getprop ro.product.vendor.device)"
PRODUCT_DEVICE="$(getprop ro.product.product.device)"

if [ "$DEVICE" = "rodin" ] || [ "$VENDOR_DEVICE" = "rodin" ] || [ "$PRODUCT_DEVICE" = "rodin" ]; then
    resetprop ro.boot.hardware.sku rodin
    resetprop ro.boot.product.hardware.sku rodin
fi
