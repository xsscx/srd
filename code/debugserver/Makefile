all: dropbear

include ../../logging.mk
include ../../build_env.mk

.PHONY: install
install: debugserver
	@$(log_install)
	cp debugserver ${CRYPTEX_BIN_DIR}
	cp debugserver.plist ${CRYPTEX_LAUNCHD_DIR}
