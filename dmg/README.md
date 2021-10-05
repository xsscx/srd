# SRD Cohort Example DMG for Crytpex

Jumpstart your Research with Example DMG Files for a Cryptex
-----------

# Updated October 5, 2021 - Now that I've Rolled my SRD up to iOS 15, I've deleted all the iOS14.x DMG's. 

I'll update ToyBox Unstripped shortly.. and I'll include the latest debugserver that is partially working.

What will be back on the iOS 15 SRDC DMG's from Cryptex?

DMG's with PoC's from Google Project Zero, ZecOps, ZDI and more.. all ready to (Crash). Most of these just express some form of Program Counter (PC Register) Control via 0x4141 ... 0x4242 ... 0xdeadbeef ... etc.. Some of the Code has been massaged or hand-rolled for your smoking enjoyment. All Credit goes to those Authors, I just happen to know a little C and Assembler then Built the DMG's for you!

```
#./a.out

Then, Go Open Xcode and look at the Crash Report
```
What is here are multiple Cryptex with Working code examples already Compiled, Signed and Hand-Rolled with Care into a precious DMG for you to install to your SRD via cryptex for your enjoyment. 

Download the DMG, copy to ../example-cryptex/ .. follow the simple instructions below to complete the Cryptex Personalization & Installation.

UPDATE ** Also included is debugserver with the signed entitlement and other goodies to you get thinking... reminder.. we're still sorting out debugserver and there is no working example.. so if you are the first to get it working on the SRD, please put together a PR with the details and consider a write-up for https://srd.cx.

```
If you are having issues with Compilation, Toolchain or have hit a wall, hit me up! I will compile your Code and Build a DMG with Installation Shell Script so everything is installed to your SRD automagically and you can FOCUS on Research.
```
Cohort Research Image File Listing from Example DMG
-----
```
tree bin
├── a.out
├── aslr
├── binbag
├── c1.exr
├── c2.exr
├── chain3
├── crash.pvr
├── disarm
├── envprint
├── fuzzed.tif
├── hello
├── hello-code-cov
├── hello_world
├── hellosan
├── hostname
├── image.jpeg
├── ioclass
├── ioprint
├── ioreg
├── ios-13_voucher_leak
├── ios-14-voucher_leak
├── ios-command-line-tool
├── ioscan
├── jtool2
├── leak64
├── libarchive.a
├── libgmalloc.dylib
├── libmemctl_core.a
├── lister
├── memctl
├── optool
├── orig.tif
├── port_refs
├── prinfkernversion
├── skywalktest
├── stage0
├── stage1
├── stage2
├── test1
├── test2
├── test3
├── test4
├── test6
├── test7
├── test8
├── tester
├── vs_cli
└── welcome
```
```
tree -L 1 src
src
├── cryptex-run
├── debugserver
├── dropbear
├── hello
├── simple-server
├── simple-shell
├── toybox
└── welcome

8 directories, 0 files
```

-------------
How does the Installation of a Hand-Rolled DMG work?
```
Pro Tip: Prior to working with cryptexctl, Close Xcode and Reboot the SRD, then do your workflow with cryptexctl. 
```
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
Below is my entire CopyPasta for manually copying, signing and installing toybox unstripped on the cryptex.
```
 example-cryptex % sudo cp src/toybox/toybox-src/generated/unstripped/toybox com.example.cryptex.dstroot/usr/bin

 example-cryptex % export CRYPTEXCTL_UDID=00008030-001538D03C40012E

 example-cryptex % cryptexctl uninstall com.example.cryptex

 example-cryptex % codesign --force -s "7B2FD6D3A142A993E0519EBDF8AE859904C584E8"  com.example.cryptex.dstroot/usr/bin/toybox

 example-cryptex % cryptexctl ${CRYPTEXCTL_FLAGS} create --replace ${CRYPTEXCTL_CREATE_FLAGS} -i com.example.cryptex -v 1.3.3.7 com.example.cryptex.dmg

 example-cryptex % cryptexctl install com.example.cryptex.cptx

cryptexctl list
com.example.cryptex
  version = 1.3.3.7
  device = /dev/disk2s1
  mount point = /private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.4sDbV3


 example-cryptex % date
Thu Aug  5 08:26:09 EDT 2021

 example-cryptex % uname -a
Darwin Ds-Mac-mini-2.local 20.6.0 Darwin Kernel Version 20.6.0: Wed Jun 23 00:26:27 PDT 2021; root:xnu-7195.141.2~5/RELEASE_ARM64_T8101 arm64

 example-cryptex % clang -v
Apple clang version 13.0.0 (clang-1300.0.27.3)
Target: arm64-apple-darwin20.6.0
Thread model: posix
InstalledDir: /Applications/Xcode-beta.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin
 example-cryptex %
 
 root@srd's password:

# df
Filesystem                                                                                                                                1K-blocks    Used Available Use% Mounted on
com.apple.os.update-56A2FC8FDDAA1D9EA3D823F3290CB87EB308000348231FAC99C5DDE49869F56A0873FB7AE5E14008058B28F2EC5289CC@/dev/disk0s1s1        62435444 7333612  55101832  12% /
devfs                                                                                                                                            50      50         0 100% /dev
/dev/disk0s1s3                                                                                                                                10240    6164      4076  61% /private/xarts
/dev/disk0s1s6                                                                                                                             62435444  155060  62280384   1% /private/preboot
/private/preboot/56A2FC8FDDAA1D9EA3D823F3290CB87EB308000348231FAC99C5DDE49869F56A0873FB7AE5E14008058B28F2EC5289CC/usr/standalone/firmware  62435444  155060  62280384   1% /usr/standalone/firmware
/dev/disk0s1s2                                                                                                                             62435444 6951576  55483868  12% /private/var
/dev/disk0s1s4                                                                                                                                10240    1968      8272  20% /private/var/wireless/baseband_data
/dev/disk0s1s7                                                                                                                             62435444     948  62434496   1% /private/var/MobileSoftwareUpdate
/dev/disk0s1s5                                                                                                                                44032   20592     23440  47% /private/var/hardware
/private/var/hardware/Pearl/System/Library/Pearl/ReferenceFrames                                                                              44032   20592     23440  47% /System/Library/Pearl/ReferenceFrames
/private/var/hardware/FactoryData/System/Library/Caches/com.apple.factorydata                                                                 44032   20592     23440  47% /System/Library/Caches/com.apple.factorydata
/dev/disk2s1                                                                                                                                  23304   18464      4840  80% /private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.4sDbV3

# cd bin
# pwd
/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.4sDbV3/usr/bin

# uname -a
Darwin iPhone 20.6.0 Darwin Kernel Version 20.6.0: Mon Jun 21 21:23:35 PDT 2021; root:xnu-7195.140.42~10/RELEASE_ARM64_T8030 iPhone12,1

# whoami
root

# ls -la toybox
-r-xr-xr-x 1 mobile staff 403968 2021-08-04 17:21 toybox
#
```

Do you want your Code loaded on an Example Cryptex for the SRD Cohort?

Open an Issue with a Link to your Code

Create a PR

Thanks!

SRD Cohort - See Bug Reports at https://srdcx.atlassian.net/jira/software/c/projects/SRDBUGS/issues/
