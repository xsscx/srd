### SRD Code Repo

Hello! This is my SRD Repo and the iPhone 11 Public Domain Register Fuzzing Project using the Apple Security Research Device, the Apple SRD.

Please contribute your Code, Project, Comments, Pro Tips or anything.... Open an Issue or PR.

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
* Results of Accessing a restricted system register from an application generates an exception and ends up in SIGILL being delivered to the process

Initial Commits contain the SPRR Code by Sven Peter for M1 Apple Silicon. The Code is being refactored for iOS. 

Also available is a TFTP Server ripped and canabalized for the SRD. TFTP Server & Client work perfectly for iOS 14.3 -> 14Beta7.

## iPhone 11 Register Fuzzing Code

On May 6, 2021 a Post by Sven Peter about Apple Silicon Hardware Secrets: SPRR and Guarded Exception Levels (GXF) at URL https://blog.svenpeter.dev/posts/m1_sprr_gxf/ appeared in my Timeline. I had just been reviewing https://github.com/AsahiLinux/m1n1/blob/main/tools/apple_regs.json.

For the M1 Apple Silicon Platform, I've Posted some Results at URL https://github.com/xsscx/macos-research/tree/main/sprr

What happens when we run the Code on an SRD???

This Repo answers the question.. what happens when we run Sven Peter's Code on the SRD... 

Repo in Development.. Feel Free to Open Issues, Ask Questions and Contribute Code to be run on the SRD.

Check out the 2021 SRD Cohort Website at https://srd.cx

## CODE CONTRIBUTIONS ACCEPTED

Do you want to see your Code run on an SRD? Malware? Scareware? Sure.... Give us some Fresh Meat! 
Ninja? Include your entitlements.plist so we can use a Hammer with your Code.. 

Contribute your Code to be Run on the Apple SRD, we will Post the Results quickly :-)

General ARM Info not specific to iOS
```
DATAPOINT https://www.kernel.org/doc/Documentation/arm64/cpu-feature-registers.txt
```
