# Install a Cryptex with Toybox Unstripped

Download DMG, install & ssh to the SRD. Includes toybox unstripped as of 4 Jan 2021. 

7 JAN 2022 Will add back debugserver + PoC's shortly. 

8 JAN 2022 - Build Pipeline for Toybox has a failure on macOS 12.x.

10 JAN 2022 Toybox Repo has a Build Error, so added a specific Roll Back DMG for a working toybox unstripped for any SRD supported IPSW. Short Summary: Just use the DMG and install a cryptex, or build your own with Last known Good Working Configuration for Toybox on iOS for Apple SRD for macOS 11.x or 12.x Mainline.

How toybox unstripped DMG was built:
------
```
sudo cp src/toybox/toybox-src/generated/unstripped/toybox com.example.cryptex.dstroot/usr/bin

codesign --force -s -  com.example.cryptex.dstroot/usr/bin/toybox

hdiutil create -fs hfs+ -srcfolder com.example.cryptex.dstroot toyboxunstripped.dmg

cryptexctl ${CRYPTEXCTL_FLAGS} create --replace ${CRYPTEXCTL_CREATE_FLAGS} -i ${CRYPTEX_ID} -v ${CRYPTEX_VERSION} ${CRYPTEX_DMG_NAME}

Example: cryptexctl ${CRYPTEXCTL_FLAGS} create --replace ${CRYPTEXCTL_CREATE_FLAGS} -i com.example.cryptex -v 1.3.3.7 toyboxunstripped.dmg

If necessary: cryptexctl uninstall com.example.cryptex

cryptexctl install --variant=research --persist com.example.cryptex.cxbd.signed
```
Result
```
cryptexctl list
com.example.cryptex
  version = 1.3.3.7
  device = /dev/disk3s1
  mount point = /private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.nJlkxj
```
