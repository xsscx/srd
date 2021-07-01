# Welcome to the SRD0009 Repo for the Apple Security Research Device (SRD)

This is the (limited, new) Code Collection for Public Domain that is run on an Apple Security Research Device, the Apple SRD.
The Target iOS ranges are 14Beta7 -> 15Beta2. The Target Platform is iPhone 11.

FB9221569 - iOS 15Beta2 and jetsam make Research nearly impossible.. (cough).. 

This Repo is Public Domain, but the main Focus is Onboarding the 2021 SRD Cohort with a Working Cryptex and Code Examples.

Please Contribute Code to be run on the SRD. Results to be Posted rapidly.

--------------------------------------------------
# For Apple Security Research Device Holders Only

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

The Makefile includes this template
(as do the various projects under the src/
directory).

The root Makefile is responsible for creating the cryptex,
distribution root and disk image, while `build_env.mk` is
responsible for cross compilation, and the various
`src/*/Makefile`s are responsible for building individual tools.

Anything in the bin/ directory will be copied into
the distribution root's `/usr/bin/` directory for inclusion
into the cryptex. Binaries in this directory should be
at-least ad-hoc signed. This is an easy way to get prebuilt
binaries into your cryptex. Alternatively you could make
a project under src/ which downloads the binary
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
be seen in the patches made to src/dropbear.

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
