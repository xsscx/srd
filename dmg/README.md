# Install a Cryptex with Toybox Unstripped using SRT 21C39

Download DMG, install & ssh to the SRD. Includes toybox unstripped, debugserver and other example PoC's as of 11 Jan 2022. 

How To Build toybox unstripped DMG for the SRD
------
```
cd example-cryptex
make
sudo cp src/toybox/toybox-src/generated/unstripped/toybox com.example.cryptex.dstroot/usr/bin
codesign --force -s -  com.example.cryptex.dstroot/usr/bin/toybox
hdiutil create -fs hfs+ -srcfolder com.example.cryptex.dstroot toyboxunstripped.dmg
```
How to Install toybox unstripped DMG to the SRD
-----
```
Download example SRD DMG
cd example-cryptex
cryptexctl ${CRYPTEXCTL_FLAGS} create --replace ${CRYPTEXCTL_CREATE_FLAGS} -i ${CRYPTEX_ID} -v ${CRYPTEX_VERSION} ${CRYPTEX_DMG_NAME}
Example: cryptexctl ${CRYPTEXCTL_FLAGS} create --replace ${CRYPTEXCTL_CREATE_FLAGS} -i com.example.cryptex -v 1.3.3.7 toyboxunstripped.dmg
If necessary: cryptexctl uninstall com.example.cryptex
cryptexctl install --variant=research --persist com.example.cryptex.cxbd.signed
ssh to SRD
```
Confirm that the Cryptex is Installed on iPhone 11 SRD0009
-----
```
cryptexctl list
com.example.cryptex
  version = 1.3.3.7
  device = /dev/disk3s1
  mount point = /private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.nJlkxj
```
Confirm that the Cryptex is Installed on iPhone 12 SRD0037
----
```
[example-cryptex] - Creating cryptex /Users/xss/security-research-device/example-cryptex/com.example.cryptex.cxbd - 1.3.3.7 from the disk image com.example.cryptex.dmg
[example-cryptex] - Installing /Users/xss/security-research-device/example-cryptex/com.example.cryptex.cxbd onto device: 00008101-001418DA3CC0013A
cryptexctl: mount entry invalid: idx = 0, val = null
cryptexctl: cryptex not installed on device: com.example.cryptex
com.example.cryptex
  version = 1.3.3.7
  device = /dev/disk3s1
  mount point = /private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.Jp4Egr
```
SSH Audit Trail
-----
iPhone 11 SRD0009
```
uname -a
Darwin iPhone 21.2.0 Darwin Kernel Version 21.2.0: Sun Nov 28 20:43:35 PST 2021; root:xnu-8019.62.2~1/RELEASE_ARM64_T8030 iPhone12,1 Toybox
date
Tue Jan 11 08:15:45 EST 2022
```
iPhone 12 SRD0037
```
uname -a
Darwin iPhone 21.3.0 Darwin Kernel Version 21.3.0: Sat Dec  4 02:01:21 PST 2021; root:xnu-8019.80.11~18/RELEASE_ARM64_T8101 iPhone13,2 Toybox
date
Tue Jan 11 08:25:49 EST 2022
```
SRD DMG Contents 
-----
```
tree com.example.cryptex.dstroot
com.example.cryptex.dstroot
├── Library
│   └── LaunchDaemons
│       ├── debugserver.plist
│       ├── dropbear-research.plist
│       ├── hello.plist
│       ├── simple-server.plist
│       └── simple-shell.plist
└── usr
    └── bin
        ├── [ -> toybox
        ├── a.out
        ├── ascii -> toybox
        ├── aslr
        ├── base64 -> toybox
        ├── basename -> toybox
        ├── bash -> toybox
        ├── binbag
        ├── c1.exr
        ├── c2.exr
        ├── cal -> toybox
        ├── cat -> toybox
        ├── catv -> toybox
        ├── chain3
        ├── chgrp -> toybox
        ├── chmod -> toybox
        ├── chown -> toybox
        ├── cksum -> toybox
        ├── clear -> toybox
        ├── cmp -> toybox
        ├── comm -> toybox
        ├── count -> toybox
        ├── cp -> toybox
        ├── cpio -> toybox
        ├── crash.pvr
        ├── crc32 -> toybox
        ├── cryptex-run
        ├── cut -> toybox
        ├── date -> toybox
        ├── debugserver
        ├── df -> toybox
        ├── dirname -> toybox
        ├── disarm
        ├── dos2unix -> toybox
        ├── dropbear
        ├── du -> toybox
        ├── echo -> toybox
        ├── egrep -> toybox
        ├── env -> toybox
        ├── envprint
        ├── expand -> toybox
        ├── factor -> toybox
        ├── fallocate -> toybox
        ├── false -> toybox
        ├── fgrep -> toybox
        ├── file -> toybox
        ├── find -> toybox
        ├── flock -> toybox
        ├── fmt -> toybox
        ├── ftpget -> toybox
        ├── ftpput -> toybox
        ├── fuzzed.tif
        ├── getconf -> toybox
        ├── grep -> toybox
        ├── groups -> toybox
        ├── head -> toybox
        ├── hello
        ├── hello-code-cov
        ├── hello_world
        ├── hellosan
        ├── help -> toybox
        ├── hexedit -> toybox
        ├── hostname -> toybox
        ├── iconv -> toybox
        ├── id -> toybox
        ├── image.jpeg
        ├── ioclass
        ├── ioprint
        ├── ioreg
        ├── ios-13_voucher_leak
        ├── ios-14-voucher_leak
        ├── ios-command-line-tool
        ├── ioscan
        ├── jtool2
        ├── kill -> toybox
        ├── killall5 -> toybox
        ├── leak64
        ├── libarchive.a
        ├── libgmalloc.dylib
        ├── libmemctl_core.a
        ├── link -> toybox
        ├── lister
        ├── ln -> toybox
        ├── logger -> toybox
        ├── logname -> toybox
        ├── ls -> toybox
        ├── md5sum -> toybox
        ├── memctl
        ├── microcom -> toybox
        ├── mkdir -> toybox
        ├── mkfifo -> toybox
        ├── mktemp -> toybox
        ├── mv -> toybox
        ├── nc -> toybox
        ├── netcat -> toybox
        ├── nice -> toybox
        ├── nl -> toybox
        ├── nohup -> toybox
        ├── nvram
        ├── od -> toybox
        ├── optool
        ├── orig.tif
        ├── paste -> toybox
        ├── patch -> toybox
        ├── port_refs
        ├── prinfkernversion
        ├── printenv -> toybox
        ├── printf -> toybox
        ├── pwd -> toybox
        ├── pwdx -> toybox
        ├── readlink -> toybox
        ├── realpath -> toybox
        ├── renice -> toybox
        ├── rev -> toybox
        ├── rm -> toybox
        ├── rmdir -> toybox
        ├── sed -> toybox
        ├── seq -> toybox
        ├── setsid -> toybox
        ├── sh -> toybox
        ├── sha1sum -> toybox
        ├── simple-server
        ├── simple-shell
        ├── skywalktest
        ├── sleep -> toybox
        ├── sort -> toybox
        ├── split -> toybox
        ├── stage0
        ├── stage1
        ├── stage2
        ├── stat -> toybox
        ├── strings -> toybox
        ├── tac -> toybox
        ├── tail -> toybox
        ├── tar -> toybox
        ├── tee -> toybox
        ├── test -> toybox
        ├── test1
        ├── test2
        ├── test3
        ├── test4
        ├── test6
        ├── test7
        ├── test8
        ├── tester
        ├── time -> toybox
        ├── timeout -> toybox
        ├── touch -> toybox
        ├── toybox
        ├── toysh -> toybox
        ├── true -> toybox
        ├── truncate -> toybox
        ├── tty -> toybox
        ├── uname -> toybox
        ├── uniq -> toybox
        ├── unix2dos -> toybox
        ├── unlink -> toybox
        ├── usleep -> toybox
        ├── uudecode -> toybox
        ├── uuencode -> toybox
        ├── uuidgen -> toybox
        ├── vs_cli
        ├── w -> toybox
        ├── watch -> toybox
        ├── wc -> toybox
        ├── welcome
        ├── wget -> toybox
        ├── which -> toybox
        ├── who -> toybox
        ├── whoami -> toybox
        ├── xargs -> toybox
        ├── xxd -> toybox
        ├── yes -> toybox
        └── zprint

4 directories, 179 files
```
