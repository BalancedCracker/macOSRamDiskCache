# macOS RAM-Disk Cache

Run at startup to move some app's cache directory be on a RAM disk.

## Installation

- Quit all apps (see ramdisk.sh)
- Run `make install`

The `make install` command effectively does the following:

    cp launchd.plist to ~/Library/LaunchAgents/macOSRamDiskCache.plist
    cp ramdisk.sh /usr/local/bin/macos_ramdisk_cache.sh
    launchctl load -w ~/Library/LaunchAgents/macOSRamDiskCache.plist

## Uninstallation

Run `make uninstall` or do it manually as follows.

    launchctl unload -w ~/Library/LaunchAgents/macOSRamDiskCache.plist
    rm ~/Library/LaunchAgents/macOSRamDiskCache.plist
    rm /usr/local/bin/macos_ramdisk_cache.sh

# License

MIT
