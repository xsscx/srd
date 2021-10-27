.PHONY: all install clean
all: s1_0_c7_c8_2

include ../../logging.mk
include ../../build_env.mk

s1_0_c7_c8_2-read:
	@$(log_build)
	${CC} ${CFLAGS} ${LDFLAGS} -O0 -o s1_0_c7_c8_2-read s1_0_c7_c8_2-read.c
	codesign -s - --entitlements s1_0_c7_c8_2.plist s1_0_c7_c8_2-read

s1_0_c7_c8_2-flip: 
	@$(log_build)
	${CC} ${CFLAGS} ${LDFLAGS} -O0 -o s1_0_c7_c8_2-flip s1_0_c7_c8_2-flip.c
	codesign -s - --entitlements s1_0_c7_c8_2.plist s1_0_c7_c8_2-flip

install: s1_0_c7_c8_2-read s1_0_c7_c8_2-flip
	@$(log_install)
	cp s1_0_c7_c8_2-read ${CRYPTEX_BIN_DIR}
	cp s1_0_c7_c8_2-flip ${CRYPTEX_BIN_DIR}

clean:
	rm -f s1_0_c7_c8_2-read
	rm -f ${CRYPTEX_BIN_DIR}/s1_0_c7_c8_2-read
	rm -f s1_0_c7_c8_2-flip
	rm -f ${CRYPTEX_BIN_DIR}/s1_0_c7_c8_2-flip
