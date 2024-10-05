# Welcome to Hoyt's SRD Repo
<img src="https://xss.cx/2024/05/20/img/hoyts-apple-security-research-device-project-image.jpeg" alt="Hoyt's Apple Security Research Device Project Repository" style="height:1024px; width:1024px;"/>

## whoami
I am David Hoyt.
  - https://hoyt.net
  - https://srd.cx
  - https://xss.cx

## SUMMARY
- This Repo was __ahead__ of the Apple Repo as of December 15, 2022 when I returned my Devices
- Built on macOS 13.x X86_64 & arm64e
- The DMG's are all Built with XNU 8792.60.55 and options Targeting for iOS 16
- Frida, Toybox Unstripped, SSH, debugserver, other example Register Code
- Largest Public Code Repo for the Apple Security Research Device with all details provide
- iOSOnMAC Fuzzing native iOS Apps on macOS - https://github.com/xsscx/macos-research/tree/main/code/iOSOnMac
- Required Reading - https://github.com/xsscx/srd/issues?q=is%3Aissue+is%3Aclosed
- Open an Issue or Ask a Question
- See https://github.com/xsscx/macos-research

Toybox Unstripped
-----------
```
nm -a com.example.cryptex.dstroot/usr/bin/toybox  | wc -l
     941
```
## START HERE

Install my Pre-Built SRD DMG
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/xsscx/srd/main/dmg/install.sh)"
```

### SRD Example DMG, Build & Installation Status for iOS 16.x w/ + 8792.60.55
| Build OS & Device Info           | Example DMG   |  debugserver DMG  |  ASAN DMG     | UBSAN DMG 
| -------------------------------- | ------------- | ------------- | ------------- | -------------
| macOS 13.0.1 22A400 X86_64       | PASS          | PASS          | PASS          | PASS          
| macOS 13 Beta T8101  | PASS          | PASS          | PASS          | PASS 
| X86_64 Install to iPhone 11 16.2_20C5049e    | PASS         | PASS         | PASS          | PASS
| T8101 Install to iPhone 12 16.2_20C5049e    | PASS          | PASS          | PASS          | PASS 

## Last Known Good Working Configuration(s)
- SIP Enabled
- macOS 13.x X86_64 or M1 T8101 macOS 13.x
- cryptexctl or CryptexManager
- Xcode beta

### Lastest IPSW Installations 
```
Signed File: iPhone11,8,iPhone12,1_15.5_19F77_Restore.ipsw | defaults write com.apple.AMPDevicesAgent ipsw-variant -string 'Research Customer Erase Install (IPSW)' 
Signed File: iPhone13,2,iPhone13,3_15.5_19F77_Restore.ipsw | defaults write com.apple.AMPDevicesAgent ipsw-variant -string 'Research Customer Erase Install (IPSW)'
Signed File: iPhone12,1_16.0_20A5328h_Restore.ipsw | defaults write com.apple.AMPDevicesAgent ipsw-variant -string 'Research Developer Erase Install (IPSW)'
Signed File: iPhone13,2,iPhone13,3_16.0_20A5328h_Restore.ipsw | defaults write com.apple.AMPDevicesAgent ipsw-variant -string 'Research Developer Erase Install (IPSW)'
```

## Prerequisites
- Security Research Tools https://github.com/apple/security-research-device

### Resources
- Source: https://github.com/apple/security-research-device/tree/main/example-cryptex
- DMG: https://github.com/xsscx/srd/raw/main/dmg/srd-universal-cryptex.dmg
- Install: https://github.com/xsscx/srd/tree/main/dmg#readme
- Discussion: nvram settings disabling KTRR, CTRR and kASLR https://github.com/apple/security-research-device/discussions/2

- IPSW & Cryptex Installations 
    -  Build Info, Issue Tracker
    -  Summary & Workarounds 
    -  iPhone 11 & 12 SRD Models 
- Pre-built DMG's for the Apple Security Research Device 
    - toyboxunstripped
    - frida
    - debugserver
    - Sample PoC's from CVE's
        - Chain3
        - P0 PoC's
            - Stage 0,1,2
            - port_refs
        - ZecOps 
            - iOS 13 + 14 Voucher Leak 
- Sample Code
    - Example ASAN Makefile and Binary
    - Example UBSAN Makefile and Binary
    - Example Code Coverage Makefile and Binary
    - Example libarchive.a
    - Example aslr Binary
    - Example Binaries in /bin
# SRD DMG Testing
- Universal cryptex for iPhone 11 and iPhone 12 SRD Models 
- Tested on the iPhone 11 for all IPSW from the iOS 14.3 floor for the iPhone 11 up to the latest iOS 16 
- Tested on the iPhone 12 for all IPSW from the iOS 15.2 floor for the iPhone 12 up to the latest iOS 16
- Tested on macOS 11.6.x using SRT 20C80, macOS 12.x using 21F79 and Cryptex Manager from X86_64 and M1 T8101 Platforms 

SRD Cryptex Log Collector
---
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/xsscx/srd/main/srd_tools-24.100.3/example-cryptex/srd-cryptex-logcollector.sh)"
```

# Hosts
X86_64
---
```
sysctl -a | grep CPU
machdep.cpu.brand_string: Intel(R) Core(TM) i7-8700B CPU @ 3.20GHz
```

Run Targets
---
```
SRD's - iPhone 11 and iPhone 12
iPhone 12 Pro Max
iPad 12 Pro
X86_64 mini
M1 T8101
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
