#!/bin/bash
# Build script for LineageOS 21 — Samsung Galaxy A12s (SM-A127F/DS)
# Requires: full LineageOS 21 source tree synced with repo

set -e

export ALLOW_MISSING_DEPENDENCIES=true
export UNSAFE_DISABLE_HIDDENAPI_FLAGS=true

cd "$(dirname "$0")/../../.."

source build/envsetup.sh
lunch lineage_a12s-ap2a-userdebug

m -j8
