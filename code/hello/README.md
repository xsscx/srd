# Hello!

This is the landing page for Feedback FB9289266

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

** Updated with Information from Apple Feedback

This Makefile is a work in progress.

Big THANK YOU to the person at Apple who is handling this Feedback Report... A+ information conveyed to Cohort.

This Directory will be the placeholder for the verified working example of hello.c for ASAN and UBSAN.

PR's welcome!

Updated Thrusday August 5, 2021 by DHOYT

This is the current work-in-progress status of implementing the Sanitizers..
```
Date/Time:           2021-08-04 17:15:36.3220 -0400
Launch Time:         2021-08-04 17:15:36.2873 -0400
OS Version:          iPhone OS 14.7.1 (18G82)
Release Type:        User
Baseband Version:    2.05.01
Report Version:      104

Exception Type:  EXC_CRASH (SIGABRT)
Exception Codes: 0x0000000000000000, 0x0000000000000000
Exception Note:  EXC_CORPSE_NOTIFY
Termination Reason: DYLD; [1]
dyld: Using shared cache: 7E549C44-E1FA-3857-8557-930654B7D002
dependent dylib '@rpath/libclang_rt.ubsan_ios_dynamic.dylib' not found for '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.MxTb9f/usr/bin/hello', tried but didn't find: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.MxTb9f/usr/bin//libclang_rt.ubsan_ios_dynamic.dylib' '/Applications/Xcode-beta.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/13.0.0/lib/darwin/libclang_rt.ubsan_ios_dynamic.dylib' '@rpath/libclang_rt.ubsan_ios_dynamic.dylib' '/usr/local/lib/libclang_rt.ubsan_ios_dynamic.dylib' '/usr/lib/libclang_rt.ubsan_ios_dynamic.dylib'

Highlighted by Thread:  0

Backtrace not available

No thread state (register information) available

Binary Images:
Binary images description not available

Error Formulating Crash Report:_dyld_process_info_create failed with 6
Failed to create CSSymbolicatorRef - corpse still valid ¯\_(ツ)_/¯
Failed to extract dyld error info: The size of the data is not what is expected

EOF

```
