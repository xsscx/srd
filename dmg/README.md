# SRD Example DMG Install with ASAN & UBSAN
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/xsscx/srd/main/dmg/install.sh)"
```
## SRD Example DMG ASAN UBSAN Build & Installation Status
WED 9 FEB 2022 at 0630 US EST: Current Build Target 19E5209h | 13E5086k

| Build OS & Device Info           | Release DMG   | ASAN DMG      | UBSAN DMG
| -------------------------------- | ------------- | ------------- | -------------
| Build macOS 12.2 21D49 X86_64    | PASS          | PASS          | PASS
| Build macOS 12.3 21E5206e T8101  | PASS          | PASS          | PASS
| Install to iPhone 11 19E5209h    | PASS          | PASS          | PASS
| Install to iPhone 12 19E5209h    | PASS          | PASS          | PASS

### Resources
- Source: https://github.com/apple/security-research-device/tree/main/example-cryptex
- PR42: https://github.com/apple/security-research-device/pull/42
- Universal DMG: https://xss.cx/srd/dmg/srd-universal-cryptex.dmg
- ASAN Beta DMG: https://xss.cx/srd/dmg/srd-asan-cryptex-beta.dmg
- UBSAN Beta DMG: https://xss.cx/srd/dmg/srd-ubsan-cryptex-beta.dmg
- Install: https://github.com/xsscx/srd/tree/main/dmg#readme
- Discussion: nvram settings disabling KTRR, CTRR and kASLR https://github.com/apple/security-research-device/discussions/2
### Prerequisites
- macOS 12.2 (21D49)
- Xcode Version 13.3 beta (13E5086k)
- Security Research Tools https://github.com/apple/security-research-device
- brew install gnu-sed automake
### SRD DMG Testing
- Universal cryptex for iPhone 11 and iPhone 12 SRD Models 
- Tested on the iPhone 11 for all IPSW from the iOS 14.3 floor for the iPhone 11 up to the latest iOS 15.4 Beta 
- Tested on the iPhone 12 for all IPSW from the iOS 15.2 floor for the iPhone 12 up to the latest iOS 15.4 Beta
- Tested on macOS 11.6.x using SRT 20C80, macOS 12.x using 21C39 and Cryptex Manager from X86_64 and M1 T8101 Platforms
### SRD Cryptex Log Collector
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/xsscx/srd/main/SecurityResearchTools_21C39/example-cryptex/srd-cryptex-troubleshooter.sh)"
```
### SRD Cryptex Log Collector Example
```
Sat Feb  5 07:04:42 EST 2022
kern.version: Darwin Kernel Version 21.3.0: Wed Jan  5 21:37:58 PST 2022; root:xnu-8019.80.24~20/RELEASE_X86_64
kern.osversion: 21D49
kern.iossupportversion: 15.3
kern.osproductversion: 12.2
kern.osproductversioncompat: 10.16
kern.osproductversioncompat: 10.16
/Applications/Xcode-beta.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk
udid                           name       build      BORD       CHIP       ECID
00008030-001538D03C40012E      SRD0009    19E5209h   0x4        0x8030     0x1538d03c40012e
00008101-001418DA3CC0013A      SRD0037    19E5209h   0xc        0x8101     0x1418da3cc0013a
Apple clang version 13.1.6 (clang-1316.0.19.2)
Target: x86_64-apple-darwin21.3.0
Thread model: posix
InstalledDir: /Applications/Xcode-beta.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin
Darwin Cryptex Management Interface Version 2.0.0: Sun Dec 19 22:28:12 PST 2021; root:libcryptex_executables-169.80.2~9/cryptexctl/WEN_ETA_X86_64
machdep.cpu.brand_string: Intel(R) Core(TM) i7-8700B CPU @ 3.20GHz
System Integrity Protection status: disabled.
cryptexctl: flags = [none]
cryptexctl: will re-exec: /usr/local/bin/cryptexctl.research
cryptexctl.research: path = /usr/local/bin/cryptexctl.research
MobileDevice version = 1368.60.4
cryptexctl.research: argv[_main] =
cryptexctl.research:   [0] = cryptexctl
cryptexctl.research:   [1] = -v2
cryptexctl.research:   [2] = -d2
cryptexctl.research:   [3] = install
cryptexctl.research:   [4] = --variant=research
cryptexctl.research:   [5] = --persist
cryptexctl.research:   [6] = --print-info
cryptexctl.research:   [7] = ./com.example.cryptex.cxbd.signed
```
## How To Build toybox unstripped DMG and Install to SRD
```
cd example-cryptex
make
sudo cp src/toybox/toybox-src/generated/unstripped/toybox com.example.cryptex.dstroot/usr/bin
codesign --force -s -  com.example.cryptex.dstroot/usr/bin/toybox
hdiutil create -fs hfs+ -srcfolder com.example.cryptex.dstroot toyboxunstripped.dmg
cryptexctl ${CRYPTEXCTL_FLAGS} create --research --replace ${CRYPTEXCTL_CREATE_FLAGS} --identifier=com.example.cryptex --version=1.3.3.7 --variant=research toyboxunstripped.dmg
cryptexctl ${CRYPTEXCTL_PERSONALIZE_FLAGS} personalize --replace  --variant=research com.example.cryptex.cxbd
cryptexctl uninstall com.example.cryptex
cryptexctl install --variant=research --persist com.example.cryptex.cxbd.signed
cryptexctl list
```
## How to Install an example cryptex DMG to the SRD
```
cd example-cryptex
wget https://xss.cx/srd/dmg/srd-universal-cryptex.dmg
cryptexctl ${CRYPTEXCTL_FLAGS} create --research --replace ${CRYPTEXCTL_CREATE_FLAGS} --identifier=com.example.cryptex --version=1.3.3.7 --variant=research toyboxunstripped.dmg
cryptexctl ${CRYPTEXCTL_PERSONALIZE_FLAGS} personalize --replace  --variant=research com.example.cryptex.cxbd
cryptexctl uninstall com.example.cryptex
cryptexctl install --variant=research --persist com.example.cryptex.cxbd.signed
cryptexctl list
```
## How to Confirm a Cryptex is Installed
```
cryptexctl list
com.example.cryptex
  version = 1.3.3.7
  device = /dev/disk3s1
  mount point = /private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.nJlkxj
```
## How to Notarize a DMG
```
codesign --timestamp --force -s "DEVELOPER_ID" srd-universal-cryptex.dmg
xcrun notarytool submit srd-universal-cryptex.dmg --credz
xcrun stapler staple srd-universal-cryptex.dmg
```
## How to Validate Notarization of DMG
```
xcrun stapler validate  srd-universal-cryptex.dmg
Processing: /Users/xss/security-research-device-main/example-cryptex/srd-universal-cryptex.dmg
The validate action worked!
codesign -vvvv -R="notarized"  srd-universal-cryptex.dmg
srd-universal-cryptex.dmg: valid on disk
srd-universal-cryptex.dmg: satisfies its Designated Requirement
srd-universal-cryptex.dmg: explicit requirement satisfied
```
## SRD Example Cryptex DMG Contents 
```
tree com.example.cryptex.dstroot
com.example.cryptex.dstroot
├── Library
│   └── LaunchDaemons
│       ├── debugserver.plist
│       ├── dropbear-research.plist
│       ├── hello.plist
│       ├── re.frida.policyd.plist
│       ├── re.frida.server.plist
│       ├── simple-server.plist
│       └── simple-shell.plist
└── usr
    ├── bin
    │   ├── [ -> toybox
    │   ├── a.out
    │   ├── ascii -> toybox
    │   ├── aslr
    │   ├── base64 -> toybox
    │   ├── basename -> toybox
    │   ├── bash -> toybox
    │   ├── c1.exr
    │   ├── c2.exr
    │   ├── cal -> toybox
    │   ├── cat -> toybox
    │   ├── catv -> toybox
    │   ├── chain3
    │   ├── chgrp -> toybox
    │   ├── chmod -> toybox
    │   ├── chown -> toybox
    │   ├── cksum -> toybox
    │   ├── clear -> toybox
    │   ├── cmp -> toybox
    │   ├── comm -> toybox
    │   ├── count -> toybox
    │   ├── cp -> toybox
    │   ├── cpio -> toybox
    │   ├── crash.pvr
    │   ├── crc32 -> toybox
    │   ├── cryptex-run
    │   ├── cut -> toybox
    │   ├── date -> toybox
    │   ├── debugserver
    │   ├── df -> toybox
    │   ├── dirname -> toybox
    │   ├── dos2unix -> toybox
    │   ├── dropbear
    │   ├── du -> toybox
    │   ├── echo -> toybox
    │   ├── egrep -> toybox
    │   ├── env -> toybox
    │   ├── expand -> toybox
    │   ├── factor -> toybox
    │   ├── fallocate -> toybox
    │   ├── false -> toybox
    │   ├── fgrep -> toybox
    │   ├── file -> toybox
    │   ├── find -> toybox
    │   ├── flock -> toybox
    │   ├── fmt -> toybox
    │   ├── frida-server
    │   ├── ftpget -> toybox
    │   ├── ftpput -> toybox
    │   ├── fuzzed.tif
    │   ├── getconf -> toybox
    │   ├── grep -> toybox
    │   ├── groups -> toybox
    │   ├── head -> toybox
    │   ├── hello
    │   ├── hello-code-cov
    │   ├── hello_world
    │   ├── hellosan
    │   ├── help -> toybox
    │   ├── hexedit -> toybox
    │   ├── hostname -> toybox
    │   ├── iconv -> toybox
    │   ├── id -> toybox
    │   ├── image.jpeg
    │   ├── ioclass
    │   ├── ioprint
    │   ├── ioreg
    │   ├── ios-13_voucher_leak
    │   ├── ios-14-voucher_leak
    │   ├── ioscan
    │   ├── kill -> toybox
    │   ├── killall5 -> toybox
    │   ├── leak64
    │   ├── libarchive.a
    │   ├── libmemctl_core.a
    │   ├── link -> toybox
    │   ├── ln -> toybox
    │   ├── logger -> toybox
    │   ├── logname -> toybox
    │   ├── ls -> toybox
    │   ├── md5sum -> toybox
    │   ├── memctl
    │   ├── microcom -> toybox
    │   ├── mkdir -> toybox
    │   ├── mkfifo -> toybox
    │   ├── mktemp -> toybox
    │   ├── mv -> toybox
    │   ├── nc -> toybox
    │   ├── netcat -> toybox
    │   ├── nice -> toybox
    │   ├── nl -> toybox
    │   ├── nohup -> toybox
    │   ├── nvram
    │   ├── od -> toybox
    │   ├── orig.tif
    │   ├── paste -> toybox
    │   ├── patch -> toybox
    │   ├── prinfkernversion
    │   ├── printenv -> toybox
    │   ├── printf -> toybox
    │   ├── pwd -> toybox
    │   ├── pwdx -> toybox
    │   ├── readlink -> toybox
    │   ├── realpath -> toybox
    │   ├── renice -> toybox
    │   ├── rev -> toybox
    │   ├── rm -> toybox
    │   ├── rmdir -> toybox
    │   ├── sed -> toybox
    │   ├── seq -> toybox
    │   ├── setsid -> toybox
    │   ├── sh -> toybox
    │   ├── sha1sum -> toybox
    │   ├── simple-server
    │   ├── simple-shell
    │   ├── sleep -> toybox
    │   ├── sort -> toybox
    │   ├── split -> toybox
    │   ├── stage0
    │   ├── stage1
    │   ├── stage2
    │   ├── stat -> toybox
    │   ├── strings -> toybox
    │   ├── tac -> toybox
    │   ├── tail -> toybox
    │   ├── tar -> toybox
    │   ├── tee -> toybox
    │   ├── test -> toybox
    │   ├── tftp-client
    │   ├── time -> toybox
    │   ├── timeout -> toybox
    │   ├── touch -> toybox
    │   ├── toybox
    │   ├── toysh -> toybox
    │   ├── true -> toybox
    │   ├── truncate -> toybox
    │   ├── tty -> toybox
    │   ├── uname -> toybox
    │   ├── uniq -> toybox
    │   ├── unix2dos -> toybox
    │   ├── unlink -> toybox
    │   ├── usleep -> toybox
    │   ├── uudecode -> toybox
    │   ├── uuencode -> toybox
    │   ├── uuidgen -> toybox
    │   ├── vi -> toybox
    │   ├── vs_cli
    │   ├── w -> toybox
    │   ├── watch -> toybox
    │   ├── wc -> toybox
    │   ├── welcome
    │   ├── wget -> toybox
    │   ├── which -> toybox
    │   ├── who -> toybox
    │   ├── whoami -> toybox
    │   ├── xargs -> toybox
    │   ├── xxd -> toybox
    │   └── yes -> toybox
    └── lib
        └── frida
            └── frida-agent.dylib

6 directories, 166 files
```
# frida-ps Example Listing
```
frida-ps -Uai
PID  Name                Identifier
---  ------------------  -------------------------------------
304   Safari          com.apple.mobilesafari
  -   App Store       com.apple.AppStore
  -   Books           com.apple.iBooks
  -   Calculator      com.apple.calculator
  -   Calendar        com.apple.mobilecal
  -   Camera          com.apple.camera
  -   Clock           com.apple.mobiletimer
  -   Compass         com.apple.compass
  -   Contacts        com.apple.MobileAddressBook
  -   FaceTime        com.apple.facetime
  -   Feedback        com.apple.appleseed.FeedbackAssistant
  -   Files           com.apple.DocumentsApp
  -   Find My         com.apple.findmy
  -   Health          com.apple.Health
  -   Home            com.apple.Home
  -   Magnifier       com.apple.Magnifier
  -   Mail            com.apple.mobilemail
  -   Maps            com.apple.Maps
  -   Measure         com.apple.measure
  -   Messages        com.apple.MobileSMS
  -   Music           com.apple.Music
  -   News            com.apple.news
  -   Notes           com.apple.mobilenotes
  -   Phone           com.apple.mobilephone
  -   Photos          com.apple.mobileslideshow
  -   Podcasts        com.apple.podcasts
  -   Reminders       com.apple.reminders
  -   Settings        com.apple.Preferences
  -   Shortcuts       com.apple.shortcuts
  -   Sidecar         com.apple.sidecar
  -   Stocks          com.apple.stocks
  -   TV              com.apple.tv
  -   Tips            com.apple.tips
  -   Translate       com.apple.Translate
  -   Voice Memos     com.apple.VoiceMemos
  -   Wallet          com.apple.Passbook
  -   Weather         com.apple.weather
  -   Web             com.apple.webapp
  -   Xcode Previews  com.apple.dt.XcodePreviews
  -   iTunes Store    com.apple.MobileStore
```
### Frida History
Frida built from Commit in https://github.com/apple/security-research-device/issues/13

