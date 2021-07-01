.PHONY: all clean install
all: s3_6_c15_c1_5-flip s3_6_c15_c1_7-flip s3_6_c15_c1_6-flip srd-reg s3_4_c15_c2_0-read s1_0_c7_c8_2-read s3_6_c15_c2_5-read s1_0_c7_c8_2-read s3_6_c15_c1_6-read s3_6_c15_c1_5-read s3_6_c15_c1_7-read s3_6_c15_c1_4-read s1_0_c7_c8_2-flip

include ../../logging.mk
include ../../build_env.mk

srd-reg:
	@$(log_build)
	$(CC) $(CFLAGS) $(LDFLAGS) -g -O0 -o srd-reg srd-reg.c
	codesign -s - srd-reg

s3_4_c15_c2_0-read:
	@$(log_build)
	$(CC) $(CFLAGS) $(LDFLAGS) -g -O0 -o s3_4_c15_c2_0-read s3_4_c15_c2_0-read.c
	codesign -s - s3_4_c15_c2_0-read

s3_4_c15_c10_5-read:
	@$(log_build)
	$(CC) $(CFLAGS) $(LDFLAGS) -g -O0 -o s3_4_c15_c10_5-read s3_4_c15_c10_5-read.c
	codesign -s - s3_4_c15_c10_5-read

s3_6_c15_c2_5-read:
	@$(log_build)
	$(CC) $(CFLAGS) $(LDFLAGS) -g -O0 -o s3_6_c15_c2_5-read s3_6_c15_c2_5-read.c
	codesign -s - s3_6_c15_c2_5-read

s1_0_c7_c8_2-read:
	@$(log_build)
	$(CC) $(CFLAGS) $(LDFLAGS) -g -O0 -o s1_0_c7_c8_2-read s1_0_c7_c8_2-read.c
	codesign -s - s1_0_c7_c8_2-read

s3_6_c15_c1_5-read:
	@$(log_build)
	$(CC) $(CFLAGS) $(LDFLAGS) -g -O0 -o s3_6_c15_c1_5-read s3_6_c15_c1_5-read.c
	codesign -s - s3_6_c15_c1_5-read

s3_6_c15_c1_6-read:
	@$(log_build)
	$(CC) $(CFLAGS) $(LDFLAGS) -g -O0 -o s3_6_c15_c1_6-read s3_6_c15_c1_6-read.c
	codesign -s - s3_6_c15_c1_6-read

s3_6_c15_c1_7-read:
	@$(log_build)
	$(CC) $(CFLAGS) $(LDFLAGS) -g -O0 -o s3_6_c15_c1_7-read s3_6_c15_c1_7-read.c
	codesign -s - s3_6_c15_c1_7-read

s3_6_c15_c1_4-read:
	@$(log_build)
	$(CC) $(CFLAGS) $(LDFLAGS) -g -O0 -o s3_6_c15_c1_4-read s3_6_c15_c1_4-read.c
	codesign -s - s3_6_c15_c1_4-read

s1_0_c7_c8_2-flip:
	@$(log_build)
	$(CC) $(CFLAGS) $(LDFLAGS) -g -O0 -o s1_0_c7_c8_2-flip s1_0_c7_c8_2-flip.c
	codesign -s - s1_0_c7_c8_2-flip

s3_6_c15_c1_6-flip:
	@$(log_build)
	$(CC) $(CFLAGS) $(LDFLAGS) -g -O0 -o s3_6_c15_c1_6-flip s3_6_c15_c1_6-flip.c
	codesign -s - s3_6_c15_c1_6-flip

s3_6_c15_c1_7-flip:
	@$(log_build)
	$(CC) $(CFLAGS) $(LDFLAGS) -g -O0 -o s3_6_c15_c1_7-flip s3_6_c15_c1_7-flip.c
	codesign -s - s3_6_c15_c1_7-flip

s3_6_c15_c1_5-flip:
	@$(log_build)
	$(CC) $(CFLAGS) $(LDFLAGS) -g -O0 -o s3_6_c15_c1_5-flip s3_6_c15_c5-flip.c
	codesign -s - s3_6_c15_c1_5-flip

clean:
	rm -f s3_6_c15_c1_5-flip s3_6_c15_c1_7-flip s3_6_c15_c1_6-flip s3_4_c15_c2_0-read srd-reg s3_4_c15_c10_5-read s3_6_c15_c2_5-read s3_6_c15_c2_5-read s3_6_c15_c1_6-read s3_6_c15_c1_5-read s3_6_c15_c1_7-read s3_6_c15_c1_4-read s1_0_c7_c8_2-flip 
	rm -f ${CRYPTEX_BIN_DIR}/s3_6_c15_c1_5-flip ${CRYPTEX_BIN_DIR}/s3_6_c15_c1_7-flip ${CRYPTEX_BIN_DIR}/s3_6_c15_c1_6-flip ${CRYPTEX_BIN_DIR}/s1_0_c7_c8_2-flip ${CRYPTEX_BIN_DIR}/s3_4_c15_c2_0-read ${CRYPTEX_BIN_DIR}/s3_4_c15_c10_5-read ${CRYPTEX_BIN_DIR}/s3_6_c15_c2_5-read ${CRYPTEX_BIN_DIR}/srd-reg ${CRYPTEX_BIN_DIR}/s1_0_c7_c8_2-read ${CRYPTEX_BIN_DIR}/s3_6_c15_c1_6-read ${CRYPTEX_BIN_DIR}/s3_6_c15_c1_5-read ${CRYPTEX_BIN_DIR}/s3_6_c15_c1_7-read ${CRYPTEX_BIN_DIR}/s3_6_c15_c1_4-read
 
install: s3_6_c15_c1_6-flip s3_6_c15_c1_5-flip s3_6_c15_c1_7-flip s1_0_c7_c8_2-flip s3_4_c15_c2_0-read s3_4_c15_c10_5-read srd-reg s3_6_c15_c2_5-read s1_0_c7_c8_2-read s3_6_c15_c1_6-read s3_6_c15_c1_5-read s3_6_c15_c1_7-read s3_6_c15_c1_6-read s3_6_c15_c1_4-read
	@$(log_install)
	cp s3_6_c15_c1_7-flip s3_6_c15_c1_6-flip s3_6_c15_c1_5-flip s1_0_c7_c8_2-flip s3_4_c15_c2_0-read s3_4_c15_c10_5-read srd-reg s3_6_c15_c2_5-read s1_0_c7_c8_2-read s3_6_c15_c1_6-read s3_6_c15_c1_5-read s3_6_c15_c1_7-read s3_6_c15_c1_4-read ${CRYPTEX_BIN_DIR}

