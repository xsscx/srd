# Landing for debugserver

Still working on the right mix of entitlements to make debugserver work on the Apple Security Research Device.

Feedback ID: FB9289266
```
./sprr-srd-asan
dyld: dependent dylib '@rpath/libclang_rt.asan_ios_dynamic.dylib' not found for '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.WzpoMU/usr/bin/./sprr-srd-asan', tried but didn't find: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.WzpoMU/usr/bin/.//libclang_rt.asan_ios_dynamic.dylib' '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/12.0.5/lib/darwin/libclang_rt.asan_ios_dynamic.dylib' '@rpath/libclang_rt.asan_ios_dynamic.dylib' '/usr/local/lib/libclang_rt.asan_ios_dynamic.dylib' '/usr/lib/libclang_rt.asan_ios_dynamic.dylib'
```
Here is where I'm at:
```
# uname -a
Darwin iPhone 20.6.0 Darwin Kernel Version 20.6.0: Sun Jun 20 22:50:32 PDT 2021; root:xnu-7195.140.39.0.1~13/RELEASE_ARM64_T8030 iPhone12,1
# date
Wed Jul  7 22:05:33 EDT 2021
#
```
Ninja Instructions for setting up debugserver - I'll do a full walk-thru on setting up debugserver on https://srd.cx soon.....
```
ls /Applications/Xcode-beta.app//Contents/Developer/Platforms/iPhoneOS.platform/DeviceSupport/
10.0	10.1	10.2	10.3	11.0	11.1	11.2	11.3	11.4	12.0	12.1	12.2	12.3	12.4	13.0	13.1	13.2	13.3	13.4	13.5	13.6	13.7	14.0	14.1	14.2	14.3	14.4	14.5	15.0	9.0	9.1	9.2	9.3
```
```
ls /Applications/Xcode-beta.app//Contents/Developer/Platforms/iPhoneOS.platform/DeviceSupport/14.5/
DeveloperDiskImage.dmg			DeveloperDiskImage.dmg.signature
```
```
hdiutil attach /Applications/Xcode-beta.app//Contents/Developer/Platforms/iPhoneOS.platform/DeviceSupport/14.5/DeveloperDiskImage.dmg
Checksumming Whole_Disk…
.......................................................................................................................................................................................................................................................................................................................................................
                          Whole_Disk: verified   CRC32 $336540CD
verified   CRC32 $986A7090
/dev/disk4          	                               	/Volumes/DeveloperDiskImage
```
```
 cp /Volumes/DeveloperDiskImage/usr/bin/debugserver ~/example-cryptex/src/debugserver/
```
```
# ps ax|grep ios-play
 1477 s000  U+     0:00.00 grep ios-play
 1474 s001  R+     0:07.96 ./ios-play
# ./debugserver *:1921 --attach=1474
debugserver-@(#)PROGRAM:LLDB  PROJECT:lldb-1205.2.13
 for arm64.
Attaching to process 1474...
error: failed to attach process 1474: unable to start the exception thread
Exiting.
```
I've tried both the entitlements shown in the .plist files.. same result with both. Re-checked signing etc..

Resigned etc... codesign --force  -s -  src/debugserver/debugserver and the .plist
```

codesign -d --entitlements :- ~/example-cryptex/src/debugserver/debugserver
Executable=/Users/xss/example-cryptex/src/debugserver/debugserver

<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>com.apple.springboard.debugapplications</key>
    <true/>
    <key>com.apple.backboardd.launchapplications</key>
    <true/>
    <key>com.apple.backboardd.debugapplications</key>
    <true/>
    <key>com.apple.frontboard.launchapplications</key>
    <true/>
    <key>com.apple.frontboard.debugapplications</key>
    <true/>
    <key>seatbelt-profiles</key>
    <array>
        <string>debugserver</string>
    </array>
    <key>com.apple.private.logging.diagnostic</key>
    <true/>
    <key>com.apple.security.network.server</key>
    <true/>
    <key>com.apple.security.network.client</key>
    <true/>
    <key>com.apple.private.memorystatus</key>
    <true/>
    <key>com.apple.private.cs.debugger</key>
    <true/>
</dict>
</plist>
```
```
Code Coverage works.. 

# pwd
/private/var/root
# LLVM_PROFILE_FILE="foo.profraw" /private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.YzdC1G/usr/bin/hello-code-cov
Hello researcher from pid 8749!
# ls -la foo.profraw
-rw-r--r--  1 root wheel  160 2021-07-08 16:52 foo.profraw
```
