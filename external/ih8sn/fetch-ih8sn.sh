#!/bin/bash
#
# Copyright (C) 2022 LinkBoi00
#
# SPDX-License-Identifier: Apache-2.0
#

if [ -z ${VENDOR_EXTERNAL_PATH+x} ]; then
    echo -e "Error: Script is not ran from build-setup.sh."
else
    wget -q https://github.com/SebaUbuntu/ih8sn/archive/refs/heads/master.zip -O $VENDOR_EXTERNAL_PATH/ih8sn/latest-release.zip
    rm -rf $VENDOR_EXTERNAL_PATH/ih8sn/release
    unzip -q $VENDOR_EXTERNAL_PATH/ih8sn/latest-release.zip -d $VENDOR_EXTERNAL_PATH/ih8sn
    mv $VENDOR_EXTERNAL_PATH/ih8sn/ih8sn-master $VENDOR_EXTERNAL_PATH/ih8sn/release
    rm $VENDOR_EXTERNAL_PATH/ih8sn/latest-release.zip
fi
