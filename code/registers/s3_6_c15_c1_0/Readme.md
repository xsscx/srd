# iPhone 11 Register Fuzzing on the Apple Security Research Device as 'root' (EL1) from the cryptex

CAVEAT: User = root and I'm Side-loading executable code onto the device with arbitrary entitlements at the same permission level as Apple operating system components.
```
Hardware Model:      iPhone12,1
iPhone OS 14.7 (18G5052d)
uname -a
Darwin iPhone 20.6.0 Darwin Kernel Version 20.6.0: Sun Jun 20 22:50:32 PDT 2021; root:xnu-7195.140.39.0.1~13/RELEASE_ARM64_T8030 iPhone12,1
```

```
SIGILL for EL1 Read on 
s3_6_c15_c1_0 - Will add full Crash Report soon
```
Here is my command line.. both the Read and Flip Crash...
```
# ./s3_6_c15_c1_0-read
# ./s3_6_c15_c1_0-flip
```
