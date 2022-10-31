#!/bin/bash
#
# Copyright (C) 2022 LinkBoi00
#
# SPDX-License-Identifier: Apache-2.0
#

REPO_URL="https://github.com/GrapheneOS/platform_external_Camera"
APP_PATH="prebuilt/Camera.apk"

# Fetch the latest release of GrapheneCamera
if [ -z ${VENDOR_PREBUILTS_PATH+x} ]; then
    echo -e "Error: Script is not ran from build-setup.sh."
else
    wget -q --show-progress $REPO_URL/raw/13/$APP_PATH -O $VENDOR_PREBUILTS_PATH/apps/GrapheneCamera/GrapheneCamera.apk
fi
