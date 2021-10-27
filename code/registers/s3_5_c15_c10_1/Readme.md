# iPhone 11 Register Fuzzing on the Apple Security Research Device as 'root' from the cryptex

M1RACLES Bug aka CVE-2021-30747

CAVEAT: User = root and I'm Side-loading executable code onto the device with arbitrary entitlements at the same permission level as Apple operating system components.

```
IPSW: iPhone11,8,iPhone12,1_14.7_18G5052d_Restore.ipsw

uname -a
Darwin iPhone 20.6.0 Darwin Kernel Version 20.6.0: Sun Jun 20 22:50:32 PDT 2021; root:xnu-7195.140.39.0.1~13/RELEASE_ARM64_T8030 iPhone12,1

id
uid=1473273909(root) gid=0(wheel) groups=0(wheel),1(daemon),2(kmem),3(sys),4(tty),5(operator),8(procview),9(procmod),20(staff),29(certusers),80(admin)

id -G
0 1 2 3 4 5 8 9 20 29 80

 id -g
0

```
### Please Contribute to the iPhone 11 Register Fuzzing Project

Reference: M1 Apple Silicon SPRR Permission Checks https://github.com/xsscx/macos-research/tree/main/sprr

This Public Domain Repo is meant to Document the Results of Testing the iPhone 11 Registers. I can not find any similar resource.

IF you are Landing here, the Code is run on an Apple Security Research Device. 

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

Please contribute Code and Knowledge into the Public Domain.


RESULT
------
```
./s3_5_c15_c10_1-flip
Flipped Register s3_5_c15_c10_1 bit 00: 0000000000000001
Flipped Register s3_5_c15_c10_1 bit 01: 0000000000000002
Flipped Register s3_5_c15_c10_1 bit 02: 0000000000000000
Flipped Register s3_5_c15_c10_1 bit 03: 0000000000000000
Flipped Register s3_5_c15_c10_1 bit 04: 0000000000000000
Flipped Register s3_5_c15_c10_1 bit 05: 0000000000000000
Flipped Register s3_5_c15_c10_1 bit 06: 0000000000000000
Flipped Register s3_5_c15_c10_1 bit 07: 0000000000000000
Flipped Register s3_5_c15_c10_1 bit 08: 0000000000000000
Flipped Register s3_5_c15_c10_1 bit 09: 0000000000000000
Flipped Register s3_5_c15_c10_1 bit 10: 0000000000000000
Flipped Register s3_5_c15_c10_1 bit 11: 0000000000000000
Flipped Register s3_5_c15_c10_1 bit 12: 0000000000000000
Flipped Register s3_5_c15_c10_1 bit 13: 0000000000000000
Flipped Register s3_5_c15_c10_1 bit 14: 0000000000000000
Flipped Register s3_5_c15_c10_1 bit 15: 0000000000000000
Flipped Register s3_5_c15_c10_1 bit 16: 0000000000000000
Flipped Register s3_5_c15_c10_1 bit 17: 0000000000000000
Flipped Register s3_5_c15_c10_1 bit 18: 0000000000000000
Flipped Register s3_5_c15_c10_1 bit 19: 0000000000000000
Flipped Register s3_5_c15_c10_1 bit 20: 0000000000000000
Flipped Register s3_5_c15_c10_1 bit 21: 0000000000000000
Flipped Register s3_5_c15_c10_1 bit 22: 0000000000000000
Flipped Register s3_5_c15_c10_1 bit 23: 0000000000000000
Flipped Register s3_5_c15_c10_1 bit 24: 0000000000000000
Flipped Register s3_5_c15_c10_1 bit 25: 0000000000000000
Flipped Register s3_5_c15_c10_1 bit 26: 0000000000000000
Flipped Register s3_5_c15_c10_1 bit 27: 0000000000000000
Flipped Register s3_5_c15_c10_1 bit 28: 0000000000000000
Flipped Register s3_5_c15_c10_1 bit 29: 0000000000000000
Flipped Register s3_5_c15_c10_1 bit 30: 0000000000000000
Flipped Register s3_5_c15_c10_1 bit 31: 0000000000000000
Flipped Register s3_5_c15_c10_1 bit 32: 0000000000000000
Flipped Register s3_5_c15_c10_1 bit 33: 0000000000000000
Flipped Register s3_5_c15_c10_1 bit 34: 0000000000000000
Flipped Register s3_5_c15_c10_1 bit 35: 0000000000000000
Flipped Register s3_5_c15_c10_1 bit 36: 0000000000000000
Flipped Register s3_5_c15_c10_1 bit 37: 0000000000000000
Flipped Register s3_5_c15_c10_1 bit 38: 0000000000000000
Flipped Register s3_5_c15_c10_1 bit 39: 0000000000000000
Flipped Register s3_5_c15_c10_1 bit 40: 0000000000000000
Flipped Register s3_5_c15_c10_1 bit 41: 0000000000000000
Flipped Register s3_5_c15_c10_1 bit 42: 0000000000000000
Flipped Register s3_5_c15_c10_1 bit 43: 0000000000000000
Flipped Register s3_5_c15_c10_1 bit 44: 0000000000000000
Flipped Register s3_5_c15_c10_1 bit 45: 0000000000000000
Flipped Register s3_5_c15_c10_1 bit 46: 0000000000000000
Flipped Register s3_5_c15_c10_1 bit 47: 0000000000000000
Flipped Register s3_5_c15_c10_1 bit 48: 0000000000000000
Flipped Register s3_5_c15_c10_1 bit 49: 0000000000000000
Flipped Register s3_5_c15_c10_1 bit 50: 0000000000000000
Flipped Register s3_5_c15_c10_1 bit 51: 0000000000000000
Flipped Register s3_5_c15_c10_1 bit 52: 0000000000000000
Flipped Register s3_5_c15_c10_1 bit 53: 0000000000000000
Flipped Register s3_5_c15_c10_1 bit 54: 0000000000000000
Flipped Register s3_5_c15_c10_1 bit 55: 0000000000000000
Flipped Register s3_5_c15_c10_1 bit 56: 0000000000000000
Flipped Register s3_5_c15_c10_1 bit 57: 0000000000000000
Flipped Register s3_5_c15_c10_1 bit 58: 0000000000000000
Flipped Register s3_5_c15_c10_1 bit 59: 0000000000000000
Flipped Register s3_5_c15_c10_1 bit 60: 0000000000000000
Flipped Register s3_5_c15_c10_1 bit 61: 0000000000000000
Flipped Register s3_5_c15_c10_1 bit 62: 0000000000000000
Flipped Register s3_5_c15_c10_1 bit 63: 0000000000000000
```
