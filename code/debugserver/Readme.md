## PUNTED: SRD | debugserver-@(#)PROGRAM:LLDB  PROJECT:lldb-1300.2.10. Reason: EXC_BAD_ACCESS | Apple needs to show a Proof of Work.

# Landing for debugserver on Apple Security Research Device 

See URL https://srd.cx/debugserver-installation-configuration/

Still working on the right mix of entitlements to make debugserver work on the Apple Security Research Device. The Wheel of Fortune for Entitlements worked with the debugserver.plist, but produced PAC Crashes depending on other attempts and ordering.. ymmv.

```
hdiutil attach /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/DeviceSupport/15.0/DeveloperDiskImage.dmg
```
```
cp /Volumes/DeveloperDiskImage/usr/bin/debugserver ~/srd/example-cryptex/src/debugserver
```
```
make install
```
```
sudo spctl --assess --verbose /Volumes/com.example.cryptex.dstroot/usr/bin/debugserver
/Volumes/com.example.cryptex.dstroot/usr/bin/debugserver: rejected
```
```
codesign -dv --verbose=4 /Volumes/com.example.cryptex.dstroot/usr/bin/debugserver
Executable=/Volumes/com.example.cryptex.dstroot/usr/bin/debugserver
Identifier=com.apple.debugserver
Format=Mach-O universal (arm64e arm64)
CodeDirectory v=20400 size=5518 flags=0x2(adhoc) hashes=162+7 location=embedded
VersionPlatform=2
VersionMin=983040
VersionSDK=983040
Hash type=sha256 size=32
CandidateCDHash sha256=6f4ba027973fafa0e8dee67953ad10c264605a1b
CandidateCDHashFull sha256=6f4ba027973fafa0e8dee67953ad10c264605a1b407a01fc12c9c974f68165b4
Hash choices=sha256
CMSDigest=6f4ba027973fafa0e8dee67953ad10c264605a1b407a01fc12c9c974f68165b4
CMSDigestType=2
Executable Segment base=0
Executable Segment limit=442368
Executable Segment flags=0x11
Page size=4096
CDHash=6f4ba027973fafa0e8dee67953ad10c264605a1b
Signature=adhoc
Info.plist entries=5
TeamIdentifier=not set
Sealed Resources=none
Internal requirements count=0 size=12
```
# Update 1 - October 4, 2021
```
(lldb) process save-core srd-dump-lldb-001.txt
0x00000019 0x00000048 [0x0000000104e88000 - 0x0000000104e94000) [0x0000000000001000 0x000000000000c000) 0x00000005 0x00000005 0x00000000 0x00000000]
0x00000019 0x00000048 [0x0000000104e94000 - 0x0000000104e98000) [0x000000000000d000 0x0000000000004000) 0x00000003 0x00000003 0x00000000 0x00000000]
0x00000019 0x00000048 [0x0000000104e98000 - 0x0000000104e9c000) [0x0000000000011000 0x0000000000004000) 0x00000003 0x00000003 0x00000000 0x00000000]
0x00000019 0x00000048 [0x0000000104e9c000 - 0x0000000104ea4000) [0x0000000000015000 0x0000000000008000) 0x00000001 0x00000001 0x00000000 0x00000000]
0x00000019 0x00000048 [0x00000001050f0000 - 0x0000000105124000) [0x000000000001d000 0x0000000000034000) 0x00000005 0x00000005 0x00000000 0x00000000]
0x00000019 0x00000048 [0x0000000105124000 - 0x0000000105128000) [0x0000000000051000 0x0000000000004000) 0x00000005 0x00000005 0x00000000 0x00000000]
0x00000019 0x00000048 [0x0000000105128000 - 0x0000000105148000) [0x0000000000055000 0x0000000000020000) 0x00000005 0x00000005 0x00000000 0x00000000]
0x00000019 0x00000048 [0x0000000105148000 - 0x0000000105154000) [0x0000000000075000 0x000000000000c000) 0x00000003 0x00000003 0x00000000 0x00000000]
0x00000019 0x00000048 [0x0000000105154000 - 0x0000000105158000) [0x0000000000081000 0x0000000000004000) 0x00000003 0x00000003 0x00000000 0x00000000]
0x00000019 0x00000048 [0x0000000105158000 - 0x0000000105190000) [0x0000000000085000 0x0000000000038000) 0x00000001 0x00000001 0x00000000 0x00000000]
0x00000019 0x00000048 [0x000000016ae7c000 - 0x000000016af78000) [0x00000000000bd000 0x00000000000fc000) 0x00000003 0x00000003 0x00000000 0x00000000]
0x00000019 0x00000048 [0x00000001808bc000 - 0x00000001d0790000) [0x00000000001b9000 0x000000004fed4000) 0x00000005 0x00000005 0x00000000 0x00000000]
0x00000019 0x00000048 [0x00000001d2790000 - 0x00000001d5634000) [0x000000005008d000 0x0000000002ea4000) 0x00000001 0x00000001 0x00000000 0x00000000]
0x00000019 0x00000048 [0x00000001d7634000 - 0x00000001d8000000) [0x0000000052f31000 0x00000000009cc000) 0x00000003 0x00000003 0x00000000 0x00000000]
0x00000019 0x00000048 [0x00000001d8000000 - 0x00000001da000000) [0x00000000538fd000 0x0000000002000000) 0x00000003 0x00000003 0x00000000 0x00000000]
0x00000019 0x00000048 [0x00000001da000000 - 0x00000001da364000) [0x00000000558fd000 0x0000000000364000) 0x00000003 0x00000003 0x00000000 0x00000000]
0x00000019 0x00000048 [0x00000001da364000 - 0x00000001dbdf4000) [0x0000000055c61000 0x0000000001a90000) 0x00000003 0x00000003 0x00000000 0x00000000]
0x00000019 0x00000048 [0x00000001dbdf4000 - 0x00000001df144000) [0x00000000576f1000 0x0000000003350000) 0x00000001 0x00000001 0x00000000 0x00000000]
0x00000019 0x00000048 [0x00000001e1144000 - 0x00000001e1170000) [0x000000005aa41000 0x000000000002c000) 0x00000001 0x00000001 0x00000000 0x00000000]
0x00000019 0x00000048 [0x00000001e1170000 - 0x00000001fe5d0000) [0x000000005aa6d000 0x000000001d460000) 0x00000005 0x00000005 0x00000000 0x00000000]
0x00000019 0x00000048 [0x00000002005d0000 - 0x00000002010bc000) [0x0000000077ecd000 0x0000000000aec000) 0x00000001 0x00000001 0x00000000 0x00000000]
0x00000019 0x00000048 [0x00000002030bc000 - 0x0000000204000000) [0x00000000789b9000 0x0000000000f44000) 0x00000003 0x00000003 0x00000000 0x00000000]
0x00000019 0x00000048 [0x0000000204000000 - 0x0000000205064000) [0x00000000798fd000 0x0000000001064000) 0x00000003 0x00000003 0x00000000 0x00000000]
0x00000019 0x00000048 [0x0000000205064000 - 0x0000000205c18000) [0x000000007a961000 0x0000000000bb4000) 0x00000003 0x00000003 0x00000000 0x00000000]
0x00000019 0x00000048 [0x0000000205c18000 - 0x00000002069d8000) [0x000000007b515000 0x0000000000dc0000) 0x00000001 0x00000001 0x00000000 0x00000000]
0x00000019 0x00000048 [0x00000002089d8000 - 0x00000002150dc000) [0x000000007c2d5000 0x000000000c704000) 0x00000001 0x00000001 0x00000000 0x00000000]
Saving 49152 bytes of data for memory region at 0x104e88000
Saving 16384 bytes of data for memory region at 0x104e94000
Saving 16384 bytes of data for memory region at 0x104e98000
Saving 32768 bytes of data for memory region at 0x104e9c000
Saving 212992 bytes of data for memory region at 0x1050f0000
Saving 16384 bytes of data for memory region at 0x105124000
Saving 131072 bytes of data for memory region at 0x105128000
Saving 49152 bytes of data for memory region at 0x105148000
Saving 16384 bytes of data for memory region at 0x105154000
Saving 229376 bytes of data for memory region at 0x105158000
Saving 1032192 bytes of data for memory region at 0x16ae7c000
Saving 1340948480 bytes of data for memory region at 0x1808bc000
In Progress........
-rw-------  1 xss  staff   1.7G Oct  4 11:10 /Volumes/APS-XS03-480/mini/Documents/srd-dump-lldb-001.txt
Its still running.... so that is very good news so far.....
```

