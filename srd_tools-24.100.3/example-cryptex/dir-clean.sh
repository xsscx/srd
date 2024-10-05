#!/bin/sh
echo "AMFI complains on T8101 XNU macOS and doesn't always make clean, aka the clean bug..."
sudo xattr -c * src/* src/*/*
rm -rf com.example.cryptex.cxbd com.example.cryptex.cxbd.signed com.example.cryptex.dstroot com.example.cryptex.cptx *.dmg
ls -tla
