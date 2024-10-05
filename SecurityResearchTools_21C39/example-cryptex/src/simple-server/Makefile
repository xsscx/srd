.PHONY: all install clean
all: simple-server

include ../../logging.mk
include ../../build_env.mk

simple-server: simple-server.c entitlements.plist
	@$(log_build)
	${CC} ${CFLAGS} ${LDFLAGS} -o simple-server simple-server.c
	codesign -s - --entitlements entitlements.plist simple-server

install: simple-server simple-server.plist
	@$(log_install)
	cp simple-server ${CRYPTEX_BIN_DIR}
	cp simple-server.plist ${CRYPTEX_LAUNCHD_DIR}

clean:
	rm -f simple-server
	rm -f ${CRYPTEX_BIN_DIR}/simple-server
	rm -f ${CRYPTEX_LAUNCHD_DIR}/simple-server.plist
