#!/bin/sh
echo "Test Harness for PR 42.. Running Clean, Build, Install for SRD"
echo "Clean"
make clean
echo "Running make"
make
echo "Changing to toybox unstripped"
chmod 775 src/toybox/toybox-src/generated/unstripped/toybox
sudo cp src/toybox/toybox-src/generated/unstripped/toybox com.example.cryptex.dstroot/usr/bin
codesign --force -s -  com.example.cryptex.dstroot/usr/bin/toybox
codesign --force -s - --entitlements src/toybox/entitlements.plist com.example.cryptex.dstroot/usr/bin/toybox
echo "Create the Example DMG"
hdiutil create -fs hfs+ -srcfolder com.example.cryptex.dstroot pr42.dmg
echo "Uninstall existing com.example.cryptex"
cryptexctl uninstall com.example.cryptex
echo "Create the Example Cryptex"
cryptexctl ${CRYPTEXCTL_FLAGS} create --research --replace ${CRYPTEXCTL_CREATE_FLAGS} --identifier=com.example.cryptex --version=1.3.3.7 --variant=research pr42.dmg
echo "Personalize the Example Cryptex"
cryptexctl ${CRYPTEXCTL_PERSONALIZE_FLAGS} personalize --replace  --variant=research com.example.cryptex.cxbd
echo "Install the Example Cryptex"
cryptexctl install --variant=research --persist com.example.cryptex.cxbd.signed
echo "List the Example Cryptex"
cryptexctl list
