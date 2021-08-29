# Landing for debugserver on Apple Security Research Device

Still working on the right mix of entitlements to make debugserver work on the Apple Security Research Device.
As of August 29, 2021, the 2021 SRD Cohort has waited 221 Days for deb ugserver to work.

Feedback ID's: FB9289266, FB9436327 & Others.. Main Feedback == FB9436327

# Attach the 15.0 SDK DDI
```
hdiutil attach /Applications/Xcode-beta.app//Contents/Developer/Platforms/iPhoneOS.platform/DeviceSupport/15.0/DeveloperDiskImage.dmg
```

```
shasum /Volumes/DeveloperDiskImage/usr/bin/debugserver
d1b2b2e6a8749d18a0d3db5f213b870e8f5fb34a  /Volumes/DeveloperDiskImage/usr/bin/debugserver
```
```
% shasum ~/srd/example-cryptex/src/debugserver/debugserver
54c3f97acd2db82a416816705c728787cb1699fa  /Users/xss/srd/example-cryptex/src/debugserver/debugserver
```
```
% cp /Volumes/DeveloperDiskImage/usr/bin/debugserver ~/srd/example-cryptex/src/debugserver
```
```
% shasum ~/srd/example-cryptex/src/debugserver/debugserver
d1b2b2e6a8749d18a0d3db5f213b870e8f5fb34a  /Users/xss/srd/example-cryptex/src/debugserver/debugserver
```
# Result 1
```
 cd /private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.TEzNH3/usr/bin
 ps ax|grep simple
  304   ??  Ss     0:00.01 /private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.TEzNH3/usr/bin/simple-server
  306   ??  Ss     0:00.01 /private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.TEzNH3/usr/bin/simple-shell
  332 s000  R+     0:00.01 grep simple
 ./debugserver *:1921 --attach=306
debugserver-@(#)PROGRAM:LLDB  PROJECT:lldb-1205.2.13
 for arm64.
Attaching to process 306...
 date
Thu Aug 26 11:41:18 EDT 2021
 ./debugserver *:1921 --attach=306
debugserver-@(#)PROGRAM:LLDB  PROJECT:lldb-1205.2.13
 for arm64.
Attaching to process 306...
(CRASH of debugserver - see Crash Report)
 date
Thu Aug 26 11:41:27 EDT 2021
 uname -a
Darwin iPhone-11 21.0.0 Darwin Kernel Version 21.0.0: Tue Aug 17 15:54:23 PDT 2021; root:xnu-8019.12.5~3/RELEASE_ARM64_T8030 iPhone12,1
```

