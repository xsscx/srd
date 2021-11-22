# SRDC DMG for Crytpex with toybox unstripped and debugserver

Jumpstart your Research with Example DMG Files
-----------

Pick your DMG, install & learn.

# With the release of macOS 12, Security Research Tools (SRT) no longer works on X86_64. Use CryptexManager.

https://github.com/pinauten/CryptexManager

Install Instructions: https://github.com/pinauten/CryptexManager/issues/1

M1 Cryptex Installation | macOS 11.6.1 (20G224)
------

Write-up with Pictures on the 2021 SRD Cohort Website at URL https://srd.cx/srd-cryptex-installation/ 

This is where you start with the SRDC DMG Example Cryptex after Download on M1 ARM macOS 11.6.1 (20G224):
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
You now have the ToyBox Unstripped Binary that has Symbols on M1 ARM

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
# This is my Proof of Work for having verified that the installed cryptex contains toybox unstripped:
```
nm -a ~/srd/example-cryptex/com.example.cryptex.dstroot/usr/bin/toybox  | wc -l
     876
```
As you can see above, the toybox unstripped has 876 results from nm -a output. That is compared with the typical toybox binary that is installed in the SRD Makefile as shown below:
```
nm -a ~/srd/example-cryptex/src/toybox/toybox-src/toybox | wc -l
     258
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
If already mounted... cryptexctl uninstall com.example.cryptex
cryptexctl install com.example.cryptex.cptx
```
Any Questions? https://twitter.com/h02332

Read about Pointer Authentication Failure at URL https://srd.cx/possible-pointer-authentication-failure-data-abort/

Read about debugserver for SRD at URL https://srd.cx/debugserver-installation-configuration/

