# iPhone 11 Register Fuzzing on the Apple Security Research Device as 'root' from the cryptex

CAVEAT: User = root and I'm Side-loading executable code onto the device with arbitrary entitlements at the same permission level as Apple operating system components.

```
IPSW: iPhone11,8,iPhone12,1_14.7_18G5052d_Restore.ipsw

uname -a
Darwin iPhone 20.6.0 Darwin Kernel Version 20.6.0: Sun Jun 20 22:50:32 PDT 2021; root:xnu-7195.140.39.0.1~13/RELEASE_ARM64_T8030 iPhone12,1

id
uid=1473273909(root) gid=0(wheel) groups=0(wheel),1(daemon),2(kmem),3(sys),4(tty),5(operator),8(procview),9(procmod),20(staff),29(certusers),80(admin)

id -G
0 1 2 3 4 5 8 9 20 29 80

 id -g
0

```

The Register Check for s3_6_c15_c1_5 resulted in....

```
./s3_6_c15_c1_5-flip
Read Initial Register s3_6_c15_c1_5 bit 00: 2010000030100000
Read Initial Register s3_6_c15_c1_5 bit 01: 2010000030100000
Read Initial Register s3_6_c15_c1_5 bit 02: 2010000030100000
Read Initial Register s3_6_c15_c1_5 bit 03: 2010000030100000
Read Initial Register s3_6_c15_c1_5 bit 04: 2010000030100000
Read Initial Register s3_6_c15_c1_5 bit 05: 2010000030100000
Read Initial Register s3_6_c15_c1_5 bit 06: 2010000030100000
Read Initial Register s3_6_c15_c1_5 bit 07: 2010000030100000
Read Initial Register s3_6_c15_c1_5 bit 08: 2010000030100000
Read Initial Register s3_6_c15_c1_5 bit 09: 2010000030100000
Read Initial Register s3_6_c15_c1_5 bit 10: 2010000030100000
Read Initial Register s3_6_c15_c1_5 bit 11: 2010000030100000
Read Initial Register s3_6_c15_c1_5 bit 12: 2010000030100000
Read Initial Register s3_6_c15_c1_5 bit 13: 2010000030100000
Read Initial Register s3_6_c15_c1_5 bit 14: 2010000030100000
Read Initial Register s3_6_c15_c1_5 bit 15: 2010000030100000
Read Initial Register s3_6_c15_c1_5 bit 16: 2010000030100000
Read Initial Register s3_6_c15_c1_5 bit 17: 2010000030100000
Read Initial Register s3_6_c15_c1_5 bit 18: 2010000030100000
Read Initial Register s3_6_c15_c1_5 bit 19: 2010000030100000
Read Initial Register s3_6_c15_c1_5 bit 20: 2010000030100000
Read Initial Register s3_6_c15_c1_5 bit 21: 2010000030100000
Read Initial Register s3_6_c15_c1_5 bit 22: 2010000030100000
Read Initial Register s3_6_c15_c1_5 bit 23: 2010000030100000
Read Initial Register s3_6_c15_c1_5 bit 24: 2010000030100000
Read Initial Register s3_6_c15_c1_5 bit 25: 2010000030100000
Read Initial Register s3_6_c15_c1_5 bit 26: 2010000030100000
Read Initial Register s3_6_c15_c1_5 bit 27: 2010000030100000
Read Initial Register s3_6_c15_c1_5 bit 28: 2010000030100000
Read Initial Register s3_6_c15_c1_5 bit 29: 2010000030100000
Read Initial Register s3_6_c15_c1_5 bit 30: 2010000030100000
Read Initial Register s3_6_c15_c1_5 bit 31: 2010000030100000
Read Initial Register s3_6_c15_c1_5 bit 32: 2010000030100000
Read Initial Register s3_6_c15_c1_5 bit 33: 2010000030100000
Read Initial Register s3_6_c15_c1_5 bit 34: 2010000030100000
Read Initial Register s3_6_c15_c1_5 bit 35: 2010000030100000
Read Initial Register s3_6_c15_c1_5 bit 36: 2010000030100000
Read Initial Register s3_6_c15_c1_5 bit 37: 2010000030100000
Read Initial Register s3_6_c15_c1_5 bit 38: 2010000030100000
Read Initial Register s3_6_c15_c1_5 bit 39: 2010000030100000
Read Initial Register s3_6_c15_c1_5 bit 40: 2010000030100000
Read Initial Register s3_6_c15_c1_5 bit 41: 2010000030100000
Read Initial Register s3_6_c15_c1_5 bit 42: 2010000030100000
Read Initial Register s3_6_c15_c1_5 bit 43: 2010000030100000
Read Initial Register s3_6_c15_c1_5 bit 44: 2010000030100000
Read Initial Register s3_6_c15_c1_5 bit 45: 2010000030100000
Read Initial Register s3_6_c15_c1_5 bit 46: 2010000030100000
Read Initial Register s3_6_c15_c1_5 bit 47: 2010000030100000
Read Initial Register s3_6_c15_c1_5 bit 48: 2010000030100000
Read Initial Register s3_6_c15_c1_5 bit 49: 2010000030100000
Read Initial Register s3_6_c15_c1_5 bit 50: 2010000030100000
Read Initial Register s3_6_c15_c1_5 bit 51: 2010000030100000
Read Initial Register s3_6_c15_c1_5 bit 52: 2010000030100000
Read Initial Register s3_6_c15_c1_5 bit 53: 2010000030100000
Read Initial Register s3_6_c15_c1_5 bit 54: 2010000030100000
Read Initial Register s3_6_c15_c1_5 bit 55: 2010000030100000
Read Initial Register s3_6_c15_c1_5 bit 56: 2010000030100000
Read Initial Register s3_6_c15_c1_5 bit 57: 2010000030100000
Read Initial Register s3_6_c15_c1_5 bit 58: 2010000030100000
Read Initial Register s3_6_c15_c1_5 bit 59: 2010000030100000
Read Initial Register s3_6_c15_c1_5 bit 60: 2010000030100000
Read Initial Register s3_6_c15_c1_5 bit 61: 2010000030100000
Read Initial Register s3_6_c15_c1_5 bit 62: 2010000030100000
Read Initial Register s3_6_c15_c1_5 bit 63: 2010000030100000
Flipped Register s3_6_c15_c1_5 bit 00: 2010000030100000
Flipped Register s3_6_c15_c1_5 bit 01: 2010000030100000
Flipped Register s3_6_c15_c1_5 bit 02: 2010000030100000
Flipped Register s3_6_c15_c1_5 bit 03: 2010000030100000
Flipped Register s3_6_c15_c1_5 bit 04: 2010000030100000
Flipped Register s3_6_c15_c1_5 bit 05: 2010000030100000
Flipped Register s3_6_c15_c1_5 bit 06: 2010000030100000
Flipped Register s3_6_c15_c1_5 bit 07: 2010000030100000
Flipped Register s3_6_c15_c1_5 bit 08: 2010000030100000
Flipped Register s3_6_c15_c1_5 bit 09: 2010000030100000
Flipped Register s3_6_c15_c1_5 bit 10: 2010000030100000
Flipped Register s3_6_c15_c1_5 bit 11: 2010000030100000
Flipped Register s3_6_c15_c1_5 bit 12: 2010000030100000
Flipped Register s3_6_c15_c1_5 bit 13: 2010000030100000
Flipped Register s3_6_c15_c1_5 bit 14: 2010000030100000
Flipped Register s3_6_c15_c1_5 bit 15: 2010000030100000
Flipped Register s3_6_c15_c1_5 bit 16: 2010000030100000
Flipped Register s3_6_c15_c1_5 bit 17: 2010000030100000
Flipped Register s3_6_c15_c1_5 bit 18: 2010000030100000
Flipped Register s3_6_c15_c1_5 bit 19: 2010000030100000
Flipped Register s3_6_c15_c1_5 bit 20: 2010000030100000
Flipped Register s3_6_c15_c1_5 bit 21: 2010000030100000
Flipped Register s3_6_c15_c1_5 bit 22: 2010000030100000
Flipped Register s3_6_c15_c1_5 bit 23: 2010000030100000
Flipped Register s3_6_c15_c1_5 bit 24: 2010000030100000
Flipped Register s3_6_c15_c1_5 bit 25: 2010000030100000
Flipped Register s3_6_c15_c1_5 bit 26: 2010000030100000
Flipped Register s3_6_c15_c1_5 bit 27: 2010000030100000
Flipped Register s3_6_c15_c1_5 bit 28: 2010000030100000
Flipped Register s3_6_c15_c1_5 bit 29: 2010000030100000
Flipped Register s3_6_c15_c1_5 bit 30: 2010000030100000
Flipped Register s3_6_c15_c1_5 bit 31: 2010000030100000
Flipped Register s3_6_c15_c1_5 bit 32: 2010000030100000
Flipped Register s3_6_c15_c1_5 bit 33: 2010000030100000
Flipped Register s3_6_c15_c1_5 bit 34: 2010000030100000
Flipped Register s3_6_c15_c1_5 bit 35: 2010000030100000
Flipped Register s3_6_c15_c1_5 bit 36: 2010000030100000
Flipped Register s3_6_c15_c1_5 bit 37: 2010000030100000
Flipped Register s3_6_c15_c1_5 bit 38: 2010000030100000
Flipped Register s3_6_c15_c1_5 bit 39: 2010000030100000
Flipped Register s3_6_c15_c1_5 bit 40: 2010000030100000
Flipped Register s3_6_c15_c1_5 bit 41: 2010000030100000
Flipped Register s3_6_c15_c1_5 bit 42: 2010000030100000
Flipped Register s3_6_c15_c1_5 bit 43: 2010000030100000
Flipped Register s3_6_c15_c1_5 bit 44: 2010000030100000
Flipped Register s3_6_c15_c1_5 bit 45: 2010000030100000
Flipped Register s3_6_c15_c1_5 bit 46: 2010000030100000
Flipped Register s3_6_c15_c1_5 bit 47: 2010000030100000
Flipped Register s3_6_c15_c1_5 bit 48: 2010000030100000
Flipped Register s3_6_c15_c1_5 bit 49: 2010000030100000
Flipped Register s3_6_c15_c1_5 bit 50: 2010000030100000
Flipped Register s3_6_c15_c1_5 bit 51: 2010000030100000
Flipped Register s3_6_c15_c1_5 bit 52: 2010000030100000
Flipped Register s3_6_c15_c1_5 bit 53: 2010000030100000
Flipped Register s3_6_c15_c1_5 bit 54: 2010000030100000
Flipped Register s3_6_c15_c1_5 bit 55: 2010000030100000
Flipped Register s3_6_c15_c1_5 bit 56: 2010000030100000
Flipped Register s3_6_c15_c1_5 bit 57: 2010000030100000
Flipped Register s3_6_c15_c1_5 bit 58: 2010000030100000
Flipped Register s3_6_c15_c1_5 bit 59: 2010000030100000
Flipped Register s3_6_c15_c1_5 bit 60: 2010000030100000
Flipped Register s3_6_c15_c1_5 bit 61: 2010000030100000
Flipped Register s3_6_c15_c1_5 bit 62: 2010000030100000
Flipped Register s3_6_c15_c1_5 bit 63: 2010000030100000
#
```
