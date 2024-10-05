#!/bin/sh
rm -rf srd-universal-cryptex.dmg
echo "Changing to toybox unstripped"
chmod 775 src/toybox/toybox-src/generated/unstripped/toybox
sudo cp src/toybox/toybox-src/generated/unstripped/toybox com.example.cryptex.dstroot/usr/bin
codesign --force -s -  com.example.cryptex.dstroot/usr/bin/toybox
codesign --force -s - --entitlements src/toybox/entitlements.plist com.example.cryptex.dstroot/usr/bin/toybox
hdiutil create -fs hfs+ -srcfolder com.example.cryptex.dstroot srd-universal-cryptex.dmg
cryptexctl ${CRYPTEXCTL_FLAGS} create --research --replace ${CRYPTEXCTL_CREATE_FLAGS} --identifier=com.example.cryptex --version=1.3.3.7 --variant=research srd-universal-cryptex.dmg
cryptexctl ${CRYPTEXCTL_PERSONALIZE_FLAGS} personalize --replace  --variant=research com.example.cryptex.cxbd
cryptexctl uninstall com.example.cryptex
cryptexctl install --variant=research --persist com.example.cryptex.cxbd.signed
cryptexctl list
