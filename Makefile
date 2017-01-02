BIN_DIR = /usr/local/bin
BIN = macos_ramdisk_cache.sh
BIN_PATH = "$(BIN_DIR)/$(BIN)"
PLIST = macOSRamDiskCache.plist
PLIST_PATH = "${HOME}/Library/LaunchAgents/$(PLIST)"

install:
	if [ ! -d $(BIN_DIR) ]; then mkdir -p $(BIN_DIR); fi
	cp ramdisk.sh $(BIN_PATH)
	cp launchd.plist $(PLIST_PATH)
	launchctl load -w $(PLIST_PATH)

uninstall:
	if [ -f $(PLIST_PATH) ]; then \
	  launchctl unload -w $(PLIST_PATH); \
	  rm -f $(PLIST_PATH); \
	fi
	if [ -f $(BIN_PATH) ]; then rm -f $(BIN_PATH); fi
