# Welcome to Hoyt's SRD Repo for the Apple Security Research Device

If you want to skip the Build Toolchain and install a Cryptex from DMG, this Repo is for you.

TUESDAY 11 JAN 2022 - Repopulated the example SRD DMG with debugserver and the other PoC's as examples.
## Prerequisites
- macOS Version 12.1 (21C52)
- Xcode Version 13.2.1 (13C100)
- Security Research Tools 21C39 (SRT 21C39)
- GNU sed
- automake

If you use brew:

```sh
brew install gnu-sed automake
```
IPSW Status
```
Latest SRD0009 IPSW 17-DEC-2021: iPhone11,8,iPhone12,1_15.3_19D5026g_Restore.ipsw
Latest SRD0037 IPSW 17-DEC-2021: iPhone13,2,iPhone13,3_15.3_19D5026g_Restore.ipsw
```
The 'latest' means that from X86_64 and/or M1 ARM the SRD IPSW has been installed with cryptex installation.

Currently maintained are 2 Build Pipelines for X86_64 and M1 T8101 using macOS 11.6.x and 12.x to Build the example Cryptex DMG. Download the DMG at URL https://github.com/xsscx/srd/tree/main/dmg.

The example SRD Cryptex DMG is a universal cryptex and works on the iPhone 11 and iPhone 12 SRD Models. The sample SRD Cryptex has been tested on the iPhone 11 for all IPSW from the iOS 14.3 floor for the iPhone 11 up to the latest iOS 15.3 Beta. The sample SRD Cryptex has been tested on the iPhone 12 for all IPSW from the iOS 15.2 floor for the iPhone 12 up to the latest iOS 15.3 Beta. Cryptex Installation has been performed with SRT 20C80, 21C39 and Cryptex Manager. 

Do you have questions or need help? Reach out and open an Issue or Discussion. DM if that's easier. 
 
Open an Issue to have Tooling built and added to the SRD DMG, sit back and watch the DMG get updated.

# Latest IPSW + Cryptex Installed 
SRD | 19C56 | Signed File: iPhone11,8,iPhone12,1_15.2_19C56_Restore.ipsw | defaults write com.apple.AMPDevicesAgent ipsw-variant -string 'Research Customer Erase Install (IPSW)' 

SRD | 19D5026g | Signed File: iPhone11,8,iPhone12,1_15.3_19D5026g_Restore.ipsw | defaults write com.apple.AMPDevicesAgent ipsw-variant -string 'Research Developer Erase Install (IPSW)'

SRD | 19D5026g | Signed File: iPhone13,2,iPhone13,3_15.3_19D5026g_Restore.ipsw | defaults write com.apple.AMPDevicesAgent ipsw-variant -string 'Research Developer Erase Install (IPSW)'

