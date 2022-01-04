# Install a Cryptex with Toybox Unstripped

Download DMG, install & ssh to the SRD. Includes debuserver, toybox unstripped and other PoC's.

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

