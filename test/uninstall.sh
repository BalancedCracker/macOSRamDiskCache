#!/usr/bin/env bash

set -x

[[ ! -f "/usr/local/bin/macos_ramdisk_cache.sh" ]] || exit 1
[[ ! -f "$HOME/Library/LaunchAgents/macOSRamDiskCache.plist" ]] || exit 1
[[ ! -d "/Volumes/RamDiskCache" ]] || exit 1

set +x
exit 0