# Result 2
```
 ps ax|grep simple
  307   ??  Ss     0:00.01 /private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.W9wsad/usr/bin/simple-server
  309   ??  Ss     0:00.01 /private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.W9wsad/usr/bin/simple-shell
  324 s000  R+     0:00.01 grep simple
 ./debugserver *:1921 --attach=309
debugserver-@(#)PROGRAM:LLDB  PROJECT:lldb-1300.2.10
 for arm64.
Attaching to process 309...
error: failed to attach process 309: unable to start the exception thread
Exiting.
 ./debugserver *:1921 --attach=307
debugserver-@(#)PROGRAM:LLDB  PROJECT:lldb-1300.2.10
 for arm64.
Attaching to process 307...
error: failed to attach process 307: unable to start the exception thread
Exiting.
 uname -a
Darwin iPhone-11 21.0.0 Darwin Kernel Version 21.0.0: Tue Aug 17 15:54:23 PDT 2021; root:xnu-8019.12.5~3/RELEASE_ARM64_T8030 iPhone12,1
 date
Thu Aug 26 12:04:58 EDT 2021
```
# Crash Report
```
Hardware Model:      iPhone12,1
Process:             debugserver [338]
Path:                /private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.TEzNH3/usr/bin/debugserver
Identifier:          debugserver
Version:             ???
Code Type:           ARM-64 (Native)
Role:                Unspecified
Parent Process:      sh [323]
Coalition:           com.example.cryptex.sshd [491]

Date/Time:           2021-08-26 11:41:24.9974 -0400
Launch Time:         2021-08-26 11:41:24.2901 -0400
OS Version:          iPhone OS 15.0 (19A5337a)
Release Type:        Beta
Baseband Version:    3.00.00
Report Version:      104

Exception Type:  EXC_BAD_ACCESS (SIGSEGV)
Exception Subtype: KERN_INVALID_ADDRESS at 0x002000010257ce18 -> 0x000000010257ce18 (possible pointer authentication failure)
Exception Codes: 0x0000000000000001, 0x002000010257ce18
VM Region Info: 0x10257ce18 is in 0x10257c000-0x102588000;  bytes after start: 3608  bytes before end: 45543
      REGION TYPE                 START - END      [ VSIZE] PRT/MAX SHRMOD  REGION DETAIL
      __TEXT                   102504000-10257c000 [  480K] r-x/r-x SM=COW  ...n/debugserver
--->  __DATA_CONST             10257c000-102588000 [   48K] r--/rw- SM=COW  ...n/debugserver
      __DATA                   102588000-102994000 [ 4144K] rw-/rw- SM=COW  ...n/debugserver
Exception Note:  EXC_CORPSE_NOTIFY
Termination Reason: SIGNAL; [11]
Terminating Process: exc handler [338]

Terminating Process: exc handler [338]
Triggered by Thread:  0

Thread 0 name:  main thread Dispatch queue: com.apple.main-thread
Thread 0 Crashed:
0   libc++.1.dylib                	       0x19c485b0c std::__1::__shared_weak_count::__release_weak+ 47884 () + 44
1   debugserver                   	       0x102511a24 0x102504000 + 55844
2   debugserver                   	       0x10250c698 0x102504000 + 34456
3   debugserver                   	       0x10250e768 0x102504000 + 42856
4   dyld                          	       0x102a69a24 start + 520


Thread 0 crashed with ARM Thread State (64-bit):
    x0: 0x0000000103a04470   x1: 0x0000000104009200   x2: 0x0000000104000000   x3: 0x0000000000000800
    x4: 0x0000000000000120   x5: 0x0000000103904470   x6: 0x0000000000000029   x7: 0x000000000000003e
    x8: 0x0000000103a04480   x9: 0x0000000000000000  x10: 0x0000000000000000  x11: 0x0000000000000a00
   x12: 0x0000000000000001  x13: 0x0000000104000000  x14: 0x0000000000000001  x15: 0x0000000000000002
   x16: 0x002000010257cdf8  x17: 0x634f000103a04470  x18: 0x0000000000000000  x19: 0x0000000103a04470
   x20: 0x0000000000000400  x21: 0x000000016d8fa818  x22: 0x0000000000000000  x23: 0x0000000000000000
   x24: 0x0000000104009200  x25: 0x0000000000000001  x26: 0x000000007fffffff  x27: 0x00000001038120d0
   x28: 0x0000000000000000   fp: 0x000000016d8fa7f0   lr: 0x0000000102511a24
    sp: 0x000000016d8fa490   pc: 0x000000019c485b0c cpsr: 0x60000000
   far: 0x002000010257ce18  esr: 0x92000004 (Data Abort) byte read Translation fault

Binary Images:
       0x19c47a000 -        0x19c4ddfff libc++.1.dylib arm64e  <15095115b2ab37719e86897521087066> /usr/lib/libc++.1.dylib
       0x102504000 -        0x10257bfff debugserver arm64e  <54186028cc6b35dfaf1be2fd9ab24404> /private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.TEzNH3/usr/bin/debugserver
       0x102a50000 -        0x102aa7fff dyld arm64e  <1602b2f2df6234128bc6ece21486c3e0> /usr/lib/dyld
               0x0 - 0xffffffffffffffff ??? unknown-arch  <00000000000000000000000000000000> ???

EOF

```

In other news.... Code Coverage works.. -fprofile-instr-generate -fcoverage-mapping
```
 pwd
/private/var/root
 LLVM_PROFILE_FILE="foo.profraw" /private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.YzdC1G/usr/bin/hello-code-cov
Hello researcher from pid 8749!
 ls -la foo.profraw
-rw-r--r--  1 root wheel  160 2021-07-08 16:52 foo.profraw
```

BUT.. CFI doesn't work on ARM.. this is something I didn't know..
```
clang: error: unsupported option '-fsanitize=cfi' for target 'arm64e-apple-darwin20.5.0'

```