SRD DMG Contents https://github.com/xsscx/srd/blob/main/dmg/srd-universal-cryptex-toyboxunstripped.dmg
-----
```
tree com.example.cryptex.dstroot
com.example.cryptex.dstroot
├── Library
│   └── LaunchDaemons
│       ├── debugserver.plist
│       ├── dropbear-research.plist
│       ├── hello.plist
│       ├── simple-server.plist
│       └── simple-shell.plist
└── usr
    └── bin
        ├── [ -> toybox
        ├── a.out
        ├── ascii -> toybox
        ├── aslr
        ├── base64 -> toybox
        ├── basename -> toybox
        ├── bash -> toybox
        ├── binbag
        ├── c1.exr
        ├── c2.exr
        ├── cal -> toybox
        ├── cat -> toybox
        ├── catv -> toybox
        ├── chain3
        ├── chgrp -> toybox
        ├── chmod -> toybox
        ├── chown -> toybox
        ├── cksum -> toybox
        ├── clear -> toybox
        ├── cmp -> toybox
        ├── comm -> toybox
        ├── count -> toybox
        ├── cp -> toybox
        ├── cpio -> toybox
        ├── crash.pvr
        ├── crc32 -> toybox
        ├── cryptex-run
        ├── cut -> toybox
        ├── date -> toybox
        ├── debugserver
        ├── df -> toybox
        ├── dirname -> toybox
        ├── disarm
        ├── dos2unix -> toybox
        ├── dropbear
        ├── du -> toybox
        ├── echo -> toybox
        ├── egrep -> toybox
        ├── env -> toybox
        ├── envprint
        ├── expand -> toybox
        ├── factor -> toybox
        ├── fallocate -> toybox
        ├── false -> toybox
        ├── fgrep -> toybox
        ├── file -> toybox
        ├── find -> toybox
        ├── flock -> toybox
        ├── fmt -> toybox
        ├── ftpget -> toybox
        ├── ftpput -> toybox
        ├── fuzzed.tif
        ├── getconf -> toybox
        ├── grep -> toybox
        ├── groups -> toybox
        ├── head -> toybox
        ├── hello
        ├── hello-code-cov
        ├── hello_world
        ├── hellosan
        ├── help -> toybox
        ├── hexedit -> toybox
        ├── hostname -> toybox
        ├── iconv -> toybox
        ├── id -> toybox
        ├── image.jpeg
        ├── ioclass
        ├── ioprint
        ├── ioreg
        ├── ios-13_voucher_leak
        ├── ios-14-voucher_leak
        ├── ios-command-line-tool
        ├── ioscan
        ├── jtool2
        ├── kill -> toybox
        ├── killall5 -> toybox
        ├── leak64
        ├── libarchive.a
        ├── libgmalloc.dylib
        ├── libmemctl_core.a
        ├── link -> toybox
        ├── lister
        ├── ln -> toybox
        ├── logger -> toybox
        ├── logname -> toybox
        ├── ls -> toybox
        ├── md5sum -> toybox
        ├── memctl
        ├── microcom -> toybox
        ├── mkdir -> toybox
        ├── mkfifo -> toybox
        ├── mktemp -> toybox
        ├── mv -> toybox
        ├── nc -> toybox
        ├── netcat -> toybox
        ├── nice -> toybox
        ├── nl -> toybox
        ├── nohup -> toybox
        ├── nvram
        ├── od -> toybox
        ├── optool
        ├── orig.tif
        ├── paste -> toybox
        ├── patch -> toybox
        ├── port_refs
        ├── prinfkernversion
        ├── printenv -> toybox
        ├── printf -> toybox
        ├── pwd -> toybox
        ├── pwdx -> toybox
        ├── readlink -> toybox
        ├── realpath -> toybox
        ├── renice -> toybox
        ├── rev -> toybox
        ├── rm -> toybox
        ├── rmdir -> toybox
        ├── sed -> toybox
        ├── seq -> toybox
        ├── setsid -> toybox
        ├── sh -> toybox
        ├── sha1sum -> toybox
        ├── simple-server
        ├── simple-shell
        ├── skywalktest
        ├── sleep -> toybox
        ├── sort -> toybox
        ├── split -> toybox
        ├── stage0
        ├── stage1
        ├── stage2
        ├── stat -> toybox
        ├── strings -> toybox
        ├── tac -> toybox
        ├── tail -> toybox
        ├── tar -> toybox
        ├── tee -> toybox
        ├── test -> toybox
        ├── test1
        ├── test2
        ├── test3
        ├── test4
        ├── test6
        ├── test7
        ├── test8
        ├── tester
        ├── time -> toybox
        ├── timeout -> toybox
        ├── touch -> toybox
        ├── toybox
        ├── toysh -> toybox
        ├── true -> toybox
        ├── truncate -> toybox
        ├── tty -> toybox
        ├── uname -> toybox
        ├── uniq -> toybox
        ├── unix2dos -> toybox
        ├── unlink -> toybox
        ├── usleep -> toybox
        ├── uudecode -> toybox
        ├── uuencode -> toybox
        ├── uuidgen -> toybox
        ├── vs_cli
        ├── w -> toybox
        ├── watch -> toybox
        ├── wc -> toybox
        ├── welcome
        ├── wget -> toybox
        ├── which -> toybox
        ├── who -> toybox
        ├── whoami -> toybox
        ├── xargs -> toybox
        ├── xxd -> toybox
        ├── yes -> toybox
        └── zprint

4 directories, 179 files
```

Makefile Details
-----
20C80 Makefile https://github.com/xsscx/srd/blob/main/SecurityResearchTools_20C80/usr/local/share/security-research-device/example-cryptex/Makefile and 21C39 Makefile https://github.com/xsscx/srd/blob/main/SecurityResearchTools_21C39/example-cryptex/Makefile

XNU Export
---
```
export XNU_VERSION=xnu-7195.141.2
```
X86_64
---
```
sysctl -a | grep Intel
machdep.cpu.brand_string: Intel(R) Core(TM) i7-8700B CPU @ 3.20GHz
```
```
clang -v
Apple clang version 13.0.0 (clang-1300.0.29.30)
Target: x86_64-apple-darwin21.2.0
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
InstalledDir: /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin
```
SDK Targets
---
```
iOS SDK 14.3 => 15.2
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

Follow this Repo and read URL https://srd.cx/srd-cryptex-installation/

