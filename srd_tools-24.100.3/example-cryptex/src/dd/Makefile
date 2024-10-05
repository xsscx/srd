.PHONY: all clean install gather-headers
all: dd
include ../../logging.mk
include ../../build_env.mk
FILE_CMDS_VERSION=file_cmds-321.40.3
dd: ${FILE_CMDS_VERSION} gather-headers
	@$(log_build)
	$(CC) ${CFLAGS} ${LDFLAGS} ${FILE_CMDS_VERSION}/dd/*.c -o dd
	codesign -s - dd
${FILE_CMDS_VERSION}: ${FILE_CMDS_VERSION}.tar.gz
	tar -xf ${FILE_CMDS_VERSION}.tar.gz
${FILE_CMDS_VERSION}.tar.gz:
	@$(log_download)
	curl -sSL -O https://opensource.apple.com/tarballs/file_cmds/${FILE_CMDS_VERSION}.tar.gz
clean:
	rm -rf dd*
	rm -f ${CRYPTEX_BIN_DIR}/dd
	rm -rf ${FILE_CMDS_VERSION}*
install: dd
	@$(log_install)
	cp dd ${CRYPTEX_BIN_DIR}

gather-headers: sdk-graft
# Here we take the sys/conf.h header, this will be satisfied by
# a pattern rule in build_env.mk which will take care of putting these into the sdk graft for us.
sdk-graft: ${LOCAL_INCLUDE_DIR}/sys/conf.h