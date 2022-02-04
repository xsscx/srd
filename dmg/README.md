# SRD Universal Cryptex Release DMG | ASAN UBSAN Beta DMG

FRI 4 FEB 2022: Current Build Target 19E5209h | 13E5086k

## Resources
- Source: https://github.com/apple/security-research-device/tree/main/example-cryptex
- PR42: https://github.com/apple/security-research-device/pull/42
- Universal DMG: https://xss.cx/srd/dmg/srd-universal-cryptex.dmg
- ASAN Beta DMG: https://xss.cx/srd/dmg/srd-asan-cryptex-beta.dmg
- UBSAN Beta DMG: https://xss.cx/srd/dmg/srd-ubsan-cryptex-beta.dmg
- Install: https://github.com/xsscx/srd/tree/main/dmg#readme
## Prerequisites
- macOS 12.2 (21D49)
- Xcode Version 13.3 beta (13E5086k)
- Security Research Tools https://github.com/apple/security-research-device/tree/main/example-cryptex
- GNU sed
- automake

If you use brew:

```
brew install gnu-sed automake
```
# SRD DMG Install
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/xsscx/srd/main/dmg/install.sh)"
```
This Repo and Documentation detail the steps to create your own toybox unstripped cryptex, or download, and then install to your SRD. 

# SRD DMG Testing
- Universal cryptex for iPhone 11 and iPhone 12 SRD Models 
- Tested on the iPhone 11 for all IPSW from the iOS 14.3 floor for the iPhone 11 up to the latest iOS 15.4 Beta 
- Tested on the iPhone 12 for all IPSW from the iOS 15.2 floor for the iPhone 12 up to the latest iOS 15.4 Beta
- Tested on macOS 11.6.x using SRT 20C80, macOS 12.x using 21C39 and Cryptex Manager from X86_64 and M1 T8101 Platforms
- BETA ASAN DMG contains Example hello binary for the iPhone 11 & iPhone 12  

# SRD Cryptex Log Collector
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/xsscx/srd/main/SecurityResearchTools_21C39/example-cryptex/srd-cryptex-troubleshooter.sh)"
```
# How To Build example cryptex DMG for the SRD
```
cd example-cryptex
make
sudo cp src/toybox/toybox-src/generated/unstripped/toybox com.example.cryptex.dstroot/usr/bin
codesign --force -s -  com.example.cryptex.dstroot/usr/bin/toybox
hdiutil create -fs hfs+ -srcfolder com.example.cryptex.dstroot toyboxunstripped.dmg
cryptexctl ${CRYPTEXCTL_FLAGS} create --research --replace ${CRYPTEXCTL_CREATE_FLAGS} --identifier=com.example.cryptex --version=1.3.3.7 --variant=research toyboxunstripped.dmg
cryptexctl  personalize --replace -o /Users/xss/security-research-device-main/example-cryptex --variant=research /Users/xss/security-research-device-main/example-cryptex/com.example.cryptex.cxbd
cryptexctl uninstall com.example.cryptex
cryptexctl install --variant=research --persist com.example.cryptex.cxbd.signed
cryptexctl list
```
# How to Install example cryptex DMG to the SRD
Download: https://xss.cx/srd/dmg/srd-universal-cryptex.dmg
```
cd example-cryptex
wget https://xss.cx/srd/dmg/srd-universal-cryptex.dmg
cryptexctl ${CRYPTEXCTL_FLAGS} create --research --replace ${CRYPTEXCTL_CREATE_FLAGS} --identifier=com.example.cryptex --version=1.3.3.7 --variant=research srd-universal-cryptex.dmg
cryptexctl  personalize --replace -o /Users/xss/security-research-device-main/example-cryptex --variant=research /Users/xss/security-research-device-main/example-cryptex/com.example.cryptex.cxbd
cryptexctl uninstall com.example.cryptex
cryptexctl install --variant=research --persist com.example.cryptex.cxbd.signed
cryptexctl list
```
# Toybox Unstripped Details
```
nm -a com.example.cryptex.dstroot/usr/bin/toybox| wc -l
     869
```
# Confirm that the Cryptex is Installed on iPhone 11 SRD0009
```
cryptexctl list
com.example.cryptex
  version = 1.3.3.7
  device = /dev/disk3s1
  mount point = /private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.nJlkxj
```
# Confirm that the Cryptex is Installed on iPhone 12 SRD0037
```
[example-cryptex] - Creating cryptex /Users/xss/security-research-device/example-cryptex/com.example.cryptex.cxbd - 1.3.3.7 from the disk image com.example.cryptex.dmg
[example-cryptex] - Installing /Users/xss/security-research-device/example-cryptex/com.example.cryptex.cxbd onto device: 00008101-001418DA3CC0013A
cryptexctl: mount entry invalid: idx = 0, val = null
cryptexctl: cryptex not installed on device: com.example.cryptex
com.example.cryptex
  version = 1.3.3.7
  device = /dev/disk3s1
  mount point = /private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.Jp4Egr
```
# SSH Audit Trail
iPhone 11 SRD0009
----
```
uname -a
Darwin iPhone 21.2.0 Darwin Kernel Version 21.2.0: Sun Nov 28 20:43:35 PST 2021; root:xnu-8019.62.2~1/RELEASE_ARM64_T8030 iPhone12,1 Toybox
date
Tue Jan 11 08:15:45 EST 2022
```
iPhone 12 SRD0037
----
```
uname -a
Darwin iPhone 21.3.0 Darwin Kernel Version 21.3.0: Sat Dec  4 02:01:21 PST 2021; root:xnu-8019.80.11~18/RELEASE_ARM64_T8101 iPhone13,2 Toybox
date
Tue Jan 11 08:25:49 EST 2022
```
# SRD DMG Contents 
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
# Audit Trail
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
# History
Frida built from Commit in https://github.com/apple/security-research-device/issues/13

