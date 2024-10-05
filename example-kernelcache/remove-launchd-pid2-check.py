#!/usr/bin/env python3

"""
This script patches out the ptrace check for PIDs less than 2, allowing
instrumenting launchd.

This is useful for Frida. Once this patch is applied and the resulting kernelcache is
packed into an image4 object and flashed to an SRD, Frida can trace launchd and launch
applications with tracing enabled.

Frida can be modified to listen on a remote port by setting the `ProgramArguments` key in
`frida-server.plist` as follows, replacing `<ip-of-your-device>` with your device's IP address.

```plist
	<key>ProgramArguments</key>
	<array>
		<string>/usr/bin/frida-server</string>
		<string>--policy-softener=internal</string>
		<string>--listen=<ip-of-your-device></string>
	</array>
```

Once Frida is listening on a remote port, the following can be used to test this patch:

```sh
# Instrument launchd
frida-trace -H ${IP_OF_YOUR_DEVICE} -i "xpc*" -n launchd
# Launch Mail in an instrumented state
frida-trace -H ${IP_OF_YOUR_DEVICE} -i "xpc*" -f com.apple.mobilemail
```
"""

import argparse
import binascii

import logging

logger = logging.getLogger("kernelache-patcher")
logging.basicConfig(level=logging.DEBUG)

from pathlib import Path

def main():

    parser = argparse.ArgumentParser()

    parser.add_argument('KERNELCACHE', type=Path, help="Path to the KernelCache to patch")
    parser.add_argument('PATCHED_KERNELCACHE', type=Path, help='Path to write the patched KernelCache')

    args = parser.parse_args()

    # The patchpoint for the launchd pid 1 check from kernelcache `75875e3d7cbbf302453a6ff1e986f00fc41358b145e6116c241b2a35d35b7589`
    """
                                 LAB_fffffff007ff3618                            XREF[1]:     fffffff007ff353c(j)
     ff007ff3618 c0 0a 40 b9     ldr        w0,[x22, #0x8]
     ff007ff361c 1f 08 00 71     cmp        w0,#0x2
     ff007ff3620 cb 03 00 54     b.lt       LAB_fffffff007ff3698                             NOP out this branch to where we deny the attach to PIDs less than 2 (launchd)

    """
    # This sequence of bytes matches the above disassembly, directly after this is the branch
    # it's surprising this instruction sequence appears exactly once, but who are we to deny
    # gifts from clang?
    before_launchd_pid_check = b'\xc0\x0a\x40\xb9\x1f\x08\x00\x71'
    hex_needle = binascii.hexlify(before_launchd_pid_check).decode('utf-8')

    # an assembled arm64e NOP
    nop = b'\x1f\x20\x03\xd5'

    logger.debug(f"Will replace the instruction after {hex_needle} with a NOP")

    logger.info(f"Reading {args.KERNELCACHE} for patching")
    with open(args.KERNELCACHE, "rb") as f:
        # Turn the file bytes into a bytearray to allow slice replacement
        x = bytearray(f.read())

        # Make sure we have _exactly_ one match.
        assert x.index(before_launchd_pid_check) == x.rindex(before_launchd_pid_check), "More than one match, signature needs updating"

        # Find the offset at which we should apply the patch
        first_patch_index = x.index(before_launchd_pid_check) + len(before_launchd_pid_check)
        logger.info(f"Found patch point at {hex(first_patch_index)}")

        # Perform the patch, this notation works because we made the bytearray above
        x[first_patch_index:first_patch_index+len(nop)] = nop

        logger.info(f"Writing {len(x)} bytes to {args.PATCHED_KERNELCACHE}")
        # Write out the patched kernelcache
        with open(args.PATCHED_KERNELCACHE, "wb") as o:
            o.write(x)

        # Confirm we haven't inserted too much code that it might break offsets
        assert args.KERNELCACHE.stat().st_size == args.PATCHED_KERNELCACHE.stat().st_size, "Original and patched kernelcaches differ in size, offsets may be incorrect after the patch"
        logger.info(f"Patch complete!")

if __name__ == '__main__':
    main()
