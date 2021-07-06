.PHONY: all install clean
all: s3_5_c15_c10_5

include ../../logging.mk
include ../../build_env.mk

s3_5_c15_c10_5-read: s3_5_c15_c10_5-read s3_5_c15_c10_5.plist
	@$(log_build)
	${CC} ${CFLAGS} ${LDFLAGS} -g -O0 -o s3_5_c15_c10_5-read s3_5_c15_c10_5-read.c
	codesign -s - --entitlements s3_5_c15_c10_5.plist s3_5_c15_c10_5-read

s3_5_c15_c10_5-flip: s3_5_c15_c10_5-flip s3_5_c15_c10_5.plist
	@$(log_build)
	${CC} ${CFLAGS} ${LDFLAGS} -g -O0 -o s3_5_c15_c10_5-flip s3_5_c15_c10_5-flip.c
	codesign -s - --entitlements s3_5_c15_c10_5.plist s3_5_c15_c10_5-flip

install: s3_5_c15_c10_5-read s3_5_c15_c10_5-flip
	@$(log_install)
	cp s3_5_c15_c10_5-read ${CRYPTEX_BIN_DIR}
	cp s3_5_c15_c10_5-flip ${CRYPTEX_BIN_DIR}
	cp s3_5_c15_c10_5.plist ${CRYPTEX_LAUNCHD_DIR}


s3_5_c15_c10_5.plist: s3_5_c15_c10_5.plist
	@$(log_install)
	cp s3_5_c15_c10_5.plist ${CRYPTEX_LAUNCHD_DIR}

clean:
	rm -f s3_5_c15_c10_5-read
	rm -f ${CRYPTEX_BIN_DIR}/s3_5_c15_c10_5-read
	rm -f s3_5_c15_c10_5-flip
	rm -f ${CRYPTEX_BIN_DIR}/s3_5_c15_c10_5-flip
	rm -f ${CRYPTEX_LAUNCHD_DIR}/s3_5_c15_c10_5.plist
