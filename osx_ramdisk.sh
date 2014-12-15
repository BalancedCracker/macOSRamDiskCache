#!/bin/bash

TARGET_CACHE_DIRS='Google/Chrome com.apple.Safari com.apple.iTunes'

USER_CACHE_DIR=$HOME/Library/Caches
RAM_CACHE_BASEDIR=/Volumes/RamDiskCache
RAM_CACHE_DIR=$RAM_CACHE_BASEDIR/$USER

DISK=`/usr/bin/hdiutil attach -nobrowse -nomount ram://2097152`
/usr/sbin/diskutil erasevolume HFS+ "RamDiskCache" $DISK

function setup_cache_for {
    TARGET=$1
    /bin/rm -rvf $USER_CACHE_DIR/$TARGET
    /bin/mkdir -pv $RAM_CACHE_DIR/$TARGET
    /bin/ln -v -s $RAM_CACHE_DIR/$TARGET $USER_CACHE_DIR/$TARGET
}
   
for CACHEDIR in $TARGET_CACHE_DIRS; do
    setup_cache_for $CACHEDIR
done

/usr/bin/chflags hidden $RAM_CACHE_BASEDIR
