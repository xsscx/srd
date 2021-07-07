### Contribute to the iPhone 11 Register Fuzzing Project

This Directory contains Code Snippets, you will probably find them useful.

File Summary
------
0xfffffc110-read.c - Read the Commpage

Code
```
#include <stdio.h>
#include <stdint.h>

int main(int argc, char *argv[])
{
  uint64_t *sprr = (uint64_t *)0xfffffc110;
  printf("%llx %llx\n", sprr[0], sprr[1]);
}
```

Results
```
2010000030300000 2010000030100000
```
iPhone 11 Register Summary as of 6 June 2021
------
```
s3_5_c15_c10_1      : 0x0000000000000000
s3_6_c15_c1_6       : 0x2020000030200000
```
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

The Code is CopyPasta from Sven Peter and I'm in the process of (slowly) refactoring the Code for iOS and the SRD. If you have ideas, or Code, and want to help get results, please make a PR, Issue or Discussion.

Note - I'm in learning mode, not a ninja. Your _input_ is requested.

Thank You
