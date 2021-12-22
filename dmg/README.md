# Install a Cryptex with Toybox Unstripped on M1 ARM or X86_64

Download DMG, install & ssh to the SRD. Includes debuserver, toybox unstripped and other PoC's.

M1 Cryptex Installation | macOS 11.6.1 (20G224)
------
Suggested Platform: X86_64 or M1 ARM with macOS 11.6.1 and Security Research Tools 20C80.

Write-up with Pictures on the 2021 SRD Cohort Website at URL https://srd.cx/srd-cryptex-installation/ 

This is where you start with the SRDC DMG Example Cryptex after Download on M1 ARM macOS 11.6.1 (20G224) and SRT 20C80:
```
cd example-cryptex/
```
```
cryptexctl ${CRYPTEXCTL_FLAGS} create --replace ${CRYPTEXCTL_CREATE_FLAGS} -i com.example.cryptex -v 1.3.3.7 ~/Downloads/toyboxunstripped.dmg
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
You now have the ToyBox Unstripped Binary that has Symbols on M1 ARM, go ssh to the SRD.

X86_64 Installation | macOS 12.0.1 (21A559)
----
This is where you start with the SRDC DMG Example Cryptex after Download on X86_64 macOS 12.0.1 (21A559):
```
Mount the SRDC DMG example: 19C5044b-toyboxunstripped.dmg with Finder or Terminal
```
Then, in Terminal, use CryptexManager to Personalize the Cryptex:
```
CryptexManager-master %  .build/release/CryptexManager create -i com.example.cryptex -v 1.3.3.7 ~/Downloads/19C5044b-toyboxunstripped.dmg /Volumes/com.example.cryptex.dstroot /tmp/cptx
```
Next, Install the Cryptex on the SRD:
```
CryptexManager-master % .build/release/CryptexManager install /tmp/cptx                                                                                                                 
Successfully installed cryptex!
```
Confirm the Cryptex is Installed:
```
cryptexctl   list                                                                                                                                               
com.example.cryptex
  version = 1.3.3.7
  device = /dev/disk2s1
  mount point = /private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.b16SlD
```
# Background to Build the DMG
This is where I'm dropping you at in the Build Pipeline:
```
...
(rm toyboxunstripped.dmg)
```
Now you have this DMG, lets walk thru the hand-roll and smoke our fine cryptex.... This is how I manually hand-roll a cryptex with toybox unstripped and a few other things:
```
sudo cp src/toybox/toybox-src/generated/unstripped/toybox com.example.cryptex.dstroot/usr/bin
```
```
codesign --force -s "7B2FD6D3A142A993E0519EBDF8AE859904C584E8"  com.example.cryptex.dstroot/usr/bin/toybox
```
```
hdiutil create -fs hfs+ -srcfolder com.example.cryptex.dstroot toyboxunstripped.dmg
```
```
cryptexctl ${CRYPTEXCTL_FLAGS} create --replace ${CRYPTEXCTL_CREATE_FLAGS} -i com.example.cryptex -v 1.3.3.7 toyboxunstripped.dmg
```
```
cryptexctl uninstall com.example.cryptex
cryptexctl install com.example.cryptex.cptx
```
Read about Pointer Authentication Failure at URL https://srd.cx/possible-pointer-authentication-failure-data-abort/

Read about debugserver for SRD at URL https://srd.cx/debugserver-installation-configuration/

