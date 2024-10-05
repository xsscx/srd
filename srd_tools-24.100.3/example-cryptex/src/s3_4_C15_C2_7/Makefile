.PHONY: all install clean
all: s3_4_C15_C2_7-read s3_4_C15_C2_7-flip

include ../../logging.mk
include ../../build_env.mk

s3_4_C15_C2_7-read: 
	@$(log_build)
	${CC} ${CFLAGS} ${LDFLAGS} -g -O0 -o s3_4_C15_C2_7-read s3_4_C15_C2_7-read.c
	codesign -s - --entitlements s3_4_C15_C2_7.plist s3_4_C15_C2_7-read

s3_4_C15_C2_7-flip:
	@$(log_build)
	${CC} ${CFLAGS} ${LDFLAGS} -g -O0 -o s3_4_C15_C2_7-flip s3_4_C15_C2_7-flip.c
	codesign -s - --entitlements s3_4_C15_C2_7.plist s3_4_C15_C2_7-flip

install: s3_4_C15_C2_7-read s3_4_C15_C2_7-flip
	@$(log_install)
	cp s3_4_C15_C2_7-read ${CRYPTEX_BIN_DIR}
	cp s3_4_C15_C2_7-flip ${CRYPTEX_BIN_DIR}

clean:
	rm -f s3_4_C15_C2_7-read
	rm -f ${CRYPTEX_BIN_DIR}/s3_4_C15_C2_7-read
	rm -f s3_4_C15_C2_7-flip
	rm -f ${CRYPTEX_BIN_DIR}/s3_4_C15_C2_7-flip

