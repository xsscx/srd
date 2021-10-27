.PHONY: all install clean
all: template

include ../../logging.mk
include ../../build_env.mk

template-read:
	@$(log_build)
	${CC} ${CFLAGS} ${LDFLAGS} -O0 -o template-read template-read.c
	codesign -s - --entitlements template.plist template-read

template-flip:
	@$(log_build)
	${CC} ${CFLAGS} ${LDFLAGS} -O0 -o template-flip template-flip.c
	codesign -s - --entitlements template.plist template-flip

install: template-read template-flip
	@$(log_install)
	cp template-read ${CRYPTEX_BIN_DIR}
	cp template-flip ${CRYPTEX_BIN_DIR}

clean:
	rm -f template-read
	rm -f ${CRYPTEX_BIN_DIR}/template-read
	rm -f template-flip
	rm -f ${CRYPTEX_BIN_DIR}/template-flip
