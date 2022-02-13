.PHONY: all clean install
all: frida-server frida-agent.dylib

include ../../logging.mk
include ../../build_env.mk

FRIDA_VERSION:=15.1.14
FRIDA_IOS_DEB_URL:=https://github.com/frida/frida/releases/download/$(FRIDA_VERSION)/frida_$(FRIDA_VERSION)_iphoneos-arm.deb
FRIDA_IOS_DEB_HASH:=452d1a6c020cc8b2596aa29df4bee512da4c71561f832e2e27209a60d79c041e

frida-server: pkg.stamp
	# Cannot use lipo here due to multiple arm64e slices,
	# a hack used to support older systems
	./thin.py pkg/usr/sbin/frida-server $@

frida-agent.dylib: pkg.stamp
	cp pkg/usr/lib/frida/frida-agent.dylib .
	touch $@

pkg.stamp: pkg.tar.xz
	rm -rf pkg
	mkdir pkg
	tar -C pkg -xf $<
	touch $@

pkg.tar.xz: pkg.deb
	ar -p $< /data.tar.xz > $@.tmp
	mv $@.tmp $@

pkg.deb:
	curl -Lo $@.tmp --progress-bar $(FRIDA_IOS_DEB_URL)
	actual_hash=$$(shasum -a 256 -b $@.tmp | awk '{ print $$1; }') \
	&& case $$actual_hash in \
		$(FRIDA_IOS_DEB_HASH)) \
			;; \
		*) \
			echo "Frida iOS .deb is corrupted; its hash is: $$actual_hash"; \
			exit 1; \
			;; \
	esac
	mv $@.tmp $@

clean:
	rm -f frida-server frida-agent.dylib pkg.stamp pkg.tar.xz pkg.deb
	rm -rf pkg
	rm -f ${CRYPTEX_BIN_DIR}/frida-server
	rm -f ${CRYPTEX_ROOT_DIR}/usr/lib/frida/frida-agent.dylib
	rm -f ${CRYPTEX_LAUNCHD_DIR}/re.frida.server.plist
	rm -f ${CRYPTEX_LAUNCHD_DIR}/re.frida.policyd.plist

install: frida-server frida-agent.dylib frida-server.plist frida-policyd.plist
	@$(log_install)
	cp frida-server ${CRYPTEX_BIN_DIR}
	mkdir -p ${CRYPTEX_ROOT_DIR}/usr/lib/frida/
	cp frida-agent.dylib ${CRYPTEX_ROOT_DIR}/usr/lib/frida/
	cp frida-server.plist ${CRYPTEX_LAUNCHD_DIR}/re.frida.server.plist
	cp frida-policyd.plist ${CRYPTEX_LAUNCHD_DIR}/re.frida.policyd.plist