# Result 1
```
(lldb) platform select remote-ios
  Platform: remote-ios
 Connected: no
  SDK Path: "/Users/xss/Library/Developer/Xcode/iOS DeviceSupport/15.1 (19B5042h) arm64e"
 SDK Roots: [ 0] "/Users/xss/Library/Developer/Xcode/iOS DeviceSupport/15.0 (19A5325f) arm64e"
 SDK Roots: [ 1] "/Users/xss/Library/Developer/Xcode/iOS DeviceSupport/14.7.1 (18G82) arm64e"
 SDK Roots: [ 2] "/Users/xss/Library/Developer/Xcode/iOS DeviceSupport/15.0 (19A5337a) arm64e"
 SDK Roots: [ 3] "/Users/xss/Library/Developer/Xcode/iOS DeviceSupport/15.0 (19A5340a) arm64e"
 SDK Roots: [ 4] "/Users/xss/Library/Developer/Xcode/iOS DeviceSupport/15.0 (19A344) arm64e"
 SDK Roots: [ 5] "/Users/xss/Library/Developer/Xcode/iOS DeviceSupport/15.1 (19B5042h) arm64e"
 SDK Roots: [ 6] "/Users/xss/Library/Developer/Xcode/iOS DeviceSupport/15.0 (19A346) arm64e"
(lldb) process connect connect://192.168.3.74:1921
Process 556 stopped
* thread #1, stop reason = signal SIGSTOP
    frame #0: 0x0000000100dee810 dyld`_dyld_start
