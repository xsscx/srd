#!/bin/sh
echo "Poor Man's Fixup for Dropbear configure.ac for SRD"
rm src/dropbear/dropbear
rm src/dropbear/dropbear-src/*.o
rm com.example.cryptex.dstroot/usr/bin/dropbear
wget https://raw.githubusercontent.com/xsscx/srd/main/srd_tools-24.100.3/example-cryptex/src/dropbear/configure.ac
mv configure.ac src/dropbear/dropbear-src
make
echo "Done here with the dropbear fixup, now back to installing..."
