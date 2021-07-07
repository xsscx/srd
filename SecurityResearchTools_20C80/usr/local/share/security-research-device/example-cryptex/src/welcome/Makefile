.PHONY: all clean install
all: welcome

include ../../logging.mk
include ../../build_env.mk

welcome:
	@$(log_build)
	$(CC) $(CFLAGS) $(LDFLAGS) -g -O0 -o welcome welcome.s
	codesign -s - welcome

clean:
	rm -f welcome
	rm -f ${CRYPTEX_BIN_DIR}/welcome

install: welcome
	@$(log_install)
	cp welcome ${CRYPTEX_BIN_DIR}
