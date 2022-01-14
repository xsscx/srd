# Beta Cryptex for SRD iPhone 11 + 12
Status == Built to DMG for Download

This cryptex will add Frida and re-include debugserver and other tooling left out of recent example cryptex due to Built Pipeline issues.

Frida Cryptex example DMG https://github.com/xsscx/srd/tree/main/dmg

Audit Trail
---
```
Install commands...
[example-cryptex] - Creating a distribution root: /Users/xss/security-research-device-main/example-cryptex/com.example.cryptex.dstroot
[welcome] - [++] Building welcome
[welcome] - [+++] Installing welcome
[example-cryptex] - [+++] Installing prebuilt binary: a.out
[example-cryptex] - [+++] Installing prebuilt binary: aslr
[example-cryptex] - [+++] Installing prebuilt binary: binbag
[example-cryptex] - [+++] Installing prebuilt binary: c1.exr
[example-cryptex] - [+++] Installing prebuilt binary: c2.exr
[example-cryptex] - [+++] Installing prebuilt binary: chain3
[example-cryptex] - [+++] Installing prebuilt binary: crash.pvr
[example-cryptex] - [+++] Installing prebuilt binary: disarm
[example-cryptex] - [+++] Installing prebuilt binary: envprint
[example-cryptex] - [+++] Installing prebuilt binary: fuzzed.tif
[example-cryptex] - [+++] Installing prebuilt binary: hello-code-cov
[example-cryptex] - [+++] Installing prebuilt binary: hello_world
[example-cryptex] - [+++] Installing prebuilt binary: hellosan
[example-cryptex] - [+++] Installing prebuilt binary: image.jpeg
[example-cryptex] - [+++] Installing prebuilt binary: ioclass
[example-cryptex] - [+++] Installing prebuilt binary: ioprint
[example-cryptex] - [+++] Installing prebuilt binary: ioreg
[example-cryptex] - [+++] Installing prebuilt binary: ios-13_voucher_leak
[example-cryptex] - [+++] Installing prebuilt binary: ios-14-voucher_leak
[example-cryptex] - [+++] Installing prebuilt binary: ios-command-line-tool
[example-cryptex] - [+++] Installing prebuilt binary: ioscan
[example-cryptex] - [+++] Installing prebuilt binary: jtool2
[example-cryptex] - [+++] Installing prebuilt binary: leak64
[example-cryptex] - [+++] Installing prebuilt binary: libarchive.a
[example-cryptex] - [+++] Installing prebuilt binary: libgmalloc.dylib
[example-cryptex] - [+++] Installing prebuilt binary: libmemctl_core.a
[example-cryptex] - [+++] Installing prebuilt binary: lister
[example-cryptex] - [+++] Installing prebuilt binary: memctl
[example-cryptex] - [+++] Installing prebuilt binary: optool
[example-cryptex] - [+++] Installing prebuilt binary: orig.tif
[example-cryptex] - [+++] Installing prebuilt binary: port_refs
[example-cryptex] - [+++] Installing prebuilt binary: prinfkernversion
[example-cryptex] - [+++] Installing prebuilt binary: skywalktest
[example-cryptex] - [+++] Installing prebuilt binary: stage0
[example-cryptex] - [+++] Installing prebuilt binary: stage1
[example-cryptex] - [+++] Installing prebuilt binary: stage2
[example-cryptex] - [+++] Installing prebuilt binary: test1
[example-cryptex] - [+++] Installing prebuilt binary: test2
[example-cryptex] - [+++] Installing prebuilt binary: test3
[example-cryptex] - [+++] Installing prebuilt binary: test4
[example-cryptex] - [+++] Installing prebuilt binary: test6
[example-cryptex] - [+++] Installing prebuilt binary: test7
[example-cryptex] - [+++] Installing prebuilt binary: test8
[example-cryptex] - [+++] Installing prebuilt binary: tester
[example-cryptex] - [+++] Installing prebuilt binary: vs_cli
[example-cryptex] - [+++] Installing prebuilt binary: zprint
[example-cryptex] - Creating disk image com.example.cryptex.dmg from distribution root /Users/xss/security-research-device-main/example-cryptex/com.example.cryptex.dstroot
....................................................................................................................................................................................................................................................................................................................................................
created: /Users/xss/security-research-device-main/example-cryptex/com.example.cryptex.dmg
[example-cryptex] - Creating cryptex /Users/xss/security-research-device-main/example-cryptex/com.example.cryptex.cxbd - 1.3.3.7 from the disk image com.example.cryptex.dmg
xss@mini example-cryptex % sudo cp src/toybox/toybox-src/generated/unstripped/toybox com.example.cryptex.dstroot/usr/bin
codesign --force -s -  com.example.cryptex.dstroot/usr/bin/toybox
hdiutil create -fs hfs+ -srcfolder com.example.cryptex.dstroot toyboxunstripped.dmg
....................................................................................................................................................................................................................................................................................................................................................
created: /Users/xss/security-research-device-main/example-cryptex/toyboxunstripped.dmg
xss@mini example-cryptex % cryptexctl ${CRYPTEXCTL_FLAGS} create --replace ${CRYPTEXCTL_CREATE_FLAGS} -i com.example.cryptex -v 1.3.3.7 toyboxunstripped.dmg
cryptexctl uninstall com.example.cryptex
cryptexctl install --variant=research --persist com.example.cryptex.cxbd.signed
```
