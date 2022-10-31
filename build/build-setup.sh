#!/bin/bash
#
# Copyright (C) 2022 LinkBoi00
#
# SPDX-License-Identifier: Apache-2.0
#

# Initial checks
if ! [ -f build/envsetup.sh ]; then
  echo -e "Error: Script is not ran from Android directory.\n"
  return 0
fi

# Run build envirovnment script from Android
. build/envsetup.sh
croot

# Environment
export VENDOR_EXTRA_PATH=$(gettop)/vendor/extra
export VENDOR_PREBUILTS_PATH="$VENDOR_EXTRA_PATH"/prebuilt
export VENDOR_EXTERNAL_PATH="$VENDOR_EXTRA_PATH"/external

# Execute Graphene fetch script
echo -e "extra: Fetching GrapheneOS Camera"
VENDOR_PREBUILTS_GRAPHENE_PATH="$VENDOR_PREBUILTS_PATH/apps/GrapheneCamera"
. $VENDOR_PREBUILTS_PATH/apps/GrapheneCamera/fetch-graphene.sh

if ! [ -f $VENDOR_PREBUILTS_GRAPHENE_PATH/GrapheneCamera.apk ]; then
    echo "Warning: GrapheneCamera is not present."
fi

# Execute ih8sn fetch script
echo -e "extra: Fetching ih8sn (SebaUbuntu)"
VENDOR_EXTERNAL_IH8SN_PATH="$VENDOR_EXTERNAL_PATH/ih8sn"
. $VENDOR_EXTERNAL_IH8SN_PATH/fetch-ih8sn.sh
