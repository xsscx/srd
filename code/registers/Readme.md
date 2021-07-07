### Contribute to the iPhone 11 Register Fuzzing Project

Reference: M1 Apple Silicon SPRR Permission Checks https://github.com/xsscx/macos-research/tree/main/sprr

This Public Domain Repo is meant to Document the Results of Testing the iPhone 11 Registers. 

DATAPOINT: https://gist.github.com/bazad/42054285391c6e0dcd0ede4b5f969ad2
DATAPOINT: https://github.com/xsscx/srd/blob/main/code/registers/data/iphone11-registers-cleaned-uniq-fuzz-input-001.txt

Summary as of 6 June 2021
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

iPhone 11 Register Tests
=========
CAVEAT: User = root and I'm Side-loading executable code onto the device with arbitrary entitlements at the same permission level as Apple operating system components.
```
Hardware Model:      iPhone12,1
iPhone OS 14.7 (18G5052d)
uname -a
Darwin iPhone 20.6.0 Darwin Kernel Version 20.6.0: Sun Jun 20 22:50:32 PDT 2021; root:xnu-7195.140.39.0.1~13/RELEASE_ARM64_T8030 iPhone12,1
```
```

* Results of Accessing a restricted system register from an application generates an exception and ends up in SIGILL being delivered to the process

Repo in Development.. Feel Free to Open Issues, Ask Questions and Contribute Code to be run on the SRD.

Check out the 2021 SRD Cohort Website at https://srd.cx

## CODE CONTRIBUTIONS ACCEPTED

Do you want to see your Code run on an SRD? Malware? Scareware? Sure.... Give us some Fresh Meat! 
Ninja? Include your entitlements.plist so we can use a Hammer with your Code.. 

Contribute your Code to be Run on the Apple SRD, we will Post the Results quickly :-)


Caveat - This Code is targeted to Apple Security Research Device Holders and Your Mileage May Vary if you do not posess a SRD.

