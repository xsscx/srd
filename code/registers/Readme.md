### Contribute to the iPhone 11 Register Fuzzing Project

Reference: M1 Apple Silicon SPRR Permission Checks https://github.com/xsscx/macos-research/tree/main/sprr

This Public Domain Repo is meant to Document the Results of Testing the iPhone 12,1 Registers. 

DATAPOINT: https://gist.github.com/bazad/42054285391c6e0dcd0ede4b5f969ad2

DATAPOINT: https://github.com/xsscx/srd/blob/main/code/registers/data/iphone11-registers-s3-cleaned-uniq-fuzz-input-001.txt

DATAPOINT: https://github.com/gdelugre/ida-arm-system-highlight/blob/master/highlight_arm_system_insn.py

October 25, 2021: In iOS 15.1 Apple added a new entitlement called research.com.apple.license-to-operate to support Frida and other research tools for the Apple Security Research Device. This entitlement allows tools to bypass the PPL codesigning protections and the usual task-port policies to inject code into any process running on the system (platform and non-platform).

Summary as of 6 June 2021
------
```
s3_5_c15_c10_1      : 0x0000000000000000
s3_6_c15_c1_6       : 0x2020000030200000
```
IF you are Landing here, the Code is run on an Apple Security Research Device. 

Toolchain Details
-----
XNU Export
```
export XNU_VERSION=xnu-7195.81.3
```
iPhone 11 Register Tests
=========
CAVEAT: User = root and I'm Side-loading executable code onto the device with arbitrary entitlements at the same permission level as Apple operating system components.
```
Hardware Model:      iPhone12,1
iPhone OS 14.7 (18G5052d)
uname -a
Darwin iPhone 20.6.0 Darwin Kernel Version 20.6.0: Sun Jun 20 22:50:32 PDT 2021; root:xnu-7195.140.39.0.1~13/RELEASE_ARM64_T8030 iPhone12,1
```
```

* Results of Accessing a restricted system register from an application generates an exception and ends up in SIGILL being delivered to the process

Repo in Development.. Feel Free to Open Issues, Ask Questions and Contribute Code to be run on the SRD.

Check out the 2021 SRD Cohort Website at https://srd.cx

## CODE CONTRIBUTIONS ACCEPTED

Do you want to see your Code run on an SRD? Malware? Scareware? Sure.... Give us some Fresh Meat! 
Ninja? Include your entitlements.plist so we can use a Hammer with your Code.. 

Contribute your Code to be Run on the Apple SRD, we will Post the Results quickly :-)


Caveat - This Code is targeted to Apple Security Research Device Holders and Your Mileage May Vary if you do not posess a SRD.

