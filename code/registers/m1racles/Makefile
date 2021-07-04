.PHONY: all clean install
all: m1racles poc

include ../../logging.mk
include ../../build_env.mk

m1racles:
	@$(log_build)
	$(CC) $(CFLAGS) $(LDFLAGS) -g -O0 -o m1racles m1racles.c
	codesign -s - m1racles

poc:
	@$(log_build)
	$(CC) $(CFLAGS) $(LDFLAGS) -g -O0 -o poc poc.c
	codesign -s - poc

clean:
	rm -f poc
	rm -f ${CRYPTEX_BIN_DIR}/poc

install: poc
	@$(log_install)
	cp poc ${CRYPTEX_BIN_DIR}
