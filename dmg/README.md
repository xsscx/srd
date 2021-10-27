# SRD Cohort Example DMG for Crytpex with Toybox Unstripped

Jumpstart your Research with Example DMG Files for a Cryptex compiled for 19B5068a
-----------

Read about Pointer Authentication Failure at URL https://srd.cx/possible-pointer-authentication-failure-data-abort/

Read about debugserver for SRD at URL https://srd.cx/debugserver-installation-configuration/

I've updated ToyBox Unstripped too!

Everything in this RTFM comes from the Makefile. If you do not recognize the manual commands below, look at the Makefile and this will be obvious. Apple failed to include Toybox Unstripped Binary to aid in debugging.

# Start of Installation of a Hand-Rolled DMG
```
Pro Tip: Prior to working with cryptexctl, Close Xcode and Reboot the SRD, then do your workflow with cryptexctl. 
```
M1 T8101 + X86_64 Cryptex Installation 
------
Write-up with Pictures on the 2021 SRD Cohort Website at URL https://srd.cx/srd-cryptex-installation/ 
# This is where you start with the SRDC DMG Example Cryptex after Download:
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
You now have the ToyBox Unstripped Binary that has Symbols. They may even work with the latest iOS Beta :-)

# This is my Proof of Work that I have completed the above steps and verified that the installed cryptex contains toybox unstripped:
```
nm -a ~/srd/example-cryptex/com.example.cryptex.dstroot/usr/bin/toybox | wc -l
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
hdiutil create -fs hfs+ -srcfolder com.example.cryptex.dstroot toyboxunstripped.dmg
```
```
created: /Users/dhoyt/srd/share/security-research-device/example-cryptex/toyboxunstripped.dmg
```
Now you have this DMG, lets walk thru the hand-roll and smoke our fine cryptex.... this is the whole process.. you have a DMG, so lets get it installed. This is how I manually hand-roll a cryptex with toybox unstripped:
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
