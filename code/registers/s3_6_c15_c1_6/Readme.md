
# iPhone 11 Register Fuzzing on the Apple Security Research Device as 'root' from the cryptex

CAVEAT: User = root and I'm Side-loading executable code onto the device with arbitrary entitlements at the same permission level as Apple operating system components.
```
Hardware Model:      iPhone12,1
iPhone OS 14.7 (18G5052d)
uname -a
Darwin iPhone 20.6.0 Darwin Kernel Version 20.6.0: Sun Jun 20 22:50:32 PDT 2021; root:xnu-7195.140.39.0.1~13/RELEASE_ARM64_T8030 iPhone12,1
```

```
# ./s3_6_c15_c1_6-flip
Read Initial Register s3_6_c15_c1_6 bit 00: 2020000030200000
Read Initial Register s3_6_c15_c1_6 bit 01: 2020000030200000
Read Initial Register s3_6_c15_c1_6 bit 02: 2020000030200000
Read Initial Register s3_6_c15_c1_6 bit 03: 2020000030200000
Read Initial Register s3_6_c15_c1_6 bit 04: 2020000030200000
Read Initial Register s3_6_c15_c1_6 bit 05: 2020000030200000
Read Initial Register s3_6_c15_c1_6 bit 06: 2020000030200000
Read Initial Register s3_6_c15_c1_6 bit 07: 2020000030200000
Read Initial Register s3_6_c15_c1_6 bit 08: 2020000030200000
Read Initial Register s3_6_c15_c1_6 bit 09: 2020000030200000
Read Initial Register s3_6_c15_c1_6 bit 10: 2020000030200000
Read Initial Register s3_6_c15_c1_6 bit 11: 2020000030200000
Read Initial Register s3_6_c15_c1_6 bit 12: 2020000030200000
Read Initial Register s3_6_c15_c1_6 bit 13: 2020000030200000
Read Initial Register s3_6_c15_c1_6 bit 14: 2020000030200000
Read Initial Register s3_6_c15_c1_6 bit 15: 2020000030200000
Read Initial Register s3_6_c15_c1_6 bit 16: 2020000030200000
Read Initial Register s3_6_c15_c1_6 bit 17: 2020000030200000
Read Initial Register s3_6_c15_c1_6 bit 18: 2020000030200000
Read Initial Register s3_6_c15_c1_6 bit 19: 2020000030200000
Read Initial Register s3_6_c15_c1_6 bit 20: 2020000030200000
Read Initial Register s3_6_c15_c1_6 bit 21: 2020000030200000
Read Initial Register s3_6_c15_c1_6 bit 22: 2020000030200000
Read Initial Register s3_6_c15_c1_6 bit 23: 2020000030200000
Read Initial Register s3_6_c15_c1_6 bit 24: 2020000030200000
Read Initial Register s3_6_c15_c1_6 bit 25: 2020000030200000
Read Initial Register s3_6_c15_c1_6 bit 26: 2020000030200000
Read Initial Register s3_6_c15_c1_6 bit 27: 2020000030200000
Read Initial Register s3_6_c15_c1_6 bit 28: 2020000030200000
Read Initial Register s3_6_c15_c1_6 bit 29: 2020000030200000
Read Initial Register s3_6_c15_c1_6 bit 30: 2020000030200000
Read Initial Register s3_6_c15_c1_6 bit 31: 2020000030200000
Read Initial Register s3_6_c15_c1_6 bit 32: 2020000030200000
Read Initial Register s3_6_c15_c1_6 bit 33: 2020000030200000
Read Initial Register s3_6_c15_c1_6 bit 34: 2020000030200000
Read Initial Register s3_6_c15_c1_6 bit 35: 2020000030200000
Read Initial Register s3_6_c15_c1_6 bit 36: 2020000030200000
Read Initial Register s3_6_c15_c1_6 bit 37: 2020000030200000
Read Initial Register s3_6_c15_c1_6 bit 38: 2020000030200000
Read Initial Register s3_6_c15_c1_6 bit 39: 2020000030200000
Read Initial Register s3_6_c15_c1_6 bit 40: 2020000030200000
Read Initial Register s3_6_c15_c1_6 bit 41: 2020000030200000
Read Initial Register s3_6_c15_c1_6 bit 42: 2020000030200000
Read Initial Register s3_6_c15_c1_6 bit 43: 2020000030200000
Read Initial Register s3_6_c15_c1_6 bit 44: 2020000030200000
Read Initial Register s3_6_c15_c1_6 bit 45: 2020000030200000
Read Initial Register s3_6_c15_c1_6 bit 46: 2020000030200000
Read Initial Register s3_6_c15_c1_6 bit 47: 2020000030200000
Read Initial Register s3_6_c15_c1_6 bit 48: 2020000030200000
Read Initial Register s3_6_c15_c1_6 bit 49: 2020000030200000
Read Initial Register s3_6_c15_c1_6 bit 50: 2020000030200000
Read Initial Register s3_6_c15_c1_6 bit 51: 2020000030200000
Read Initial Register s3_6_c15_c1_6 bit 52: 2020000030200000
Read Initial Register s3_6_c15_c1_6 bit 53: 2020000030200000
Read Initial Register s3_6_c15_c1_6 bit 54: 2020000030200000
Read Initial Register s3_6_c15_c1_6 bit 55: 2020000030200000
Read Initial Register s3_6_c15_c1_6 bit 56: 2020000030200000
Read Initial Register s3_6_c15_c1_6 bit 57: 2020000030200000
Read Initial Register s3_6_c15_c1_6 bit 58: 2020000030200000
Read Initial Register s3_6_c15_c1_6 bit 59: 2020000030200000
Read Initial Register s3_6_c15_c1_6 bit 60: 2020000030200000
Read Initial Register s3_6_c15_c1_6 bit 61: 2020000030200000
Read Initial Register s3_6_c15_c1_6 bit 62: 2020000030200000
Read Initial Register s3_6_c15_c1_6 bit 63: 2020000030200000
Flipped Register s3_6_c15_c1_6 bit 00: 2020000030200000
Flipped Register s3_6_c15_c1_6 bit 01: 2020000030200000
Flipped Register s3_6_c15_c1_6 bit 02: 2020000030200000
Flipped Register s3_6_c15_c1_6 bit 03: 2020000030200000
Flipped Register s3_6_c15_c1_6 bit 04: 2020000030200000
Flipped Register s3_6_c15_c1_6 bit 05: 2020000030200000
Flipped Register s3_6_c15_c1_6 bit 06: 2020000030200000
Flipped Register s3_6_c15_c1_6 bit 07: 2020000030200000
Flipped Register s3_6_c15_c1_6 bit 08: 2020000030200000
Flipped Register s3_6_c15_c1_6 bit 09: 2020000030200000
Flipped Register s3_6_c15_c1_6 bit 10: 2020000030200000
Flipped Register s3_6_c15_c1_6 bit 11: 2020000030200000
Flipped Register s3_6_c15_c1_6 bit 12: 2020000030200000
Flipped Register s3_6_c15_c1_6 bit 13: 2020000030200000
Flipped Register s3_6_c15_c1_6 bit 14: 2020000030200000
Flipped Register s3_6_c15_c1_6 bit 15: 2020000030200000
Flipped Register s3_6_c15_c1_6 bit 16: 2020000030200000
Flipped Register s3_6_c15_c1_6 bit 17: 2020000030200000
Flipped Register s3_6_c15_c1_6 bit 18: 2020000030200000
Flipped Register s3_6_c15_c1_6 bit 19: 2020000030200000
Flipped Register s3_6_c15_c1_6 bit 20: 2020000030200000
Flipped Register s3_6_c15_c1_6 bit 21: 2020000030200000
Flipped Register s3_6_c15_c1_6 bit 22: 2020000030200000
Flipped Register s3_6_c15_c1_6 bit 23: 2020000030200000
Flipped Register s3_6_c15_c1_6 bit 24: 2020000030200000
Flipped Register s3_6_c15_c1_6 bit 25: 2020000030200000
Flipped Register s3_6_c15_c1_6 bit 26: 2020000030200000
Flipped Register s3_6_c15_c1_6 bit 27: 2020000030200000
Flipped Register s3_6_c15_c1_6 bit 28: 2020000030200000
Flipped Register s3_6_c15_c1_6 bit 29: 2020000030200000
Flipped Register s3_6_c15_c1_6 bit 30: 2020000030200000
Flipped Register s3_6_c15_c1_6 bit 31: 2020000030200000
Flipped Register s3_6_c15_c1_6 bit 32: 2020000030200000
Flipped Register s3_6_c15_c1_6 bit 33: 2020000030200000
Flipped Register s3_6_c15_c1_6 bit 34: 2020000030200000
Flipped Register s3_6_c15_c1_6 bit 35: 2020000030200000
Flipped Register s3_6_c15_c1_6 bit 36: 2020000030200000
Flipped Register s3_6_c15_c1_6 bit 37: 2020000030200000
Flipped Register s3_6_c15_c1_6 bit 38: 2020000030200000
Flipped Register s3_6_c15_c1_6 bit 39: 2020000030200000
Flipped Register s3_6_c15_c1_6 bit 40: 2020000030200000
Flipped Register s3_6_c15_c1_6 bit 41: 2020000030200000
Flipped Register s3_6_c15_c1_6 bit 42: 2020000030200000
Flipped Register s3_6_c15_c1_6 bit 43: 2020000030200000
Flipped Register s3_6_c15_c1_6 bit 44: 2020000030200000
Flipped Register s3_6_c15_c1_6 bit 45: 2020000030200000
Flipped Register s3_6_c15_c1_6 bit 46: 2020000030200000
Flipped Register s3_6_c15_c1_6 bit 47: 2020000030200000
Flipped Register s3_6_c15_c1_6 bit 48: 2020000030200000
Flipped Register s3_6_c15_c1_6 bit 49: 2020000030200000
Flipped Register s3_6_c15_c1_6 bit 50: 2020000030200000
Flipped Register s3_6_c15_c1_6 bit 51: 2020000030200000
Flipped Register s3_6_c15_c1_6 bit 52: 2020000030200000
Flipped Register s3_6_c15_c1_6 bit 53: 2020000030200000
Flipped Register s3_6_c15_c1_6 bit 54: 2020000030200000
Flipped Register s3_6_c15_c1_6 bit 55: 2020000030200000
Flipped Register s3_6_c15_c1_6 bit 56: 2020000030200000
Flipped Register s3_6_c15_c1_6 bit 57: 2020000030200000
Flipped Register s3_6_c15_c1_6 bit 58: 2020000030200000
Flipped Register s3_6_c15_c1_6 bit 59: 2020000030200000
Flipped Register s3_6_c15_c1_6 bit 60: 2020000030200000
Flipped Register s3_6_c15_c1_6 bit 61: 2020000030200000
Flipped Register s3_6_c15_c1_6 bit 62: 2020000030200000
Flipped Register s3_6_c15_c1_6 bit 63: 2020000030200000
# ./s3_6_c15_c1_6-read
s3_6_c15_c1_6 bit 00: 2020000030200000
s3_6_c15_c1_6 bit 01: 2020000030200000
s3_6_c15_c1_6 bit 02: 2020000030200000
s3_6_c15_c1_6 bit 03: 2020000030200000
s3_6_c15_c1_6 bit 04: 2020000030200000
s3_6_c15_c1_6 bit 05: 2020000030200000
s3_6_c15_c1_6 bit 06: 2020000030200000
s3_6_c15_c1_6 bit 07: 2020000030200000
s3_6_c15_c1_6 bit 08: 2020000030200000
s3_6_c15_c1_6 bit 09: 2020000030200000
s3_6_c15_c1_6 bit 10: 2020000030200000
s3_6_c15_c1_6 bit 11: 2020000030200000
s3_6_c15_c1_6 bit 12: 2020000030200000
s3_6_c15_c1_6 bit 13: 2020000030200000
s3_6_c15_c1_6 bit 14: 2020000030200000
s3_6_c15_c1_6 bit 15: 2020000030200000
s3_6_c15_c1_6 bit 16: 2020000030200000
s3_6_c15_c1_6 bit 17: 2020000030200000
s3_6_c15_c1_6 bit 18: 2020000030200000
s3_6_c15_c1_6 bit 19: 2020000030200000
s3_6_c15_c1_6 bit 20: 2020000030200000
s3_6_c15_c1_6 bit 21: 2020000030200000
s3_6_c15_c1_6 bit 22: 2020000030200000
s3_6_c15_c1_6 bit 23: 2020000030200000
s3_6_c15_c1_6 bit 24: 2020000030200000
s3_6_c15_c1_6 bit 25: 2020000030200000
s3_6_c15_c1_6 bit 26: 2020000030200000
s3_6_c15_c1_6 bit 27: 2020000030200000
s3_6_c15_c1_6 bit 28: 2020000030200000
s3_6_c15_c1_6 bit 29: 2020000030200000
s3_6_c15_c1_6 bit 30: 2020000030200000
s3_6_c15_c1_6 bit 31: 2020000030200000
s3_6_c15_c1_6 bit 32: 2020000030200000
s3_6_c15_c1_6 bit 33: 2020000030200000
s3_6_c15_c1_6 bit 34: 2020000030200000
s3_6_c15_c1_6 bit 35: 2020000030200000
s3_6_c15_c1_6 bit 36: 2020000030200000
s3_6_c15_c1_6 bit 37: 2020000030200000
s3_6_c15_c1_6 bit 38: 2020000030200000
s3_6_c15_c1_6 bit 39: 2020000030200000
s3_6_c15_c1_6 bit 40: 2020000030200000
s3_6_c15_c1_6 bit 41: 2020000030200000
s3_6_c15_c1_6 bit 42: 2020000030200000
s3_6_c15_c1_6 bit 43: 2020000030200000
s3_6_c15_c1_6 bit 44: 2020000030200000
s3_6_c15_c1_6 bit 45: 2020000030200000
s3_6_c15_c1_6 bit 46: 2020000030200000
s3_6_c15_c1_6 bit 47: 2020000030200000
s3_6_c15_c1_6 bit 48: 2020000030200000
s3_6_c15_c1_6 bit 49: 2020000030200000
s3_6_c15_c1_6 bit 50: 2020000030200000
s3_6_c15_c1_6 bit 51: 2020000030200000
s3_6_c15_c1_6 bit 52: 2020000030200000
s3_6_c15_c1_6 bit 53: 2020000030200000
s3_6_c15_c1_6 bit 54: 2020000030200000
s3_6_c15_c1_6 bit 55: 2020000030200000
s3_6_c15_c1_6 bit 56: 2020000030200000
s3_6_c15_c1_6 bit 57: 2020000030200000
s3_6_c15_c1_6 bit 58: 2020000030200000
s3_6_c15_c1_6 bit 59: 2020000030200000
s3_6_c15_c1_6 bit 60: 2020000030200000
s3_6_c15_c1_6 bit 61: 2020000030200000
s3_6_c15_c1_6 bit 62: 2020000030200000
s3_6_c15_c1_6 bit 63: 2020000030200000
#
```
