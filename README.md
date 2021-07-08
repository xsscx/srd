# Apple Security Research Device (SRD) Repo by SRD0009

--------------------------------------------------
Can someone from Apple (please) look at:

FB9221569 - iOS 15Beta2 and jetsam make Research nearly impossible..  

FB9221261 - debugserver crash - null hostname.. 

FB9223349 - debugserver crash - cryptex cwd.. 

FB9289266 - ASAN Compile Options for Command Line Cryptex results in dyld: dependent dylib not found, Xcode ASAN works fine.

SRD Cohort - See Bug Reports at https://srdcx.atlassian.net/jira/software/c/projects/SRDBUGS/issues/

----------

Toolchain Details
-----
Makefile https://github.com/xsscx/srd/blob/main/SecurityResearchTools_20C80/usr/local/share/security-research-device/example-cryptex/Makefile

Target
```
-triple arm64-apple-ios14.5.0
```

XNU Export
```
export XNU_VERSION=xnu-7195.81.3
```
X86_64
```
sysctl -a | grep Intel
machdep.cpu.brand_string: Intel(R) Core(TM) i5-1038NG7 CPU @ 2.00GHz
```
```
xcode-select -p
/Applications/Xcode.app/Contents/Developer

clang -v
Apple clang version 12.0.5 (clang-1205.0.22.11)
Target: arm64-apple-darwin20.5.0
Thread model: posix
InstalledDir: /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin

clang -v
Apple clang version 13.0.0 (clang-1300.0.18.6)
Target: arm64-apple-darwin20.5.0
Thread model: posix
InstalledDir: /Applications/Xcode-beta.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin
iOS SDK at /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS14.5.sdk
iOS SDK at /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS15.0.sdk
```

M1 Apple Silicon
```
sysctl -a | grep M1
machdep.cpu.brand_string: Apple M1
```
```
xcode-select -p
/Applications/Xcode-beta.app/Contents/Developer

clang -v
Apple clang version 12.0.5 (clang-1205.0.22.11)
Target: arm64-apple-darwin20.5.0
Thread model: posix
InstalledDir: /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin

clang -v
Apple clang version 13.0.0 (clang-1300.0.18.6)
Target: arm64-apple-darwin20.5.0
Thread model: posix
InstalledDir: /Applications/Xcode-beta.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin
iOS SDK at /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS14.5.sdk
iOS SDK at /Applications/Xcode-beta.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS15.0.sdk
```
```
iOS SDK 15
iOS SDK 14
iOS 14Beta7
iOS 15Beta2
```
* To ALL - Open a Discussion, PR or Issue with Suggestions, Comments, Bugs, Feedback, Tips etc..
* Collaborative Research
* All Code and Questions are Welcome 
* When you see Code Errors, Fails or LOL's.. Please Open an Issue... Thanks!
 
This is Hoyt's Public Domain & Collaboration Research Code Collection [SRD0009] that is run on an Apple Security Research Device, the Apple SRD.
The Target iOS ranges are 14Beta7 -> 15Beta2. The Target Platform is iPhone 11.

* Industry Participation Requested, See URL https://srd.cx/industry-participation/

* Updated July 4, 2021: Note that Issue #1 is Open and I failed to include the entitlements.plist due to operator error... Now updated

This Repo is Public Domain and I hope you will contribute your Code, Suggestions & Pro Tip's.

The main Focus had been Onboarding the 2021 SRD Cohort with a Working Cryptex and Code Examples, now I want to _your_ input!

--------------------------------------------------
Please Contribute Code to be run on the SRD. Results to be Posted rapidly.
--------------------------------------------------

Open an Issue with Details and a Link to your Xcode Project, App or Code and I will attempt to run your Code on the SRD and post Results. Entitlements are the big Hammer to swing with the SRD so include your entitlements.plist.

# Cryptex Example

This directory contains a working example of a cryptex designed to
get you up and running quickly on the Security Research
Device platform.

## Prerequisites
- macOS Big Sur
- Xcode
- GNU sed
- automake

If you use brew:

```sh
brew install gnu-sed automake
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

1. Readme
2. See https://srd.cx/apple-security-research-device-cohort-2021/

## The build process

For simplicity this project mainly uses Make as a build
system as it is expected this will be more familiar to
most people.

The build_env.mk Makefile is a template
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

The root Makefile includes this template
(as do the various projects under the src
directory).

The root Makefile is responsible for creating the cryptex,
distribution root and disk image, while `build_env.mk` is
responsible for cross compilation, and the various
`src/*/Makefile`s are responsible for building individual tools.

Anything in the bin directory will be copied into
the distribution root's `/usr/bin/` directory for inclusion
into the cryptex. Binaries in this directory should be
at-least ad-hoc signed. This is an easy way to get prebuilt
binaries into your cryptex. Alternatively you could make
a project under src which downloads the binary
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
suffix `.cptx`

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
cryptex-run. A more comprehensive example can
be seen in the patches made to dropbear.

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
cryptexctl -v9 -d9 -ldt install --print-info ./com.example.cryptex.cptx

# Collect logs from the device. The -E is so we capture the CRYPTEXCTL_UDID env var.
# You can alternativly specify --udid on the command line
sudo -E cryptexctl log collect
# View the logs from the archive
cryptexctl log show -- --archive ./system_logs.logarchive
```

## Building

If you get errors about missing SDKs or headers, double check that you've selected your
Xcode install with `xcode-select(1)`.

## Sample Stub Makefile
Stub Makefile for Apple Security Research Device
```
.PHONY: all clean install
all: hello

include ../../logging.mk
include ../../build_env.mk

hello:
	@$(log_build)
	$(CC) $(CFLAGS) $(LDFLAGS) -o hello hello.c
	codesign -s - hello

clean:
	rm -f hello
	rm -f ${CRYPTEX_BIN_DIR}/hello

install: hello hello.plist
	@$(log_install)
	cp hello ${CRYPTEX_BIN_DIR}
	cp hello.plist ${CRYPTEX_LAUNCHD_DIR}

```
