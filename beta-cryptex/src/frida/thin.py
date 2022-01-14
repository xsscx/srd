#!/usr/bin/env python3

import os
import stat
import struct
import sys


FAT_MAGIC = 0xcafebabe

CPU_ARCH_MASK = 0xff000000
CPU_ARCH_ABI64 = 0x01000000
CPU_TYPE_ARM = 12
CPU_TYPE_ARM64 = CPU_TYPE_ARM | CPU_ARCH_ABI64
CPU_SUBTYPE_MASK = 0xff000000
CPU_SUBTYPE_PTRAUTH_ABI = 0x80000000
CPU_SUBTYPE_ARM64E = 2


def extract_arm64e_slice(input_path, output_path):
    """
    Used to thin a fat Mach-O when Apple's lipo tool refuses to do so, such as with
    binaries with two arm64e slices to support both the new and the old arm64e ABI.
    """
    with open(input_path, 'rb') as input_file:
        (magic, num_slices) = struct.unpack(">II", input_file.read(2 * 4))

        if magic != FAT_MAGIC:
            raise ValueError("expected a FAT Mach-O")

        for i in range(num_slices):
            cpu_type, cpu_subtype, offset, size, alignment = struct.unpack(">IIIII", input_file.read(5 * 4))
            if cpu_type == CPU_TYPE_ARM64 \
                    and (cpu_subtype & ~CPU_SUBTYPE_MASK) == CPU_SUBTYPE_ARM64E \
                    and (cpu_subtype & CPU_SUBTYPE_PTRAUTH_ABI) != 0:
                input_file.seek(offset)
                dylib = input_file.read(size)
                with open(output_path, 'wb') as output_file:
                    output_file.write(dylib)
                os.chmod(output_path, os.stat(output_path).st_mode | stat.S_IXUSR | stat.S_IXGRP | stat.S_IXOTH)

                return

        raise ValueError("slice not found")


if __name__ == '__main__':
    input_path = sys.argv[1]
    output_path = sys.argv[2]
    try:
        extract_arm64e_slice(input_path, output_path)
    except Exception as e:
        print("Unable to extract arm64e slice:", e, file=sys.stderr)
        sys.exit(1)
