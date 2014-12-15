install:
	#[ ! -d /usr/local/bin/ ] && mkdir -p /usr/local/bin
	cp ./osx_ramdisk.sh /usr/local/bin/
	#sudo chmod 755 /usr/local/bin/osx_ramdisk.sh
	#sudo chown root:wheel /usr/local/bin/osx_ramdisk.sh
	cp ./com.coledot.ChromeRamDisk.plist ~/Library/LaunchAgents/
	[ -f ~/Library/LaunchAgents/com.coledot.ChromeRamDisk.plist ] && launchctl load -w ~/Library/LaunchAgents/com.coledot.ChromeRamDisk.plist

uninstall:
	[ -f ~/Library/LaunchAgents/com.coledot.ChromeRamDisk.plist ] && launchctl unload -w ~/Library/LaunchAgents/com.coledot.ChromeRamDisk.plist
	[ -f /usr/local/bin/ChromeRamDisk.sh ] && rm -f /usr/local/bin/ChromeRamDisk.sh
	[ -f ~/Library/LaunchAgents/com.coledot.ChromeRamDisk.plist ] && rm -f ~/Library/LaunchAgents/com.coledot.ChromeRamDisk.plist
	[ -h ~/Library/Caches/Google/Chrome/Default ] && bash -c "rm -f ~/Library/Caches/Google/Chrome/Default; mkdir ~/Library/Caches/Google/Chrome/Default"
