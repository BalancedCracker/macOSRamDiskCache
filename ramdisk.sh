#!/bin/bash

CACHE_DIRS='Google/Chrome com.apple.Safari com.apple.iTunes com.spotify.client com.apple.helpd com.apple.dt.Xcode Firefox'
LIBRARY_CACHES=$HOME/Library/Caches

RAMDISK_NAME="RamDiskCache"
MOUNTPOINT="/Volumes/${RAMDISK_NAME}"
RAMDISK_ROOT="$MOUNTPOINT/$USER"

DISK=$(/usr/bin/hdiutil info|awk "/$RAMDISK_NAME/ { print \$1 }")
if [ -z "$DISK" ]; then
  DISK=`/usr/bin/hdiutil attach -nobrowse -nomount ram://2097152`
  /usr/sbin/diskutil erasevolume HFS+ "RamDiskCache" $DISK
fi
/usr/bin/chflags hidden $MOUNTPOINT

function setup_cache_for {
    d=$1
    /bin/rm -rvf $LIBRARY_CACHES/$d
    /bin/mkdir -pv $RAMDISK_ROOT/$d
    /bin/ln -v -s $RAMDISK_ROOT/$d $LIBRARY_CACHES/$d
}

for d in $CACHE_DIRS; do setup_cache_for $d; done
