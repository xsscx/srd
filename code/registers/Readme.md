# Results for iPhone 11 & iPhone 12 Register Fuzzing

Reference: M1 Apple Silicon SPRR Permission Checks https://github.com/xsscx/macos-research/tree/main/sprr

This Public Domain Repo is meant to Document the Results of Testing the iPhone 11 & iPhone 12 Registers. 

DATAPOINT: https://gist.github.com/bazad/42054285391c6e0dcd0ede4b5f969ad2

DATAPOINT: https://github.com/xsscx/srd/blob/main/code/registers/data/iphone11-registers-s3-cleaned-uniq-fuzz-input-001.txt

DATAPOINT: https://github.com/gdelugre/ida-arm-system-highlight/blob/master/highlight_arm_system_insn.py

iPhone 11 Sample Results from cryptex
------
```
SPRR_PERM_EL0 - Read Register s3_6_c15_c1_5 (as root)
SPRR_PERM_EL1 - Read Register s3_6_c15_c1_6 (as root)
M1RACLES Bug - Register s3_5_c15_c10_1 bit 00 + bit 01
```

iPhone 12 Sample Results from cryptex
------
```
SPRR_PERM_EL0 - Read Register s3_6_c15_c1_5 (as root)
SPRR_PERM_EL1 - Read Register s3_4_c15_c10_5 (as root)
M1RACLES Bug - Register s3_5_c15_c10_1 bit 00 + bit 01
CNTPCT_ALIAS_EL0 - Read Register - s3_4_c15_c10_5 (as root)
```
