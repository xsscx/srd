### All Code Contributions Welcome

Open an Issue and include a Link to your Xcode Project, App or Code. Include entitlements.plist and a read.me.

I will run your Code and Post the Results to your Issue.

Ask a Question, Open an Issue!

Here is the process:

In the Code Directory, there are examples of Code with Makefiles and .plists. They are working, compiled, executable programs for the Apple Security Research Device that Compile with both the iOS 14.5 and iOS 15.x SDK's.

To make a Code Contribution via Pull Request please use the example Makefiles as a Template for your Makefile. The build pipeline for Cryptex Code Compile and Installation is fully automated. Your PR will be executed and results returned to a Readme.md on the Main Branch in the Code Repo available to the SRD Holders.

If you have an Xcode Project, please Open a PR or Issue and Results will be Posted quickly.

Stub Makefile for Apple Security Research Device
```
.PHONY: all clean install
all: hello

include ../../logging.mk
include ../../build_env.mk

hello:
	@$(log_build)
	$(CC) $(CFLAGS) $(LDFLAGS) -o hello hello.c
	codesign -s - hello

clean:
	rm -f hello
	rm -f ${CRYPTEX_BIN_DIR}/hello

install: hello hello.plist
	@$(log_install)
	cp hello ${CRYPTEX_BIN_DIR}
	cp hello.plist ${CRYPTEX_LAUNCHD_DIR}

```

Please Contribute Code to be run on the Apple Security Research Device

Thank You
