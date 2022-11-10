#!/usr/bin/python3
#
# Copyright (C) 2022 Giovanni Ricca
# Copyright (C) 2022 LinkBoi00
#
# SPDX-License-Identifier: Apache-2.0
#

import os
from hashlib import md5
from re import search
from glob import glob


def getprop(prop):
    return search(
        r"".join(["(?<=", prop, "=).*"]), open("system/build.prop").read()
    ).group(0)


version, datetime = (
    getprop("ro.lineage.build.version"),  # version
    getprop("ro.build.date.utc"),  # datetime
)
filename = max(
    glob("".join(["lineage-", version, "*", ".zip"])),
    key=os.path.getctime,
)
id = md5(open(filename, "rb").read()).hexdigest()
size = os.stat(filename).st_size

print(
    """
{
  "response": [
    {
      "datetime": %s,
      "filename": "%s",
      "id": "%s",
      "romtype": "unofficial",
      "size": %s,
      "url": " ",
      "version": "%s"
    }
  ]
}
"""
    % (datetime, filename, id, size, version)
)
