#!/bin/sh
echo "Running Clean, Build, Install for iPhone 11"
export CRYPTEXCTL_UDID=00008030-001538D03C40012E
echo "DMG Backup"
backup_files="srd-universal-cryptex.dmg"
dest="/Users/xss/security-research-device-main/example-cryptex/dmg-backup"
day=$(date +%A)
hostname=$(hostname -s)
archive_file="$hostname.X86_64.cryptex.$day.tgz"
echo "Backing up $backup_files to $dest/$archive_file"
tar czf $dest/$archive_file $backup_files
echo "Backup finished"
echo "Backup Listing"
ls -lh $dest
echo "Running Purge"
sudo purge
echo "Clean"
make clean
echo "Clean Again"
make clean
echo "Running Purge"
sudo purge
echo "time make"
time make
echo "Copy Toybox Unstripped to the DST"
sudo cp src/toybox/toybox-src/generated/unstripped/toybox com.example.cryptex.dstroot/usr/bin
echo "Codesign Ad Hoc"
codesign --force -s -  com.example.cryptex.dstroot/usr/bin/toybox
echo "Delete the old DMG"
rm srd-universal-cryptex.dmg
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
