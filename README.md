# Welcome to Hoyt's SRD Repo
WED 9 FEB 2022 at 0630 US EST: Current Build Target 19E5209h | 13E5086k
 
# SRD DMG Install
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/xsscx/srd/main/dmg/install.sh)"
```
FRI 11 FEB 2022 at 1830 US EST: Current Build Target 21E5206e | 13E5086k
## SRD Example DMG, PR 42,48,49 Build & Installation Status
| Build OS & Device Info           | Example DMG   |  debugserver DMG  |  ASAN DMG     | UBSAN DMG 
| -------------------------------- | ------------- | ------------- | ------------- | -------------
| macOS 12.2.1 (21D62) X86_64      | PASS          | FAIL          | PASS          | PASS          
| PR 42  21E5206e T8101            | PASS          | PASS          | FAIL          | FAIL
| PR 48  21E5206e T8101            | PASS          | PASS          | FAIL          | FAIL
| PR 49  21E5206e T8101            | PASS          | PASS          | FAIL          | FAIL
| Build macOS 12.3 21E5206e T8101  | PASS          | PASS          | FAIL          | FAIL
| Install to iPhone 11 19E5219e    | PASS          | PASS          | PASS          | PASS
| Install to iPhone 12 19E5219e    | PASS          | PASS          | PASS          | PASS

## Resources
- Source: https://github.com/apple/security-research-device/tree/main/example-cryptex
- PR42: https://github.com/apple/security-research-device/pull/42
- Universal DMG: https://xss.cx/srd/dmg/srd-universal-cryptex.dmg
- ASAN Beta DMG: https://xss.cx/srd/dmg/srd-asan-cryptex-beta.dmg
- UBSAN Beta DMG: https://xss.cx/srd/dmg/srd-ubsan-cryptex-beta.dmg
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
## Prerequisites
- macOS 12.2.1 (21D62) or macOS 12.3 Beta (21E5206e)
- Xcode Version 13.3 beta  
- Security Research Tools https://github.com/apple/security-research-device
- brew install gnu-sed automake
# SRD DMG Testing
- Universal cryptex for iPhone 11 and iPhone 12 SRD Models 
- Tested on the iPhone 11 for all IPSW from the iOS 14.3 floor for the iPhone 11 up to the latest iOS 15.4 Beta 
- Tested on the iPhone 12 for all IPSW from the iOS 15.2 floor for the iPhone 12 up to the latest iOS 15.4 Beta
- Tested on macOS 11.6.x using SRT 20C80, macOS 12.x using 21C39 and Cryptex Manager from X86_64 and M1 T8101 Platforms 

SRD Cryptex Log Collector
---
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/xsscx/srd/main/SecurityResearchTools_21C39/example-cryptex/srd-cryptex-troubleshooter.sh)"
```
# Lastest IPSW + Cryptex Installations 
```
Signed File: iPhone11,8,iPhone12,1_15.3_19D50_Restore.ipsw | defaults write com.apple.AMPDevicesAgent ipsw-variant -string 'Research Customer Erase Install (IPSW)' 
Signed File: iPhone13,2,iPhone13,3_15.3_19D50_Restore.ipsw | defaults write com.apple.AMPDevicesAgent ipsw-variant -string 'Research Customer Erase Install (IPSW)'
Signed File: iPhone12,8,iPhone12,1_15.4_19E5219e_Restore.ipsw | defaults write com.apple.AMPDevicesAgent ipsw-variant -string 'Research Developer Erase Install (IPSW)'
Signed File: iPhone13,2,iPhone13,3_15.4_19E5219e_Restore.ipsw | defaults write com.apple.AMPDevicesAgent ipsw-variant -string 'Research Developer Erase Install (IPSW)'
```
The above means that from X86_64 and/or M1 ARM the SRD IPSW has been installed with cryptex personalization verified as shown below.

Makefile
-----
21C39 https://github.com/xsscx/srd/blob/main/SecurityResearchTools_21C39/example-cryptex/Makefile

XNU Export
---
```
export XNU_VERSION=xnu-7195.141.2
```
# Hosts
X86_64
---
```
sysctl -a | grep CPU
machdep.cpu.brand_string: Intel(R) Core(TM) i7-8700B CPU @ 3.20GHz
```
```
clang -v
Apple clang version 13.1.6 (clang-1316.0.19.2)
Target: x86_64-apple-darwin21.3.0
InstalledDir: /Applications/Xcode-beta.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin
```
M1 Apple Silicon
---
```
sysctl -a | grep M1
machdep.cpu.brand_string: Apple M1
```
```
clang -v
Apple clang version 13.1.6 (clang-1316.0.19.2)
Target: arm64-apple-darwin21.4.0
InstalledDir: /Applications/Xcode-beta.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin
```
SDK Targets
---
```  
 SDK Path: "/Users/xss/Library/Developer/Xcode/iOS DeviceSupport/15.4 (19E5209h) arm64e"
 SDK Roots: [ 0] "Developer/Xcode/iOS DeviceSupport/15.3 (19D49) arm64e"
 SDK Roots: [ 1] "Developer/Xcode/iOS DeviceSupport/15.3 (19D50) arm64e"
 SDK Roots: [ 2] "Developer/Xcode/iOS DeviceSupport/14.7.1 (18G82) arm64e"
 SDK Roots: [ 3] "Developer/Xcode/iOS DeviceSupport/15.4 (19E5209h) arm64e"
 SDK Roots: [ 4] "Developer/Xcode/iOS DeviceSupport/15.2.1 (19C63) arm64e"
 SDK Roots: [ 5] "Developer/Xcode/iOS DeviceSupport/14.8 (18H17) arm64e"
 SDK Roots: [ 6] "Developer/Xcode/iOS DeviceSupport/15.3 (19D5026g) arm64e"
 SDK Roots: [ 7] "eveloper/Xcode/iOS DeviceSupport/15.2 (19C56) arm64e"
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

