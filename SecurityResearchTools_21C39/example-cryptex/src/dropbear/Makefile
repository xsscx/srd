all: dropbear

include ../../logging.mk
include ../../build_env.mk

DROPBEAR_VERSION:=DROPBEAR_2020.79
EXTRA_GIT_FLAGS=$(if ifeq (0, $(VERBOSE)), --quiet ,)
EXTRA_CONFIGURE_FLAG=$(if ifeq (0, $(VERBOSE)), --quiet ,)

# Here we use an order only rule because the configure step
# updates the modification time of the dropbear-src directory
# causing us to rebuild every time
dropbear: | dropbear-src dropbear-src/config.h sdk-graft
	@$(log_build)
	cd dropbear-src && git reset --hard $(DROPBEAR_VERSION)
	cp localoptions.h dropbear-src/
	cd dropbear-src && git apply ../cryptex-aware.diff
	$(MAKE) ${EXTRA_MAKE_FLAGS} -C dropbear-src dropbear
	cp dropbear-src/dropbear dropbear
	chmod 775 dropbear
	codesign -s - --entitlements entitlements.plist dropbear

.PHONY: cryptex-run
cryptex-run:
	# We need cryptex-run for our launchd plist
	$(MAKE) -C ../cryptex-run install

dropbear-src/config.h:
	# You'll need automake to build dropbear
	@$(log_configure)
	@$(call log, Checking you have automake on your path to configure dropbear)
	@$(call check_path, "autoreconf","autoreconf not found on your PATH. Did you install automake?")
	@$(call check_path, "aclocal","aclocal not found on your PATH. Did you install automake?")
	cd dropbear-src && autoreconf
	cd dropbear-src && ./configure \
			--host arm-apple-darwin \
		   	--disable-utmpx \
			--disable-utmp \
			--disable-wtmp \
			--disable-wtmpx \
			--disable-zlib \
			--disable-pam \
			--enable-bundled-libtom \
			$(EXTRA_CONFIGURE_FLAG) \
			${_REDIRECT_OUTPUT}

.PHONY: download
download: dropbear-src

dropbear-src:
	@$(log_download)
	git clone $(EXTRA_GIT_FLAGS) -b $(DROPBEAR_VERSION) https://github.com/mkj/dropbear.git dropbear-src $(_REDIRECT_OUTPUT)

clean:
	rm -rf dropbear-src dropbear
	rm -f ${CRYPTEX_BIN_DIR}/dropbear
	rm -f ${CRYPTEX_LAUNCHD_DIR}/dropbear-research.plist

.PHONY: install
install: dropbear cryptex-run
	@$(log_install)
	cp dropbear ${CRYPTEX_BIN_DIR}
	cp dropbear-research.plist ${CRYPTEX_LAUNCHD_DIR}
