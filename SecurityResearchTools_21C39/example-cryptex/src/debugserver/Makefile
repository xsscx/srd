all: debugserver

include ../../logging.mk
include ../../build_env.mk

.PHONY: install
install: debugserver
	@$(log_install)
	codesign -s - --entitlements debugserver.plist debugserver
	cp debugserver ${CRYPTEX_BIN_DIR}
	cp debugserver.plist ${CRYPTEX_LAUNCHD_DIR}
