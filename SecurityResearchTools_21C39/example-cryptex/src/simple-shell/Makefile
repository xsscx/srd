.PHONY: all install clean
all: simple-shell

include ../../logging.mk
include ../../build_env.mk

simple-shell: simple-shell.c entitlements.plist
	@$(log_build)
	$(CC) ${CFLAGS} ${LDFLAGS} -o simple-shell simple-shell.c
	codesign -s - --entitlements entitlements.plist simple-shell

install: simple-shell simple-shell.plist
	@$(log_install)
	cp simple-shell ${CRYPTEX_BIN_DIR}
	cp simple-shell.plist ${CRYPTEX_LAUNCHD_DIR}

clean:
	rm -f ${CRYPTEX_BIN_DIR}/simple-shell
	rm -f ${CRYPTEX_LAUNCHD_DIR}/simple-shell.plist
	rm -f simple-shell
