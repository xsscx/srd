#!/bin/sh
rm -rf srd-universal-cryptex.dmg
sudo purge
make clean
sudo purge
make
sudo purge
codesign -s - --entitlements src/toybox/entitlements.plist  src/toybox/toybox-src/generated/unstripped/toybox
sudo cp src/toybox/toybox-src/generated/unstripped/toybox com.example.cryptex.dstroot/usr/bin
sudo purge
codesign --force -s -  com.example.cryptex.dstroot/usr/bin/toybox
sudo purge
hdiutil create -fs hfs+ -srcfolder com.example.cryptex.dstroot srd-universal-cryptex.dmg
sudo purge
cryptexctl ${CRYPTEXCTL_FLAGS} create --research --replace ${CRYPTEXCTL_CREATE_FLAGS} --identifier=com.example.cryptex --version=1.3.3.7 --variant=research srd-universal-cryptex.dmg
sudo purge
cryptexctl  personalize --replace -o /Users/xss/security-research-device-main/example-cryptex --variant=research /Users/xss/security-research-device-main/example-cryptex/com.example.cryptex.cxbd
sudo purge
cryptexctl uninstall com.example.cryptex
sudo purge
cryptexctl install --variant=research --persist com.example.cryptex.cxbd.signed
sudo purge
cryptexctl list
sudo purge
