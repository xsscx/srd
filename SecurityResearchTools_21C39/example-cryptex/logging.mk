export VERBOSE ?= 1
# If VERBOSE is set to 0, we will suppress echoing
ifeq (0, ${VERBOSE})
# Suppress echoing
#.SILENT:
endif

# If VERBOSE is 0 we will redirect to /dev/null
export _REDIRECT_OUTPUT=$(if $(ifeq (0, ${VERBOSE})), " > /dev/null",)
export EXTRA_MAKE_FLAGS=$(if $(ifeq (0, ${VERBOSE})), -s,)

export BLUE := tput -Txterm setaf 6
export GREEN := tput -Txterm setaf 2
export WHITE := tput -Txterm setaf 7
export RED := tput -Txterm setaf 1
export RESET := tput -Txterm sgr0

export PROJECT_DISPLAY_NAME := $(or ${PROJECT_NAME}, $(notdir $(shell pwd)))
log = @echo [$(PROJECT_DISPLAY_NAME)] - $(1)

define log_download
${WHITE}
$(call log, [%] Building $(notdir $(shell pwd)))
${RESET}
endef

define log_configure
${WHITE}
$(call log, [+] Building $(notdir $(shell pwd)))
${RESET}
endef

define log_build
${BLUE}
$(call log, [++] Building $(notdir $(shell pwd)))
${RESET}
endef

define log_install
${GREEN}
$(call log, [+++] Installing $(notdir $(shell pwd)))
${RESET}
endef

define log_clean
${WHITE}
$(call log, [---] Cleaning $(notdir $(shell pwd)))
${RESET}
endef

define log_die
${RED}
@echo $1
${RESET}
@exit 1
endef

define check_path
which $1 >/dev/null || ($(RED) && echo "[$(PROJECT_DISPLAY_NAME)] - $2" && $(RESET) && exit 1)
endef
