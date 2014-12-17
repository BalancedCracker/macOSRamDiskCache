#!/bin/bash

LIBRARY_TARGET_CACHE_DIRS='Google/Chrome com.apple.Safari com.apple.iTunes com.spotify.client com.apple.helpd com.apple.dt.Xcode Firefox'
USER_LIBRARY_CACHE_BASEDIR=$HOME/Library/Caches

RAM_CACHE_MOUNT_DIR=/Volumes/RamDiskCache
RAM_CACHE_BASE_DIR=$RAM_CACHE_MOUNT_DIR/$USER

DISK=`/usr/bin/hdiutil attach -nobrowse -nomount ram://2097152`
/usr/sbin/diskutil erasevolume HFS+ "RamDiskCache" $DISK
/usr/bin/chflags hidden $RAM_CACHE_MOUNT_DIR

function setup_cache_for {
    TARGET=$1
    /bin/rm -rvf $USER_LIBRARY_CACHE_BASEDIR/$TARGET
    /bin/mkdir -pv $RAM_CACHE_BASE_DIR/$TARGET
    /bin/ln -v -s $RAM_CACHE_BASE_DIR/$TARGET $USER_LIBRARY_CACHE_BASEDIR/$TARGET
}
   
for CACHEDIR in $LIBRARY_TARGET_CACHE_DIRS; do
    setup_cache_for $CACHEDIR
done

