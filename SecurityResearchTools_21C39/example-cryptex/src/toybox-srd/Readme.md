# toybox mods for Apple SRD by xsscx

This is a quick fix for Toybox Build for Apple Security Research Device as of 10 JAN 2022.

Picked Commit https://github.com/landley/toybox/commit/ea4748a7cbfa5e2f3ef188f917d4e5aeac70dd0f

The toybox-src and DMG Build and Install on macOS 11.x and SRT20C80, and also macOS12.x and SRT21C39 with cryptexctl from libcryptex_executables-169.80.2~9.

This Directory captures the changes used to Roll Back and Build Toybox Unstripped for Apple Secuirty Research Device for all IPSW

Instructions
------
```
Unzip toybox-src.zip in example-cryptex/src/toybox
make clean
make
```

Questions? Add to https://github.com/xsscx/srd/issues/7
