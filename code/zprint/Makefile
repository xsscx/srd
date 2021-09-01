all: zprint

include ../../logging.mk
include ../../build_env.mk

.PHONY: install
install: zprint
	@$(log_install)
	codesign -s - --entitlements zprint.plist zprint
	cp zprint ${CRYPTEX_BIN_DIR}
	cp zprint.plist ${CRYPTEX_LAUNCHD_DIR}
