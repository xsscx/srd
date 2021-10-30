# Welcome to Hoyt's SRD Repo for the Apple Security Research Device. (SRD) Repo by SRD0009

Welcome to Hoyt's SRD Repo for the Apple Security Research Device.
```
uname -a
Darwin iPhone 21.2.0 Darwin Kernel Version 21.2.0: Tue Oct 19 23:43:56 PDT 2021; root:xnu-8019.60.40.0.1~25/RELEASE_ARM64_T8030 iPhone12,1 Toybox
```
The Target iOS ranges are iOS15 Mainline and Beta Trains. The Target Platform is iPhone 11 which is aka iPhone 12,1. The Model Number is MWL72LL/A. Help us Prove the SRD Model with a PR or Issue. 

Crowdsource: Proof & Audit for the Apple Security Research Device. Create a PR, send a DM or Tweet.  Help us Validate & Proof the Apple SRD. Your Ideas can be a Proof for the SRD. All Result to be Published into the Public Domain immediately.

--------------------------------------------------
SRD | 19B74 | Signed File: iPhone11,8,iPhone12,1_15.1_19B74_Restore.ipsw | defaults write com.apple.AMPDevicesAgent ipsw-variant -string 'Research Customer Erase Install (IPSW)' 

SRD | 19C5026i | Signed File: iPhone11,8,iPhone12,1_15.2_19C5026i_Restore.ipsw | defaults write com_apple_AMPDevicesAgent ipsw-variant -string 'Research Developer Erase Install (IPSW)'

See URL https://github.com/xsscx/srd/tree/main/dmg

There are typically 2 DMG's available that are Compiled for the Mainline and Beta Trains.

Open an Issue or PR if you want Code included in the available DMG's.

# What's Here
```
Security Research Tools - Use 20C80 Only
Sample Code for the SRD
Cryptex DMG's built with Toybox Unstripped and includes debugserver, jtool2, binbag, ioscan, ioprint and more...
PoC's on the DMG that Crash, are Broken and Programs that write Hello researcher from pid xxx!
There is a new entitlement called research.com.apple.license-to-operate to support Frida and other research tools for the Apple Security Research Device
```
# Want to write Instrumentation or a PoC for the SRD?

Here is where you start your Instrumentation:
```
groups
wheel daemon kmem sys tty operator procview procmod staff certusers admin
uname -a
Darwin iPhone 21.2.0 Darwin Kernel Version 21.2.0: Tue Oct 19 23:43:56 PDT 2021; root:xnu-8019.60.40.0.1~25/RELEASE_ARM64_T8030 iPhone12,1 Toybox
 whoami
root
```

This Repo is Public Domain and I hope you will contribute your Code, Comments and Suggestions.

SRD Details
----------
```
Model: 		    MWL72LL/A
Model Name:         iPhone 11
release:            21.0.0
version:            Darwin iPhone 21.2.0 Darwin Kernel Version 21.2.0: Tue Oct 19 23:43:56 PDT 2021; root:xnu-8019.60.40.0.1~25/RELEASE_ARM64_T8030 iPhone12,1 Toybox
machine:            iPhone12,1
cpu type:           0x100000c  (arm64e)
cpu subtype:        0x2  (ARM64E)
cpus:               6 cores / 6 threads
memory:             0xf1200000  (3.8G)
page size:          0x4000  (16K)
```
Toolchain Details
-----
Makefile https://github.com/xsscx/srd/blob/main/SecurityResearchTools_20C80/usr/local/share/security-research-device/example-cryptex/Makefile