dyld`_dyld_start:
->  0x100dee810 <+0>:  mov    x0, sp
    0x100dee814 <+4>:  and    sp, x0, #0xfffffffffffffff0
    0x100dee818 <+8>:  mov    x29, #0x0
    0x100dee81c <+12>: mov    x30, #0x0
Target 0: (hello) stopped.Darwin iPhone-11 21.0.0 Darwin Kernel Version 21.0.0: Tue Aug 17 15:54:23 PDT 2021; root:xnu-8019.12.5~3/RELEASE_ARM64_T8030 iPhone12,1
```
```
default	09:09:42.680408-0400	debugserver	Got a 'k' packet, killing the inferior process.
default	09:09:42.714221-0400	debugserver	Sending ptrace PT_KILL to terminate inferior process pid 336.
```


# Crash Report
```
Hardware Model:      iPhone12,1
Process:             debugserver [338]
Path:                /private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.TEzNH3/usr/bin/debugserver
Identifier:          debugserver
Version:             ???
Code Type:           ARM-64 (Native)
Role:                Unspecified
Parent Process:      sh [323]
Coalition:           com.example.cryptex.sshd [491]

Date/Time:           2021-08-26 11:41:24.9974 -0400
Launch Time:         2021-08-26 11:41:24.2901 -0400
OS Version:          iPhone OS 15.0 (19A5337a)
Release Type:        Beta
Baseband Version:    3.00.00
Report Version:      104

Exception Type:  EXC_BAD_ACCESS (SIGSEGV)
Exception Subtype: KERN_INVALID_ADDRESS at 0x002000010257ce18 -> 0x000000010257ce18 (possible pointer authentication failure)
Exception Codes: 0x0000000000000001, 0x002000010257ce18
VM Region Info: 0x10257ce18 is in 0x10257c000-0x102588000;  bytes after start: 3608  bytes before end: 45543
      REGION TYPE                 START - END      [ VSIZE] PRT/MAX SHRMOD  REGION DETAIL
      __TEXT                   102504000-10257c000 [  480K] r-x/r-x SM=COW  ...n/debugserver
--->  __DATA_CONST             10257c000-102588000 [   48K] r--/rw- SM=COW  ...n/debugserver
      __DATA                   102588000-102994000 [ 4144K] rw-/rw- SM=COW  ...n/debugserver
Exception Note:  EXC_CORPSE_NOTIFY
Termination Reason: SIGNAL; [11]
Terminating Process: exc handler [338]

Terminating Process: exc handler [338]
Triggered by Thread:  0

Thread 0 name:  main thread Dispatch queue: com.apple.main-thread
Thread 0 Crashed:
0   libc++.1.dylib                	       0x19c485b0c std::__1::__shared_weak_count::__release_weak+ 47884 () + 44
1   debugserver                   	       0x102511a24 0x102504000 + 55844
2   debugserver                   	       0x10250c698 0x102504000 + 34456
3   debugserver                   	       0x10250e768 0x102504000 + 42856
4   dyld                          	       0x102a69a24 start + 520


Thread 0 crashed with ARM Thread State (64-bit):
    x0: 0x0000000103a04470   x1: 0x0000000104009200   x2: 0x0000000104000000   x3: 0x0000000000000800
    x4: 0x0000000000000120   x5: 0x0000000103904470   x6: 0x0000000000000029   x7: 0x000000000000003e
    x8: 0x0000000103a04480   x9: 0x0000000000000000  x10: 0x0000000000000000  x11: 0x0000000000000a00
   x12: 0x0000000000000001  x13: 0x0000000104000000  x14: 0x0000000000000001  x15: 0x0000000000000002
   x16: 0x002000010257cdf8  x17: 0x634f000103a04470  x18: 0x0000000000000000  x19: 0x0000000103a04470
   x20: 0x0000000000000400  x21: 0x000000016d8fa818  x22: 0x0000000000000000  x23: 0x0000000000000000
   x24: 0x0000000104009200  x25: 0x0000000000000001  x26: 0x000000007fffffff  x27: 0x00000001038120d0
   x28: 0x0000000000000000   fp: 0x000000016d8fa7f0   lr: 0x0000000102511a24
    sp: 0x000000016d8fa490   pc: 0x000000019c485b0c cpsr: 0x60000000
   far: 0x002000010257ce18  esr: 0x92000004 (Data Abort) byte read Translation fault

Binary Images:
       0x19c47a000 -        0x19c4ddfff libc++.1.dylib arm64e  <15095115b2ab37719e86897521087066> /usr/lib/libc++.1.dylib
       0x102504000 -        0x10257bfff debugserver arm64e  <54186028cc6b35dfaf1be2fd9ab24404> /private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.TEzNH3/usr/bin/debugserver
       0x102a50000 -        0x102aa7fff dyld arm64e  <1602b2f2df6234128bc6ece21486c3e0> /usr/lib/dyld
               0x0 - 0xffffffffffffffff ??? unknown-arch  <00000000000000000000000000000000> ???

EOF

```
# Console Log
```
default	15:04:19.294269-0400	debugserver	10 +0.011133 sec [0c45/0103]: error: ::task_for_pid ( target_tport = 0x0203, pid = 636, &task ) => err = 0x00000005 ((os/kern) failure) err = ::task_for_pid ( target_tport = 0x0203, pid = 636, &task ) => err = 0x00000005 ((os/kern) failure) (0x00000005)
```
```
default	15:04:19.393461-0400	debugserver	error: MachTask::StartExceptionThread (): task invalid, exception thread start failed.
```
```
default	15:04:19.393614-0400	debugserver	error: [LaunchAttach] END (3141) MachProcess::AttachForDebug failed to start exception thread attaching to pid 636: unable to start the exception thread
```
# Plist File
```
xmllint debugserver.plist
<?xml version="1.0"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>com.apple.system-task-ports</key>
	<true/>
	<key>task_for_pid-allow</key>
	<true/>
</dict>
</plist>
```


In other news.... Code Coverage works.. -fprofile-instr-generate -fcoverage-mapping
```
 pwd
/private/var/root
 LLVM_PROFILE_FILE="foo.profraw" /private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.YzdC1G/usr/bin/hello-code-cov
Hello researcher from pid 8749!
 ls -la foo.profraw
-rw-r--r--  1 root wheel  160 2021-07-08 16:52 foo.profraw
```

BUT.. CFI doesn't work on ARM.. this is something I didn't know..
```
clang: error: unsupported option '-fsanitize=cfi' for target 'arm64e-apple-darwin20.5.0'

```
