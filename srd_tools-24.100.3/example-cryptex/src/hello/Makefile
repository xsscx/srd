.PHONY: all clean install
all: hello

include ../../logging.mk
include ../../build_env.mk

ASAN := 0
UBSAN := 1
ASAN_DYLIB := libclang_rt.asan_ios_dynamic.dylib
UBSAN_DYLIB := libclang_rt.ubsan_ios_dynamic.dylib
ASAN_DYLIB_PATH := $(shell clang -print-file-name=lib)/darwin/$(ASAN_DYLIB)
UBSAN_DYLIB_PATH := $(shell clang -print-file-name=lib)/darwin/$(UBSAN_DYLIB)

ifeq ($(wildcard $(ASAN_DYLIB_PATH)),)
$(error Cannot find ASan dylib at "$(ASAN_DYLIB_PATH)")
else
$(info Found ASan dylib at "$(ASAN_DYLIB_PATH)")
endif

ifeq ($(wildcard $(UBSAN_DYLIB_PATH)),)
$(error Cannot find UBSan dylib at "$(UBSAN_DYLIB_PATH)")
else
$(info Found UBSan dylib at "$(UBSAN_DYLIB_PATH)")
endif

INSTALL_SANITIZER_LIBS :=

ifeq ($(ASAN),1)
CFLAGS += -fsanitize=address
LDFLAGS += -fsanitize=address
INSTALL_SANITIZER_LIBS += install_asan
endif

ifeq ($(UBSAN),1)
CFLAGS += -fsanitize=undefined
LDFLAGS += -fsanitize=undefined
INSTALL_SANITIZER_LIBS += install_ubsan
endif

hello:
	@$(log_build)
	$(CC) $(CFLAGS) $(LDFLAGS) -o hello hello.c
	codesign -s - hello

clean:
	rm -f hello
	rm -f ${CRYPTEX_BIN_DIR}/hello

install: hello hello.plist $(INSTALL_SANITIZER_LIBS)
	@$(log_install)
	cp hello ${CRYPTEX_BIN_DIR}
	cp hello.plist ${CRYPTEX_LAUNCHD_DIR}

# TODO: Figure out if codesigning is actually necessary
.PHONY: install_asan
install_asan:
	cp $(ASAN_DYLIB_PATH) ${CRYPTEX_BIN_DIR}


.PHONY: install_ubsan
install_ubsan:
	cp $(UBSAN_DYLIB_PATH) ${CRYPTEX_BIN_DIR}
