# Hoyt's Example Cryptex & DMG for SRT 21C39

SUN 16 JAN 2022
----
- Source: https://github.com/xsscx/srd/tree/main/SecurityResearchTools_21C39/example-cryptex
- DMG: https://xss.cx/srd/dmg/srd-universal-cryptex.dmg
- Install: https://github.com/xsscx/srd/tree/main/dmg#readme
- Build: https://xss.cx/srd/21C39/example-cryptex.zip

## Prerequisites
- macOS Version 12.1 (21C52)
- Xcode Version 13.2.1 (13C100)
- Security Research Tools 21C39 (SRT 21C39)
- GNU sed
- automake

If you use brew:

```sh
brew install gnu-sed automake
```
SRD DMG Install
---
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/xsscx/srd/main/dmg/install.sh)"
```
SRD DMG File
---
```
shasum srd-universal-cryptex.dmg
9f7f30af3beab25f404cc47a89818a306f1da1ad  srd-universal-cryptex.dmg
26M Jan 15 18:20 srd-universal-cryptex.dmg
```
SRD DMG Testing
-----
- Universal cryptex for iPhone 11 and iPhone 12 SRD Models 
- Tested on the iPhone 11 for all IPSW from the iOS 14.3 floor for the iPhone 11 up to the latest iOS 15.3 Beta 
- Tested on the iPhone 12 for all IPSW from the iOS 15.2 floor for the iPhone 12 up to the latest iOS 15.3 Beta
- Tested on macOS 11.6.x using SRT 20C80, macOS 12.x using 21C39 and Cryptex Manager from X86_64 and M1 T8101 Platforms 

SRD Cryptex Log Collector
---
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/xsscx/srd/main/SecurityResearchTools_21C39/example-cryptex/srd-cryptex-troubleshooter.sh)"
```
Do you have questions or need help? Reach out and open an Issue or Discussion. DM if that's easier. Include some of the Details from these Logs.

# Recent IPSW + Cryptex Installations 
```
Signed File: iPhone11,8,iPhone12,1_15.2.1_19C63_Restore.ipsw | defaults write com.apple.AMPDevicesAgent ipsw-variant -string 'Research Customer Erase Install (IPSW)' 
Signed File: iPhone13,2,iPhone13,3_15.2.1_19C63_Restore.ipsw | defaults write com.apple.AMPDevicesAgent ipsw-variant -string 'Research Customer Erase Install (IPSW)'
Signed File: iPhone11,8,iPhone12,1_15.3_19D5040e_Restore.ipsw | defaults write com.apple.AMPDevicesAgent ipsw-variant -string 'Research Developer Erase Install (IPSW)'
Signed File: iPhone13,2,iPhone13,3_15.3_19D5040e_Restore.ipsw | defaults write com.apple.AMPDevicesAgent ipsw-variant -string 'Research Developer Erase Install (IPSW)'
```
The above means that from X86_64 and/or M1 ARM the SRD IPSW has been installed with cryptex personalization verified.

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

