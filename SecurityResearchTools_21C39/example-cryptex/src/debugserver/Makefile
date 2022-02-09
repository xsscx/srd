.PHONY: all clean install

all: debugserver

export XCODE_DEVELOPER_DIRECTORY:=$(shell xcode-select --print-path)
export CURRENT_IOS_PLATFORM_VERSION:=$(shell ls ${XCODE_DEVELOPER_DIRECTORY}/Platforms/iPhoneOS.platform/DeviceSupport | sort -n | tail -n 1)
export CURRENT_IOS_DEV_DMG:=$(abspath ${XCODE_DEVELOPER_DIRECTORY}/Platforms/iPhoneOS.platform/DeviceSupport/${CURRENT_IOS_PLATFORM_VERSION}/DeveloperDiskImage.dmg)

include ../../logging.mk
include ../../build_env.mk

debugserver:
	@$(log_download)
	ls -lah ${CURRENT_IOS_DEV_DMG}
	hdiutil detach /Volumes/DeveloperDiskImage | true
	hdiutil attach ${CURRENT_IOS_DEV_DMG}
	cp /Volumes/DeveloperDiskImage/usr/bin/debugserver debugserver.developer
	hdiutil detach /Volumes/DeveloperDiskImage
	codesign --display --entitlements - --xml debugserver.developer > debugserver.entitlements
	# Inject the entitlements required on the Security Research Device to make debugserver
	# all powerful
	plutil -convert xml1 -o debugserver.research.entitlements debugserver.entitlements
	# Note that plutil plays by its own rules and interprets '.' as the nesting operator, it must be escaped
	# in entitlement names during insertion.
	plutil -insert 'research\.com\.apple\.license-to-operate' -bool "true" -- debugserver.research.entitlements
	plutil -insert 'task_for_pid-allow' -bool "true" -- debugserver.research.entitlements
	# Don't opt into the sandbox profile
	plutil -remove 'seatbelt-profiles' -- debugserver.research.entitlements
	# Opt out of the platform sandbox profile
	plutil -insert 'com\.apple\.private\.security\.no-container' -bool "true" -- debugserver.research.entitlements

	cp debugserver.developer debugserver
	# Sign in our new entitlements, being careful to preserve our existing metadata
	codesign --sign - \
		--force \
		--preserve-metadata=identifier,requirements,flags,runtime \
		--entitlements debugserver.research.entitlements \
		debugserver
	codesign --display \
		--verbose=4 \
		--entitlements - \
		debugserver

clean:
	rm -f debugserver debugserver.developer debugserver.entitlements debugserver.research.entitlements

install: debugserver
	@$(log_install)
	cp debugserver ${CRYPTEX_BIN_DIR}
	cp debugserver-research.plist ${CRYPTEX_LAUNCHD_DIR}
