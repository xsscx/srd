# SRD Cohort Example DMG for Crytpex

Jumpstart your Research with Example DMG Files for a Cryptex
-----------

# Updated October 5, 2021 - Now that I've Rolled my SRD up to iOS 15, I've deleted all the iOS14.x DMG's. 

I've updated ToyBox Unstripped too!

Everything in this RTFM comes from the Makefile. If you do not recognize the manual commands below, look at the Makefile and this will be obvious. Apple failed to include Toybox Unstripped Binary to aid in debugging.

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
hdiutil create -fs hfs+ -srcfolder com.example.cryptex.dstroot toyboxunstripped.dmg
```
```
created: /Users/dhoyt/srd/share/security-research-device/example-cryptex/toyboxunstripped.dmg
```
Now you have this DMG, lets walk thru the hand-roll and smoke our fine cryptex.... this is the whole process.. you have a DMG, so lets get it installed. I start off doing this for you.....
```
rm  com.example.cryptex.dmg
```
```
sudo cp src/toybox/toybox-src/generated/unstripped/toybox com.example.cryptex.dstroot/usr/bin
```
```
codesign --force -s "7B2FD6D3A142A993E0519EBDF8AE859904C584E8"  com.example.cryptex.dstroot/usr/bin/toybox
```
```
hdiutil create -fs hfs+ -srcfolder com.example.cryptex.dstroot toyboxunstripped.dmg
```
This is where you start with the SRDC DMG Example Cryptex:
```
cryptexctl ${CRYPTEXCTL_FLAGS} create --replace ${CRYPTEXCTL_CREATE_FLAGS} -i com.example.cryptex -v 1.3.3.7 toyboxunstripped.dmg
```
```
cryptexctl install com.example.cryptex.cptx
```
```
cryptexctl list
com.example.cryptex
  version = 1.3.3.7
  device = /dev/disk2s1
  mount point = /private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.8Ug7XY
```
You now have the ToyBox Unstripped Binary that that has Symbols. They may even work with the latest iOS Beta :-)
```
id -n
uid=6315365(root) gid=0(wheel) groups=0(wheel),1(daemon),2(kmem),3(sys),4(tty),5(operator),8(procview),9(procmod),20(staff),29(certusers),80(admin)
```
```
id -r
uid=78667109(root) gid=0(wheel) groups=0(wheel),1(daemon),2(kmem),3(sys),4(tty),5(operator),8(procview),9(procmod),20(staff),29(certusers),80(admin)
```
