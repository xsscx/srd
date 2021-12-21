# Landing Page for Feedback FB9566985 for zprint on Apple Security Research Device run from cryptex

Still working on the right mix of entitlements to make zprint work on the Apple Security Research Device. 
```
zprint
zprint: mach_memory_info: unknown error code (entitlement required or rate-limit exceeded)
```
```
SRD$ zprint
zprint: mach_memory_info: unknown error code (entitlement required or rate-limit exceeded)

SRD$ uname -a
Darwin iPhone-11 21.0.0 Darwin Kernel Version 21.0.0: Tue Aug 17 15:54:23 PDT 2021; root:xnu-8019.12.5~3/RELEASE_ARM64_T8030 iPhone12,1

SRD$ whoami
root

SRD$ hostname
iPhone-11

Info:
release:            21.0.0
version:            root:xnu-8019.12.5~3/RELEASE_ARM64_T8030
machine:            iPhone12,1
cpu type:           0x100000c  (arm64e)
cpu subtype:        0x2  (ARM64E)
cpus:               6 cores / 6 threads
memory:             0xf0a58000  (3.8G)
page size:          0x4000  (16K)
can has debugger:   no

SRD$ date
Wed Sep  1 11:00:33 EDT 2021

```
The Feedback Case said to Self-Sign the zprint binary, and install to Cryptex. 
```
Please compile the zprint from the open source release here: https://opensource.apple.com/source/system_cmds/system_cmds-880.40.5/zprint.tproj/

And attempt to sign with the given entitlements in the repo.

If zprint still fails, you can try signing the binary with the following entitlements:

com.apple.private.kernel.get-kext-info
com.apple.private.memoryinfo

Please let us know if it fails with these entitlements.
```
Here are my Reproduction Steps:

On the SRD Host:
```	
  codesign -s - --entitlements zprint.plist zprint
	cp zprint ${CRYPTEX_BIN_DIR}
	cp zprint.plist ${CRYPTEX_LAUNCHD_DIR}
...
  make install
```
On the SRD:
```
./zprint
-sh: ./zprint: Operation not permitted
```
