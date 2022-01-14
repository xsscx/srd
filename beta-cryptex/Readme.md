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
Tree
----
```
tree com.example.cryptex.dstroot
com.example.cryptex.dstroot
├── Library
│   └── LaunchDaemons
│       ├── debugserver.plist
│       ├── dropbear-research.plist
│       ├── hello.plist
│       ├── re.frida.policyd.plist
│       ├── re.frida.server.plist
│       ├── simple-server.plist
│       └── simple-shell.plist
└── usr
    ├── bin
    │   ├── [ -> toybox
    │   ├── a.out
    │   ├── ascii -> toybox
    │   ├── aslr
    │   ├── base64 -> toybox
    │   ├── basename -> toybox
    │   ├── bash -> toybox
    │   ├── binbag
    │   ├── c1.exr
    │   ├── c2.exr
    │   ├── cal -> toybox
    │   ├── cat -> toybox
    │   ├── catv -> toybox
    │   ├── chain3
    │   ├── chgrp -> toybox
    │   ├── chmod -> toybox
    │   ├── chown -> toybox
    │   ├── cksum -> toybox
    │   ├── clear -> toybox
    │   ├── cmp -> toybox
    │   ├── comm -> toybox
    │   ├── count -> toybox
    │   ├── cp -> toybox
    │   ├── cpio -> toybox
    │   ├── crash.pvr
    │   ├── crc32 -> toybox
    │   ├── cryptex-run
    │   ├── cut -> toybox
    │   ├── date -> toybox
    │   ├── debugserver
    │   ├── df -> toybox
    │   ├── dirname -> toybox
    │   ├── disarm
    │   ├── dos2unix -> toybox
    │   ├── dropbear
    │   ├── du -> toybox
    │   ├── echo -> toybox
    │   ├── egrep -> toybox
    │   ├── env -> toybox
    │   ├── envprint
    │   ├── expand -> toybox
    │   ├── factor -> toybox
    │   ├── fallocate -> toybox
    │   ├── false -> toybox
    │   ├── fgrep -> toybox
    │   ├── file -> toybox
    │   ├── find -> toybox
    │   ├── flock -> toybox
    │   ├── fmt -> toybox
    │   ├── frida-server
    │   ├── ftpget -> toybox
    │   ├── ftpput -> toybox
    │   ├── fuzzed.tif
    │   ├── getconf -> toybox
    │   ├── grep -> toybox
    │   ├── groups -> toybox
    │   ├── head -> toybox
    │   ├── hello
    │   ├── hello-code-cov
    │   ├── hello_world
    │   ├── hellosan
    │   ├── help -> toybox
    │   ├── hexedit -> toybox
    │   ├── hostname -> toybox
    │   ├── iconv -> toybox
    │   ├── id -> toybox
    │   ├── image.jpeg
    │   ├── ioclass
    │   ├── ioprint
    │   ├── ioreg
    │   ├── ios-13_voucher_leak
    │   ├── ios-14-voucher_leak
    │   ├── ios-command-line-tool
    │   ├── ioscan
    │   ├── jtool2
    │   ├── kill -> toybox
    │   ├── killall5 -> toybox
    │   ├── leak64
    │   ├── libarchive.a
    │   ├── libgmalloc.dylib
    │   ├── libmemctl_core.a
    │   ├── link -> toybox
    │   ├── lister
    │   ├── ln -> toybox
    │   ├── logger -> toybox
    │   ├── logname -> toybox
    │   ├── ls -> toybox
    │   ├── md5sum -> toybox
    │   ├── memctl
    │   ├── microcom -> toybox
    │   ├── mkdir -> toybox
    │   ├── mkfifo -> toybox
    │   ├── mktemp -> toybox
    │   ├── mv -> toybox
    │   ├── nc -> toybox
    │   ├── netcat -> toybox
    │   ├── nice -> toybox
    │   ├── nl -> toybox
    │   ├── nohup -> toybox
    │   ├── nvram
    │   ├── od -> toybox
    │   ├── optool
    │   ├── orig.tif
    │   ├── paste -> toybox
    │   ├── patch -> toybox
    │   ├── port_refs
    │   ├── prinfkernversion
    │   ├── printenv -> toybox
    │   ├── printf -> toybox
    │   ├── pwd -> toybox
    │   ├── pwdx -> toybox
    │   ├── readlink -> toybox
    │   ├── realpath -> toybox
    │   ├── renice -> toybox
    │   ├── rev -> toybox
    │   ├── rm -> toybox
    │   ├── rmdir -> toybox
    │   ├── sed -> toybox
    │   ├── seq -> toybox
    │   ├── setsid -> toybox
    │   ├── sh -> toybox
    │   ├── sha1sum -> toybox
    │   ├── simple-server
    │   ├── simple-shell
    │   ├── skywalktest
    │   ├── sleep -> toybox
    │   ├── sort -> toybox
    │   ├── split -> toybox
    │   ├── stage0
    │   ├── stage1
    │   ├── stage2
    │   ├── stat -> toybox
    │   ├── strings -> toybox
    │   ├── tac -> toybox
    │   ├── tail -> toybox
    │   ├── tar -> toybox
    │   ├── tee -> toybox
    │   ├── test -> toybox
    │   ├── test1
    │   ├── test2
    │   ├── test3
    │   ├── test4
    │   ├── test6
    │   ├── test7
    │   ├── test8
    │   ├── tester
    │   ├── time -> toybox
    │   ├── timeout -> toybox
    │   ├── touch -> toybox
    │   ├── toybox
    │   ├── toysh -> toybox
    │   ├── true -> toybox
    │   ├── truncate -> toybox
    │   ├── tty -> toybox
    │   ├── uname -> toybox
    │   ├── uniq -> toybox
    │   ├── unix2dos -> toybox
    │   ├── unlink -> toybox
    │   ├── usleep -> toybox
    │   ├── uudecode -> toybox
    │   ├── uuencode -> toybox
    │   ├── uuidgen -> toybox
    │   ├── vi -> toybox
    │   ├── vs_cli
    │   ├── w -> toybox
    │   ├── watch -> toybox
    │   ├── wc -> toybox
    │   ├── welcome
    │   ├── wget -> toybox
    │   ├── which -> toybox
    │   ├── who -> toybox
    │   ├── whoami -> toybox
    │   ├── xargs -> toybox
    │   ├── xxd -> toybox
    │   ├── yes -> toybox
    │   └── zprint
    └── lib
        └── frida
            └── frida-agent.dylib

6 directories, 184 files
```
