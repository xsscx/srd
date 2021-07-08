### SRD Code Repo

Hello! This is my SRD Repo and the iPhone 11 Public Domain Register Fuzzing Project using the Apple Security Research Device, the Apple SRD.

Please contribute your Code, Project, Comments, Pro Tips or anything.... Open an Issue or PR.

Toolchain Details
-----
XNU Export
```
export XNU_VERSION=xnu-7195.81.3
```
X86_64
```
xcode-select -p
/Applications/Xcode.app/Contents/Developer

clang -v
Apple clang version 13.0.0 (clang-1300.0.18.6)
Target: arm64-apple-darwin20.5.0
Thread model: posix
InstalledDir: /Applications/Xcode-beta.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin
iOS SDK at /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS14.5.sdk
iOS SDK at /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS15.0.sdk
```

M1 Apple Silicon
```
xcode-select -p
/Applications/Xcode-beta.app/Contents/Developer

clang -v
Apple clang version 13.0.0 (clang-1300.0.18.6)
Target: arm64-apple-darwin20.5.0
Thread model: posix
InstalledDir: /Applications/Xcode-beta.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin
iOS SDK at /Applications/Xcode-beta.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS15.0.sdk
```
```
iOS SDK 15
iOS SDK 14
iOS 14Beta7
iOS 15Beta2
```
* Results of Accessing a restricted system register from an application generates an exception and ends up in SIGILL being delivered to the process

Initial Commits contain the SPRR Code by Sven Peter for M1 Apple Silicon. The Code is being refactored for iOS. 

Also available is a TFTP Server ripped and canabalized for the SRD. TFTP Server & Client work perfectly for iOS 14.3 -> 14Beta7.

## iPhone 11 Register Fuzzing Code

On May 6, 2021 a Post by Sven Peter about Apple Silicon Hardware Secrets: SPRR and Guarded Exception Levels (GXF) at URL https://blog.svenpeter.dev/posts/m1_sprr_gxf/ appeared in my Timeline. I had just been reviewing https://github.com/AsahiLinux/m1n1/blob/main/tools/apple_regs.json.

For the M1 Apple Silicon Platform, I've Posted some Results at URL https://github.com/xsscx/macos-research/tree/main/sprr

What happens when we run the Code on an SRD???

This Repo answers the question.. what happens when we run Sven Peter's Code on the SRD... 

Repo in Development.. Feel Free to Open Issues, Ask Questions and Contribute Code to be run on the SRD.

Check out the 2021 SRD Cohort Website at https://srd.cx

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
