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

```
Hardware Model:      iPhone12,1
Process:             s3_6_c15_c1_2-flip [2331]
Path:                /private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.lOtBuq/usr/bin/s3_6_c15_c1_2-flip
Identifier:          s3_6_c15_c1_2-flip
Version:             ???
Code Type:           ARM-64 (Native)
Role:                Unspecified
Parent Process:      sh [2326]
Coalition:           com.example.cryptex.sshd [589]


Date/Time:           2021-07-05 20:59:43.5414 -0400
Launch Time:         2021-07-05 20:59:43.4970 -0400
OS Version:          iPhone OS 14.7 (18G5052d)
Release Type:        Beta
Baseband Version:    2.05.01
Report Version:      104

Exception Type:  EXC_BAD_INSTRUCTION (SIGILL)
Exception Codes: 0x0000000000000001, 0x00000000d51ef148
Termination Signal: Illegal instruction: 4
Termination Reason: Namespace SIGNAL, Code 0x4
Terminating Process: exc handler [2331]
Triggered by Thread:  0

Thread 0 name:  Dispatch queue: com.apple.main-thread
Thread 0 Crashed:
0   s3_6_c15_c1_2-flip            	0x0000000104557ea8 write_sprr + 32424 (s3_6_c15_c1_2-flip.c:9)
1   s3_6_c15_c1_2-flip            	0x0000000104557f14 main + 32532 (s3_6_c15_c1_2-flip.c:36)
2   libdyld.dylib                 	0x00000001a4911cf8 start + 4

Thread 0 crashed with ARM Thread State (64-bit):
    x0: 0x0000000000000001   x1: 0x000000016b8af9f0   x2: 0x000000016b8afa00   x3: 0x000000016b8afa78
    x4: 0x0000000000000000   x5: 0x0000000000000000   x6: 0x0000000000000000   x7: 0x0000000000000000
    x8: 0x0000000000000001   x9: 0x0000000000000000  x10: 0x0000000000000001  x11: 0x0000000000000003
   x12: 0x0000000000000002  x13: 0x0000000000000000  x14: 0x0000000000000002  x15: 0x00000001b430c6b1
   x16: 0x47446e0104557ed4  x17: 0x6ae100016b8ae868  x18: 0x0000000000000000  x19: 0x0000000000000000
   x20: 0x0000000000000000  x21: 0x0000000000000000  x22: 0x0000000000000000  x23: 0x0000000000000000
   x24: 0x0000000000000000  x25: 0x0000000000000000  x26: 0x0000000000000000  x27: 0x0000000000000000
   x28: 0x000000016b8af9e0   fp: 0x000000016b8af9b0   lr: 0x0000000104557f14
    sp: 0x000000016b8af960   pc: 0x0000000104557ea8 cpsr: 0x80000000
   esr: 0x02000000  Address size fault

Binary Images:
0x104550000 - 0x104557fff s3_6_c15_c1_2-flip arm64e  <e84490b8f3e737e198e9d7b8232ba43d> /var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.lOtBuq/usr/bin/s3_6_c15_c1_2-flip
0x1048f4000 - 0x104967fff dyld arm64e  <542397fa8b2632f38318b296300924ee> /usr/lib/dyld
0x1a48cb000 - 0x1a490ffff libdispatch.dylib arm64e  <7e42eabf280735f6a852045a8ef4cc00> /usr/lib/system/libdispatch.dylib
0x1a4910000 - 0x1a494cfff libdyld.dylib arm64e  <18d100a457733fd18b3fbf929022ecfe> /usr/lib/system/libdyld.dylib
0x1adfc3000 - 0x1adfe8fff libsystem_info.dylib arm64e  <a3d066e3817c3a7dadeacc602868f547> /usr/lib/system/libsystem_info.dylib
0x1adfe9000 - 0x1ae068fff libsystem_c.dylib arm64e  <7c18ec71746d3266a32ca140952ba357> /usr/lib/system/libsystem_c.dylib
0x1b42ec000 - 0x1b430ffff libsystem_malloc.dylib arm64e  <220159d6b88d369e846fd11d20580ced> /usr/lib/system/libsystem_malloc.dylib
0x1b61e8000 - 0x1b61f7fff libsystem_networkextension.dylib arm64e  <39a586cbbf3631c0a1382e6583891818> /usr/lib/system/libsystem_networkextension.dylib
0x1b9774000 - 0x1b97abfff libobjc.A.dylib arm64e  <20095bba0633346595fde55bc4409efa> /usr/lib/libobjc.A.dylib
0x1b980e000 - 0x1b9869fff libc++.1.dylib arm64e  <85731d05680b3acba7142eafaf569f54> /usr/lib/libc++.1.dylib
0x1b986a000 - 0x1b9883fff libc++abi.dylib arm64e  <36d62aea377c391d8816524e817ec575> /usr/lib/libc++abi.dylib
0x1bb4ab000 - 0x1bb4c1fff libsystem_trace.dylib arm64e  <5cf2adf16bdb3e1ab027b47066da4004> /usr/lib/system/libsystem_trace.dylib
0x1bf800000 - 0x1bf80afff libsystem_notify.dylib arm64e  <f9af4de0f7453e7faee4102b5f2ebbd9> /usr/lib/system/libsystem_notify.dylib
0x1bf8b9000 - 0x1bf92cfff libcorecrypto.dylib arm64e  <d7416c36c920347194a87e640f2a1309> /usr/lib/system/libcorecrypto.dylib
0x1bfa28000 - 0x1bfa42fff libsystem_asl.dylib arm64e  <94ad762d720c305e8fe530b1c0c35fff> /usr/lib/system/libsystem_asl.dylib
0x1c76ca000 - 0x1c76d1fff libsystem_symptoms.dylib arm64e  <23da52bee6333a8090312b85982d7d79> /usr/lib/system/libsystem_symptoms.dylib
0x1d2dc3000 - 0x1d2df5fff libsystem_kernel.dylib arm64e  <0b7f2529325635599e786a710483eed3> /usr/lib/system/libsystem_kernel.dylib
0x1d57b2000 - 0x1d57b3fff libSystem.B.dylib arm64e  <2ca0772c7c143d3fb9a37b61787fcb63> /usr/lib/libSystem.B.dylib
0x1f06d0000 - 0x1f06d5fff libcache.dylib arm64e  <64c1693333df3606a344db127b17dcdd> /usr/lib/system/libcache.dylib
0x1f06d6000 - 0x1f06e3fff libcommonCrypto.dylib arm64e  <1e462e870c7c350c96e0d6294ae178c2> /usr/lib/system/libcommonCrypto.dylib
0x1f06e4000 - 0x1f06e7fff libcompiler_rt.dylib arm64e  <afb468f579a633a4a10d199c7f497613> /usr/lib/system/libcompiler_rt.dylib
0x1f06e8000 - 0x1f06f0fff libcopyfile.dylib arm64e  <7a59f28e8b213080b9bf1b9666af2132> /usr/lib/system/libcopyfile.dylib
0x1f07d6000 - 0x1f07d6fff liblaunch.dylib arm64e  <8eb908aa5a8637f1bb429a17e5f8cad6> /usr/lib/system/liblaunch.dylib
0x1f07d7000 - 0x1f07dcfff libmacho.dylib arm64e  <154246abbaeb3da1936aabc6a4bd9689> /usr/lib/system/libmacho.dylib
0x1f07dd000 - 0x1f07dffff libremovefile.dylib arm64e  <6f348e122e4b3c67b474d731d927ff75> /usr/lib/system/libremovefile.dylib
0x1f07e0000 - 0x1f07e1fff libsystem_blocks.dylib arm64e  <6578956937dd339d8c578be85576318a> /usr/lib/system/libsystem_blocks.dylib
0x1f07e2000 - 0x1f07e4fff libsystem_collections.dylib arm64e  <f755f16ea79830019d0934161df13741> /usr/lib/system/libsystem_collections.dylib
0x1f07e5000 - 0x1f07e9fff libsystem_configuration.dylib arm64e  <0c939675104b3c878fcb43ad30813bb1> /usr/lib/system/libsystem_configuration.dylib
0x1f07ea000 - 0x1f07fcfff libsystem_containermanager.dylib arm64e  <176520b8481e3f4499558ee3df5ce236> /usr/lib/system/libsystem_containermanager.dylib
0x1f07fd000 - 0x1f07fefff libsystem_coreservices.dylib arm64e  <945a7e3a8e8039a7bfd8f89e22ebb974> /usr/lib/system/libsystem_coreservices.dylib
0x1f07ff000 - 0x1f0808fff libsystem_darwin.dylib arm64e  <7a163500520636e08b3e11cf27a5c396> /usr/lib/system/libsystem_darwin.dylib
0x1f0809000 - 0x1f0811fff libsystem_dnssd.dylib arm64e  <019c3b2181a335798433c2bef0b51546> /usr/lib/system/libsystem_dnssd.dylib
0x1f0812000 - 0x1f0814fff libsystem_featureflags.dylib arm64e  <c1b25a14537230018d553eee52862d17> /usr/lib/system/libsystem_featureflags.dylib
0x1f0815000 - 0x1f0842fff libsystem_m.dylib arm64e  <f09d2f3614893ad9aef30710ab80ea14> /usr/lib/system/libsystem_m.dylib
0x1f0843000 - 0x1f0849fff libsystem_platform.dylib arm64e  <efa7b555f4453d6ab48bec58ee0c9eca> /usr/lib/system/libsystem_platform.dylib
0x1f084a000 - 0x1f084afff libsystem_product_info_filter.dylib arm64e  <54c0cfb3f07131d19ca19969d694a31e> /usr/lib/system/libsystem_product_info_filter.dylib
0x1f084b000 - 0x1f0856fff libsystem_pthread.dylib arm64e  <9d05e0a5b98f31fa94d1fa87fae9055d> /usr/lib/system/libsystem_pthread.dylib
0x1f0857000 - 0x1f085afff libsystem_sandbox.dylib arm64e  <0108b50d3b7931239570fdd198a5ee35> /usr/lib/system/libsystem_sandbox.dylib
0x1f085b000 - 0x1f0865fff libunwind.dylib arm64e  <798f26e0db613755a6e3e875064d6c83> /usr/lib/system/libunwind.dylib
0x1f0866000 - 0x1f089cfff libxpc.dylib arm64e  <fced62a860c837429619e4ccd214720c> /usr/lib/system/libxpc.dylib

EOF

```
