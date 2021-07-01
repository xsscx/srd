.PHONY: all clean install
all: S3_6_c15_c1_5

include ../../logging.mk
include ../../build_env.mk

S3_6_c15_c1_5:
        @$(log_build)
        $(CC) $(CFLAGS) $(LDFLAGS) -o S3_6_c15_c1_5 S3_6_c15_c1_5.c
        codesign -s - S3_6_c15_c1_5

install: S3_6_c15_c1_5
        @$(log_install)
        cp S3_6_c15_c1_5 ${CRYPTEX_BIN_DIR}

