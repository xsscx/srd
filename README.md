# Welcome to Hoyt's SRD Repo for the Apple Security Research Device
Follow this Repo and read URL https://srd.cx/srd-cryptex-installation/

```
Latest SRD0009 IPSW 17-DEC-2021: iPhone11,8,iPhone12,1_15.3_19D5026g_Restore.ipsw
Latest SRD0037 IPSW 17-DEC-2021: iPhone13,2,iPhone13,3_15.3_19D5026g_Restore.ipsw
```
X86_64 and/or M1 ARM: Updated the IPSW + performed cryptex installation.

Do you have questions or need help? Reach out and open an Issue or Discussion. DM if that's easier.

# Cryptex DMG's for Mainline & Developer Trains
SRD | 19C56 | Signed File: iPhone11,8,iPhone12,1_15.2_19C56_Restore.ipsw | defaults write com.apple.AMPDevicesAgent ipsw-variant -string 'Research Customer Erase Install (IPSW)' 

SRD | 19D5026g | Signed File: iPhone11,8,iPhone12,1_15.3_19D5026g_Restore.ipsw | defaults write com.apple.AMPDevicesAgent ipsw-variant -string 'Research Developer Erase Install (IPSW)'

SRD | 19D5026g | Signed File: iPhone13,2,iPhone13,3_15.3_19D5026g_Restore.ipsw | defaults write com.apple.AMPDevicesAgent ipsw-variant -string 'Research Developer Erase Install (IPSW)'

See URL https://github.com/xsscx/srd/tree/main/dmg

There are typically 2 DMG's available that are Compiled for the Mainline and Beta Trains.

# What's Here

My Security Research Tools SRT20C80 Code - See Issue #17 for Details https://github.com/apple/security-research-device/issues/17. All the examples for the SRD are based on SRT20C80 and macOS11.6.x to keep things simple, easy and quick.

Sample Code for the SRD

Cryptex DMG's built with Toybox Unstripped and includes debugserver, jtool2, binbag, ioscan, ioprint and more...

PoC's on the DMG that Crash, are Broken and Programs that write Hello researcher from pid xxx!


Toolchain Details
-----
Makefile https://github.com/xsscx/srd/blob/main/SecurityResearchTools_20C80/usr/local/share/security-research-device/example-cryptex/Makefile

XNU Export
---
```
export XNU_VERSION=xnu-7195.141.2
```
X86_64
---
```
sysctl -a | grep Intel
machdep.cpu.brand_string: Intel(R) Core(TM) i5-1038NG7 CPU @ 2.00GHz
```
```
clang -v
Apple clang version 13.0.0 (clang-1300.0.29.3)
Target: X86_64-apple-darwin20.6.0
Thread model: posix
InstalledDir: /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin
```
M1 Apple Silicon
---
```
sysctl -a | grep M1
machdep.cpu.brand_string: Apple M1
```
```
clang -v
Apple clang version 13.0.0 (clang-1300.0.29.30)
Target: arm64-apple-darwin20.6.0
Thread model: posix
InstalledDir: /Applications/Xcode-beta.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin
```
SDK Targets
---
```
iOS SDK 15.2
```
Run Targets
---
```
SRD's - iPhone 11 and iPhone 12
iPhone 12 Pro Max
iPad 12 Pro
```
How-To Compile for iOS
-----
```
xcrun -sdk iphoneos clang -g -O2  -mios-version-min=14.3 -DDEBUG=0  -Wall -Wpedantic -Wno-gnu -Werror -Wunused-variable -o a.out code.s
```
* To ALL - Open a Discussion, PR or Issue with Suggestions, Comments, Bugs, Feedback, Tips etc..
* Collaborative Research
* All Code and Questions are Welcome 
* When you see Code Errors, Fails or LOL's.. Please Open an Issue... Thanks!

Read about Pointer Authentication Failure at URL https://srd.cx/possible-pointer-authentication-failure-data-abort/

Read about debugserver for SRD at URL https://srd.cx/debugserver-installation-configuration/
