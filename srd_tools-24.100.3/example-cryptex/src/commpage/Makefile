.PHONY: all clean install
all: commpage

include ../../logging.mk
include ../../build_env.mk

commpage:
	@$(log_build)
	$(CC) $(CFLAGS) $(LDFLAGS) -o commpage commpage.c
	codesign -s - commpage

clean:
	rm -f commpage
	rm -f ${CRYPTEX_BIN_DIR}/commpage

install: commpage commpage.plist
	@$(log_install)
	cp commpage ${CRYPTEX_BIN_DIR}
	cp commpage.plist ${CRYPTEX_LAUNCHD_DIR}