### How to Confirm the SRD Example DMG Install | Audit Trail
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/xsscx/srd/main/dmg/install.sh)"
```
```
--2022-01-17 14:12:26--  https://xss.cx/srd/dmg/srd-universal-cryptex.dmg
Resolving xss.cx (xss.cx)... 50.62.160.45
Connecting to xss.cx (xss.cx)|50.62.160.45|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 27295841 (26M) [application/x-zip-compressed]
Saving to: ‘srd-universal-cryptex.dmg’

srd-universal-cryptex.dmg                                                                                100%[=================================================================================================================================================================================================================================================================================>]  26.03M  3.32MB/s    in 8.3s

2022-01-17 14:12:35 (3.12 MB/s) - ‘srd-universal-cryptex.dmg’ saved [27295841/27295841]

com.example.cryptex
  version = 1.3.3.7
  device = /dev/disk2s1
  mount point = /private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.yobZuo
  ```
### Recent IPSW + Cryptex Installations 
```
Signed File: iPhone11,8,iPhone12,1_15.2.1_19C63_Restore.ipsw | defaults write com.apple.AMPDevicesAgent ipsw-variant -string 'Research Customer Erase Install (IPSW)' 
Signed File: iPhone13,2,iPhone13,3_15.2.1_19C63_Restore.ipsw | defaults write com.apple.AMPDevicesAgent ipsw-variant -string 'Research Customer Erase Install (IPSW)'
Signed File: iPhone11,8,iPhone12,1_15.3_19E5209h_Restore.ipsw | defaults write com.apple.AMPDevicesAgent ipsw-variant -string 'Research Developer Erase Install (IPSW)'
Signed File: iPhone13,2,iPhone13,3_15.3_19E5209h_Restore.ipsw | defaults write com.apple.AMPDevicesAgent ipsw-variant -string 'Research Developer Erase Install (IPSW)'

