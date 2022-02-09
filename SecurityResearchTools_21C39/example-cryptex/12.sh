#!/bin/sh
echo "Running Clean, Build, Install for iPhone 12"
export CRYPTEXCTL_UDID=00008101-001418DA3CC0013A
echo "DMG Backup"
backup_files="srd-universal-cryptex.dmg"
dest="~/security-research-device-main/example-cryptex/dmg-backup"
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
echo "Extra Clean"
make clean
echo "Running Purge"
sudo purge
echo "Timing make"
time make
echo "Running Purge"
sudo purge
echo "Copy Toybox Unstripped to the DST"
chmod 775 src/toybox/toybox-src/generated/unstripped/toybox
sudo cp src/toybox/toybox-src/generated/unstripped/toybox com.example.cryptex.dstroot/usr/bin
sudo purge
echo "Codesign Ad Hoc"
codesign --force -s -  com.example.cryptex.dstroot/usr/bin/toybox
sudo purge
echo "Delete the old DMG"
rm srd-universal-cryptex.dmg
echo "Create the Example DMG"
hdiutil create -fs hfs+ -srcfolder com.example.cryptex.dstroot srd-universal-cryptex.dmg
sudo purge
echo "Uninstall existing com.example.cryptex"
cryptexctl uninstall com.example.cryptex
echo "Create the cryptex"
sudo purge
cryptexctl ${CRYPTEXCTL_FLAGS} create --research --replace ${CRYPTEXCTL_CREATE_FLAGS} --identifier=com.example.cryptex --version=1.3.3.7 --variant=research srd-universal-cryptex.dmg
sudo purge
echo "Personalize cryptex"
cryptexctl ${CRYPTEXCTL_PERSONALIZE_FLAGS} personalize --replace  --variant=research com.example.cryptex.cxbd
sudo purge
echo "Install cryptex"
cryptexctl install --variant=research --persist com.example.cryptex.cxbd.signed
echo "Check Installation"
cryptexctl list
sudo purge
echo "Done"
