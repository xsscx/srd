# How to Patch and Boot a KernelCache on an SRD by Hoyt

Updated: SAT 09 JULY 2022 at 0741 EDT

```
uname -a
Darwin iPhone 21.4.0 CopyPasta Kernel Cache 21.4.0: Mon Feb 21 21:27:55 PST 2022; root:xnu-8020.102.3~1/RELEASE_ARM64_T8101 iPhone13,2 Toybox
Sat Mar 26 17:59:16 PDT 2022
```

## SUMMARY

Steps to successful Kernel Cache Install on iPhone 12 SRD
-------
Step 1: Read this Page and complete the steps to generate your first kernel cache.

Step 2: Use the example command line:
```
defaults write com.apple.AMPDevicesAgent ipsw-variant -string 'Research Customer Erase Install (IPSW)'
killall Finder
srdutil restore -v -s -e 0x1418da3cc0013a -K=/Users/xss/iphone12/example-kernelcache/kernelcache.patched.image4  -i /Users/xss/iphone12/example-kernelcache/iPhone13,2,iPhone13,3_15.4_19E241_Restore.ipsw
```

Step 3:
```
Install cryptex
```

Step 4:
```
ssh to srd
```

Step 5:
```
uname -a
CopyPasta Kernel Cache
```

### SRD Kernel Cache Exampleware Installation for 15.4_19E241_Restore.ipsw

| Build OS & Device Info           | Example Kernel Cache
| -------------------------------- | ------------- 
| iPhone 11 & 12 iOS 15.4 (19E241)       | PASS  

Below is verbatim from SRD Tools from Apple
-----
# Patching and booting a KernelCache

The Security Research Device allows flashing a custom kernelcache
using the personalisation system and `srdutil(1)`.

The following tutorial explains how to extract a kernelcache from an IPSW,
patch it, and flash it to a Security Research Device.

## Prerequisites

1. A Security Research Device
2. An IPSW for the Security Research Device
3. The [asn1 Python library](https://pypi.org/project/asn1/)
4. The `lzfse(1)` tool, `brew install lzfse`

## A brief tutorial

IPSW files are zip files with a determined structure, the normal `unzip` command
can be used to extract them.

First we will download the IPSW for our particular Security Research Device model
from the [Installing System Versions SRD Wiki page](https://github.com/apple/security-research-device/wiki/2.-Installing-System-Versions).

Once the IPSW has been downloaded we can extract the kernelcache using `unzip(1)`:

```sh
unzip *.ipsw 'kernelcache.research.*'
ls -lah kernelcache.research.*
```

Here I have extracted the kernelcache for the 2021 iPhone 12 SRD.

```sh
$ unzip srd_12_19D52.ipsw 'kernelcache.research.*'
Archive:  srd_12_19D52.ipsw
  inflating: kernelcache.research.iphone13
$ file kernelcache.research.iphone13
kernelcache.research.iphone13: data
$ file kernelcache.research.iphone*
kernelcache.research.iphone13: data
```

You'll notice that the `kernelcache.research.iphone13`, is actually not a kernelcache,
it's an Image4 payload. Note the `IM4P` below.

```sh
$ xxd kernelcache.research.iphone* | head -n 1
00000000: 3084 0101 a515 1604 494d 3450 1604 6b72  0.......IM4P..kr
```

We now need to extract the kernelcache from the Image4 object. The provided
[`kernelcacheutils.py`](kernelcacheutils.py) script implements a basic version
of the Image4 format.

To unpack the kernelcache we use the `unpack` subcommand. This takes an Image4
file and a destination path for the payload. It will print out the fields it has
parsed.

```sh
$ ./kernelcacheutils.py unpack kernelcache.research.iphone* kernelcache
IM4P/krnl - KernelCacheBuilder_research-2238.80.2 - payload: 16884945 - Image4Compression.LZFSE - 49940000
$ file kernelcache
kernelcache: Mach-O 64-bit executable arm64e
```

We now have the kernelcache extracted and we can start patching! As an example the `kernelcacheutils.py` script
includes a simple `patch` command.

```sh
$ ./kernelcacheutils.py patch kernelcache kernelcache.patched
```

The script simply replaces the kernel version string that is returned to `uname -a`, replacing "Darwin" with
"Hacked". While this is a very simple patch, more complex patches are possible with some work.

Now that we have a patched kernelcache, we will pack it back into an Image4 object for flashing:

```sh
$ ./kernelcacheutils.py pack kernelcache.patched kernelcache.patched.image4
```

Note that the filesize is slightly larger than the original, despite our byte for byte patch. This is because
`kernelcacheutils.py` does not implement compression, only decompression of kernelcaches.

Now let's flash the device! We use the same command we'd normally use to restore an IPSW, but in addition we supply
the `--kernel-cache` argument. Note that the _absolute path_ must be supplied.

```sh
srdutil restore --kernel-cache $(pwd)/kernelcache.patched.image4 ...
```

If all goes well, your SRD should boot normally. Install the example cryptex on the device
and run `uname -a` to see the patch in action:

```sh
# uname -a
Darwin iPhone 21.4.0 Hacked Kernel Version 21.4.0: Mon Feb 21 21:27:55 PST 2022; root:xnu-8020.102.3~1/RELEASE_ARM64_T8101 iPhone13,2 Toybox
```

## Recovering from the inevitable

It is inevitable that you will soft brick the device while playing with the kernel. Thankfully, the
SRD is easy to recover from this state.

Launch `srdutil(1)` in the streaming mode:

```sh
$ srdutil restore --stream
```

Then [place the device into DFU or recovery mode](https://support.apple.com/en-us/HT201263)
using the key chord. The device will either show the restore screen or a black screen, in either
case the SRD will appear in the srdutil output.

Once the device appears as connected in srdutil, you may flash the device again. If your device
does not recover, get in touch with the Security Research Device team.

## Troubleshooting and additional information

### Image4

The Image4 file is actually an ASN1 encoded DER blob, it can be inspected using
the `openssl(1)` utility as follows. Note the `head(1)`, without this you'll be
inundated with the bytes of the payload.

```sh
$ openssl asn1parse -inform DER -in kernelcache.research.* | head -n 4
```

### Personalisation failure

Additional logging can be retrieved from `srdutil` and the underlying
restore framework with the following command:

```sh
log show --predicate 'process == "srdutil"'
```

A common source of personalisation failures in this flow is not including the
absolute path to the kernelcache image4 object.

### Boot failure

The device may boot into the recovery screen, in this case check that you selected
the image4 object to flash to the device with `--kernel-cache`. iBoot won't boot a
raw Mach-O.

If you still have issues with booting, it's likely there is an issue with your
kernelcache or you are causing a kernel panic with a patch. Please reach out
via GitHub or email to the SRD team and we can help you debug.
