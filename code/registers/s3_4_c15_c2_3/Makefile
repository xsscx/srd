.PHONY: all install clean
all: s3_4_c15_c2_3

include ../../logging.mk
include ../../build_env.mk

s3_4_c15_c2_3-read: s3_4_c15_c2_3-read s3_4_c15_c2_3.plist
	@$(log_build)
	${CC} ${CFLAGS} ${LDFLAGS} -g -O0 -o s3_4_c15_c2_3-read s3_4_c15_c2_3-read.c
	codesign -s - --entitlements s3_4_c15_c2_3.plist s3_4_c15_c2_3-read

s3_4_c15_c2_3-flip: s3_4_c15_c2_3-flip s3_4_c15_c2_3.plist
	@$(log_build)
	${CC} ${CFLAGS} ${LDFLAGS} -g -O0 -o s3_4_c15_c2_3-flip s3_4_c15_c2_3-flip.c
	codesign -s - --entitlements s3_4_c15_c2_3.plist s3_4_c15_c2_3-flip

install: s3_4_c15_c2_3-read s3_4_c15_c2_3-flip
	@$(log_install)
	cp s3_4_c15_c2_3-read ${CRYPTEX_BIN_DIR}
	cp s3_4_c15_c2_3-flip ${CRYPTEX_BIN_DIR}
	cp s3_4_c15_c2_3.plist ${CRYPTEX_LAUNCHD_DIR}


s3_4_c15_c2_3.plist: s3_4_c15_c2_3.plist
	@$(log_install)
	cp s3_4_c15_c2_3.plist ${CRYPTEX_LAUNCHD_DIR}

clean:
	rm -f s3_4_c15_c2_3-read
	rm -f ${CRYPTEX_BIN_DIR}/s3_4_c15_c2_3-read
	rm -f s3_4_c15_c2_3-flip
	rm -f ${CRYPTEX_BIN_DIR}/s3_4_c15_c2_3-flip
	rm -f ${CRYPTEX_LAUNCHD_DIR}/s3_4_c15_c2_3.plist
