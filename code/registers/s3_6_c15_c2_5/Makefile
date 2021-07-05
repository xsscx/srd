.PHONY: all install clean
all: s3_6_c15_c2_5-read

include ../../logging.mk
include ../../build_env.mk

s3_6_c15_c2_5-read: s3_6_c15_c2_5-read s3_6_c15_c2_5.plist
	@$(log_build)
	${CC} ${CFLAGS} ${LDFLAGS} -g -O0 -o s3_6_c15_c2_5-read s3_6_c15_c2_5-read.c
	codesign -s - --entitlements s3_6_c15_c2_5.plist s3_6_c15_c2_5-read

install: s3_6_c15_c2_5-read
	@$(log_install)
	cp s3_6_c15_c2_5-read ${CRYPTEX_BIN_DIR}

s3_6_c15_c2_5.plist: s3_6_c15_c2_5.plist
	@$(log_install)
	cp s3_6_c15_c2_5.plist ${CRYPTEX_BIN_DIR}

clean:
	rm -f s3_6_c15_c2_5-read
	rm -f ${CRYPTEX_BIN_DIR}/s3_6_c15_c2_5-read
	rm -f ${CRYPTEX_LAUNCHD_DIR}/s3_6_c15_c2_5.plist
