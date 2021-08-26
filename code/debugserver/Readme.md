# Landing for debugserver

Still working on the right mix of entitlements to make debugserver work on the Apple Security Research Device.

Feedback ID's: FB9289266, FB9436327 & Others.. 

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
 date
Thu Aug 26 11:41:27 EDT 2021
 uname -a
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
# sysdiagnose
```

```
Code Coverage works.. -fprofile-instr-generate -fcoverage-mapping

# pwd
/private/var/root
# LLVM_PROFILE_FILE="foo.profraw" /private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.YzdC1G/usr/bin/hello-code-cov
Hello researcher from pid 8749!
# ls -la foo.profraw
-rw-r--r--  1 root wheel  160 2021-07-08 16:52 foo.profraw
```
```
BUT.. CFI doesn't work on ARM.. this is something I didn't know..

clang: error: unsupported option '-fsanitize=cfi' for target 'arm64e-apple-darwin20.5.0'

https://twitter.com/h02332/status/1413295796301275136
```
