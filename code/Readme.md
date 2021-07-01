### iPhone 11 SPRR Permission Configuration Register (EL0) SPRR_PERM_EL0 s3_6_c15_c1_5 Check & Other iPhone 11 Register Fuzzing Code

Caveat - This Code is targeted to Apple Security Research Device Holders and Your Mileage May Vary if you do not posess a SRD.

On May 6, 2021 a Post by Sven Peter about Apple Silicon Hardware Secrets: SPRR and Guarded Exception Levels (GXF) at URL https://blog.svenpeter.dev/posts/m1_sprr_gxf/ appeared in my Timeline. I had just been reviewing https://github.com/AsahiLinux/m1n1/blob/main/tools/apple_regs.json.

For the M1 Apple Silicon Platform, I've Posted some Results at URL https://github.com/xsscx/macos-research/tree/main/sprr

An interesting Read but no additional information was provided with respect to Fuzzing those 64 Register Bits, just performing a Bit Flip with the provided example SPRR JIT test code. My first thoughts were: What happens when the Program Counter (PC) and/or Link Register (LR) are lightly Fuzzed? Pitchfork / Clusterbomb, and what happens when we run the Code on an SRD.

This Repo answer the question.. what happens when we run Sven Peter's Code on the SRD... 

Repo in Development.. Feel Free to Open Issues, Ask Questions and Contribute Code to be run on the SRD.

Check out the 2021 SRD Cohort Website at https://srd.cx

## CODE CONTRIBUTIONS ACCEPTED

Do you want to see you Code run on an SRD? Malware? Scareware? Sure.... Give us some Fresh Meat! 
Ninja? Include your entitlements.plist so we can use a Hammer with your Code.. 

Contribute your Code to be Run on the Apple SRD, we will Post the Results quickly :-)