# Example SRD DMG Install Audit Trail
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
# Notarization
```
# How to Notarize a DMG
```
codesign --timestamp --force -s "DEVELOPER_ID" srd-universal-cryptex.dmg
xcrun notarytool submit srd-universal-cryptex.dmg --credz
xcrun stapler staple srd-universal-cryptex.dmg
```
# Validate DMG
```
xcrun stapler validate  srd-universal-cryptex.dmg
Processing: /Users/xss/security-research-device-main/example-cryptex/srd-universal-cryptex.dmg
The validate action worked!
codesign -vvvv -R="notarized"  srd-universal-cryptex.dmg
srd-universal-cryptex.dmg: valid on disk
srd-universal-cryptex.dmg: satisfies its Designated Requirement
srd-universal-cryptex.dmg: explicit requirement satisfied
```
# SRD Cryptex Log Collector
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/xsscx/srd/main/SecurityResearchTools_21C39/example-cryptex/srd-cryptex-troubleshooter.sh)"
```
Do you have questions or need help? Reach out and open an Issue or Discussion. DM if that's easier. Include some of the Details from these Logs.

# Recent IPSW + Cryptex Installations 
```
Signed File: iPhone11,8,iPhone12,1_15.2.1_19C63_Restore.ipsw | defaults write com.apple.AMPDevicesAgent ipsw-variant -string 'Research Customer Erase Install (IPSW)' 
Signed File: iPhone13,2,iPhone13,3_15.2.1_19C63_Restore.ipsw | defaults write com.apple.AMPDevicesAgent ipsw-variant -string 'Research Customer Erase Install (IPSW)'
Signed File: iPhone11,8,iPhone12,1_15.3_19D5040e_Restore.ipsw | defaults write com.apple.AMPDevicesAgent ipsw-variant -string 'Research Developer Erase Install (IPSW)'
Signed File: iPhone13,2,iPhone13,3_15.3_19D5040e_Restore.ipsw | defaults write com.apple.AMPDevicesAgent ipsw-variant -string 'Research Developer Erase Install (IPSW)'
```
The above means that from X86_64 and/or M1 ARM the SRD IPSW has been installed with cryptex personalization verified.