Audit Trail
---
```
frida-ps -Uai
PID  Name                Identifier
---  ------------------  -------------------------------------
304   Safari          com.apple.mobilesafari
  -   App Store       com.apple.AppStore
  -   Books           com.apple.iBooks
  -   Calculator      com.apple.calculator
  -   Calendar        com.apple.mobilecal
  -   Camera          com.apple.camera
  -   Clock           com.apple.mobiletimer
  -   Compass         com.apple.compass
  -   Contacts        com.apple.MobileAddressBook
  -   FaceTime        com.apple.facetime
  -   Feedback        com.apple.appleseed.FeedbackAssistant
  -   Files           com.apple.DocumentsApp
  -   Find My         com.apple.findmy
  -   Health          com.apple.Health
  -   Home            com.apple.Home
  -   Magnifier       com.apple.Magnifier
  -   Mail            com.apple.mobilemail
  -   Maps            com.apple.Maps
  -   Measure         com.apple.measure
  -   Messages        com.apple.MobileSMS
  -   Music           com.apple.Music
  -   News            com.apple.news
  -   Notes           com.apple.mobilenotes
  -   Phone           com.apple.mobilephone
  -   Photos          com.apple.mobileslideshow
  -   Podcasts        com.apple.podcasts
  -   Reminders       com.apple.reminders
  -   Settings        com.apple.Preferences
  -   Shortcuts       com.apple.shortcuts
  -   Sidecar         com.apple.sidecar
  -   Stocks          com.apple.stocks
  -   TV              com.apple.tv
  -   Tips            com.apple.tips
  -   Translate       com.apple.Translate
  -   Voice Memos     com.apple.VoiceMemos
  -   Wallet          com.apple.Passbook
  -   Weather         com.apple.weather
  -   Web             com.apple.webapp
  -   Xcode Previews  com.apple.dt.XcodePreviews
  -   iTunes Store    com.apple.MobileStore
```
## Quick start

0. Install the prerequisites and select your Xcode with `xcode-select(1)`.
1. Plug in your Security Research Device
2. Run `cryptexctl device list`
3. Export the environment variable`CRYPTEXCTL_UDID` and set it to the UDID of your device
4. Run `make install`
5. Get the IP address of your device (Settings -> WiFi)
6. Run `nc ${IP} 7777`, if you see "Hello!" it's all working!
7. Now SSH in! `ssh root@${IP}`

## Follow along

Here is a suggested reading order.

0. This README
1. The [build_env.mk](build_env.mk) Makefile
2. The root [Makefile](Makefile)
3. [Hello researcher](src/hello)
4. [simple-server](src/simple-server)
5. [nvram](src/nvram)
6. [toybox](src/toybox)
7. [dropbear](src/dropbear)

## The build process

For simplicity this project mainly uses Make as a build
system as it is expected this will be more familiar to
most people.

The [build_env.mk](build_env.mk) Makefile is a template
that can be included into other Makefiles to set up cross
compilation for arm64e iOS targets. We essentially locate
the iOS SDK and add a `-isysroot` flag when we call the compiler
and linker.

You'll note that we also locate the macOS SDK, this is so
we can pull in specific headers that are present in the
macOS SDK but not in the iOS SDK. We graft them into
our include path, allowing us to compile some tools
that could otherwise only be compiled with an internal
or macOS SDK.

Once the appropriate `CFLAGS` and `LDFLAGS` are exported,
cross compilation is largely a matter of grafting required
headers into the include path and porting your software.

The [root Makefile](Makefile) includes this template
(as do the various projects under the [src/](src/)
directory).

The root Makefile is responsible for creating the cryptex,
distribution root and disk image, while `build_env.mk` is
responsible for cross compilation, and the various
`src/*/Makefile`s are responsible for building individual tools.

Anything in the [bin/](bin/) directory will be copied into
the distribution root's `/usr/bin/` directory for inclusion
into the cryptex. Binaries in this directory should be
at-least ad-hoc signed. This is an easy way to get prebuilt
binaries into your cryptex. Alternatively you could make
a project under [src/](src/) which downloads the binary
and installs it into the distribution root, similar to the
other projects in the src directory.

## Creating a cryptex

A cryptex starts life as a distribution root, essentially
a directory whose contents could be merged on top of the root
of a file system.

The distribution root can contain a number of familiar paths:

- `/Library/LaunchDaemons`
- `/usr/bin`
- `/usr/local/bin`

A disk image (dmg) is then created from this distribution root.
This makes it easy to share a set of tools with others and for
the cryptexctl(1) tool to ingest the distribution root. We refer
to this as the cryptex root dmg or just the dmg.

The dmg is then read by cryptexctl(1) and personalised for a specific
device. A directory containing the personalised content is then output,
this directory is a cryptex. This directory will typically have the
suffix `.cxbd`

