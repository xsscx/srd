# Install a Cryptex with Toybox Unstripped

Download DMG, install & ssh to the SRD. Includes toybox unstripped as of 4 Jan 2021. Will add back debugserver + PoC's shortly. Changing Hardware + Build Platforms at Colo all day.

```
sudo cp src/toybox/toybox-src/generated/unstripped/toybox com.example.cryptex.dstroot/usr/bin

codesign --force -s -  com.example.cryptex.dstroot/usr/bin/toybox

hdiutil create -fs hfs+ -srcfolder com.example.cryptex.dstroot toyboxunstripped.dmg

cryptexctl uninstall com.example.cryptex

cryptexctl install --variant=research --persist com.example.cryptex.cxbd.signed
```
