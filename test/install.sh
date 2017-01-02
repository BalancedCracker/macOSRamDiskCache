#!/usr/bin/env bash

set -x

[[ -f "/usr/local/bin/macos_ramdisk_cache.sh" ]] || exit 1
[[ -f "$HOME/Library/LaunchAgents/macOSRamDiskCache.plist" ]] || exit 1
[[ -d "/Volumes/RamDiskCache" ]] || exit 1
[[ -d "/Volumes/RamDiskCache/$USER" ]] || exit 1

CACHE_DIRS="Google/Chrome com.apple.Safari com.apple.iTunes com.spotify.client"
CACHE_DIRS="${CACHE_DIRS} com.apple.helpd com.apple.dt.Xcode Firefox"
for d in $CACHE_DIRS; do
  expected="/Volumes/RamDiskCache/$USER/$d"
  if [[ ! -d "$expected" ]]; then
    echo "missing $expected"
    exit 1
  fi
done

set +x
exit 0
