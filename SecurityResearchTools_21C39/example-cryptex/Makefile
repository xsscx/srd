all: create

# Set VERBOSE=1 on the command line for more verbosity!
export VERBOSE ?=0

# $(call log) comes from logging.mk
include logging.mk

# You can include build_env.mk into your own
# Makefile to get the cross compilation flags
include build_env.mk

# If you don't specify a UDID in your environment
# we use the special "first" value. This selects the
# first available device that lockdown sees.
# See the man page for cryptexctl for more info
export CRYPTEXCTL_UDID ?= first

# If you want to specify custom flags for cryptexctl
# you can set this variable in the environment.
# Here we default to mirroring the make verbosity level.
# See the cryptexctl man page for more information.
export CRYPTEXCTL_FLAGS ?= -v$(VERBOSE)

# This is useful if you want to personalise your cryptex for an
# offline device.
export CRYPTEXCTL_PERSONALIZE_FLAGS ?=

# Set this variable to add flags when we call `cryptexctl create`
export CRYPTEXCTL_CREATE_FLAGS ?=

# These are the details of the cryptex we'll build.
# See the cryptex-create and cryptex-install man pages
# for more information.
export CRYPTEX_ID ?= com.example.cryptex
export CRYPTEX_VERSION ?= 1.3.3.7
export CRYPTEX_PATH ?= $(abspath ${CRYPTEX_ID}.cxbd)

# This is where we'll create the distribution root
export CRYPTEX_ROOT_DIR ?= $(abspath ${PROJECT_PATH}/${CRYPTEX_ID}.dstroot)

# This is the disk image that we'll create. If you want to share
# your tooling with someone else, you can share the distributionroot
# or this disk image.
export CRYPTEX_DMG_NAME ?= ${CRYPTEX_ID}.dmg

# These are the paths within the distribution root where we'll place
# our built products.
export CRYPTEX_LAUNCHD_DIR = ${CRYPTEX_ROOT_DIR}/Library/LaunchDaemons
export CRYPTEX_BIN_DIR = ${CRYPTEX_ROOT_DIR}/usr/bin

# This is a convenience target to produce the cryptex
.PHONY: cryptex create
cryptex: ${CRYPTEX_ID}
create: ${CRYPTEX_ID}

# This is a convenience target to produce the disk image
.PHONY: dmg
dmg: ${CRYPTEX_DMG_NAME}

# This is a convenience target to produce the distribution root
.PHONY: dstroot
dstroot: ${CRYPTEX_ROOT_DIR}

.PHONY: example-cryptex
example-cryptex: dstroot

# This target will download XNU sources, then extract headers from
# the source and your installed macOS SDK to create an additional
# include directory.
.PHONY: sdk-graft

# Uninstall the cryptex from the device
.PHONY: uninstall
uninstall:
	@$(call log, Removing ${CRYPTEX_ID} from device: ${CRYPTEXCTL_UDID})
	$(call check_path, cryptexctl, "cryptexctl is not on your path. Did you install the research disk image?")
	cryptexctl list
	cryptexctl uninstall ${CRYPTEX_ID}
	cryptexctl list

# Install the cryptex onto the device
.PHONY: install
install: ${CRYPTEX_PATH}
	@$(call log, Installing ${CRYPTEX_PATH} onto device: ${CRYPTEXCTL_UDID})
	$(call check_path, cryptexctl, "cryptexctl is not on your path. Did you install the research disk image?")
	cryptexctl uninstall ${CRYPTEX_ID} || true
	cryptexctl ${CRYPTEXCTL_PERSONALIZE_FLAGS} personalize --replace -o $(abspath ${PROJECT_PATH}) --variant=research ${CRYPTEX_PATH} || log_die "Personalization failure"
	cryptexctl install --variant=research --persist ${CRYPTEX_PATH}.signed || log_die "Failed to install cryptex... Is your device '${CRYPTEXCTL_UDID}' connected?" $?
	cryptexctl list


.PHONY: ${CRYPTEX_ID}
${CRYPTEX_ID}: ${CRYPTEX_PATH}

# Create the cryptex from the disk image containing the distribution root
${CRYPTEX_PATH}: ${CRYPTEX_DMG_NAME}
	@$(call log, Creating cryptex ${CRYPTEX_PATH} - ${CRYPTEX_VERSION} from the disk image ${CRYPTEX_DMG_NAME})
	$(call check_path, cryptexctl, "cryptexctl is not on your path. Did you install the research disk image?")
	cryptexctl ${CRYPTEXCTL_FLAGS} create --research --replace ${CRYPTEXCTL_CREATE_FLAGS} --identifier=${CRYPTEX_ID} --version=${CRYPTEX_VERSION} --variant=research ${CRYPTEX_DMG_NAME}

# Take the distribution root and create a disk image
${CRYPTEX_DMG_NAME}: dstroot
	@$(call log, Creating disk image ${CRYPTEX_DMG_NAME} from distribution root ${CRYPTEX_ROOT_DIR})
	rm -f ${CRYPTEX_DMG_NAME}
	hdiutil create -fs hfs+ -srcfolder ${CRYPTEX_ROOT_DIR} ${CRYPTEX_DMG_NAME}


# Search for projects in the src/ directory
PROJECT_DIRS = $(wildcard ${PROJECT_PATH}/src/*)

# Create a distribution root
${CRYPTEX_ROOT_DIR}: projects prebuilt-binaries

.PHONY: projects $(PROJECT_DIRS)
projects: $(PROJECT_DIRS)

$(PROJECT_DIRS): sdk-graft
	@$(call log, Creating a distribution root: ${CRYPTEX_ROOT_DIR})
	mkdir -p ${CRYPTEX_ROOT_DIR}
	mkdir -p ${CRYPTEX_BIN_DIR} ${CRYPTEX_LAUNCHD_DIR}
	$(MAKE) ${EXTRA_MAKE_FLAGS} -C $@ install

# This is a convenience target. Anything you put in $(PROJECT_PATH)/bin/ will be
# included into the cryptex.
PREBUILT_BINARIES = $(foreach bin,$(wildcard ${PROJECT_PATH}/bin/*), $(notdir $(bin)))
.PHONY: prebuilt-binaries

prebuilt-binaries: $(foreach binary, $(PREBUILT_BINARIES), $(abspath $(CRYPTEX_BIN_DIR)/$(binary)))

$(abspath $(CRYPTEX_BIN_DIR)/)%: $(abspath $(PROJECT_PATH)/bin/)%
	@$(GREEN)
	@$(call log, [+++] Installing prebuilt binary: $(notdir $<))
	@$(RESET)
	mkdir -p $(CRYPTEX_BIN_DIR)
	cp $< $@

.PHONY: clean
clean:
	rm -rf ${CRYPTEX_ROOT_DIR} ${CRYPTEX_DMG_NAME} ${CRYPTEX_ID}.cxbd ${CRYPTEX_ID}.cxbd.signed
	rm -rf include
	# Loop through each project and call its clean target
	$(foreach proj,$(PROJECT_DIRS),$(MAKE) $(EXTRA_MAKE_FLAGS) -C $(proj) clean;)
