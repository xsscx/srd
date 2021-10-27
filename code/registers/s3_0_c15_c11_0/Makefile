.PHONY: all install clean
all: s3_0_c15_c11_0

include ../../logging.mk
include ../../build_env.mk

s3_0_c15_c11_0-read:
	@$(log_build)
	${CC} ${CFLAGS} ${LDFLAGS} -O0 -o s3_0_c15_c11_0-read s3_0_c15_c11_0-read.c
	codesign -s - --entitlements s3_0_c15_c11_0.plist s3_0_c15_c11_0-read

s3_0_c15_c11_0-flip: 
	@$(log_build)
	${CC} ${CFLAGS} ${LDFLAGS} -O0 -o s3_0_c15_c11_0-flip s3_0_c15_c11_0-flip.c
	codesign -s - --entitlements s3_0_c15_c11_0.plist s3_0_c15_c11_0-flip

install: s3_0_c15_c11_0-read s3_0_c15_c11_0-flip
	@$(log_install)
	cp s3_0_c15_c11_0-read ${CRYPTEX_BIN_DIR}
	cp s3_0_c15_c11_0-flip ${CRYPTEX_BIN_DIR}

clean:
	rm -f s3_0_c15_c11_0-read
	rm -f ${CRYPTEX_BIN_DIR}/s3_0_c15_c11_0-read
	rm -f s3_0_c15_c11_0-flip
	rm -f ${CRYPTEX_BIN_DIR}/s3_0_c15_c11_0-flip
