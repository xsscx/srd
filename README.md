# Welcome to Hoyt's SRD Repo for the Apple Security Research Device. (SRD) Repo by SRD0009

--------------------------------------------------
SRD | 19B74 | Signed File: iPhone11,8,iPhone12,1_15.1_19B74_Restore.ipsw | defaults write com.apple.AMPDevicesAgent ipsw-variant -string 'Research Customer Erase Install (IPSW)' | Found variant: Research Customer Erase Install (IPSW)

SRD | 19C5026i | Signed File: iPhone11,8,iPhone12,1_15.2_19C5026i_Restore.ipsw | defaults write com_apple_AMPDevicesAgent ipsw-variant -string 'Research Developer Erase Install (IPSW)'

See URL https://github.com/xsscx/srd/tree/main/dmg

There are typically 2 DMG's available that are Compiled for the Mainline and Beta Trains.

Open an Issue or PR if you want Code included in the available DMG's.

Added the Entitlement research.com.apple.license-to-operate to debugserver

Welcome
-----
Welcome to Hoyt's SRD Repo for the Apple Security Research Device.

The Target iOS ranges is iOS15. The Target Platform is iPhone 11 which is aka iPhone 12,1. The Model Number is MWL72LL/A. Help us Prove the SRD Model with a PR or Issue. 

Crowdsource: Proof & Audit for the Apple Security Research Device. Create a PR, send a DM or Tweet.  Help us Validate & Proof the Apple SRD. Your Ideas can be a Proof for the SRD. All Result to be Published into the Public Domain immediately.

Read about Pointer Authentication Failure at URL https://srd.cx/possible-pointer-authentication-failure-data-abort/
Read about debugserver for SRD at URL https://srd.cx/debugserver-installation-configuration/

Here is where you start your Instrumentation:
```
groups
wheel daemon kmem sys tty operator procview procmod staff certusers admin
uname -a
Darwin iPhone 21.1.0 Darwin Kernel Version 21.1.0: Wed Oct 13 18:16:58 PDT 2021; root:xnu-8019.42.4~1/RELEASE_ARM64_T8030 iPhone12,1 Toybox
 whoami
root
```

This Repo is Public Domain and I hope you will contribute your Code, Comments and Suggestions.

SRD Details
----------
```
Model: 		    MWL72LL/A
Model Name:         iPhone 11
release:            21.0.0
version:            Darwin iPhone 21.1.0 Darwin Kernel Version 21.1.0: Wed Oct 13 18:16:58 PDT 2021; root:xnu-8019.42.4~1/RELEASE_ARM64_T8030 iPhone12,1 Toybox
machine:            iPhone12,1
cpu type:           0x100000c  (arm64e)
cpu subtype:        0x2  (ARM64E)
cpus:               6 cores / 6 threads
memory:             0xf1200000  (3.8G)
page size:          0x4000  (16K)
```
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
Apple clang version 13.0.0 (clang-1300.0.29.3)
Target: arm64-apple-darwin20.6.0
Thread model: posix
InstalledDir: /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin
```
SDK Targets
---
```
iOS SDK 15
```
Run Targets
---
```
SRD
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

Please Contribute your Code & Ideas. Help us Prove the SRD Model. Results to be Posted rapidly.
--------------------------------------------------

