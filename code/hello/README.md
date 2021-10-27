# Hello!

October 25, 2021: In iOS 15.1 Apple added a new entitlement called research.com.apple.license-to-operate to support Frida and other research tools for the Apple Security Research Device. This entitlement allows tools to bypass the PPL codesigning protections and the usual task-port policies to inject code into any process running on the system (platform and non-platform).

RESULTS
-------
Its working better than it was :-)

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

