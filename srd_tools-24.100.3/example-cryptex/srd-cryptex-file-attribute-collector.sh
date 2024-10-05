#!/bin/sh
echo "=========================================="
echo "SRD Cryptex File Profile Collector Start"
echo "=========================================="
echo "Collecting Info"
echo "==========================================" > srd-cryptex-file-attribute-collector.log 2>&1
date >> srd-cryptex-file-attribute-collector.log 2>&1
codesign --display --entitlements - --xml com.example.cryptex.dstroot/usr/bin/cryptex-run >> srd-cryptex-file-attribute-collector.log 2>&1
codesign -dvvv /Users/xss/example-cryptex/src/cryptex-run >> srd-cryptex-file-attribute-collector.log 2>&1
hexdump -n 4 com.example.cryptex.dstroot/usr/bin/cryptex-run >> srd-cryptex-file-attribute-collector.log 2>&1
otool -L  com.example.cryptex.dstroot/usr/bin/cryptex-run >> srd-cryptex-file-attribute-collector.log 2>&1
xcrun dyldinfo -rebase -bind  com.example.cryptex.dstroot/usr/bin/cryptex-run >> srd-cryptex-file-attribute-collector.log 2>&1
machodump -i com.example.cryptex.dstroot/usr/bin/cryptex-run >> srd-cryptex-file-attribute-collector.log 2>&1
codesign --display --entitlements - --xml com.example.cryptex.dstroot/usr/bin/debugserver >> srd-cryptex-file-attribute-collector.log 2>&1
codesign -dvvv /Users/xss/example-cryptex/src/debugserver >> srd-cryptex-file-attribute-collector.log 2>&1
hexdump -n 4 com.example.cryptex.dstroot/usr/bin/debugserver >> srd-cryptex-file-attribute-collector.log 2>&1
otool -L  com.example.cryptex.dstroot/usr/bin/debugserver >> srd-cryptex-file-attribute-collector.log 2>&1
xcrun dyldinfo -rebase -bind  com.example.cryptex.dstroot/usr/bin/debugserver >> srd-cryptex-file-attribute-collector.log 2>&1
machodump -i com.example.cryptex.dstroot/usr/bin/debugserver >> srd-cryptex-file-attribute-collector.log 2>&1
codesign --display --entitlements - --xml com.example.cryptex.dstroot/usr/bin/frida-server >> srd-cryptex-file-attribute-collector.log 2>&1
codesign -dvvv /Users/xss/example-cryptex/src/frida-server >> srd-cryptex-file-attribute-collector.log 2>&1
hexdump -n 4 com.example.cryptex.dstroot/usr/bin/frida-server >> srd-cryptex-file-attribute-collector.log 2>&1
otool -L  com.example.cryptex.dstroot/usr/bin/frida-server >> srd-cryptex-file-attribute-collector.log 2>&1
xcrun dyldinfo -rebase -bind  com.example.cryptex.dstroot/usr/bin/frida-server >> srd-cryptex-file-attribute-collector.log 2>&1
machodump -i com.example.cryptex.dstroot/usr/bin/frida-server >> srd-cryptex-file-attribute-collector.log 2>&1
codesign --display --entitlements - --xml com.example.cryptex.dstroot/usr/bin/nvram >> srd-cryptex-file-attribute-collector.log 2>&1
codesign -dvvv /Users/xss/example-cryptex/src/nvram >> srd-cryptex-file-attribute-collector.log 2>&1
hexdump -n 4 com.example.cryptex.dstroot/usr/bin/nvram >> srd-cryptex-file-attribute-collector.log 2>&1
otool -L  com.example.cryptex.dstroot/usr/bin/nvram >> srd-cryptex-file-attribute-collector.log 2>&1
xcrun dyldinfo -rebase -bind  com.example.cryptex.dstroot/usr/bin/nvram >> srd-cryptex-file-attribute-collector.log 2>&1
machodump -i com.example.cryptex.dstroot/usr/bin/nvram >> srd-cryptex-file-attribute-collector.log 2>&1
codesign --display --entitlements - --xml com.example.cryptex.dstroot/usr/bin/simple-server >> srd-cryptex-file-attribute-collector.log 2>&1
codesign -dvvv /Users/xss/example-cryptex/src/simple-server >> srd-cryptex-file-attribute-collector.log 2>&1
hexdump -n 4 com.example.cryptex.dstroot/usr/bin/simple-server >> srd-cryptex-file-attribute-collector.log 2>&1
otool -L  com.example.cryptex.dstroot/usr/bin/simple-server >> srd-cryptex-file-attribute-collector.log 2>&1
xcrun dyldinfo -rebase -bind  com.example.cryptex.dstroot/usr/bin/simple-server >> srd-cryptex-file-attribute-collector.log 2>&1
machodump -i com.example.cryptex.dstroot/usr/bin/simple-server >> srd-cryptex-file-attribute-collector.log 2>&1
codesign --display --entitlements - --xml com.example.cryptex.dstroot/usr/bin/simple-shell >> srd-cryptex-file-attribute-collector.log 2>&1
codesign -dvvv /Users/xss/example-cryptex/src/simple-shell >> srd-cryptex-file-attribute-collector.log 2>&1
hexdump -n 4 com.example.cryptex.dstroot/usr/bin/simple-shell >> srd-cryptex-file-attribute-collector.log 2>&1
otool -L  com.example.cryptex.dstroot/usr/bin/simple-shell >> srd-cryptex-file-attribute-collector.log 2>&1
xcrun dyldinfo -rebase -bind  com.example.cryptex.dstroot/usr/bin/simple-shell >> srd-cryptex-file-attribute-collector.log 2>&1
machodump -i com.example.cryptex.dstroot/usr/bin/simple-shell >> srd-cryptex-file-attribute-collector.log 2>&1
codesign --display --entitlements - --xml com.example.cryptex.dstroot/usr/bin/toybox >> srd-cryptex-file-attribute-collector.log 2>&1
codesign -dvvv /Users/xss/example-cryptex/src/toybox >> srd-cryptex-file-attribute-collector.log 2>&1
hexdump -n 4 com.example.cryptex.dstroot/usr/bin/toybox >> srd-cryptex-file-attribute-collector.log 2>&1
otool -L  com.example.cryptex.dstroot/usr/bin/toybox >> srd-cryptex-file-attribute-collector.log 2>&1
xcrun dyldinfo -rebase -bind  com.example.cryptex.dstroot/usr/bin/toybox >> srd-cryptex-file-attribute-collector.log 2>&1
machodump -i com.example.cryptex.dstroot/usr/bin/toybox >> srd-cryptex-file-attribute-collector.log 2>&1
codesign --display --entitlements - --xml com.example.cryptex.dstroot/usr/bin/hello >> srd-cryptex-file-attribute-collector.log 2>&1
codesign -dvvv /Users/xss/example-cryptex/src/hello >> srd-cryptex-file-attribute-collector.log 2>&1
hexdump -n 4 com.example.cryptex.dstroot/usr/bin/hello >> srd-cryptex-file-attribute-collector.log 2>&1
otool -L  com.example.cryptex.dstroot/usr/bin/hello >> srd-cryptex-file-attribute-collector.log 2>&1
xcrun dyldinfo -rebase -bind  com.example.cryptex.dstroot/usr/bin/hello >> srd-cryptex-file-attribute-collector.log 2>&1
machodump -i com.example.cryptex.dstroot/usr/bin/hello >> srd-cryptex-file-attribute-collector.log 2>&1
echo "==========================================" > srd-cryptex-file-nm-collector.log 2>&1
echo "cryptex-run" >> srd-cryptex-file-nm-collector.log 2>&1
echo "==========================================" >> srd-cryptex-file-nm-collector.log 2>&1
nm -a com.example.cryptex.dstroot/usr/bin/cryptex-run	>> srd-cryptex-file-nm-collector.log 2>&1
echo "==========================================" >> srd-cryptex-file-nm-collector.log 2>&1
echo "debugserver" >> srd-cryptex-file-nm-collector.log 2>&1
echo "==========================================" >> srd-cryptex-file-nm-collector.log 2>&1
nm -a com.example.cryptex.dstroot/usr/bin/debugserver	>> srd-cryptex-file-nm-collector.log 2>&1
echo "==========================================" >> srd-cryptex-file-nm-collector.log 2>&1
echo "dropbear" >> srd-cryptex-file-nm-collector.log 2>&1
echo "==========================================" >> srd-cryptex-file-nm-collector.log 2>&1
nm -a com.example.cryptex.dstroot/usr/bin/dropbear >> srd-cryptex-file-nm-collector.log 2>&1
echo "==========================================" >> srd-cryptex-file-nm-collector.log 2>&1
echo "frida" >> srd-cryptex-file-nm-collector.log 2>&1
echo "==========================================" >> srd-cryptex-file-nm-collector.log 2>&1
nm -a com.example.cryptex.dstroot/usr/bin/frida-server	>> srd-cryptex-file-nm-collector.log 2>&1
echo "==========================================" >> srd-cryptex-file-nm-collector.log 2>&1
echo "hello" >> srd-cryptex-file-nm-collector.log 2>&1
echo "==========================================" >> srd-cryptex-file-nm-collector.log 2>&1
nm -a com.example.cryptex.dstroot/usr/bin/hello	>> srd-cryptex-file-nm-collector.log 2>&1
echo "==========================================" >> srd-cryptex-file-nm-collector.log 2>&1
echo "nvram" >> srd-cryptex-file-nm-collector.log 2>&1
echo "==========================================" >> srd-cryptex-file-nm-collector.log 2>&1
nm -a com.example.cryptex.dstroot/usr/bin/nvram	>> srd-cryptex-file-nm-collector.log 2>&1
echo "==========================================" >> srd-cryptex-file-nm-collector.log 2>&1
echo "simple-server" >> srd-cryptex-file-nm-collector.log 2>&1
echo "==========================================" >> srd-cryptex-file-nm-collector.log 2>&1
nm -a com.example.cryptex.dstroot/usr/bin/simple-server	>> srd-cryptex-file-nm-collector.log 2>&1
echo "==========================================" >> srd-cryptex-file-nm-collector.log 2>&1
echo "simple-shell" >> srd-cryptex-file-nm-collector.log 2>&1
echo "==========================================" >> srd-cryptex-file-nm-collector.log 2>&1
nm -a com.example.cryptex.dstroot/usr/bin/simple-shell >> srd-cryptex-file-nm-collector.log 2>&1
echo "==========================================" >> srd-cryptex-file-nm-collector.log 2>&1
echo "toybox" >> srd-cryptex-file-nm-collector.log 2>&1
echo "==========================================" >> srd-cryptex-file-nm-collector.log 2>&1
nm -a com.example.cryptex.dstroot/usr/bin/toybox >> srd-cryptex-file-nm-collector.log 2>&1
echo "EOF" >> srd-cryptex-file-nm-collector.log 2>&1
echo "=========================================="
echo "SRD Cryptex File Profile Collector Stop"
echo "=========================================="
