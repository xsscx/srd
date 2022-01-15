#!/bin/sh
echo "Running Clean, Build, Install for iPhone 11"
export CRYPTEXCTL_UDID=00008030-001538D03C40012E
sudo purge
echo "Clean x^2"
make clean
make clean
echo "Running Purge"
sudo purge
echo "time make"
time make
echo "Backup current DMG"
mv srd-universal-cryptex.dmg srd-universal-cryptex.dmg.backup
echo "Copy Toybox Unstripped to the DST"
sudo cp src/toybox/toybox-src/generated/unstripped/toybox com.example.cryptex.dstroot/usr/bin
echo "Codesign Ad Hoc"
codesign --force -s -  com.example.cryptex.dstroot/usr/bin/toybox
echo "Create the Example DMG"
hdiutil create -fs hfs+ -srcfolder com.example.cryptex.dstroot srd-universal-cryptex.dmg
echo "Personalize the cryptex"
cryptexctl ${CRYPTEXCTL_FLAGS} create --replace ${CRYPTEXCTL_CREATE_FLAGS} -i com.example.cryptex -v 1.3.3.7 srd-universal-cryptex.dmg
echo "Uninstall existing com.example.cryptex"
cryptexctl uninstall com.example.cryptex
echo "Install cryptex"
cryptexctl install --variant=research --persist com.example.cryptex.cxbd.signed
echo "Check Installation"
cryptexctl list
echo "Done"

