#!/bin/sh
echo "umount com.example.cryptex"
cryptexctl uninstall com.example.cryptex
echo "Getting DMG...."
wget https://github.com/xsscx/srd/raw/main/dmg/srd-universal-cryptex.dmg
echo "running.. hdiutil attach srd-universal-cryptex.dmg"
hdiutil attach srd-universal-cryptex.dmg
echo "Installing a Cryptex with CryptexManager\n\n Using CryptexManager create -i com.example.cryptex -v 1.3.3.7  srd-universal-cryptex.dmg /Volumes/com.example.cryptex.dstroot /tmp/cptx\n\n"
CryptexManager create -i com.example.cryptex -v 1.3.3.7  srd-universal-cryptex.dmg /Volumes/com.example.cryptex.dstroot /tmp/cptx
CryptexManager install /tmp/cptx
CryptexManager list
hdiutil detach /Volumes/com.example.cryptex.dstroot
rm -rf /tmp/cptx com.example.cryptex.cxbd
echo "done..."
