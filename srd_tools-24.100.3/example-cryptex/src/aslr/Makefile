.PHONY: all clean install
all: aslr

include ../../logging.mk
include ../../build_env.mk

aslr:
	@$(log_build)
	$(CC) $(CFLAGS) $(LDFLAGS) -o aslr aslr.c
	codesign -s - aslr

clean:
	rm -f aslr
	rm -f ${CRYPTEX_BIN_DIR}/aslr

install: aslr aslr.plist
	@$(log_install)
	cp aslr ${CRYPTEX_BIN_DIR}
	cp aslr.plist ${CRYPTEX_LAUNCHD_DIR}
