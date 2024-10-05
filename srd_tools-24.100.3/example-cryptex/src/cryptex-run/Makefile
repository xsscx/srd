.PHONY: all install clean
all: cryptex-run

include ../../logging.mk
include ../../build_env.mk

cryptex-run: cryptex-run.c
	@$(log_build)
	$(CC) ${CFLAGS} ${LDFLAGS} cryptex-run.c -o cryptex-run
	codesign -s - --entitlements entitlements.plist cryptex-run

clean:
	rm -f cryptex-run
	rm -f ${CRYPTEX_BIN_DIR}/cryptex-run

install: cryptex-run
	@$(log_install)
	cp cryptex-run ${CRYPTEX_BIN_DIR}