QA: From X86_64 and/or M1 ARM the SRD IPSW has been installed with cryptex personalization verified
```
## SRD ASAN & UBSAN Installation Information | Drilling Down
###  iPhone 12 - TSS ASAN Cryptex Example HTTP Response of Success for Personalization
```
HTTP/1.1 200 OK
Server: Apple
Date: Sat, 05 Feb 2022 22:13:37 GMT
Content-Type: text/html
Content-Length: 4384
Connection: close
Host: gs.apple.com
Strict-Transport-Security: max-age=31536000; includeSubdomains
X-Frame-Options: SAMEORIGIN

STATUS=0&MESSAGE=SUCCESS&REQUEST_STRING=<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
```
### otool -L hello confirming Link to SAN Lib
```
otool -L com.example.cryptex.dstroot/usr/bin/hello
com.example.cryptex.dstroot/usr/bin/hello:
	@rpath/libclang_rt.asan_ios_dynamic.dylib (compatibility version 0.0.0, current version 0.0.0)
	/usr/lib/libSystem.B.dylib (compatibility version 1.0.0, current version 1311.100.2)
```
### iPhone 12 - hello with SAN Lib
```
./hello
Hello researcher from pid 953!
```
iPhone 12 debugserver for hello binary with asan dylib
------------
```
(lldb) image dump symtab hello
Symtab, num_symbols = 31:
               Debug symbol
               |Synthetic symbol
               ||Externally Visible
               |||
