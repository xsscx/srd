all: toybox-bin
.PHONY: all clean install configure gather-headers

include ../../logging.mk
include ../../build_env.mk

CRYPTEX_ROOT_DIR ?= $(PROJECT_PATH)/build
PREFIX ?= $(abspath $(CRYPTEX_ROOT_DIR))
CRYPTEX_BIN_DIR ?= $(abspath $(PREFIX)/usr/bin)

SED := $(or $(shell which gsed), $(shell which sed))
EXTRA_GIT_FLAGS=$(if ifeq (0, $(VERBOSE)), --quiet ,)
EXTRA_CONFIGURE_FLAGS=$(if ifeq (0, $(VERBOSE)), --quiet ,)

# Here we use an order only rule because the configure step
# alters the timestamp of the toybox-src directory and causes
# us to rebuild every time
toybox-bin: | gather-headers toybox-src/.config toybox-src
	@$(log_build)
	# We need to fiddle with the HOSTCC and include the
	# HOST_CFLAGS so we pick up headers from the macOS
	# SDK instead of the iPhone SDK. This is because
	# toybox doesn't include any CFLAGS style env var
	# in its invocation of $(HOSTCC)
	$(MAKE) ${EXTRA_MAKE_FLAGS} -C toybox-src toybox \
			HOSTCC="$(HOSTCC) $(HOST_CFLAGS)" \
			CC="$(CC)" \
			CFLAGS="$(CFLAGS)" \
			LDFLAGS="$(LDFLAGS)" \
			ARCH="$(ARCH)"
	codesign -s - --entitlements entitlements.plist toybox-src/toybox
	cp toybox-src/toybox toybox-bin
	chmod 775 toybox-bin

instlist: toybox-bin
	$(HOSTCC) $(HOST_CFLAGS) -I toybox-src toybox-src/scripts/install.c -o instlist || exit 1

configure: toybox-src/.config

download: toybox-src

toybox-src/.config: toybox-src
	# We need GNU sed, Apple sed won't do
	@$(call log, Checking for GNU sed)
	$(SED) --version | grep 'GNU' || ($(RED) && echo "[$(PROJECT_DISPLAY_NAME)] - GNU sed not found on your path. Did you install GNU sed?" && $(RESET) && exit 1)
	rm -rf ./sed_path/
	mkdir -p ./sed_path/
	ln -s $(SED) ./sed_path/sed
	# We need to do the defconfig as macOS since this builds
	# the config program for the host
	@$(log_configure)
	./sed_path/sed -i '/CONFIG_SH=/d' toybox-src/kconfig/macos_miniconfig
	# WORKAROUND to Build on iOS 15.x
	# ./sed_path/sed -i '/CONFIG_VI=/d' toybox-src/kconfig/macos_miniconfig
	./sed_path/sed -i '/CONFIG_WGET=/d' toybox-src/kconfig/macos_miniconfig
	# Patch in the config to get a shell and some other goodies
	echo CONFIG_SH=y >> toybox-src/kconfig/macos_miniconfig
	# HOYT FIXUP 
	echo CONFIG_VI=y >> toybox-src/kconfig/macos_miniconfig
	echo CONFIG_WGET=y >> toybox-src/kconfig/macos_miniconfig
	env -vi PATH="$(shell pwd)/sed_path:$(PATH)" $(MAKE) ${EXTRA_MAKE_FLAGS} \
			-C toybox-src macos_defconfig \
			HOSTCC="$(HOSTCC) $(HOST_CFLAGS)" \
			${_REDIRECT_OUTPUT}

toybox-src:
	@$(log_download)
	git clone $(EXTRA_GIT_FLAGS) https://github.com/landley/toybox.git toybox-src $(_REDIRECT_OUTPUT)

clean:
	rm -rf toybox-src toybox sed_path toybox-bin instlist build

install: toybox-bin
	@$(log_install)
	mkdir -p $(PREFIX) $(CRYPTEX_BIN_DIR)
	$(MAKE) ${EXTRA_MAKE_FLAGS} -C toybox-src install_flat \
			HOSTCC="$(HOSTCC) $(HOST_CFLAGS)" \
			CC="$(CC)" \
			CFLAGS="$(CFLAGS)" \
			LDFLAGS="$(LDFLAGS)" \
			ARCH="$(ARCH)" \
			PREFIX="$(CRYPTEX_BIN_DIR)"

gather-headers: sdk-graft
