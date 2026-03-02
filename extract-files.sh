#!/bin/bash
#
# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2017-2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

function blob_fixup() {
    case "${1}" in
        vendor/lib/libmmcamera_hdr_gb_lib.so \
        | vendor/lib/libmpbase.so \
        | vendor/lib/liboptizoom.so \
        | vendor/lib/libseemore.so \
        | libtrueportrait.so \
        | libubifocus.so \
        | libchromaflash.so )
            "${PATCHELF_0_17_2}" --replace-needed "libstdc++.so" "libstdc++_vendor.so" "${2}"
            ;;
        vendor/lib/libmmcamera_ppeiscore.so)
            "${PATCHELF_0_17_2}" --add_needed "libppeiscore_shim.so" "${2}"
            "${PATCHELF_0_17_2}" --replace-needed "libGLESv2.so" "libGLESv2_adreno.so" "${2}"
            ;;
        vendor/lib/libmmcamera_tuning.so)
            "${PATCHELF_0_17_2}" --remove-needed "libmm-qcamera.so" "${2}"
            ;;
    esac

    # For all ELF files
    if [[ "${1}" =~ ^.*(\.so|\/bin\/.*)$ ]]; then
        "${PATCHELF_0_17_2}" --replace-needed "libstdc++.so" "libstdc++_vendor.so" "${2}"
    fi
}

# If we're being sourced by the common script that we called,
# stop right here. No need to go down the rabbit hole.
if [ "${BASH_SOURCE[0]}" != "${0}" ]; then
    return
fi

set -e

export DEVICE=mido
export DEVICE_COMMON=mithorium-common
export VENDOR=xiaomi

"./../../${VENDOR}/${DEVICE_COMMON}/extract-files.sh" "$@"
