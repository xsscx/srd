#!/bin/sh
echo "This script attempts to capture the entitlements on src only following make and then comapare to dstroot when DMG is built"
echo "Deleting some scratch file which may not exist..."
rm make-all-compare-entitlements.txt list-dstroot-entitlements-in-binary.txt entitlements-at-src.txt list-dstroot-entitlements-in-binary.txt list-src-entitlements-in-binary.txt make-install-compare-entitlements.txt  list-of-files.txt dstroot-list-of-files.txt make-dstroot-compare-entitlements.txt
echo "These are the files being check for entitlements at the src/ dir .... enter the binary file names 1 per line to be checked...."
cat list-src-entitlements-in-binary.txt | xargs codesign --display --entitlements - --xml > entitlements-at-src.txt
echo "Now check those entitlements against com.example.cryptex.dstroot..."
for item in `find com.example.cryptex.dstroot -perm -0100 -type f` ; do file $item | grep 'Mach-O' ; done | awk '{print $1}' | sed 's/\:$//' | uniq > list-dstroot-entitlements-in-binary.txt
echo "Do some ugly cat to get the existing entitlements"
cat list-src-entitlements-in-binary.txt | xargs codesign --display --entitlements - --xml > make-all-compare-entitlements.txt
echo "Do some ugly cat to get the entitlements built in dstroot and within the DMG"
cat list-dstroot-entitlements-in-binary.txt | xargs codesign --display --entitlements - --xml > make-install-compare-entitlements.txt
echo "Do some ugly fidd and see what, if anything is different...."
diff make-all-compare-entitlements.txt make-install-compare-entitlements.txt