Index   UserID DSX Type            File Address/Value Load Address       Size               Flags      Name
------- ------ --- --------------- ------------------ ------------------ ------------------ ---------- ----------------------------------
[    0]      0     Code            0x0000000100007bd4 0x000000010432bbd4 0x00000000000001c8 0x001e0080 __os_log_helper_16_0_1_4_0
[    1]      1     Code            0x0000000100007d9c 0x000000010432bd9c 0x0000000000000034 0x000e0000 asan.module_ctor
[    2]      2     Code            0x0000000100007dd0 0x000000010432bdd0 0x000000000000001c 0x000e0000 asan.module_dtor
[    3]      3     Data            0x0000000100007ec0 0x000000010432bec0 0x0000000000000040 0x000e0000 .str
[    4]      4     Data            0x0000000100007f00 0x000000010432bf00 0x0000000000000040 0x000e0000 .str.1
[    5]      5     Data            0x0000000100007f40 0x000000010432bf40 0x0000000000000020 0x000e0000 .str.2
[    6]      6     Data            0x0000000100010000 0x0000000104334000 0x0000000000000040 0x000e0000 __asan_global_.str
[    7]      7     Data            0x0000000100010040 0x0000000104334040 0x0000000000000040 0x000e0000 __asan_global_.str.1
[    8]      8     Data            0x0000000100010080 0x0000000104334080 0x0000000000000040 0x000e0000 __asan_global_.str.2
[    9]      9     Data            0x00000001000100c0 0x00000001043340c0 0x0000000000000010 0x000e0000 __asan_binder_.str
[   10]     10     Data            0x00000001000100d0 0x00000001043340d0 0x0000000000000010 0x000e0000 __asan_binder_.str.1
[   11]     11     Data            0x00000001000100e0 0x00000001043340e0 0x0000000000000010 0x000e0000 __asan_binder_.str.2
[   12]     12     Data            0x00000001000100f0 0x00000001043340f0 0x0000000000000008 0x001e0000 ___asan_globals_registered
[   13]     13   X Data            0x0000000100000000 0x0000000104324000 0x000000000000796c 0x000f0010 _mh_execute_header
[   14]     14   X Code            0x000000010000796c 0x000000010432b96c 0x0000000000000268 0x000f0000 main
[   15]     15     Trampoline      0x0000000100007dec 0x000000010432bdec 0x0000000000000010 0x00010100 __asan_init
[   16]     16   X Undefined       0x0000000000000000                    0x0000000000000000 0x00010100 __asan_option_detect_stack_use_after_return
[   17]     17     Trampoline      0x0000000100007dfc 0x000000010432bdfc 0x0000000000000010 0x00010100 __asan_register_image_globals
[   18]     18     Trampoline      0x0000000100007e0c 0x000000010432be0c 0x0000000000000010 0x00010100 __asan_report_store1
[   19]     19     Trampoline      0x0000000100007e1c 0x000000010432be1c 0x0000000000000010 0x00010100 __asan_report_store4
[   20]     20   X Undefined       0x0000000000000000                    0x0000000000000000 0x00010100 __asan_shadow_memory_dynamic_address
[   21]     21     Trampoline      0x0000000100007e2c 0x000000010432be2c 0x0000000000000010 0x00010100 __asan_stack_malloc_0
[   22]     22     Trampoline      0x0000000100007e3c 0x000000010432be3c 0x0000000000000010 0x00010100 __asan_unregister_image_globals
[   23]     23     Trampoline      0x0000000100007e4c 0x000000010432be4c 0x0000000000000010 0x00010100 __asan_version_mismatch_check_apple_clang_1316
[   24]     24     Trampoline      0x0000000100007e5c 0x000000010432be5c 0x0000000000000010 0x00010200 __stack_chk_fail
[   25]     25   X Undefined       0x0000000000000000                    0x0000000000000000 0x00010200 __stack_chk_guard
[   26]     26     Trampoline      0x0000000100007e6c 0x000000010432be6c 0x0000000000000010 0x00010200 _os_log_impl
[   27]     27     Trampoline      0x0000000100007e7c 0x000000010432be7c 0x0000000000000010 0x00010200 getpid
[   28]     28     Trampoline      0x0000000100007e8c 0x000000010432be8c 0x0000000000000010 0x00010200 os_log_create
[   29]     29     Trampoline      0x0000000100007e9c 0x000000010432be9c 0x0000000000000010 0x00010200 os_log_type_enabled
[   30]     30     Trampoline      0x0000000100007eac 0x000000010432beac 0x0000000000000010 0x00010200 printf
(lldb)
```
### SRD Console Log - iPhone 11
```
Password auth succeeded for 'root' from 192.168.3.83:64608

