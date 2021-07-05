.PHONY: all install clean
all: s3_4_c15_c2_1

include ../../logging.mk
include ../../build_env.mk

s3_4_c15_c2_1read: s3_4_c15_c2_1read s3_5_c15_c10_1.plist
	@$(log_build)
	${CC} ${CFLAGS} ${LDFLAGS} -g -O0 -o s3_4_c15_c2_1read s3_4_c15_c2_1read.c
	codesign -s - --entitlements s3_5_c15_c10_1.plist s3_4_c15_c2_1read

s3_4_c15_c2_1flip: s3_4_c15_c2_1flip s3_5_c15_c10_1.plist
	@$(log_build)
	${CC} ${CFLAGS} ${LDFLAGS} -g -O0 -o s3_4_c15_c2_1flip s3_4_c15_c2_1flip.c
	codesign -s - --entitlements s3_5_c15_c10_1.plist s3_4_c15_c2_1flip

install: s3_4_c15_c2_1read s3_4_c15_c2_1flip
	@$(log_install)
	cp s3_4_c15_c2_1read ${CRYPTEX_BIN_DIR}
	cp s3_4_c15_c2_1flip ${CRYPTEX_BIN_DIR}
	cp s3_5_c15_c10_1.plist ${CRYPTEX_LAUNCHD_DIR}


s3_5_c15_c10_1.plist: s3_5_c15_c10_1.plist
	@$(log_install)
	cp s3_5_c15_c10_1.plist ${CRYPTEX_LAUNCHD_DIR}

clean:
	rm -f s3_4_c15_c2_1read
	rm -f ${CRYPTEX_BIN_DIR}/s3_4_c15_c2_1read
	rm -f s3_4_c15_c2_1flip
	rm -f ${CRYPTEX_BIN_DIR}/s3_4_c15_c2_1flip
	rm -f ${CRYPTEX_LAUNCHD_DIR}/s3_5_c15_c10_1.plist
