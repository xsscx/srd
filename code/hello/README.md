# Hello!

This is the landing page for Feedback FB9289266.

This is also the landing page for ASAN & UBSAN Example. See the Makefile.FB9289266 for the example. Send a PR when you do better! :-)

Wed - Sept 22, 2021 - We need the right mix of entitlements to allow for debugserver to attach to this simple hello.c code. 
Then, we need more examples of the Applications that we can attach to using debugserver. We need Apple to help us complete these tasks.

If you work at Apple, please give a Hoot, and reach out to me and help make this work.

I've taken to Wheel-of-Fortune for testing entitlements:
```
codesign -d -vvv --entitlements :- src/hello/hello
Executable=/Users/xss/srd/example-cryptex/src/hello/hello
Identifier=hello-55554944a75b880b5c373803afb132a464d549b8
Format=Mach-O thin (arm64e)
CodeDirectory v=20400 size=1031 flags=0x2(adhoc) hashes=21+7 location=embedded
Hash type=sha256 size=32
CandidateCDHash sha256=f87e33b0a6513573be2e44ef0d6c762be7d7dedf
CandidateCDHashFull sha256=f87e33b0a6513573be2e44ef0d6c762be7d7dedfbed368322dc91ff91df247b4
Hash choices=sha256
CMSDigest=f87e33b0a6513573be2e44ef0d6c762be7d7dedfbed368322dc91ff91df247b4
CMSDigestType=2
CDHash=f87e33b0a6513573be2e44ef0d6c762be7d7dedf
Signature=adhoc
Info.plist=not bound
TeamIdentifier=not set
Sealed Resources=none
Internal requirements count=0 size=12
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>com.apple.backboardd.debugapplications</key>
    <true/>
    <key>com.apple.backboardd.launchapplications</key>
    <true/>
    <key>com.apple.diagnosticd.diagnostic</key>
    <true/>
    <key>com.apple.frontboard.debugapplications</key>
    <true/>
    <key>com.apple.frontboard.launchapplications</key>
    <true/>
    <key>com.apple.security.network.client</key>
    <true/>
    <key>com.apple.security.network.server</key>
    <true/>
    <key>com.apple.springboard.debugapplications</key>
    <true/>
    <key>com.apple.system-task-ports</key>
    <true/>
    <key>get-task-allow</key>
    <true/>
    <key>platform-application</key>
    <true/>
    <key>run-unsigned-code</key>
    <true/>
    <key>task_for_pid-allow</key>
    <true/>
</dict>
</plist>
```
RESULTS
-------
```
default	10:59:01.957542-0400	debugserver	debugserver will use ASL for internal logging.
default	10:59:01.961209-0400	debugserver	1 +0.000000 sec [014e/0103]: error: ::posix_spawnp ( pid => 0, path = '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.voMtk8/usr/bin/hello', file_actions = 0x16d081ea0, attr = 0x16d081eb8, argv = 0x127f04610, envp = 0x127f04690 ) err = Operation not permitted (0x00000001)
default	10:59:01.961366-0400	debugserver	2 +0.000254 sec [014e/0103]: RNBRunLoopLaunchInferior DNBProcessLaunch() returned error: 'Operation not permitted'
error	10:59:01.961867-0400	kernel	Sandbox: debugserver(334) deny(1) process-fork
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


In this example we compile a simple binary that prints to
stdout and to the system log, and install a service to
run it again and again. The Makefile contains examples
for ASAN, UBSAN & other Sanitizers.

You can view this log from the Console application on your
Mac.

The binary is compiled and ad-hoc signed, then placed
into `/usr/bin` inside the cryptex. The
[launchd plist](hello.plist) is placed into
`/Library/LaunchDaemons` in the cryptex and will keep
starting `hello`.

