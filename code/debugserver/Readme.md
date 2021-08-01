# Landing for debugserver

Still working on the right mix of entitlements to make debugserver work on the Apple Security Research Device.

Feedback ID's: FB9289266, FB9436327 & Others.. 

```
hdiutil attach /Applications/Xcode-beta.app//Contents/Developer/Platforms/iPhoneOS.platform/DeviceSupport/14.5/DeveloperDiskImage.dmg
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
```
# ps ax|grep simple
  170   ??  Ss     0:00.01 /private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.hleZZ9/usr/bin/simple-server
  172   ??  Ss     0:00.01 /private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.hleZZ9/usr/bin/simple-shell
  301 s000  R+     0:00.00 grep simple
```
```
# ./debugserver *:1921 --attach=170
debugserver-@(#)PROGRAM:LLDB  PROJECT:lldb-1205.2.13
 for arm64.
Attaching to process 170...
error: failed to attach process 170: unable to start the exception thread
Exiting.
```
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