It is important to note that while the distribution root and the cryptex
disk image may be shared with others, once the dmg is personalised and
turned into a cryptex, the cryptex may only be installed on the device
for which it has been personalised. That is to say, share the distribution
root or the dmg, others must create their own cryptexes.

## Cryptex Installation and usage

The cryptex may be installed onto a device by using the `cryptexctl install`
command. Once installed, any launch daemons will be started and any Mach-O
files within the cryptex will work on your device.

The cryptex will persist after a reboot, but will be uninstalled on an upgrade.

The cryptex is mounted to a random path, which can be found by running
`cryptexctl list`. This path can change between reboots.

Thankfully the cryptex subsystem can inject an environment variable
when launching a launchd plist that can be used by a binary to locate the
cryptex it is a part of.

A simple example of using this variable can be found in
[cryptex-run](srd/cryptex-run). A more comprehensive example can
be seen in the patches made to [dropbear](src/dropbear).

### Offline installation

The cryptex subsystem requires an internet connection to personalize a cryptex
for a device, it does not require the device to be present or internet connected
for installation of the cryptex.

This allows for workflows where the device is not connected to the host directly
such as when testing in a Faraday cage for radio research, or when the device is
on the other side of an airgap (such as for malware research).

The flow is largely similar to the normal flow except the user must specify
all the information required to perform the personalization to the cryptexctl
create subcommand.

The easiest way to do this is to run `cryptexctl identity` to retrieve the
personalization identifiers, then to create a plist with the identity information
within (see cryptexctl-create(1))

Please note, you will need to keep the cryptex nonce in sync. The nonce hash is specified
with the `--BNCH` flag on `cryptexctl create`, and can be retrieved from the device
with the `cryptexctl nonce` subcommand.

# Troubleshooting

## Cryptexes

The man pages for cryptexctl are broken up into a man page for each subcommand.
The root cryptexctl(1) man page links to the others, which follow the format:
cryptexctl-${SUBCOMMAND}.

There is a troubleshooting section in `cryptexctl-install(1)` which is particularly
helpful. The gist of it is included below:

```sh
# Enable verbose logging with -v, -d and redirect from the system log to stderr with -ldt
cryptexctl -v9 -d9 -ldt install --print-info ./com.example.cryptex.cptx (20C80)
OR 
cryptexctl -v4 -d4  install --variant=research --persist --print-info ./com.example.cryptex.cxbd.signed (21C39)

# Collect logs from the device. The -E is so we capture the CRYPTEXCTL_UDID env var.
# You can alternativly specify --udid on the command line
sudo -E cryptexctl log collect
# View the logs from the archive
cryptexctl log show -- --archive ./system_logs.logarchive
```
## Log Collection
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/xsscx/srd/main/SecurityResearchTools_21C39/example-cryptex/srd-cryptex-troubleshooter.sh)"
```
## Building

If you get errors about missing SDKs or headers, double check that you've selected your
Xcode install with `xcode-select(1)` or just download a pre-built cryptex here https://xss.cx/srd/dmg/srd-universal-cryptex.dmg

## Audit Trail
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/xsscx/srd/main/dmg/install.sh)"
--2022-01-17 14:12:26--  https://xss.cx/srd/dmg/srd-universal-cryptex.dmg
Resolving xss.cx (xss.cx)... 50.62.160.45
Connecting to xss.cx (xss.cx)|50.62.160.45|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 27295841 (26M) [application/x-zip-compressed]
Saving to: ‘srd-universal-cryptex.dmg’

srd-universal-cryptex.dmg                                                                                100%[=================================================================================================================================================================================================================================================================================>]  26.03M  3.32MB/s    in 8.3s

2022-01-17 14:12:35 (3.12 MB/s) - ‘srd-universal-cryptex.dmg’ saved [27295841/27295841]

com.example.cryptex
  version = 1.3.3.7
  device = /dev/disk2s1
  mount point = /private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.yobZuo```
