# SRD Cohort Research Image for Crytpex Information

Jumpstart your Research with Example DMG Files for a Cryptex
-----------
What is here?

DMG's with PoC's from Google Project Zero, ZecOps, ZDI and more.. all ready to (Crash). Most of these just express some form of Program Counter (PC Register) Control via 0x4141 ... 0x4242 ... 0xdeadbeef ... etc.. Some of the Code has been massaged or hand-rolled for your smoking enjoyment. All Credit goes to those Authors, I just happen to know a little C and Assembler then Built the DMG's for you!

```
#./a.out

Then, Go Open Xcode-beta and look at the Crash Report
```


What is here are multiple Cryptex with Working code examples already Compiled, Signed and Hand-Rolled with Care into a precious DMG for you to install to your SRD via cryptex for your enjoyment. 

```
Simple: Download the DMG, copy to ../example-cryptex/ .. follow the simple instructions below to complete the Cryptex Personalization & Isntallation.
```

Also included is debugserver with the signed entitlement and other goodies to you get thinking... reminder.. we're still sorting out debugserver and there is no working example.. so if you are the first to get it working on the SRD, please put together a PR with the details and consider a write-up for https://srd.cx.

```
If you are having issues with Compilation, Toolchain or have hit a wall, hit me up! I will compile your Code and Build a DMG with Installation Shell Script so everything is installed to your SRD automagically and you can FOCUS on Research.
```
Cohort Research Image File Listing from Example DMG
-----
```
tree bin/
bin/
├── aslr
├── binbag
├── c1.exr
├── c2.exr
├── chain3
├── crash.pvr
├── disarm
├── envprint
├── fuzzed.tif
├── hello-code-cov
├── hostname
├── image.jpeg
├── ioclass
├── ioprint
├── ioreg
├── ios-13_voucher_leak
├── ios-14-voucher_leak
├── ioscan
├── jtool2
├── leak64
├── libarchive.a
├── libmemctl_core.a
├── memctl
├── optool
├── orig.tif
├── skywalktest
├── stage0
├── stage1
├── stage2
├── vs_cli
└── welcome
```

-------------
How does the Installation of a Hand-Rolled DMG work?
```
Pro Tip: When working with cryptexctl, DO NOT USE XCODE, CLOSE XCODE, REBOOT SRD, then use cryptexctl! 
```
If you have read the Makefile and Documentation then you can download the dmg and put it in ../example-cryptex/ and use it. I'll Post a How-to here and on https://srd.cx with look at hand-rolling a cryptex, but, its very easy.. just look at the example in the Makefile.. there is an example DMG that has Toybox Unstripped for Debugging. There will be an Updated SRDCRI DMG Released very soon with Toybox Unstripped and other Instrumentation. If you have been following my Twitter Feed at https://twitter.com/h02332 you have seen some of the Build Issues that have been hit transitioning from the the X86_64 Build Pipeline to an Apple Silicon based Worlflow. 

Note that LLVM has not reached parity with the Coverage for ARM vs X86_64.

Ready to Isntall the SMG to a Cryptex now you have read some more information?

X86_64 Cryptex Installation 
------
Write-up with Pictures on the 2021 SRD Cohort Website at URL https://srd.cx/srd-cryptex-installation/ 
```
uname -a
Darwin xsss-MacBook-Pro.local 20.5.0 Darwin Kernel Version 20.5.0: Sat May  8 05:10:33 PDT 2021; root:xnu-7195.121.3~9/RELEASE_X86_64 x86_64
```
iPhone 12,1
```
uname -a
Darwin iPhone 20.6.0 Darwin Kernel Version 20.6.0: Sun Jun 20 22:50:32 PDT 2021; root:xnu-7195.140.39.0.1~13/RELEASE_ARM64_T8030 iPhone12,1
```
This is where I'm dropping you at in the Build Pipeline:
```
created: /Users/dhoyt/srd/share/security-research-device/example-cryptex/com.example.cryptex.dmg
```
Now you have this DMG, lets walk thru the hand-roll and smoke our fine cryptex.... 

This is how the Makefile does it.. no magic.. follow along.. if you get it.. cool.. but if not, Open an Issue, ping me on Slack, hit me up on Twitter.. this is a critical hurdle to get over...

Next Steps:
```
cryptexctl uninstall com.example.cryptex 
```
```
cryptexctl ${CRYPTEXCTL_FLAGS} create --replace ${CRYPTEXCTL_CREATE_FLAGS} -i com.example.cryptex -v H.O.Y.T com.example.cryptex.dmg
```
```
cryptexctl install com.example.cryptex.cptx 
```
```
cryptexctl list                            
com.example.cryptex
  version = H.O.Y.T
  device = /dev/disk2s1
  mount point = /private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.bAa5aS
```


---------
Do you want your Code loaded on an Example Cryptex for the SRD Cohort?

Open an Issue with a Link to your Code

Create a PR

Thanks!

```
We are all BLIND, so share the knowledge!! 
```
Reminder - ONLY use X86_64 for cryptex personalizations.

Last Updated: WED 14 July 2021 0000Z

Can someone from Apple (please) look at:
```
FB9221569 - iOS 15Beta2 and jetsam make Research nearly impossible..  
FB9221261 - debugserver crash - null hostname.. 
FB9223349 - debugserver crash - cryptex cwd.. 
FB9289266 - ASAN Compile Options -fsanitize=address for Command Line Cryptex results in dyld: dependent dylib not found, Xcode ASAN works fine.
FB9289266 - clang: error: unsupported option '-fsanitize=cfi' for target 'arm64e-apple-darwin20.5.0' 
FB9323197 - SRD | macOS 11.4 (20F71) | Xcode Version 13.0 beta (13A5155e) | UNCAUGHT EXCEPTION .. unrecognized selector
FB9326490 - SRD | macOS 11.4 (20F71) | 13A5155e | X86_64 | DDI | SecurityResearchTools
FB9331017 - 20F71 | 13A5155e | com.apple.dt.GitHubHostBuiltInExtension | malloc: Double free of object
```
SRD Cohort - See Bug Reports at https://srdcx.atlassian.net/jira/software/c/projects/SRDBUGS/issues/

Example DMG's for multiple Toolchains and iOS Flavors... 

IF you need help.. start by Connecting with me on Twitter @h02332 https://twitter.com/h02332 and I'll get you on the Slack Channel.

OR.. Open an Issue .. Discussion.. Contribute Code.. Get in Touch! @h02332 on twitter

