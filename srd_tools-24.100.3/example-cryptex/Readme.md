# SRD Example Cryptex & DMG Source Build Repo for SRT 24.100.3

Build & Install the ./example-cryptex/ in this Repo
-----
- Building an up to date cryptex is easy with this Repo
- https://xss.cx/srd/example-cryptex/hoyt-working-example-cryptex.zip
- https://xss.cx/srd/example-cryptex/hoyt-working-example-cryptex-plus-compiled-binaries.zip
- Fully working ./example-cryptex/ with binaries built with XNU-8019.41.5      
- Reproduction in a GIF https://xss.cx/srd/example-cryptex/hoyt-working-example-cryptex.gif
- Reproduction in a MOV https://xss.cx/srd/example-cryptex/hoyt-working-example-cryptex.mov
- Open an Issue if you have _any_ questions!
- arm64e ./example-cryptex/ https://xss.cx/srd/example-cryptex/hoyt-working-example-cryptex-plus-compiled-binaries-arm64e.zip
## START HERE

Get the Working Cryptex for X86_64
------
- wget https://xss.cx/srd/example-cryptex/hoyt-working-example-cryptex.zip
- unzip hoyt-working-example-cryptex.zip
- cd public-domain
- make install 
```
[public-domain] - Creating disk image com.example.cryptex.dmg from distribution root /Users/xss/validate/public-domain/com.example.cryptex.dstroot
....................................................................................................................................................................................................................................................................................
created: /Users/xss/validate/public-domain/com.example.cryptex.dmg
[public-domain] - Creating cryptex /Users/xss/validate/public-domain/com.example.cryptex.cxbd - 1.3.3.7 from the disk image com.example.cryptex.dmg
```
Confirmation
```
# uname -a
Darwin SRD0009 21.6.0 Darwin Kernel Version 21.6.0: Mon May  9 00:43:43 PDT 2022; root:xnu-8020.140.20.0.4~16/RELEASE_ARM64_T8030 iPhone12,1 Toybox
# date
Tue May 31 18:10:33 EDT 2022
```
- Open an Issue if you have _any_ questions!

## SRD DMG Install
M1 T8101
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/xsscx/srd/main/dmg/install.sh)"
```
X86_64 
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/xsscx/srd/main/srd_tools-24.100.3/example-cryptex/cryptexmanager-install.sh)" 
```

## SRD Source Build example-cryptex with toybox unstripped using this Repo

### Prerequisites
- Security Research Tools https://github.com/apple/security-research-device
- cd ./example-cryptex/ 
- brew install gnu-sed automake hg git-lfs
- wget https://xss.cx/srd/example-cryptex/hoyt-working-example-cryptex.zip
- make install

Automagic Build Pipeline
----------
- M1: Run build.sh as shown below on M1 T8101
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/xsscx/srd/main/srd_tools-24.100.3/example-cryptex/build.sh)" 
```
- X86_64: Run cryptexmanager-build.sh as shown below on X86_64
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/xsscx/srd/main/srd_tools-24.100.3/example-cryptex/cryptexmanager-build.sh)" 
```
## Security Research Tools (SRT) 24.100.3 Canned Instructions 

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

### Troubleshooting

The SRD Build Pipeline is robust, but like all other 'live build' systems there can be transitory Network issues that prevent a successful Build & Installation.

Take for example that over US Memorial Day Weekend Holiday in 2021 there were points in time where GateKeeper, CoreTrust. AMFI and the Tatsu Signing Server were unavailable. No cryptex build; Researcher needs to always have Backup DMG's for when the Build Pipeline fails.

### Enable verbose logging with -v, -d and redirect from the system log to stderr with -ldt
``` 
cryptexctl -v4 -d4 -ldt install --variant=research --persist --print-info ./com.example.cryptex.cxbd.signed (srd_tools-24.100.3)
```
### Collect logs from the device. The -E is so we capture the CRYPTEXCTL_UDID env var.
```
sudo -E cryptexctl log collect
```
### View the logs from the archive
```
cryptexctl log show -- --archive ./system_logs.logarchive
```
#### Log Collection & cat TXT File
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/xsscx/srd/main/srd_tools-24.100.3/example-cryptex/srd-cryptex-logcollector.sh)"
```

#### Log Collection & drop to lldb
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/xsscx/srd/main/srd_tools-24.100.3/example-cryptex/srd-cryptex-troubleshooter.sh)"
```

#### Log Collection & drop to Xcode
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/xsscx/srd/main/srd_tools-24.100.3/example-cryptex/srd-cryptex-xcdebug.sh)" 
```

## Building

This Repo does the Build and Published DMG's containing Examples. Add a PR or Issue to Merge

## Example SRD DMG Install Audit Trail
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/xsscx/srd/main/dmg/install.sh)"
```
```
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
  mount point = /private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.yobZuo
  ```
### Other Resources for Crashes, PAC Fail, Regexp & Analysis

When using a regexp to find Console Log Messages, these Files may be helpful:
- https://github.com/xsscx/srd/blob/main/code/xnu-os-cli-regexp-small-applesecurityresearchdevice-runtarget-001.txt
- https://github.com/xsscx/Commodity-Injection-Signatures/blob/master/meta/xnu-os-cli-regexp-small-applesecurityresearchdevice-runtarget-002.txt

If you experience a Crash when using cryptexctl or com.apple.cryptex*, these URL's may be helpful:
- https://srd.cx/possible-pointer-authentication-failure-data-abort/
- https://srd.cx/debugserver-installation-configuration/
- https://srd.cx/xnu-crash-analysis/
