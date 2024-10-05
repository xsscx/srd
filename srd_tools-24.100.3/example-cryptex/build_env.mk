# Set up all the variables we need to compile command line iOS applications
export PROJECT_PATH ?= $(dir $(realpath $(firstword ${MAKEFILE_LIST})))

export TOOLCHAIN ?= iOS14.0
export MACOS_TOOLCHAIN ?= MacOSX11.0

export ARCH:=arm64e
export SDK:=iphoneos

export SDK_PATH:=$(shell xcrun --show-sdk-path --sdk $(SDK))
export SDKROOT=$(SDK_PATH)
export MACOS_SDK_PATH:=$(shell xcrun --show-sdk-path --sdk macosx)

export SDK_GRAFT_DIR ?= $(abspath ${PROJECT_PATH}/sdk-graft)
export SDK_GRAFT_DOWNLOADS ?= $(abspath ${SDK_GRAFT_DIR}/downloads)
export LOCAL_INCLUDE_DIR ?= $(abspath ${SDK_GRAFT_DIR}/include)

export CC:=$(shell xcrun -f --toolchain $(TOOLCHAIN) clang)
export HOSTCC:=$(shell xcrun -f --toolchain $(MACOS_TOOLCHAIN) clang)

export CXX:=$(shell xcrun -f --toolchain $(TOOLCHAIN) clang++)

export CFLAGS:=-isysroot $(SDK_PATH) -arch $(ARCH) -I$(SDK_PATH)/usr/include -I$(LOCAL_INCLUDE_DIR) -F${LOCAL_INCLUDE_DIR} -DTARGET_OS_IPHONE=1 -DTARGET_OS_BRIDGE=0
export HOST_CFLAGS:=-isysroot $(MACOS_SDK_PATH) -I$(MACOS_SDK_PATH)/usr/include
export LD_LIBRARY_PATH:=$(SDK_PATH)/usr/lib

export LDFLAGS:=-isysroot ${SDK_PATH} -arch ${ARCH}
export HOST_LDFLAGS:=-isysroot $(MACOS_SDK_PATH)

export CXXFLAGS:=${CFLAGS}
export CCFLAGS:=${CFLAGS}
export CPPFLAGS= -DUSE_GETCWD -isysroot ${SDKROOT} -arch arm64 -I${LOCAL_INCLUDE_DIR} -F${LOCAL_INCLUDE_DIR}


# Make sure the two SDK directories exist
check-sdks:
	@$(call log, Checking for macOS SDK at ${MACOS_SDK_PATH})
	$(if $(ifndef $(MACOS_SDK_PATH)),$(error "No MACOS_SDK_PATH defined, macOS SDK could not be located. Have you selected your Xcode install with xcode-select(1)?"))
	stat "$(MACOS_SDK_PATH)" > /dev/null
	@$(call log, Checking for iOS SDK at ${SDKROOT})
	$(if $(ifndef $(SDK_PATH)),$(error "No SDK_PATH defined, iPhone SDK could not be located. Have you selected your Xcode install with xcode-select(1)?"))
	stat "$(SDK_PATH)" > /dev/null

# Extend clean to include common-clean
clean: common-clean

# common-clean should depend on all the bits we need to clean up here
common-clean: sdk-graft-clean
	@$(call log_clean)

# --------------------------------------
# This section is concerned with extracting headers from the SDK

# Gather headers from the macOS SDK and XNU
.PHONY: sdk-graft
sdk-graft: check-sdks gather-xnu-headers
	# Since we don't have an SDK that provides the headers we need, we'll need to just *borrow*
	# some bits from the macOS SDK...
	@$(call log, Creating SDK header graft...)
	mkdir -p ${LOCAL_INCLUDE_DIR}

# The pattern here is to append your file to the requirements for sdk-graft
sdk-graft: ${LOCAL_INCLUDE_DIR}/sys/disk.h
sdk-graft: ${LOCAL_INCLUDE_DIR}/term.h
sdk-graft: ${LOCAL_INCLUDE_DIR}/libkern/OSTypes.h

# This pattern rule will graft a header from the macOS SDK into our sdk-graft
${LOCAL_INCLUDE_DIR}/%: ${MACOS_SDK_PATH}/usr/include/%
	mkdir -p $(dir $@)
	cp $< $@

# This pattern rule will graft an IOKit header from the macOS SDK into our sdk-graft
${LOCAL_INCLUDE_DIR}/IOKit/%.h: ${MACOS_SDK_PATH}/System/Library/Frameworks/IOKit.framework/Versions/Current/Headers/%.h
	mkdir -p ${LOCAL_INCLUDE_DIR}/IOKit/
	cp $< $@

# --------------
# This section deals with grabbing XNU and extracting headers from it
export XNU_VERSION=xnu-6153.81.5

.PHONY: gather-xnu-headers
gather-xnu-headers: ${SDK_GRAFT_DOWNLOADS}/${XNU_VERSION}

${SDK_GRAFT_DOWNLOADS}/${XNU_VERSION}: ${SDK_GRAFT_DOWNLOADS}/${XNU_VERSION}.tar.gz
	# Ensure the name of the destination directory is ${XNU_VERSION}
	cd ${SDK_GRAFT_DOWNLOADS} && \
	mkdir ${XNU_VERSION} && \
	tar -xf ${XNU_VERSION}.tar.gz -C ${XNU_VERSION} --strip-components 1

${SDK_GRAFT_DOWNLOADS}/${XNU_VERSION}.tar.gz:
	@$(log_download)
	mkdir -p ${SDK_GRAFT_DOWNLOADS}
	curl -sSL -o ${SDK_GRAFT_DOWNLOADS}/${XNU_VERSION}.tar.gz https://github.com/apple-oss-distributions/xnu/archive/${XNU_VERSION}.tar.gz

sdk-graft-clean:
	rm -rf ${SDK_GRAFT_DIR}
