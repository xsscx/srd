### SRD Code Repo

Hello! This is my SRD Repo and the iPhone 11 Public Domain Register Fuzzing Project using the Apple Security Research Device, the Apple SRD.

Read about Pointer Authentication Failure at URL https://srd.cx/possible-pointer-authentication-failure-data-abort/

Read about debugserver for SRD at URL https://srd.cx/debugserver-installation-configuration/

Please contribute your Code, Project, Comments, Pro Tips or anything.... Open an Issue or PR.

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