date
Sat Feb  5 18:53:00 EST 2022

uname -a
Darwin SRD0009 21.4.0 Darwin Kernel Version 21.4.0: Sun Jan 16 20:50:39 PST 2022; root:xnu-8020.100.406.0.1~10/RELEASE_ARM64_T8030 iPhone12,1 Toybox

./debugserver 192.168.3.83:1921 ./hello
debugserver-@(#)PROGRAM:LLDB  PROJECT:lldb-1316.2.4.12
 for arm64.
Listening to port 1921 for a connection from 192.168.3.83...
```
iPhone 11 debugserver for hello binary with asan dylib
---
```
(lldb) image dump symtab hello
Symtab, num_symbols = 31:
               Debug symbol
               |Synthetic symbol
               ||Externally Visible
               |||
Index   UserID DSX Type            File Address/Value Load Address       Size               Flags      Name
------- ------ --- --------------- ------------------ ------------------ ------------------ ---------- ----------------------------------
[    0]      0     Code            0x0000000100007bd4 0x0000000104a07bd4 0x00000000000001c8 0x001e0080 __os_log_helper_16_0_1_4_0
[    1]      1     Code            0x0000000100007d9c 0x0000000104a07d9c 0x0000000000000034 0x000e0000 asan.module_ctor
[    2]      2     Code            0x0000000100007dd0 0x0000000104a07dd0 0x000000000000001c 0x000e0000 asan.module_dtor
[    3]      3     Data            0x0000000100007ec0 0x0000000104a07ec0 0x0000000000000040 0x000e0000 .str
[    4]      4     Data            0x0000000100007f00 0x0000000104a07f00 0x0000000000000040 0x000e0000 .str.1
[    5]      5     Data            0x0000000100007f40 0x0000000104a07f40 0x0000000000000020 0x000e0000 .str.2
[    6]      6     Data            0x0000000100010000 0x0000000104a10000 0x0000000000000040 0x000e0000 __asan_global_.str
[    7]      7     Data            0x0000000100010040 0x0000000104a10040 0x0000000000000040 0x000e0000 __asan_global_.str.1
[    8]      8     Data            0x0000000100010080 0x0000000104a10080 0x0000000000000040 0x000e0000 __asan_global_.str.2
[    9]      9     Data            0x00000001000100c0 0x0000000104a100c0 0x0000000000000010 0x000e0000 __asan_binder_.str
[   10]     10     Data            0x00000001000100d0 0x0000000104a100d0 0x0000000000000010 0x000e0000 __asan_binder_.str.1
[   11]     11     Data            0x00000001000100e0 0x0000000104a100e0 0x0000000000000010 0x000e0000 __asan_binder_.str.2
[   12]     12     Data            0x00000001000100f0 0x0000000104a100f0 0x0000000000000008 0x001e0000 ___asan_globals_registered
[   13]     13   X Data            0x0000000100000000 0x0000000104a00000 0x000000000000796c 0x000f0010 _mh_execute_header
[   14]     14   X Code            0x000000010000796c 0x0000000104a0796c 0x0000000000000268 0x000f0000 main
[   15]     15     Trampoline      0x0000000100007dec 0x0000000104a07dec 0x0000000000000010 0x00010100 __asan_init
[   16]     16   X Undefined       0x0000000000000000                    0x0000000000000000 0x00010100 __asan_option_detect_stack_use_after_return
[   17]     17     Trampoline      0x0000000100007dfc 0x0000000104a07dfc 0x0000000000000010 0x00010100 __asan_register_image_globals
[   18]     18     Trampoline      0x0000000100007e0c 0x0000000104a07e0c 0x0000000000000010 0x00010100 __asan_report_store1
[   19]     19     Trampoline      0x0000000100007e1c 0x0000000104a07e1c 0x0000000000000010 0x00010100 __asan_report_store4
[   20]     20   X Undefined       0x0000000000000000                    0x0000000000000000 0x00010100 __asan_shadow_memory_dynamic_address
[   21]     21     Trampoline      0x0000000100007e2c 0x0000000104a07e2c 0x0000000000000010 0x00010100 __asan_stack_malloc_0
[   22]     22     Trampoline      0x0000000100007e3c 0x0000000104a07e3c 0x0000000000000010 0x00010100 __asan_unregister_image_globals
[   23]     23     Trampoline      0x0000000100007e4c 0x0000000104a07e4c 0x0000000000000010 0x00010100 __asan_version_mismatch_check_apple_clang_1316
[   24]     24     Trampoline      0x0000000100007e5c 0x0000000104a07e5c 0x0000000000000010 0x00010200 __stack_chk_fail
[   25]     25   X Undefined       0x0000000000000000                    0x0000000000000000 0x00010200 __stack_chk_guard
[   26]     26     Trampoline      0x0000000100007e6c 0x0000000104a07e6c 0x0000000000000010 0x00010200 _os_log_impl
[   27]     27     Trampoline      0x0000000100007e7c 0x0000000104a07e7c 0x0000000000000010 0x00010200 getpid
[   28]     28     Trampoline      0x0000000100007e8c 0x0000000104a07e8c 0x0000000000000010 0x00010200 os_log_create
[   29]     29     Trampoline      0x0000000100007e9c 0x0000000104a07e9c 0x0000000000000010 0x00010200 os_log_type_enabled
[   30]     30     Trampoline      0x0000000100007eac 0x0000000104a07eac 0x0000000000000010 0x00010200 printf
(lldb) quit
```
iPhone 11 debugserver for hello binary with ubsan dylib
---
```
(lldb) image dump symtab hello
Symtab, num_symbols = 11:
               Debug symbol
               |Synthetic symbol
               ||Externally Visible
               |||
Index   UserID DSX Type            File Address/Value Load Address       Size               Flags      Name
------- ------ --- --------------- ------------------ ------------------ ------------------ ---------- ----------------------------------
[    0]      0     Code            0x0000000100007e44 0x000000010252fe44 0x0000000000000038 0x001e0080 __os_log_helper_16_0_1_4_0
[    1]      1   X Data            0x0000000100000000 0x0000000102528000 0x0000000000007d08 0x000f0010 _mh_execute_header
[    2]      2   X Code            0x0000000100007d08 0x000000010252fd08 0x000000000000013c 0x000f0000 main
[    3]      3     Trampoline      0x0000000100007e7c 0x000000010252fe7c 0x0000000000000010 0x00010200 __stack_chk_fail
[    4]      4   X Undefined       0x0000000000000000                    0x0000000000000000 0x00010200 __stack_chk_guard
[    5]      5     Trampoline      0x0000000100007e8c 0x000000010252fe8c 0x0000000000000010 0x00010100 __ubsan_handle_nonnull_arg
[    6]      6     Trampoline      0x0000000100007e9c 0x000000010252fe9c 0x0000000000000010 0x00010200 _os_log_impl
[    7]      7     Trampoline      0x0000000100007eac 0x000000010252feac 0x0000000000000010 0x00010200 getpid
[    8]      8     Trampoline      0x0000000100007ebc 0x000000010252febc 0x0000000000000010 0x00010200 os_log_create
[    9]      9     Trampoline      0x0000000100007ecc 0x000000010252fecc 0x0000000000000010 0x00010200 os_log_type_enabled
[   10]     10     Trampoline      0x0000000100007edc 0x000000010252fedc 0x0000000000000010 0x00010200 printf
```
### Process Information Tracing | WIP
SRD
----
```
export CODE_MACH_KMSG_INFO=0x1200028
export CODE_MACH_PROC_EXEC=0x401000C
export CODE_MACH_MSG_SEND=0x120000C
export CODE_MACH_MSG_RECV=0x1200010
export CODE_TRACE_DATA_EXEC=0x7000008
ofile=~/${1:-ipc.raw}
ps -Ac | sed 's,\s*\([0-9][0-9]*\) .*[0-9]*:[0-9]*\.[0-9]* \(.*\), 00000000.0  0.0(0.0)  proc_exec  \1 0 0 0 0 0  \2,' > "${ofile}.txt"

```
