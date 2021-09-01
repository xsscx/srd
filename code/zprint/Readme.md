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
