.PHONY: all clean install gather-headers

all: nvram

include ../../logging.mk
include ../../build_env.mk

SYSTEM_CMDS_VERSION=system_cmds-854.40.2
LDFLAGS+= -framework CoreFoundation -framework IOKit

nvram: ${SYSTEM_CMDS_VERSION} gather-headers
	@$(log_build)
	$(CC) ${CFLAGS} ${LDFLAGS} ${SYSTEM_CMDS_VERSION}/nvram.tproj/nvram.c -o nvram
	codesign -s - nvram

${SYSTEM_CMDS_VERSION}: ${SYSTEM_CMDS_VERSION}.tar.gz
	tar -xf ${SYSTEM_CMDS_VERSION}.tar.gz

${SYSTEM_CMDS_VERSION}.tar.gz:
	@$(log_download)
	curl -sSL -O https://opensource.apple.com/tarballs/system_cmds/${SYSTEM_CMDS_VERSION}.tar.gz

clean:
	rm -rf nvram*
	rm -f ${CRYPTEX_BIN_DIR}/nvram
	rm -rf ${SYSTEM_CMDS_VERSION}*

install: nvram
	@$(log_install)
	cp nvram ${CRYPTEX_BIN_DIR}

gather-headers: sdk-graft

# Here we make all of the IOKit headers as part of the sdk-graft
# a pattern rule in build_env.mk will take care of putting these into the sdk graft for us.
IOKIT_HEADERS:=$(wildcard ${MACOS_SDK_PATH}/System/Library/Frameworks/IOKit.framework/Versions/Current/Headers/*.h)
sdk-graft: $(foreach header,$(IOKIT_HEADERS),${LOCAL_INCLUDE_DIR}/IOKit/$(notdir $(header)))

gather-xnu-headers: ${LOCAL_INCLUDE_DIR}/IOKit/IOKitKeysPrivate.h
${LOCAL_INCLUDE_DIR}/IOKit/IOKitKeysPrivate.h: ${SDK_GRAFT_DOWNLOADS}/${XNU_VERSION}/iokit/IOKit/IOKitKeysPrivate.h
	mkdir -p ${LOCAL_INCLUDE_DIR}/IOKit/
	cp ${SDK_GRAFT_DOWNLOADS}/${XNU_VERSION}/iokit/IOKit/IOKitKeysPrivate.h ${LOCAL_INCLUDE_DIR}/IOKit/
