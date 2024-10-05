#!/usr/bin/env python3

import argparse
from os import path
from pathlib import Path
import json
from enum import Enum

from typing import Tuple, Optional

import subprocess

# pip install asn1
# brew install lzfse
try:
    import asn1
except ImportError as e:
    print("asn1 Python library not found, did you pip install it?")
    raise e



class Image4Compression(Enum):
    LZSS = 0
    LZFSE = 1

class Image4(object):
    tag: str = "IM4P"
    type: str = "krnl"
    version: str = "patched"
    payload: bytes
    decompress_payload: bytes
    compression_algorithm: Image4Compression = Image4Compression.LZSS
    decompressed_size: int

    @classmethod
    def unpack_img4(cls, data: bytes):
        img4 = Image4()
        decoder = asn1.Decoder()
        decoder.start(data)
        decoder.enter()

        tag, value = decoder.read()
        img4.tag = value

        tag, value = decoder.read()
        img4.type = value

        tag, value = decoder.read()
        img4.version = value

        tag, value = decoder.read()
        img4.payload = value

        decoder.enter()
        tag, value = decoder.read()
        img4.compression_algorithm = Image4Compression(value=value)
        tag, value = decoder.read()
        img4.decompressed_size = value
        decoder.leave()

        if img4.compression_algorithm == Image4Compression.LZFSE:
            proc = subprocess.run('lzfse -decode', capture_output=True, input=img4.payload, shell=True)
            proc.check_returncode()
            img4.decompress_payload = proc.stdout
            assert len(img4.decompress_payload) == img4.decompressed_size
        else:
            raise NotImplementedError("Only LZFSE decoding is implemented")

        decoder.leave()

        return img4

    def __repr__(self):
        return f"{self.tag}/{self.type} - {self.version} - payload: {len(self.payload)} - {self.compression_algorithm} - {self.decompressed_size}"

    def pack_img4(self, path: Optional[Path] = None):
        encoder = asn1.Encoder()
        encoder.start()

        encoder.enter(asn1.Numbers.Sequence)

        manifest_data = [self.tag, self.type, self.version]
        for data in manifest_data:
            encoder.write(data.encode('utf-8'), nr=asn1.Numbers.IA5String)
        encoder.write(self.decompress_payload)

        encoder.leave()

        if path:
            with open(path, 'wb') as f:
                f.write(encoder.output())
        return encoder.output()

def main():
    parser = argparse.ArgumentParser()
    subparsers = parser.add_subparsers(dest="command")

    unpack = subparsers.add_parser("unpack")
    unpack.add_argument("IMAGE4", type=Path, help="Path to an Image4 containing a KernelCache")
    unpack.add_argument("KERNELCACHE", type=Path, help="Path to write the extracted KernelCache")

    patch = subparsers.add_parser("patch")
    patch.add_argument("KERNELCACHE", type=Path, help="Path to the KernelCache to patch")
    patch.add_argument("PATCHED_KERNELCACHE", type=Path, help="Path to write the patched KernelCache")

    pack = subparsers.add_parser("pack")
    pack.add_argument("KERNELCACHE", type=Path, help="Path to the KernelCache to pack into an Image4")
    pack.add_argument("IMAGE4", type=Path, help="Path to write a packed image4")

    args = parser.parse_args()

    if args.command == 'unpack':
        img4 = Image4.unpack_img4(args.IMAGE4.read_bytes())
        print(img4)
        args.KERNELCACHE.write_bytes(img4.decompress_payload)

    if args.command == 'pack':
        img4 = Image4()
        img4.decompress_payload = args.KERNELCACHE.read_bytes()

        img4.pack_img4(args.IMAGE4)

    if args.command == 'patch':
        data = args.KERNELCACHE.read_bytes()
        find = b'Darwin Kernel Version '
        custom = b'CopyPasta Edition Kernel Cache '
        replaced = data.replace(find, custom)
        args.PATCHED_KERNELCACHE.write_bytes(replaced)
        # Once this is flashed, run `uname -a` on the device and see our glorious hackings



if __name__ == '__main__':
    main()
