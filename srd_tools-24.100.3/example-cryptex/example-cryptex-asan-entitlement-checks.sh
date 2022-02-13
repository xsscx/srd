#!/bin/sh
echo "Start asan build"
cp src/hello/Makefile.san src/hello/Makefile
make clean
make all
echo "Start of entitlement checks....."
rm /private/tmp/*.xml
echo "Check the entitlements in the src/"
codesign --display --entitlements - --xml src/frida/frida-agent.dylib > /private/tmp/src-frida-agent.xml 
codesign --display --entitlements - --xml src/frida/frida-server > /private/tmp/src-frida-server.xml 
codesign --display --entitlements - --xml src/dropbear/dropbear > /private/tmp/src-dropbear.xml
codesign --display --entitlements - --xml /Applications/Xcode-beta.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/13.1.6/lib/darwin/libclang_rt.asan_ios_dynamic.dylib > /private/tmp/src-libclang_rt.asan_ios_dynamic.dylib.xml 
echo "Changing to toybox unstripped"
chmod 775 src/toybox/toybox-src/generated/unstripped/toybox src/toybox/toybox-src/generated/unstripped/toybox
codesign --force -s - --entitlements src/toybox/entitlements.plist src/toybox/toybox-src/generated/unstripped/toybox
sudo cp src/toybox/toybox-src/generated/unstripped/toybox com.example.cryptex.dstroot/usr/bin
codesign --force -s -  com.example.cryptex.dstroot/usr/bin/toybox
codesign --force -s - --entitlements src/toybox/entitlements.plist com.example.cryptex.dstroot/usr/bin/toybox 
codesign --display --entitlements - --xml src/toybox/toybox-src/generated/unstripped/toybox > /private/tmp/src-toybox.xml 
codesign --display --entitlements - --xml src/simple-shell/simple-shell > /private/tmp/src-simple-server.xml 
codesign --display --entitlements - --xml src/debugserver/debugserver > /private/tmp/src-debugserver.xml 
codesign --display --entitlements - --xml src/hello/hello > /private/tmp/src-hello.xml 
codesign --display --entitlements - --xml src/simple-server/simple-server > /private/tmp/src-simple-server.xml 
codesign --display --entitlements - --xml src/nvram/nvram > /private/tmp/src-nvram.xml 
codesign --display --entitlements - --xml src/cryptex-run/cryptex-run > /private/tmp/src-cryptex-run.xml 
echo "Check the entitlements in the dstroot/"
codesign --display --entitlements - --xml com.example.cryptex.dstroot/usr/lib/frida/frida-agent.dylib > /private/tmp/dst-frida-agent.xml 
codesign --display --entitlements - --xml com.example.cryptex.dstroot/usr/bin/frida-server > /private/tmp/dst-frida-server.xml 
codesign --display --entitlements - --xml com.example.cryptex.dstroot/usr/bin/dropbear > /private/tmp/dst-dropbear.xml 
codesign --display --entitlements - --xml com.example.cryptex.dstroot/usr/bin/toybox > /private/tmp/dst-toybox.xml 
codesign --display --entitlements - --xml com.example.cryptex.dstroot/usr/bin/simple-shell > /private/tmp/dst-simple-server.xml 
codesign --display --entitlements - --xml com.example.cryptex.dstroot/usr/bin/debugserver > /private/tmp/dst-debugserver.xml 
codesign --display --entitlements - --xml com.example.cryptex.dstroot/usr/bin/hello > /private/tmp/dst-hello.xml 
codesign --display --entitlements - --xml com.example.cryptex.dstroot/usr/bin/simple-server > /private/tmp/dst-simple-server.xml 
codesign --display --entitlements - --xml com.example.cryptex.dstroot/usr/bin/nvram > /private/tmp/dst-nvram.xml 
codesign --display --entitlements - --xml com.example.cryptex.dstroot/usr/bin/cryptex-run > /private/tmp/dst-cryptex-run.xml 
codesign --display --entitlements - --xml com.example.cryptex.dstroot/usr/bin/libclang_rt.asan_ios_dynamic.dylib > /private/tmp/dst-libclang_rt.asan_ios_dynamic.dylib.xml 
echo "diff the entitlements..."
echo "Check for frida-agent"
diff /private/tmp/src-frida-agent.xml /private/tmp/dst-frida-agent.xml
echo "Check for frida-server"
diff /private/tmp/src-frida-server.xml /private/tmp/dst-frida-server.xml
echo "Check for dropbear"
diff /private/tmp/src-dropbear.xml /private/tmp/dst-dropbear.xml
echo "Check for toybox"
diff /private/tmp/src-toybox.xml /private/tmp/dst-toybox.xml
echo "Check for simple-server"
diff /private/tmp/src-simple-server.xml /private/tmp/dst-simple-server.xml
echo "Check for debugserver"
diff /private/tmp/src-debugserver.xml /private/tmp/dst-debugserver.xml
echo "Check for hello"
diff /private/tmp/src-hello.xml /private/tmp/dst-hello.xml
echo "Check for nvram"
diff /private/tmp/src-nvram.xml /private/tmp/dst-nvram.xml
echo "Check for cryptex-run"
diff /private/tmp/src-cryptex-run.xml /private/tmp/dst-cryptex-run.xml
echo "Check for libclang_rt.asan_ios_dynamic.dylib"
diff /private/tmp/src-libclang_rt.asan_ios_dynamic.dylib.xml /private/tmp/dst-libclang_rt.asan_ios_dynamic.dylib.xml
echo "End of entitlement checks....."
hdiutil create -fs hfs+ -srcfolder com.example.cryptex.dstroot srd-universal-cryptex.dmg
cryptexctl ${CRYPTEXCTL_FLAGS} create --research --replace ${CRYPTEXCTL_CREATE_FLAGS} --identifier=com.example.cryptex --version=1.3.3.7 --variant=research srd-universal-cryptex.dmg
cryptexctl ${CRYPTEXCTL_PERSONALIZE_FLAGS} personalize --replace  --variant=research com.example.cryptex.cxbd
cryptexctl uninstall com.example.cryptex
cryptexctl install --variant=research --persist com.example.cryptex.cxbd.signed
cryptexctl list