XNU Export
---
```
export XNU_VERSION=xnu-7195.141.2
```
X86_64
---
```
sysctl -a | grep Intel
machdep.cpu.brand_string: Intel(R) Core(TM) i5-1038NG7 CPU @ 2.00GHz
```
```
clang -v
Apple clang version 13.0.0 (clang-1300.0.29.3)
Target: X86_64-apple-darwin20.6.0
Thread model: posix
InstalledDir: /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin
```
M1 Apple Silicon
---
```
sysctl -a | grep M1
machdep.cpu.brand_string: Apple M1
```
```
clang -v
Apple clang version 13.0.0 (clang-1300.0.29.30)
Target: arm64-apple-darwin20.6.0
Thread model: posix
InstalledDir: /Applications/Xcode-beta.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin
```
SDK Targets
---
```
iOS SDK 15.2
```
Run Targets
---
```
SRD
iPhone 12 Pro Max
iPad 12 Pro
```
How-To Compile for iOS
-----
```
xcrun -sdk iphoneos clang -g -O2  -mios-version-min=14.3 -DDEBUG=0  -Wall -Wpedantic -Wno-gnu -Werror -Wunused-variable -o a.out code.s
```
* To ALL - Open a Discussion, PR or Issue with Suggestions, Comments, Bugs, Feedback, Tips etc..
* Collaborative Research
* All Code and Questions are Welcome 
* When you see Code Errors, Fails or LOL's.. Please Open an Issue... Thanks!

Please Contribute your Code & Ideas. Help us Prove the SRD Model. Results to be Posted rapidly.
--------------------------------------------------

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

Code Profiling Example
=======
```
PROFILE BUILD
clang -fprofile-instr-generate -fcoverage-mapping -mllvm -runtime-counter-relocation -g -fsanitize=undefined -O0 -o a.out code.c
PROFILE

LLVM_PROFILE_FILE=default.profraw ./a.out
xcrun llvm-profdata merge -sparse default.profraw -o a.profdata
xcrun llvm-cov show ./a.out -instr-profile=a.profdata

REPORT
xcrun llvm-cov show ./a.out -instr-profile=a.profdata --show-regions=0 -show-line-counts-or-regions -show-instantiation-summary
xcrun llvm-cov report ./a.out -instr-profile=a.profdata
sudo gcovr --gcov-executable "xcrun llvm-cov gcov" -r . --html --html-details -o out.html

RUN
	LLVM_PROFILE_FILE=default.profraw ./a.out

    1|       |#include <stdio.h>
    2|       |#include <os/log.h>
    3|       |#include <unistd.h>
    4|       |
    5|      1|int main() {
    6|      1|    pid_t pid = getpid();
    7|      1|	printf("Hello researcher from pid %d!\n", pid);
    8|      1|    os_log_t log = os_log_create("com.example.cryptex", "hello");
    9|      1|    os_log_info(log, "Hello researcher from pid %d!", pid);
   10|      1|	return 0;
   11|      1|}

Ds-Mac-mini:re xss$ xcrun llvm-cov show ./a.out -instr-profile=a.profdata --show-regions=0 -show-line-counts-or-regions -show-instantiation-summary
    1|       |#include <stdio.h>
    2|       |#include <os/log.h>
    3|       |#include <unistd.h>
    4|       |
    5|      1|int main() {
    6|      1|    pid_t pid = getpid();
    7|      1|	printf("Hello researcher from pid %d!\n", pid);
    8|      1|    os_log_t log = os_log_create("com.example.cryptex", "hello");
    9|      1|    os_log_info(log, "Hello researcher from pid %d!", pid);
   10|      1|	return 0;
   11|      1|}

xcrun llvm-cov report ./a.out -instr-profile=a.profdata
Filename                                         Regions    Missed Regions     Cover   Functions  Missed Functions  Executed       Lines      Missed Lines     Cover    Branches   Missed Branches     Cover
-------------------------------------------------------------------------------------------------------------------------------------------------------------
/Users/xss/example-cryptex/src/hello/hello.c           1                 0   100.00%           1                 0   100.00%           7                 0   100.00%           0                 0         -
-------------------------------------------------------------------------------------------------------------------------------------------------------------
TOTAL                                                  1                 0   100.00%           1                 0   100.00%           7                 0   100.00%           0                 0         -

```

Please Contribute Code to be run on the Apple Security Research Device

Thank You

Read about Pointer Authentication Failure at URL https://srd.cx/possible-pointer-authentication-failure-data-abort/

Read about debugserver for SRD at URL https://srd.cx/debugserver-installation-configuration/

