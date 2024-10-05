# SRD PR42, 48 & 49 | unsuitable CT policy 0x8 for this platform/device, rejecting signature

Last Updated: THU 31 MAR 2022 1715 EDT

Note: macOS 12.3.1 (21E258) X86_64 Note: cryptexctl == EXC_BAD_ACCESS (SIGSEGV)
- X86_64 Workaround: [CryptexManager](https://github.com/pinauten/CryptexManager)

### SRD Example DMG, Build & Installation Status w/ XNU-8019.41.5 
| Build OS & Device Info           | Example DMG   |  debugserver DMG  |  ASAN DMG     | UBSAN DMG 
| -------------------------------- | ------------- | ------------- | ------------- | -------------
| macOS 12.3 (21E230) X86_64       | PASS          | PASS          | PASS          | PASS          
| macOS 12.3 (21E230) T8101  | PASS          | PASS          | PASS          | PASS 
| X86_64 Install to iPhone 11 19E258    | SIGSEGV         | SIGSEGV         | SIGSEGV          | SIGSEGV
| T8101 Install to iPhone 12 19E258    | PASS          | PASS          | PASS          | PASS 


#### Comment
AMFI is too Noisy on the SRD Platform to be usable for debugserver, frida or other debugging tools.
```
macOS 12.2.1 (21D62) X86_64 or M1 T8101 macOS 12.3 (21E230)
Xcode Version 13.3 (13E113)
```
If you experience unsuitable CT policy 0x8 for this platform/device, rejecting signature, just do make clean; make install

### SRD Build Unit Tests for ./example-cryptex/ and the *SAN Dylibs

#### Case 1: Build ./example/cryptex/ which includes PR48 + PR49 {updated entitlements and debugserver}
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/xsscx/srd/main/srd_tools-24.100.3/example-cryptex/build.sh)"
```

#### Case 2: Build ./example/cryptex/ and ASAN Dylib linked to hello sample code
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/xsscx/srd/main/srd_tools-24.100.3/example-cryptex/build-asan.sh)"
```

#### Case 3: Build ./example/cryptex/ and UBSAN Dylib linked to hello sample code
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/xsscx/srd/main/srd_tools-24.100.3/example-cryptex/build-ubsan.sh)"
```
### Reproduction Case  1: Build the example-cryptex with macOS 12.2.1 (21D62) on X86_64 when using iOS 15.4_19E5225g

```
make clean
make install
```
### Results using iPhone 12

```
default	10:22:00.585464-0500	kernel	AMFI: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.USWFhH/usr/bin/debugserver' is adhoc signed.
default	10:22:00.585630-0500	kernel	AMFI: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.USWFhH/usr/bin/debugserver': unsuitable CT policy 0 for this platform/device, rejecting signature.
```
### Picture at Left showing the make and install process for ./example-cryptex/ with Picture at Right showing the SRD iPhone 12 Console Log
<img src="https://xss.cx/2022/02/15/img/srd0037-cryptex-install-debugserver-ct-rejected-example-001.png" alt="Picture at Left showing the make and install process with Picture at Right showing the SRD iPhone 12 Console Log" style="height: 800px; width:1000px;"/>

## Reproduction Case  2: Build the example-cryptex with macOS 12.2.1 (21D62) on X86_64 __and__ ASAN Dylib using iPhone 12 when using iOS 15.4_19E5225g

```
default	10:33:07.038976-0500	kernel	/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.ZKfbpw/usr/bin/hello[2467] ==> debugserver
default	10:33:07.049099-0500	kernel	AMFI: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.ZKfbpw/usr/bin/debugserver' is adhoc signed.
default	10:33:07.049264-0500	kernel	AMFI: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.ZKfbpw/usr/bin/debugserver': unsuitable CT policy 0 for this platform/device, rejecting signature.
default	10:33:17.064152-0500	kernel	/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.ZKfbpw/usr/bin/hello[2470] ==> debugserver
default	10:33:17.074069-0500	kernel	AMFI: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.ZKfbpw/usr/bin/debugserver' is adhoc signed.
default	10:33:17.074337-0500	kernel	AMFI: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.ZKfbpw/usr/bin/debugserver': unsuitable CT policy 0 for this platform/device, rejecting signature.
```

### Picture at Left showing the make and install process for ./example-cryptex + hello + asan.dylib with Picture at Right showing the SRD iPhone 12 Console Log
<img src="https://xss.cx/2022/02/15/img/srd0037-cryptex-install-hello-ubsan-ct-rejected-example-001.png" alt="Picture at Left showing the make and install process with Picture at Right showing the SRD iPhone 12 Console Log with ASAN" style="height: 800px; width:1000px;"/>

## Reproduction Case 3: Build the example-cryptex with macOS 12.2.1 (21D62) on X86_64 __and__ UBSAN Dylib using iPhone 12 when using iOS 15.4_19E5225g

```
error	10:37:14.650327-0500	kernel	Sandbox: hello(2520) deny(1) file-map-executable /private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.sYr3Iw/usr/bin/libclang_rt.ubsan_ios_dynamic.dylib
default	10:37:14.653177-0500	ReportCrash	ASI found [dyld] (sensitive) 'Library not loaded: @rpath/libclang_rt.ubsan_ios_dynamic.dylib
  Referenced from: /private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.sYr3Iw/usr/bin/hello
  Reason: tried: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.sYr3Iw/usr/bin/libclang_rt.ubsan_ios_dynamic.dylib' (file system sandbox blocked mmap() of '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.sYr3Iw/usr/bin/libclang_rt.ubsan_ios_dynamic.dylib'), '/Applications/Xcode-beta.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/13.1.6/lib/darwin/libclang_rt.ubsan_ios_dynamic.dylib' (no such file), '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.sYr3Iw/usr/bin/libclang_rt.ubsan_ios_dynamic.dylib' (file system sandbox blocked mmap() of '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.sYr3Iw/usr/bin/libclang_rt.ubsan_ios_dynamic.dylib'), '/Applications/Xcode-beta.app/Contents/Developer/Toolchains<…>'
default	10:37:24.659471-0500	kernel	AMFI: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.sYr3Iw/usr/bin/debugserver' is adhoc signed.
default	10:37:24.659594-0500	kernel	AMFI: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.sYr3Iw/usr/bin/debugserver': unsuitable CT policy 0 for this platform/device, rejecting signature.
default	10:37:24.660537-0500	kernel	/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.sYr3Iw/usr/bin/hello[2529] ==> debugserver
default	10:37:24.672394-0500	ReportCrash	ASI found [dyld] (sensitive) 'Library not loaded: @rpath/libclang_rt.ubsan_ios_dynamic.dylib
  Referenced from: /private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.sYr3Iw/usr/bin/hello
  Reason: tried: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.sYr3Iw/usr/bin/libclang_rt.ubsan_ios_dynamic.dylib' (file system sandbox blocked mmap() of '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.sYr3Iw/usr/bin/libclang_rt.ubsan_ios_dynamic.dylib'), '/Applications/Xcode-beta.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/13.1.6/lib/darwin/libclang_rt.ubsan_ios_dynamic.dylib' (no such file), '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.sYr3Iw/usr/bin/libclang_rt.ubsan_ios_dynamic.dylib' (file system sandbox blocked mmap() of '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.sYr3Iw/usr/bin/libclang_rt.ubsan_ios_dynamic.dylib'), '/Applications/Xcode-beta.app/Contents/Developer/Toolchains<…>'

```

### Picture at Left showing the make and install process for ./example-cryptex + hello + ubsan.dylib with Picture at Right showing the SRD iPhone 12 Console Log
<img src="https://xss.cx/2022/02/15/img/srd0037-cryptex-install-hello-ubsan-ct-rejected-example-001.png" alt="Picture at Left showing the make and install process with Picture at Right showing the SRD iPhone 12 Console Log with UBSAN" style="height: 800px; width:1000px;"/>

## Deeper Dive into Build & Entitlement Issues using macOS Version 12.3 Beta (21E5206e) on M1 T8101 using iPhone 11 when using iOS 15.4_19E5225g

### SRD Build Unit Tests for ./example-cryptex/ and the *SAN Dylibs

#### Case 1: Build ./example/cryptex/ which includes PR48 + PR49 {updated entitlements and debugserver} when using iOS 15.4_19E5225g
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/xsscx/srd/main/srd_tools-24.100.3/example-cryptex/build.sh)"
```
 
#### Case 2: Build ./example/cryptex/ and ASAN Dylib linked to hello sample code when using iOS 15.4_19E5225g
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/xsscx/srd/main/srd_tools-24.100.3/example-cryptex/build-asan.sh)"
```

#### Case 3: Build ./example/cryptex/ and UBSAN Dylib linked to hello sample code when using iOS 15.4_19E5225g
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/xsscx/srd/main/srd_tools-24.100.3/example-cryptex/build-ubsan.sh)"
```

### Manual Reproduction Case 1: Build the example-cryptex with macOS Version 12.3 Beta (21E5206e) on M1 T8101 

```
make clean
make install
```
### Results using iPhone 11 when using iOS 15.4_19E5225g

```
default	13:12:43.390099-0500	kernel	AMFI: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.4rldXe/usr/bin/debugserver' is adhoc signed.
default	13:12:43.390281-0500	kernel	AMFI: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.4rldXe/usr/bin/debugserver': unsuitable CT policy 0 for this platform/device, rejecting signature.
```

<img src="https://xss.cx/2022/02/15/img/srd0037-cryptex-install-debugserver-ct-rejected-example-001.png" alt="Picture at Left showing the make and install process with Picture at Right showing the SRD iPhone 12 Console Log" style="height: 800px; width:1000px;"/>

### Picture at Left showing the make and install process for ./example-cryptex/ with Picture at Right showing the SRD iPhone 12 Console Log when using iOS 15.4_19E5225g

```
default	13:18:36.008584-0500	kernel	AMFI: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.3WMvnj/usr/bin/debugserver' is adhoc signed.
default	13:18:36.008703-0500	kernel	AMFI: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.3WMvnj/usr/bin/debugserver': unsuitable CT policy 0 for this platform/device, rejecting signature.
```

## Reproduction Case  2: Build ./example-cryptex/ and hello sample code with macOS Version 12.3 Beta (21E5206e) on M1 T8101 __and__ ASAN Dylib using iPhone 11 when using iOS 15.4_19E5225g

```
default	13:18:36.008584-0500	kernel	AMFI: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.3WMvnj/usr/bin/debugserver' is adhoc signed.
default	13:18:36.008703-0500	kernel	AMFI: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.3WMvnj/usr/bin/debugserver': unsuitable CT policy 0 for this platform/device, rejecting signature.
default	13:18:45.809112-0500	kernel	AMFI: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.3WMvnj/usr/bin/hello' is adhoc signed.
default	13:18:45.809300-0500	kernel	AMFI: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.3WMvnj/usr/bin/hello': unsuitable CT policy 0 for this platform/device, rejecting signature.
```

<img src="https://xss.cx/2022/02/15/img/srd0009-cryptex-install-hello-asan-ct-rejected-example-001.png" alt="Picture at Left showing the make and install process for ASAN with Picture at Right showing the SRD iPhone 12 Console Log" style="height: 800px; width:1000px;"/>

## Reproduction Case 3: Build ./example/cryptex/ and hello sample code with macOS Version 12.3 Beta (21E5206e) on M1 T8101 __and__ UBSAN Dylib using iPhone 11 when using iOS 15.4_19E5225g

```
default	13:41:29.533740-0500	kernel	/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.SschPE/usr/bin/hello[5267] ==> debugserver
default	13:41:29.548676-0500	ReportCrash	ASI found [dyld] (sensitive) 'Library not loaded: @rpath/libclang_rt.ubsan_ios_dynamic.dylib
  Referenced from: /private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.SschPE/usr/bin/hello
  Reason: tried: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.SschPE/usr/bin/libclang_rt.ubsan_ios_dynamic.dylib' (file system sandbox blocked mmap() of '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.SschPE/usr/bin/libclang_rt.ubsan_ios_dynamic.dylib'), '/Applications/Xcode-beta.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/13.1.6/lib/darwin/libclang_rt.ubsan_ios_dynamic.dylib' (no such file), '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.SschPE/usr/bin/libclang_rt.ubsan_ios_dynamic.dylib' (file system sandbox blocked mmap() of '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.SschPE/usr/bin/libclang_rt.ubsan_ios_dynamic.dylib'), '/Applications/Xcode-beta.app/Contents/Developer/Toolchains<…>'
default	13:41:29.559604-0500	kernel	AMFI: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.SschPE/usr/bin/debugserver' is adhoc signed.
default	13:41:29.559663-0500	kernel	AMFI: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.SschPE/usr/bin/debugserver': unsuitable CT policy 0 for this platform/device, rejecting signature.
default	13:41:39.552968-0500	kernel	/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.SschPE/usr/bin/hello[5270] ==> debugserver
default	13:41:39.568058-0500	ReportCrash	ASI found [dyld] (sensitive) 'Library not loaded: @rpath/libclang_rt.ubsan_ios_dynamic.dylib
  Referenced from: /private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.SschPE/usr/bin/hello
  Reason: tried: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.SschPE/usr/bin/libclang_rt.ubsan_ios_dynamic.dylib' (file system sandbox blocked mmap() of '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.SschPE/usr/bin/libclang_rt.ubsan_ios_dynamic.dylib'), '/Applications/Xcode-beta.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/13.1.6/lib/darwin/libclang_rt.ubsan_ios_dynamic.dylib' (no such file), '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.SschPE/usr/bin/libclang_rt.ubsan_ios_dynamic.dylib' (file system sandbox blocked mmap() of '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.SschPE/usr/bin/libclang_rt.ubsan_ios_dynamic.dylib'), '/Applications/Xcode-beta.app/Contents/Developer/Toolchains<…>'
default	13:41:39.579498-0500	kernel	AMFI: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.SschPE/usr/bin/debugserver' is adhoc signed.
default	13:41:39.579556-0500	kernel	AMFI: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.SschPE/usr/bin/debugserver': unsuitable CT policy 0 for this platform/device, rejecting signature.
```

<img src="https://xss.cx/2022/02/15/img/srd0009-cryptex-install-hello-ubsan-ct-rejected-example-001.png" alt="Picture at Left showing the make and install process for UBSAN with Picture at Right showing the SRD iPhone 12 Console Log" style="height: 800px; width:1000px;"/>

### macOS 12.2.1 (21D62) on X86_64 on WED 11 FEB 2022 at 1100 US EST for iPhone 11 when using iOS 15.3.1_19D52
#### Case 1: Build ./example/cryptex/ which includes PR48 + PR49 {updated entitlements and debugserver}
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/xsscx/srd/main/srd_tools-24.100.3/example-cryptex/build.sh)"
```

##### Result for Build ./example/cryptex/ on the SRD iPhone 11 when using iOS 15.4_19E5225g - Includes PR48 + PR49

```
default	11:18:56.917251-0500	kernel	hfs: mounted com.example.cryptex.dstroot on device disk2s1
default	11:18:56.927124-0500	MobileStorageMounter	cryptex mount point = <private>
default	11:18:56.927226-0500	MobileStorageMounter	Posting notification: com.apple.mobile.cryptex_mounted
default	11:18:56.929575-0500	installd	0x16afa3000 main_block_invoke_2: event: <OS_xpc_dictionary: <dictionary: 0x105604f50> { count = 4, transaction: 0, voucher = 0x105604480, contents =
	"UserInfo" => <dictionary: 0x10530b5a0> { count = 2, transaction: 0, voucher = 0x0, contents =
		"DiskImageType" => <string: 0x10530b8d0> { length = 7, contents = "Cryptex" }
		"DiskImageMountPath" => <string: 0x1053060e0> { length = 75, contents = "/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.mNUrPS" }
	}
	"Name" => <string: 0x105306640> { length = 35, contents = "com.apple.mobile.disk_image_mounted" }
	"Object" => <string: 0x105305f90> { length = 20, contents = "MobileStorageMounter" }
	"XPCEventName" => <string: 0x10530b4c0> { length = 35, contents = "com.apple.mobile.disk_image_mounted" }
}>
default	11:18:56.952966-0500	installd	0x16afa3000 -[MIDeveloperDiskImageTracker imageMounted:]: received notification: file:///private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.mNUrPS/Applications/
default	11:18:56.953097-0500	installd	0x16afa3000 -[MIDeveloperDiskImageTracker checkMountPoint:]_block_invoke: /private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.mNUrPS/Applications is not present now or before
error	11:18:57.031265-0500	kernel	1 duplicate report for Sandbox: MobileStorageMou(519) deny(1) file-read-metadata /private/var/run/com.apple.security.cryptexd/codex.system/live/com.example.cryptex/cpxd
error	11:18:57.031332-0500	kernel	Sandbox: mobile_storage_p(516) deny(1) file-read-metadata /private/var/run/com.apple.security.cryptexd/codex.system/live/com.example.cryptex/cpxd
error	11:18:57.119971-0500	simple-shell	I'm about to listen on fd: 3
default	11:18:57.122471-0500	kernel	AMFI: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.mNUrPS/usr/bin/debugserver' is adhoc signed.
default	11:18:57.122595-0500	kernel	AMFI: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.mNUrPS/usr/bin/debugserver': unsuitable CT policy 0 for this platform/device, rejecting signature.
error	11:18:57.123411-0500	simple-server	Hello! I'm simple-server from the example cryptex!
error	11:18:57.123532-0500	simple-server	I'm about to bind to 0.0.0.0:7777
error	11:18:57.123934-0500	simple-server	I'm about to listen on fd: 3
error	11:18:57.124028-0500	simple-server	Waiting for a client to connect...
error	11:18:57.131742-0500	kernel	1 duplicate report for Sandbox: mobile_storage_p(516) deny(1) file-read-metadata /private/var/run/com.apple.security.cryptexd/codex.system/live/com.example.cryptex/cpxd
error	11:18:57.131860-0500	kernel	Sandbox: hello(682) deny(1) file-map-executable /private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.mNUrPS/usr/bin/libclang_rt.ubsan_ios_dynamic.dylib
error	11:18:57.134337-0500	dropbear	send failed: Invalid argument
error	11:18:57.134426-0500	dropbear	send failed: Invalid argument
error	11:18:57.134463-0500	dropbear	send failed: Invalid argument
default	11:18:57.135406-0500	ReportCrash	ASI found [dyld] (sensitive) 'Library not loaded: @rpath/libclang_rt.ubsan_ios_dynamic.dylib
  Referenced from: /private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.mNUrPS/usr/bin/hello
  Reason: tried: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.mNUrPS/usr/bin/libclang_rt.ubsan_ios_dynamic.dylib' (file system sandbox blocked mmap() of '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.mNUrPS/usr/bin/libclang_rt.ubsan_ios_dynamic.dylib'), '/Applications/Xcode-beta.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/13.1.6/lib/darwin/libclang_rt.ubsan_ios_dynamic.dylib' (no such file), '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.mNUrPS/usr/bin/libclang_rt.ubsan_ios_dynamic.dylib' (file system sandbox blocked mmap() of '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.mNUrPS/usr/bin/libclang_rt.ubsan_ios_dynamic.dylib'), '/Applications/Xcode-beta.app/Contents/Developer/Toolchains<…>'
default	11:19:07.146106-0500	kernel	AMFI: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.mNUrPS/usr/bin/debugserver' is adhoc signed.
default	11:19:07.146220-0500	kernel	AMFI: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.mNUrPS/usr/bin/debugserver': unsuitable CT policy 0 for this platform/device, rejecting signature.
default	11:19:07.156826-0500	ReportCrash	ASI found [dyld] (sensitive) 'Library not loaded: @rpath/libclang_rt.ubsan_ios_dynamic.dylib
  Referenced from: /private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.mNUrPS/usr/bin/hello
  Reason: tried: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.mNUrPS/usr/bin/libclang_rt.ubsan_ios_dynamic.dylib' (file system sandbox blocked mmap() of '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.mNUrPS/usr/bin/libclang_rt.ubsan_ios_dynamic.dylib'), '/Applications/Xcode-beta.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/13.1.6/lib/darwin/libclang_rt.ubsan_ios_dynamic.dylib' (no such file), '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.mNUrPS/usr/bin/libclang_rt.ubsan_ios_dynamic.dylib' (file system sandbox blocked mmap() of '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.mNUrPS/usr/bin/libclang_rt.ubsan_ios_dynamic.dylib'), '/Applications/Xcode-beta.app/Contents/Developer/Toolchains<…>'
```

### macOS 12.2.1 (21D62) on X86_64 on WED 11 FEB 2022 at 1100 US EST for iPhone 11 when using iOS 15.3.1_19D52
#### Case 2: Build ./example/cryptex/ and ASAN Dylib linked to hello sample code

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/xsscx/srd/main/srd_tools-24.100.3/example-cryptex/build-asan.sh)"
```

##### Result for Build ./example/cryptex/ and ASAN Dylib linked to hello sample code on the SRD iPhone 11 when using iOS 15.3.1_19D52

```
default	11:14:55.685646-0500	kernel	AMFI: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.7rGwkO/usr/bin/debugserver' is adhoc signed.
default	11:14:55.685749-0500	kernel	AMFI: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.7rGwkO/usr/bin/debugserver': unsuitable CT policy 0 for this platform/device, rejecting signature.
default	11:15:05.669167-0500	ReportCrash	ASI found [dyld] (sensitive) 'Library not loaded: @rpath/libclang_rt.ubsan_ios_dynamic.dylib
  Referenced from: /private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.7rGwkO/usr/bin/hello
  Reason: tried: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.7rGwkO/usr/bin/libclang_rt.ubsan_ios_dynamic.dylib' (file system sandbox blocked mmap() of '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.7rGwkO/usr/bin/libclang_rt.ubsan_ios_dynamic.dylib'), '/Applications/Xcode-beta.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/13.1.6/lib/darwin/libclang_rt.ubsan_ios_dynamic.dylib' (no such file), '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.7rGwkO/usr/bin/libclang_rt.ubsan_ios_dynamic.dylib' (file system sandbox blocked mmap() of '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.7rGwkO/usr/bin/libclang_rt.ubsan_ios_dynamic.dylib'), '/Applications/Xcode-beta.app/Contents/Developer/Toolchains<…>'
default	11:15:05.705619-0500	kernel	AMFI: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.7rGwkO/usr/bin/debugserver' is adhoc signed.
default	11:15:05.705734-0500	kernel	AMFI: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.7rGwkO/usr/bin/debugserver': unsuitable CT policy 0 for this platform/device, rejecting signature.
default	11:15:15.691719-0500	ReportCrash	ASI found [dyld] (sensitive) 'Library not loaded: @rpath/libclang_rt.ubsan_ios_dynamic.dylib
  Referenced from: /private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.7rGwkO/usr/bin/hello
  Reason: tried: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.7rGwkO/usr/bin/libclang_rt.ubsan_ios_dynamic.dylib' (file system sandbox blocked mmap() of '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.7rGwkO/usr/bin/libclang_rt.ubsan_ios_dynamic.dylib'), '/Applications/Xcode-beta.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/13.1.6/lib/darwin/libclang_rt.ubsan_ios_dynamic.dylib' (no such file), '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.7rGwkO/usr/bin/libclang_rt.ubsan_ios_dynamic.dylib' (file system sandbox blocked mmap() of '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.7rGwkO/usr/bin/libclang_rt.ubsan_ios_dynamic.dylib'), '/Applications/Xcode-beta.app/Contents/Developer/Toolchains<…>'
default	11:15:15.729199-0500	kernel	AMFI: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.7rGwkO/usr/bin/debugserver' is adhoc signed.
default	11:15:15.729290-0500	kernel	AMFI: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.7rGwkO/usr/bin/debugserver': unsuitable CT policy 0 for this platform/device, rejecting signature.

```

### macOS 12.2.1 (21D62) on X86_64 on WED 11 FEB 2022 at 1100 US EST for iPhone 11 when using iOS 15.3.1_19D52
#### Case 3: Build ./example/cryptex/ and UBSAN Dylib linked to hello sample code

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/xsscx/srd/main/srd_tools-24.100.3/example-cryptex/build-ubsan.sh)"
```

##### Result for Build ./example/cryptex/ and UBSAN Dylib linked to hello sample code on the SRD iPhone 11 when using iOS 15.3.1_19D52

```
error	11:09:55.004194-0500	dropbear	send failed: Invalid argument
error	11:09:55.004306-0500	dropbear	send failed: Invalid argument
error	11:09:55.004345-0500	dropbear	send failed: Invalid argument
default	11:09:55.052843-0500	ReportCrash	ASI found [dyld] (sensitive) 'Library not loaded: @rpath/libclang_rt.ubsan_ios_dynamic.dylib
  Referenced from: /private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.7rGwkO/usr/bin/hello
  Reason: tried: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.7rGwkO/usr/bin/libclang_rt.ubsan_ios_dynamic.dylib' (file system sandbox blocked mmap() of '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.7rGwkO/usr/bin/libclang_rt.ubsan_ios_dynamic.dylib'), '/Applications/Xcode-beta.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/13.1.6/lib/darwin/libclang_rt.ubsan_ios_dynamic.dylib' (no such file), '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.7rGwkO/usr/bin/libclang_rt.ubsan_ios_dynamic.dylib' (file system sandbox blocked mmap() of '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.7rGwkO/usr/bin/libclang_rt.ubsan_ios_dynamic.dylib'), '/Applications/Xcode-beta.app/Contents/Developer/Toolchains<…>'
default	11:10:05.000646-0500	kernel	AMFI: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.7rGwkO/usr/bin/debugserver' is adhoc signed.
default	11:10:05.000849-0500	kernel	AMFI: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.7rGwkO/usr/bin/debugserver': unsuitable CT policy 0 for this platform/device, rejecting signature.
default	11:10:05.017462-0500	ReportCrash	ASI found [dyld] (sensitive) 'Library not loaded: @rpath/libclang_rt.ubsan_ios_dynamic.dylib
  Referenced from: /private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.7rGwkO/usr/bin/hello
  Reason: tried: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.7rGwkO/usr/bin/libclang_rt.ubsan_ios_dynamic.dylib' (file system sandbox blocked mmap() of '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.7rGwkO/usr/bin/libclang_rt.ubsan_ios_dynamic.dylib'), '/Applications/Xcode-beta.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/13.1.6/lib/darwin/libclang_rt.ubsan_ios_dynamic.dylib' (no such file), '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.7rGwkO/usr/bin/libclang_rt.ubsan_ios_dynamic.dylib' (file system sandbox blocked mmap() of '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.7rGwkO/usr/bin/libclang_rt.ubsan_ios_dynamic.dylib'), '/Applications/Xcode-beta.app/Contents/Developer/Toolchains<…>'
default	11:10:15.030478-0500	kernel	AMFI: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.7rGwkO/usr/bin/debugserver' is adhoc signed.
default	11:10:15.030608-0500	kernel	AMFI: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.7rGwkO/usr/bin/debugserver': unsuitable CT policy 0 for this platform/device, rejecting signature.
default	11:10:15.034358-0500	ReportCrash	ASI found [dyld] (sensitive) 'Library not loaded: @rpath/libclang_rt.ubsan_ios_dynamic.dylib
  Referenced from: /private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.7rGwkO/usr/bin/hello
  Reason: tried: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.7rGwkO/usr/bin/libclang_rt.ubsan_ios_dynamic.dylib' (file system sandbox blocked mmap() of '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.7rGwkO/usr/bin/libclang_rt.ubsan_ios_dynamic.dylib'), '/Applications/Xcode-beta.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/13.1.6/lib/darwin/libclang_rt.ubsan_ios_dynamic.dylib' (no such file), '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.7rGwkO/usr/bin/libclang_rt.ubsan_ios_dynamic.dylib' (file system sandbox blocked mmap() of '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.7rGwkO/usr/bin/libclang_rt.ubsan_ios_dynamic.dylib'), '/Applications/Xcode-beta.app/Contents/Developer/Toolchains<…>'
default	11:10:25.056121-0500	ReportCrash	ASI found [dyld] (sensitive) 'Library not loaded: @rpath/libclang_rt.ubsan_ios_dynamic.dylib
  Referenced from: /private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.7rGwkO/usr/bin/hello
  Reason: tried: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.7rGwkO/usr/bin/libclang_rt.ubsan_ios_dynamic.dylib' (file system sandbox blocked mmap() of '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.7rGwkO/usr/bin/libclang_rt.ubsan_ios_dynamic.dylib'), '/Applications/Xcode-beta.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/13.1.6/lib/darwin/libclang_rt.ubsan_ios_dynamic.dylib' (no such file), '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.7rGwkO/usr/bin/libclang_rt.ubsan_ios_dynamic.dylib' (file system sandbox blocked mmap() of '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.7rGwkO/usr/bin/libclang_rt.ubsan_ios_dynamic.dylib'), '/Applications/Xcode-beta.app/Contents/Developer/Toolchains<…>'
default	11:10:25.056224-0500	kernel	AMFI: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.7rGwkO/usr/bin/debugserver' is adhoc signed.
default	11:10:25.056391-0500	kernel	AMFI: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.7rGwkO/usr/bin/debugserver': unsuitable CT policy 0 for this platform/device, rejecting signature.
default	11:10:35.078013-0500	ReportCrash	ASI found [dyld] (sensitive) 'Library not loaded: @rpath/libclang_rt.ubsan_ios_dynamic.dylib
  Referenced from: /private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.7rGwkO/usr/bin/hello
  Reason: tried: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.7rGwkO/usr/bin/libclang_rt.ubsan_ios_dynamic.dylib' (file system sandbox blocked mmap() of '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.7rGwkO/usr/bin/libclang_rt.ubsan_ios_dynamic.dylib'), '/Applications/Xcode-beta.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/13.1.6/lib/darwin/libclang_rt.ubsan_ios_dynamic.dylib' (no such file), '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.7rGwkO/usr/bin/libclang_rt.ubsan_ios_dynamic.dylib' (file system sandbox blocked mmap() of '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.7rGwkO/usr/bin/libclang_rt.ubsan_ios_dynamic.dylib'), '/Applications/Xcode-beta.app/Contents/Developer/Toolchains<…>'
default	11:10:35.079694-0500	kernel	AMFI: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.7rGwkO/usr/bin/debugserver' is adhoc signed.
default	11:10:35.079823-0500	kernel	AMFI: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.7rGwkO/usr/bin/debugserver': unsuitable CT policy 0 for this platform/device, rejecting signature.
```

### macOS 12.2.1 (21D62) on X86_64 on THU 24 FEB 2022 at 0500 US EST for iPhone 11 when using iOS_15.4_19E5235a
#### Case 2: Build ./example/cryptex/ which includes PR48 + PR49 {updated entitlements and debugserver}
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/xsscx/srd/main/srd_tools-24.100.3/example-cryptex/build-asan.sh)"
```

### Result == Works
```
(lldb) image dump sections
Dumping sections for 2 modules.
Sections for '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.pU5TsF/usr/bin/hello(0x00000001029c8000)' (arm64e):
  SectID     Type             Load Address                             Perm File Off.  File Size  Flags      Section Name
  ---------- ---------------- ---------------------------------------  ---- ---------- ---------- ---------- ----------------------------
  0x00000100 container        [0x0000000000000000-0x0000000100000000)* ---  0x00000000 0x00000000 0x00000000 hello.__PAGEZERO
  0x00000200 container        [0x00000001029c8000-0x00000001029d4000)  r-x  0x00000000 0x0000c000 0x00000000 hello.__TEXT
  0x00000001 code             [0x00000001029cf96c-0x00000001029cfdec)  r-x  0x0000796c 0x00000480 0x80000400 hello.__TEXT.__text
  0x00000002 code             [0x00000001029cfdec-0x00000001029cfebc)  r-x  0x00007dec 0x000000d0 0x80000408 hello.__TEXT.__auth_stubs
  0x00000003 regular          [0x00000001029cfebc-0x00000001029cfec0)  r-x  0x00007ebc 0x00000004 0x00000016 hello.__TEXT.__init_offsets
  0x00000004 regular          [0x00000001029cfec0-0x00000001029cff60)  r-x  0x00007ec0 0x000000a0 0x00000000 hello.__TEXT.__asan_cstring
  0x00000005 data-cstr        [0x00000001029cff60-0x00000001029cff8f)  r-x  0x00007f60 0x0000002f 0x00000002 hello.__TEXT.__cstring
  0x00000006 regular          [0x00000001029cff8f-0x00000001029cff97)  r-x  0x00007f8f 0x00000008 0x00000000 hello.__TEXT.__const
  0x00000007 compact-unwind   [0x00000001029cff98-0x00000001029cffe8)  r-x  0x00007f98 0x00000050 0x00000000 hello.__TEXT.__unwind_info
  0x00000008 data-cstr        [0x00000001029d0000-0x00000001029d001e)  r-x  0x00008000 0x0000001e 0x00000002 hello.__TEXT.__oslogstring
  0x00000300 container        [0x00000001029d4000-0x00000001029d8000)  rw-  0x0000c000 0x00004000 0x00000010 hello.__DATA_CONST
  0x00000009 data-ptrs        [0x00000001029d4000-0x00000001029d4068)  rw-  0x0000c000 0x00000068 0x00000006 hello.__DATA_CONST.__auth_got
  0x0000000a data-ptrs        [0x00000001029d4068-0x00000001029d4080)  rw-  0x0000c068 0x00000018 0x00000006 hello.__DATA_CONST.__got
  0x0000000b data-ptrs        [0x00000001029d4080-0x00000001029d4088)  rw-  0x0000c080 0x00000008 0x0000000a hello.__DATA_CONST.__mod_term_func
  0x0000000c regular          [0x00000001029d4088-0x00000001029d40b8)  rw-  0x0000c088 0x00000030 0x00000000 hello.__DATA_CONST.__const
  0x00000400 container        [0x00000001029d8000-0x00000001029dc000)  rw-  0x00010000 0x00004000 0x00000000 hello.__DATA
  0x0000000d regular          [0x00000001029d8000-0x00000001029d80c0)  rw-  0x00010000 0x000000c0 0x00000000 hello.__DATA.__asan_globals
  0x0000000e regular          [0x00000001029d80c0-0x00000001029d80f0)  rw-  0x000100c0 0x00000030 0x00000000 hello.__DATA.__asan_liveness
  0x0000000f zero-fill        [0x00000001029d80f0-0x00000001029d80f8)  rw-  0x00000000 0x00000000 0x00000001 hello.__DATA.__common
  0x00000500 container        [0x00000001029dc000-0x00000001029e4000)  r--  0x00014000 0x00005150 0x00000000 hello.__LINKEDIT
Sections for '/Users/xss/Library/Developer/Xcode/iOS DeviceSupport/15.4 (19E5225g) arm64e/Symbols/usr/lib/dyld' (arm64e):
  SectID     Type             Load Address                             Perm File Off.  File Size  Flags      Section Name
  ---------- ---------------- ---------------------------------------  ---- ---------- ---------- ---------- ----------------------------
  0x00000100 container        [0x0000000102b7c000-0x0000000102bd4000)  r-x  0x00000000 0x00058000 0x00000000 dyld.__TEXT
  0x00000001 code             [0x0000000102b7d000-0x0000000102bca3bc)  r-x  0x00001000 0x0004d3bc 0x80000400 dyld.__TEXT.__text
  0x00000002 regular          [0x0000000102bca3c0-0x0000000102bcb2f0)  r-x  0x0004e3c0 0x00000f30 0x00000000 dyld.__TEXT.__const
  0x00000003 data-cstr        [0x0000000102bcb2f0-0x0000000102bd385a)  r-x  0x0004f2f0 0x0000856a 0x00000002 dyld.__TEXT.__cstring
  0x00000004 compact-unwind   [0x0000000102bd385c-0x0000000102bd3b70)  r-x  0x0005785c 0x00000314 0x00000000 dyld.__TEXT.__unwind_info
  0x00000200 container        [0x0000000102bd4000-0x0000000102be8000)  rw-  0x00058000 0x00014000 0x00000010 dyld.__DATA_CONST
  0x00000005 regular          [0x0000000102bd4000-0x0000000102bd4070)  rw-  0x00058000 0x00000070 0x00000000 dyld.__DATA_CONST.__auth_ptr
  0x00000006 regular          [0x0000000102bd4070-0x0000000102bd7c98)  rw-  0x00058070 0x00003c28 0x00000000 dyld.__DATA_CONST.__const
  0x00000007 regular          [0x0000000102bd7c98-0x0000000102be7c98)  rw-  0x0005bc98 0x00010000 0x00000000 dyld.__DATA_CONST.__bss
  0x00000300 container        [0x0000000102be8000-0x0000000102bec000)  rw-  0x0006c000 0x00004000 0x00000000 dyld.__DATA
  0x00000008 data             [0x0000000102be8000-0x0000000102be813c)  rw-  0x0006c000 0x0000013c 0x00000000 dyld.__DATA.__data
  0x00000009 regular          [0x0000000102be8140-0x0000000102be82b0)  rw-  0x0006c140 0x00000170 0x00000000 dyld.__DATA.__all_image_info
  0x0000000a regular          [0x0000000102be82b0-0x0000000102be82f0)  rw-  0x0006c2b0 0x00000040 0x00000000 dyld.__DATA.__crash_info
  0x0000000b zero-fill        [0x0000000102be8300-0x0000000102be9cf8)  rw-  0x00000000 0x00000000 0x00000001 dyld.__DATA.__common
  0x0000000c zero-fill        [0x0000000102be9cf8-0x0000000102bea1dc)  rw-  0x00000000 0x00000000 0x00000001 dyld.__DATA.__bss
  0x00000400 container        [0x0000000102bec000-0x0000000102c24000)  r--  0x00070000 0x000356f0 0x00000000 dyld.__LINKEDIT
```

#### Results for UBSAN dylib and hello.c example
```
default	10:07:52.191668-0500	debugserver	debugserver will use ASL for internal logging.
default	10:07:52.191746-0500	debugserver	debugserver-@(#)PROGRAM:LLDB  PROJECT:lldb-1316.2.4.16
 for arm64.
default	10:07:52.191785-0500	debugserver	Listening to port 2345 for a connection from 0.0.0.0...
default	10:08:02.176695-0500	kernel	AMFI: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.LCIv75/usr/bin/hello' is adhoc signed.
default	10:08:02.176819-0500	kernel	AMFI: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.LCIv75/usr/bin/hello': unsuitable CT policy 0 for this platform/device, rejecting signature.
default	10:08:12.190854-0500	kernel	AMFI: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.LCIv75/usr/bin/hello' is adhoc signed.
default	10:08:12.190975-0500	kernel	AMFI: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.LCIv75/usr/bin/hello': unsuitable CT policy 0 for this platform/device, rejecting signature.
```

## Observation

AMFI Research complains about __debugserver__:
```
default	11:10:35.079694-0500	kernel	AMFI: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.7rGwkO/usr/bin/debugserver' is adhoc signed.
default	11:10:35.079823-0500	kernel	AMFI: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.7rGwkO/usr/bin/debugserver': unsuitable CT policy 0 for this platform/device, rejecting signature.
```

## SAT 26 FEB 2022 Spot Check - debugserver not working - iPhone 12

```
default	10:10:51.684679-0500	kernel	AMFI: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.y2awNR/usr/bin/debugserver' is adhoc signed.
default	10:10:51.684818-0500	kernel	AMFI: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.y2awNR/usr/bin/debugserver': unsuitable CT policy 0 for this platform/device, rejecting signature.
```

### Visual Representation of the Issue(s) - below, debugserver causing AMFI to throw() on iPhone 11

<img src="https://xss.cx/2022/02/25/img/srd0009-iphone11-debugserver-adhoc_signed-ct-coretrust-rejected-amfi_research-example-001.png" alt="Picture at Left showing the make and install process for debugserver with Picture at Right showing the SRD iPhone 11 Console Log" style="height: 800px; width:1000px;"/>

### Visual Representation of the Issue(s) - below, debugserver causing AMFI to throw() on iPhone 12

<img src="https://xss.cx/2022/02/25/img/srd0037-iphone12-debugserver-adhoc_signed-ct-coretrust-rejected-amfi_research-example-001.png" alt="Picture at Left showing the make and install process for debugserver with Picture at Right showing the SRD iPhone 12 Console Log" style="height: 800px; width:1000px;"/>

## SAT 26 FEB 2022 Spot Check - ubsan working iPhone 12

<img src="https://xss.cx/2022/02/25/img/srd0037-ubsan-working-macos_1221_example-no-entitlements-sample-001.png" alt="Picture at Left showing the make and install process for debugserver with Picture at Right showing the SRD iPhone 12 Console Log" style="height: 800px; width:1000px;"/>


## SAT 26 FEB 2022 Spot Check - asan working iPhone 12

<img src="https://xss.cx/2022/02/25/img/srd0037-asan-working-macos_1221_example-no-entitlements-sample-001.png" alt="Picture at Left showing the make and install process for debugserver with Picture at Right showing the SRD iPhone 12 Console Log" style="height: 800px; width:1000px;"/>


## SAT 26 FEB 2022 Spot Check - ubsan _not_ working iPhone 12

<img src="https://xss.cx/2022/02/25/img/srd0037-ubsan-not_working-macos_1221_example-no-entitlements-sample-001.png" alt="Picture at Left showing the make and install process for debugserver with Picture at Right showing the SRD iPhone 12 Console Log" style="height: 800px; width:1000px;"/>

## MON 28 FEB 2022 Spot Check - asan working iPhone 11

<img src="https://xss.cx/2022/02/28/img/srd0009-applesecurityresearchdevice-debugserver-amfi-research-working-entitlement-example-001.png" alt="Picture at Left showing the make and install process for debugserver with Picture at Right showing the SRD iPhone 12 Console Log" style="height: 800px; width:1000px;"/>

## Testing iOS 15.4_19E5241a
```
15.4_19E5241a looks fine from macOS 12.2.1 (21D62) for iPhone 11 & iPhone 12
```

## SUMMARY
```
PR42 should be Merged because is suffers from the same CT | AMFI Research Issues in PR48 & PR49 which is that a binary in the SRD Trust Cache is adhoc signed, unsuitable CT policy 0 for this platform/device, rejecting signature.
```

### DATAPOINT WED 2 MAR 2022
UBSAN working on iPhone 11 iOS 15.4_19E5241a with personalization from macOS 12.2.1 (21D62) X86_64
```
./debugserver 192.168.3.83:1921 ./hello
debugserver-@(#)PROGRAM:LLDB  PROJECT:lldb-1316.2.4.16
 for arm64.
Listening to port 1921 for a connection from 192.168.3.83...
Got a connection, launched process ./hello (pid = 821).
Exiting.
date
Wed Mar  2 10:10:49 EST 2022
uname -a
Darwin SRD0009 21.4.0 Darwin Kernel Version 21.4.0: Mon Feb 21 22:46:43 PST 2022; root:xnu-8020.102.3~2/RELEASE_ARM64_T8030 iPhone12,1 Toybox
```
### SRD Console Log iPhone 11
```
default	10:01:26.111783-0500	debugserver	debugserver will use ASL for internal logging.
default	10:01:26.111870-0500	debugserver	debugserver-@(#)PROGRAM:LLDB  PROJECT:lldb-1316.2.4.16
 for arm64.
default	10:01:26.111913-0500	debugserver	Listening to port 2345 for a connection from 0.0.0.0...
default	10:04:54.313806-0500	dropbear	Password auth succeeded for 'root' from 192.168.3.83:59300
default	10:04:54.342422-0500	dropbear	CRYPTEX_SHELL specified. User shell is now '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.xEXHz4/usr/bin/sh'
default	10:04:54.346293-0500	dropbear	Setting PATH to '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.xEXHz4/sbin:/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.xEXHz4/bin:/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.xEXHz4/usr/bin:/sbin:/bin:/usr/bin'
default	10:04:54.349047-0500	dropbear	Starting shell: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.xEXHz4/usr/bin/sh'
error	10:04:59.318826-0500	kernel	1 duplicate report for Sandbox: mobile_storage_p(281) deny(1) file-read-metadata /private/var/run/com.apple.security.cryptexd/codex.system/live/com.example.cryptex/cpxd
default	10:05:17.714731-0500	debugserver	debugserver will use ASL for internal logging.
default	10:05:17.720081-0500	debugserver	[LaunchAttach] (820) about to task_for_pid(821)
default	10:05:17.720256-0500	debugserver	[LaunchAttach] (820) successfully task_for_pid(821)'ed
default	10:05:17.722193-0500	debugserver	[LaunchAttach] (820) About to ptrace(PT_ATTACHEXC, 821)...
default	10:05:17.722981-0500	debugserver	Initializing connection
default	10:05:17.724328-0500	debugserver	Removing all cached process handles
default	10:05:17.725372-0500	debugserver	Sending handshake request attempt #1 to server
default	10:05:17.725578-0500	debugserver	Creating connection to com.apple.runningboard
default	10:05:17.739305-0500	debugserver	Handshake succeeded
default	10:05:17.739913-0500	debugserver	Identity resolved as anon<debugserver>
default	10:05:17.743817-0500	debugserver	BKSApplicationStateMonitor updated with invalid process
default	10:05:17.747795-0500	debugserver	BKSApplicationStateMonitor updated with invalid process
default	10:05:17.844341-0500	debugserver	[LaunchAttach] (820) Completed ptrace(PT_ATTACHEXC, 821) == 0
default	10:05:17.871484-0500	debugserver	networkd_settings_read_from_file initialized networkd settings by reading plist directly
default	10:05:17.871836-0500	debugserver	networkd_settings_read_from_file initialized networkd settings by reading plist directly
default	10:05:50.634277-0500	debugserver	[LaunchAttach] Successfully launched ./hello (pid = 821).
```

### DATAPOINT WED 2 MAR 2022
UBSAN working on iPhone 12 iOS 15.4_19E5241a with personalization from macOS 12.2.1 (21D62) X86_64
```
./debugserver 192.168.3.83:1921 ./hello
debugserver-@(#)PROGRAM:LLDB  PROJECT:lldb-1316.2.4.16
 for arm64.
Listening to port 1921 for a connection from 192.168.3.83...
Got a connection, launched process ./hello (pid = 567).
Exiting.
date
Wed Mar  2 10:13:34 EST 2022
uname -a
Darwin SRD0037 21.4.0 Darwin Kernel Version 21.4.0: Mon Feb 21 22:46:42 PST 2022; root:xnu-8020.102.3~2/RELEASE_ARM64_T8101 iPhone13,2 Toybox
```

### SRD Console Log
```
default	10:05:17.844341-0500	debugserver	[LaunchAttach] (820) Completed ptrace(PT_ATTACHEXC, 821) == 0
default	10:05:17.871484-0500	debugserver	networkd_settings_read_from_file initialized networkd settings by reading plist directly
default	10:05:17.871836-0500	debugserver	networkd_settings_read_from_file initialized networkd settings by reading plist directly
default	10:05:50.634277-0500	debugserver	[LaunchAttach] Successfully launched ./hello (pid = 821).
default	10:10:45.753757-0500	debugserver	Got a 'k' packet, killing the inferior process.
default	10:10:45.753904-0500	debugserver	Sending ptrace PT_KILL to terminate inferior process pid 821.
default	10:10:45.754116-0500	debugserver	1 +0.000000 sec [0334/0103]: error: ::ptrace (request = PT_THUPDATE, pid = 0x0335, tid = 0x2103, signal = 0) err = Resource busy (0x00000010)
default	10:10:45.754523-0500	debugserver	2 +0.000474 sec [0334/0103]: error: ::task_resume ( target_task = 0x1603 ) err = (os/kern) failure (0x00000005)
default	10:10:45.754950-0500	debugserver	Waited 0 ms for process to be reaped (state = Exited)
default	10:10:45.755254-0500	debugserver	debugserver's process monitoring thread has exited.
default	10:10:45.755379-0500	debugserver	debugserver about to shut down packet communications to lldb.
default	10:10:45.755552-0500	debugserver	3 +0.001083 sec [0334/1807]: error: ::read ( 8, 0x16b386b18, 1024 ) => -1 err = Bad file descriptor (0x00000009)
```

### DATAPOINT SAT 12 MAR 2022
```
default	07:55:19.820102-0500	dropbear	Password auth succeeded for 'root' from 192.168.3.47:49380
default	07:55:22.262186-0500	dropbear	CRYPTEX_SHELL specified. User shell is now '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.ngoqXx/usr/bin/sh'
default	07:55:22.264880-0500	dropbear	Setting PATH to '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.ngoqXx/sbin:/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.ngoqXx/bin:/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.ngoqXx/usr/bin:/sbin:/bin:/usr/bin'
default	07:55:22.266797-0500	dropbear	Starting shell: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.ngoqXx/usr/bin/sh'
default	07:55:22.268325-0500	kernel	AMFI: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.ngoqXx/usr/bin/toybox' is adhoc signed.
default	07:55:22.268399-0500	kernel	AMFI: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.ngoqXx/usr/bin/toybox': unsuitable CT policy 0 for this platform/device, rejecting signature.
error	07:55:37.586630-0500	simple-server	A client has connected!
error	07:55:37.587091-0500	simple-server	Waiting for a client to connect...
```
### iPhone 12 Console Log | toybox: unsuitable CT policy
<img src="https://xss.cx/2022/03/12/img/srd0037-coretrust-amfi-research-unsuitable-ct-policy-signature-rejected-sample-001.png" alt="CoreTrust, AMFI research, Signature Rejection, Apple Security Research Device, iPhone 12" style="height: 800px; width:1000px;"/>

## SRD PR42

Note: macOS 12.3 (21E230) X86_64 Note: cryptexctl == EXC_BAD_ACCESS (SIGSEGV)
- X86_64 Workaround: [CryptexManager](https://github.com/pinauten/CryptexManager)

### SRD Example DMG, Build & Installation Status w/ XNU-8019.41.5 
| Build OS & Device Info           | Example DMG   |  debugserver DMG  |  ASAN DMG     | UBSAN DMG 
| -------------------------------- | ------------- | ------------- | ------------- | -------------
| macOS 12.3 (21E230) X86_64       | PASS          | PASS          | PASS          | PASS          
| macOS 12.3 (21E230) T8101  | PASS          | PASS          | PASS          | PASS 
| X86_64 Install to iPhone 11 19E241    | SIGSEGV         | SIGSEGV         | SIGSEGV          | SIGSEGV
| T8101 Install to iPhone 12 19E241    | PASS          | PASS          | PASS          | PASS 


#### Comment
```
macOS 12.2.1 (21D62) X86_64 or M1 T8101 macOS 12.3 (21E230)
Xcode Version 13.3 (13E113)
```
If you experience unsuitable CT policy 0x8 for this platform/device, rejecting signature, just do make clean; make install

### SRD Build Unit Tests for ./example-cryptex/ and the *SAN Dylibs

#### Case 1: Build ./example/cryptex/ which includes PR48 + PR49 {updated entitlements and debugserver}
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/xsscx/srd/main/srd_tools-24.100.3/example-cryptex/build.sh)"
```

#### Case 2: Build ./example/cryptex/ and ASAN Dylib linked to hello sample code
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/xsscx/srd/main/srd_tools-24.100.3/example-cryptex/build-asan.sh)"
```

#### Case 3: Build ./example/cryptex/ and UBSAN Dylib linked to hello sample code
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/xsscx/srd/main/srd_tools-24.100.3/example-cryptex/build-ubsan.sh)"
```
### Reproduction Case  1: Build the example-cryptex with macOS 12.2.1 (21D62) on X86_64 when using iOS 15.4_19E5225g

```
make clean
make install
```
### Results using iPhone 12

```
default	10:22:00.585464-0500	kernel	AMFI: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.USWFhH/usr/bin/debugserver' is adhoc signed.
default	10:22:00.585630-0500	kernel	AMFI: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.USWFhH/usr/bin/debugserver': unsuitable CT policy 0 for this platform/device, rejecting signature.
```
### Picture at Left showing the make and install process for ./example-cryptex/ with Picture at Right showing the SRD iPhone 12 Console Log
<img src="https://xss.cx/2022/02/15/img/srd0037-cryptex-install-debugserver-ct-rejected-example-001.png" alt="Picture at Left showing the make and install process with Picture at Right showing the SRD iPhone 12 Console Log" style="height: 800px; width:1000px;"/>

## Reproduction Case  2: Build the example-cryptex with macOS 12.2.1 (21D62) on X86_64 __and__ ASAN Dylib using iPhone 12 when using iOS 15.4_19E5225g

```
default	10:33:07.038976-0500	kernel	/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.ZKfbpw/usr/bin/hello[2467] ==> debugserver
default	10:33:07.049099-0500	kernel	AMFI: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.ZKfbpw/usr/bin/debugserver' is adhoc signed.
default	10:33:07.049264-0500	kernel	AMFI: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.ZKfbpw/usr/bin/debugserver': unsuitable CT policy 0 for this platform/device, rejecting signature.
default	10:33:17.064152-0500	kernel	/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.ZKfbpw/usr/bin/hello[2470] ==> debugserver
default	10:33:17.074069-0500	kernel	AMFI: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.ZKfbpw/usr/bin/debugserver' is adhoc signed.
default	10:33:17.074337-0500	kernel	AMFI: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.ZKfbpw/usr/bin/debugserver': unsuitable CT policy 0 for this platform/device, rejecting signature.
```

### Picture at Left showing the make and install process for ./example-cryptex + hello + asan.dylib with Picture at Right showing the SRD iPhone 12 Console Log
<img src="https://xss.cx/2022/02/15/img/srd0037-cryptex-install-hello-ubsan-ct-rejected-example-001.png" alt="Picture at Left showing the make and install process with Picture at Right showing the SRD iPhone 12 Console Log with ASAN" style="height: 800px; width:1000px;"/>

## Reproduction Case 3: Build the example-cryptex with macOS 12.2.1 (21D62) on X86_64 __and__ UBSAN Dylib using iPhone 12 when using iOS 15.4_19E5225g

```
error	10:37:14.650327-0500	kernel	Sandbox: hello(2520) deny(1) file-map-executable /private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.sYr3Iw/usr/bin/libclang_rt.ubsan_ios_dynamic.dylib
default	10:37:14.653177-0500	ReportCrash	ASI found [dyld] (sensitive) 'Library not loaded: @rpath/libclang_rt.ubsan_ios_dynamic.dylib
  Referenced from: /private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.sYr3Iw/usr/bin/hello
  Reason: tried: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.sYr3Iw/usr/bin/libclang_rt.ubsan_ios_dynamic.dylib' (file system sandbox blocked mmap() of '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.sYr3Iw/usr/bin/libclang_rt.ubsan_ios_dynamic.dylib'), '/Applications/Xcode-beta.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/13.1.6/lib/darwin/libclang_rt.ubsan_ios_dynamic.dylib' (no such file), '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.sYr3Iw/usr/bin/libclang_rt.ubsan_ios_dynamic.dylib' (file system sandbox blocked mmap() of '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.sYr3Iw/usr/bin/libclang_rt.ubsan_ios_dynamic.dylib'), '/Applications/Xcode-beta.app/Contents/Developer/Toolchains<…>'
default	10:37:24.659471-0500	kernel	AMFI: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.sYr3Iw/usr/bin/debugserver' is adhoc signed.
default	10:37:24.659594-0500	kernel	AMFI: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.sYr3Iw/usr/bin/debugserver': unsuitable CT policy 0 for this platform/device, rejecting signature.
default	10:37:24.660537-0500	kernel	/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.sYr3Iw/usr/bin/hello[2529] ==> debugserver
default	10:37:24.672394-0500	ReportCrash	ASI found [dyld] (sensitive) 'Library not loaded: @rpath/libclang_rt.ubsan_ios_dynamic.dylib
  Referenced from: /private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.sYr3Iw/usr/bin/hello
  Reason: tried: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.sYr3Iw/usr/bin/libclang_rt.ubsan_ios_dynamic.dylib' (file system sandbox blocked mmap() of '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.sYr3Iw/usr/bin/libclang_rt.ubsan_ios_dynamic.dylib'), '/Applications/Xcode-beta.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/13.1.6/lib/darwin/libclang_rt.ubsan_ios_dynamic.dylib' (no such file), '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.sYr3Iw/usr/bin/libclang_rt.ubsan_ios_dynamic.dylib' (file system sandbox blocked mmap() of '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.sYr3Iw/usr/bin/libclang_rt.ubsan_ios_dynamic.dylib'), '/Applications/Xcode-beta.app/Contents/Developer/Toolchains<…>'

```

### Picture at Left showing the make and install process for ./example-cryptex + hello + ubsan.dylib with Picture at Right showing the SRD iPhone 12 Console Log
<img src="https://xss.cx/2022/02/15/img/srd0037-cryptex-install-hello-ubsan-ct-rejected-example-001.png" alt="Picture at Left showing the make and install process with Picture at Right showing the SRD iPhone 12 Console Log with UBSAN" style="height: 800px; width:1000px;"/>

## Deeper Dive into Build & Entitlement Issues using macOS Version 12.3 Beta (21E5206e) on M1 T8101 using iPhone 11 when using iOS 15.4_19E5225g

### SRD Build Unit Tests for ./example-cryptex/ and the *SAN Dylibs

#### Case 1: Build ./example/cryptex/ which includes PR48 + PR49 {updated entitlements and debugserver} when using iOS 15.4_19E5225g
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/xsscx/srd/main/srd_tools-24.100.3/example-cryptex/build.sh)"
```
 
#### Case 2: Build ./example/cryptex/ and ASAN Dylib linked to hello sample code when using iOS 15.4_19E5225g
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/xsscx/srd/main/srd_tools-24.100.3/example-cryptex/build-asan.sh)"
```

#### Case 3: Build ./example/cryptex/ and UBSAN Dylib linked to hello sample code when using iOS 15.4_19E5225g
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/xsscx/srd/main/srd_tools-24.100.3/example-cryptex/build-ubsan.sh)"
```

### Manual Reproduction Case 1: Build the example-cryptex with macOS Version 12.3 Beta (21E5206e) on M1 T8101 

```
make clean
make install
```
### Results using iPhone 11 when using iOS 15.4_19E5225g

```
default	13:12:43.390099-0500	kernel	AMFI: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.4rldXe/usr/bin/debugserver' is adhoc signed.
default	13:12:43.390281-0500	kernel	AMFI: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.4rldXe/usr/bin/debugserver': unsuitable CT policy 0 for this platform/device, rejecting signature.
```

<img src="https://xss.cx/2022/02/15/img/srd0037-cryptex-install-debugserver-ct-rejected-example-001.png" alt="Picture at Left showing the make and install process with Picture at Right showing the SRD iPhone 12 Console Log" style="height: 800px; width:1000px;"/>

### Picture at Left showing the make and install process for ./example-cryptex/ with Picture at Right showing the SRD iPhone 12 Console Log when using iOS 15.4_19E5225g

```
default	13:18:36.008584-0500	kernel	AMFI: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.3WMvnj/usr/bin/debugserver' is adhoc signed.
default	13:18:36.008703-0500	kernel	AMFI: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.3WMvnj/usr/bin/debugserver': unsuitable CT policy 0 for this platform/device, rejecting signature.
```

## Reproduction Case  2: Build ./example-cryptex/ and hello sample code with macOS Version 12.3 Beta (21E5206e) on M1 T8101 __and__ ASAN Dylib using iPhone 11 when using iOS 15.4_19E5225g

```
default	13:18:36.008584-0500	kernel	AMFI: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.3WMvnj/usr/bin/debugserver' is adhoc signed.
default	13:18:36.008703-0500	kernel	AMFI: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.3WMvnj/usr/bin/debugserver': unsuitable CT policy 0 for this platform/device, rejecting signature.
default	13:18:45.809112-0500	kernel	AMFI: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.3WMvnj/usr/bin/hello' is adhoc signed.
default	13:18:45.809300-0500	kernel	AMFI: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.3WMvnj/usr/bin/hello': unsuitable CT policy 0 for this platform/device, rejecting signature.
```

<img src="https://xss.cx/2022/02/15/img/srd0009-cryptex-install-hello-asan-ct-rejected-example-001.png" alt="Picture at Left showing the make and install process for ASAN with Picture at Right showing the SRD iPhone 12 Console Log" style="height: 800px; width:1000px;"/>

## Reproduction Case 3: Build ./example/cryptex/ and hello sample code with macOS Version 12.3 Beta (21E5206e) on M1 T8101 __and__ UBSAN Dylib using iPhone 11 when using iOS 15.4_19E5225g

```
default	13:41:29.533740-0500	kernel	/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.SschPE/usr/bin/hello[5267] ==> debugserver
default	13:41:29.548676-0500	ReportCrash	ASI found [dyld] (sensitive) 'Library not loaded: @rpath/libclang_rt.ubsan_ios_dynamic.dylib
  Referenced from: /private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.SschPE/usr/bin/hello
  Reason: tried: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.SschPE/usr/bin/libclang_rt.ubsan_ios_dynamic.dylib' (file system sandbox blocked mmap() of '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.SschPE/usr/bin/libclang_rt.ubsan_ios_dynamic.dylib'), '/Applications/Xcode-beta.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/13.1.6/lib/darwin/libclang_rt.ubsan_ios_dynamic.dylib' (no such file), '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.SschPE/usr/bin/libclang_rt.ubsan_ios_dynamic.dylib' (file system sandbox blocked mmap() of '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.SschPE/usr/bin/libclang_rt.ubsan_ios_dynamic.dylib'), '/Applications/Xcode-beta.app/Contents/Developer/Toolchains<…>'
default	13:41:29.559604-0500	kernel	AMFI: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.SschPE/usr/bin/debugserver' is adhoc signed.
default	13:41:29.559663-0500	kernel	AMFI: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.SschPE/usr/bin/debugserver': unsuitable CT policy 0 for this platform/device, rejecting signature.
default	13:41:39.552968-0500	kernel	/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.SschPE/usr/bin/hello[5270] ==> debugserver
default	13:41:39.568058-0500	ReportCrash	ASI found [dyld] (sensitive) 'Library not loaded: @rpath/libclang_rt.ubsan_ios_dynamic.dylib
  Referenced from: /private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.SschPE/usr/bin/hello
  Reason: tried: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.SschPE/usr/bin/libclang_rt.ubsan_ios_dynamic.dylib' (file system sandbox blocked mmap() of '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.SschPE/usr/bin/libclang_rt.ubsan_ios_dynamic.dylib'), '/Applications/Xcode-beta.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/13.1.6/lib/darwin/libclang_rt.ubsan_ios_dynamic.dylib' (no such file), '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.SschPE/usr/bin/libclang_rt.ubsan_ios_dynamic.dylib' (file system sandbox blocked mmap() of '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.SschPE/usr/bin/libclang_rt.ubsan_ios_dynamic.dylib'), '/Applications/Xcode-beta.app/Contents/Developer/Toolchains<…>'
default	13:41:39.579498-0500	kernel	AMFI: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.SschPE/usr/bin/debugserver' is adhoc signed.
default	13:41:39.579556-0500	kernel	AMFI: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.SschPE/usr/bin/debugserver': unsuitable CT policy 0 for this platform/device, rejecting signature.
```

<img src="https://xss.cx/2022/02/15/img/srd0009-cryptex-install-hello-ubsan-ct-rejected-example-001.png" alt="Picture at Left showing the make and install process for UBSAN with Picture at Right showing the SRD iPhone 12 Console Log" style="height: 800px; width:1000px;"/>

### macOS 12.2.1 (21D62) on X86_64 on WED 11 FEB 2022 at 1100 US EST for iPhone 11 when using iOS 15.3.1_19D52
#### Case 1: Build ./example/cryptex/ which includes PR48 + PR49 {updated entitlements and debugserver}
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/xsscx/srd/main/srd_tools-24.100.3/example-cryptex/build.sh)"
```

##### Result for Build ./example/cryptex/ on the SRD iPhone 11 when using iOS 15.4_19E5225g - Includes PR48 + PR49

```
default	11:18:56.917251-0500	kernel	hfs: mounted com.example.cryptex.dstroot on device disk2s1
default	11:18:56.927124-0500	MobileStorageMounter	cryptex mount point = <private>
default	11:18:56.927226-0500	MobileStorageMounter	Posting notification: com.apple.mobile.cryptex_mounted
default	11:18:56.929575-0500	installd	0x16afa3000 main_block_invoke_2: event: <OS_xpc_dictionary: <dictionary: 0x105604f50> { count = 4, transaction: 0, voucher = 0x105604480, contents =
	"UserInfo" => <dictionary: 0x10530b5a0> { count = 2, transaction: 0, voucher = 0x0, contents =
		"DiskImageType" => <string: 0x10530b8d0> { length = 7, contents = "Cryptex" }
		"DiskImageMountPath" => <string: 0x1053060e0> { length = 75, contents = "/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.mNUrPS" }
	}
	"Name" => <string: 0x105306640> { length = 35, contents = "com.apple.mobile.disk_image_mounted" }
	"Object" => <string: 0x105305f90> { length = 20, contents = "MobileStorageMounter" }
	"XPCEventName" => <string: 0x10530b4c0> { length = 35, contents = "com.apple.mobile.disk_image_mounted" }
}>
default	11:18:56.952966-0500	installd	0x16afa3000 -[MIDeveloperDiskImageTracker imageMounted:]: received notification: file:///private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.mNUrPS/Applications/
default	11:18:56.953097-0500	installd	0x16afa3000 -[MIDeveloperDiskImageTracker checkMountPoint:]_block_invoke: /private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.mNUrPS/Applications is not present now or before
error	11:18:57.031265-0500	kernel	1 duplicate report for Sandbox: MobileStorageMou(519) deny(1) file-read-metadata /private/var/run/com.apple.security.cryptexd/codex.system/live/com.example.cryptex/cpxd
error	11:18:57.031332-0500	kernel	Sandbox: mobile_storage_p(516) deny(1) file-read-metadata /private/var/run/com.apple.security.cryptexd/codex.system/live/com.example.cryptex/cpxd
error	11:18:57.119971-0500	simple-shell	I'm about to listen on fd: 3
default	11:18:57.122471-0500	kernel	AMFI: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.mNUrPS/usr/bin/debugserver' is adhoc signed.
default	11:18:57.122595-0500	kernel	AMFI: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.mNUrPS/usr/bin/debugserver': unsuitable CT policy 0 for this platform/device, rejecting signature.
error	11:18:57.123411-0500	simple-server	Hello! I'm simple-server from the example cryptex!
error	11:18:57.123532-0500	simple-server	I'm about to bind to 0.0.0.0:7777
error	11:18:57.123934-0500	simple-server	I'm about to listen on fd: 3
error	11:18:57.124028-0500	simple-server	Waiting for a client to connect...
error	11:18:57.131742-0500	kernel	1 duplicate report for Sandbox: mobile_storage_p(516) deny(1) file-read-metadata /private/var/run/com.apple.security.cryptexd/codex.system/live/com.example.cryptex/cpxd
error	11:18:57.131860-0500	kernel	Sandbox: hello(682) deny(1) file-map-executable /private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.mNUrPS/usr/bin/libclang_rt.ubsan_ios_dynamic.dylib
error	11:18:57.134337-0500	dropbear	send failed: Invalid argument
error	11:18:57.134426-0500	dropbear	send failed: Invalid argument
error	11:18:57.134463-0500	dropbear	send failed: Invalid argument
default	11:18:57.135406-0500	ReportCrash	ASI found [dyld] (sensitive) 'Library not loaded: @rpath/libclang_rt.ubsan_ios_dynamic.dylib
  Referenced from: /private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.mNUrPS/usr/bin/hello
  Reason: tried: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.mNUrPS/usr/bin/libclang_rt.ubsan_ios_dynamic.dylib' (file system sandbox blocked mmap() of '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.mNUrPS/usr/bin/libclang_rt.ubsan_ios_dynamic.dylib'), '/Applications/Xcode-beta.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/13.1.6/lib/darwin/libclang_rt.ubsan_ios_dynamic.dylib' (no such file), '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.mNUrPS/usr/bin/libclang_rt.ubsan_ios_dynamic.dylib' (file system sandbox blocked mmap() of '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.mNUrPS/usr/bin/libclang_rt.ubsan_ios_dynamic.dylib'), '/Applications/Xcode-beta.app/Contents/Developer/Toolchains<…>'
default	11:19:07.146106-0500	kernel	AMFI: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.mNUrPS/usr/bin/debugserver' is adhoc signed.
default	11:19:07.146220-0500	kernel	AMFI: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.mNUrPS/usr/bin/debugserver': unsuitable CT policy 0 for this platform/device, rejecting signature.
default	11:19:07.156826-0500	ReportCrash	ASI found [dyld] (sensitive) 'Library not loaded: @rpath/libclang_rt.ubsan_ios_dynamic.dylib
  Referenced from: /private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.mNUrPS/usr/bin/hello
  Reason: tried: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.mNUrPS/usr/bin/libclang_rt.ubsan_ios_dynamic.dylib' (file system sandbox blocked mmap() of '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.mNUrPS/usr/bin/libclang_rt.ubsan_ios_dynamic.dylib'), '/Applications/Xcode-beta.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/13.1.6/lib/darwin/libclang_rt.ubsan_ios_dynamic.dylib' (no such file), '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.mNUrPS/usr/bin/libclang_rt.ubsan_ios_dynamic.dylib' (file system sandbox blocked mmap() of '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.mNUrPS/usr/bin/libclang_rt.ubsan_ios_dynamic.dylib'), '/Applications/Xcode-beta.app/Contents/Developer/Toolchains<…>'
```

### macOS 12.2.1 (21D62) on X86_64 on WED 11 FEB 2022 at 1100 US EST for iPhone 11 when using iOS 15.3.1_19D52
#### Case 2: Build ./example/cryptex/ and ASAN Dylib linked to hello sample code

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/xsscx/srd/main/srd_tools-24.100.3/example-cryptex/build-asan.sh)"
```

##### Result for Build ./example/cryptex/ and ASAN Dylib linked to hello sample code on the SRD iPhone 11 when using iOS 15.3.1_19D52

```
default	11:14:55.685646-0500	kernel	AMFI: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.7rGwkO/usr/bin/debugserver' is adhoc signed.
default	11:14:55.685749-0500	kernel	AMFI: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.7rGwkO/usr/bin/debugserver': unsuitable CT policy 0 for this platform/device, rejecting signature.
default	11:15:05.669167-0500	ReportCrash	ASI found [dyld] (sensitive) 'Library not loaded: @rpath/libclang_rt.ubsan_ios_dynamic.dylib
  Referenced from: /private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.7rGwkO/usr/bin/hello
  Reason: tried: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.7rGwkO/usr/bin/libclang_rt.ubsan_ios_dynamic.dylib' (file system sandbox blocked mmap() of '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.7rGwkO/usr/bin/libclang_rt.ubsan_ios_dynamic.dylib'), '/Applications/Xcode-beta.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/13.1.6/lib/darwin/libclang_rt.ubsan_ios_dynamic.dylib' (no such file), '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.7rGwkO/usr/bin/libclang_rt.ubsan_ios_dynamic.dylib' (file system sandbox blocked mmap() of '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.7rGwkO/usr/bin/libclang_rt.ubsan_ios_dynamic.dylib'), '/Applications/Xcode-beta.app/Contents/Developer/Toolchains<…>'
default	11:15:05.705619-0500	kernel	AMFI: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.7rGwkO/usr/bin/debugserver' is adhoc signed.
default	11:15:05.705734-0500	kernel	AMFI: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.7rGwkO/usr/bin/debugserver': unsuitable CT policy 0 for this platform/device, rejecting signature.
default	11:15:15.691719-0500	ReportCrash	ASI found [dyld] (sensitive) 'Library not loaded: @rpath/libclang_rt.ubsan_ios_dynamic.dylib
  Referenced from: /private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.7rGwkO/usr/bin/hello
  Reason: tried: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.7rGwkO/usr/bin/libclang_rt.ubsan_ios_dynamic.dylib' (file system sandbox blocked mmap() of '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.7rGwkO/usr/bin/libclang_rt.ubsan_ios_dynamic.dylib'), '/Applications/Xcode-beta.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/13.1.6/lib/darwin/libclang_rt.ubsan_ios_dynamic.dylib' (no such file), '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.7rGwkO/usr/bin/libclang_rt.ubsan_ios_dynamic.dylib' (file system sandbox blocked mmap() of '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.7rGwkO/usr/bin/libclang_rt.ubsan_ios_dynamic.dylib'), '/Applications/Xcode-beta.app/Contents/Developer/Toolchains<…>'
default	11:15:15.729199-0500	kernel	AMFI: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.7rGwkO/usr/bin/debugserver' is adhoc signed.
default	11:15:15.729290-0500	kernel	AMFI: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.7rGwkO/usr/bin/debugserver': unsuitable CT policy 0 for this platform/device, rejecting signature.

```

### macOS 12.2.1 (21D62) on X86_64 on WED 11 FEB 2022 at 1100 US EST for iPhone 11 when using iOS 15.3.1_19D52
#### Case 3: Build ./example/cryptex/ and UBSAN Dylib linked to hello sample code

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/xsscx/srd/main/srd_tools-24.100.3/example-cryptex/build-ubsan.sh)"
```

##### Result for Build ./example/cryptex/ and UBSAN Dylib linked to hello sample code on the SRD iPhone 11 when using iOS 15.3.1_19D52

```
error	11:09:55.004194-0500	dropbear	send failed: Invalid argument
error	11:09:55.004306-0500	dropbear	send failed: Invalid argument
error	11:09:55.004345-0500	dropbear	send failed: Invalid argument
default	11:09:55.052843-0500	ReportCrash	ASI found [dyld] (sensitive) 'Library not loaded: @rpath/libclang_rt.ubsan_ios_dynamic.dylib
  Referenced from: /private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.7rGwkO/usr/bin/hello
  Reason: tried: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.7rGwkO/usr/bin/libclang_rt.ubsan_ios_dynamic.dylib' (file system sandbox blocked mmap() of '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.7rGwkO/usr/bin/libclang_rt.ubsan_ios_dynamic.dylib'), '/Applications/Xcode-beta.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/13.1.6/lib/darwin/libclang_rt.ubsan_ios_dynamic.dylib' (no such file), '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.7rGwkO/usr/bin/libclang_rt.ubsan_ios_dynamic.dylib' (file system sandbox blocked mmap() of '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.7rGwkO/usr/bin/libclang_rt.ubsan_ios_dynamic.dylib'), '/Applications/Xcode-beta.app/Contents/Developer/Toolchains<…>'
default	11:10:05.000646-0500	kernel	AMFI: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.7rGwkO/usr/bin/debugserver' is adhoc signed.
default	11:10:05.000849-0500	kernel	AMFI: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.7rGwkO/usr/bin/debugserver': unsuitable CT policy 0 for this platform/device, rejecting signature.
default	11:10:05.017462-0500	ReportCrash	ASI found [dyld] (sensitive) 'Library not loaded: @rpath/libclang_rt.ubsan_ios_dynamic.dylib
  Referenced from: /private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.7rGwkO/usr/bin/hello
  Reason: tried: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.7rGwkO/usr/bin/libclang_rt.ubsan_ios_dynamic.dylib' (file system sandbox blocked mmap() of '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.7rGwkO/usr/bin/libclang_rt.ubsan_ios_dynamic.dylib'), '/Applications/Xcode-beta.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/13.1.6/lib/darwin/libclang_rt.ubsan_ios_dynamic.dylib' (no such file), '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.7rGwkO/usr/bin/libclang_rt.ubsan_ios_dynamic.dylib' (file system sandbox blocked mmap() of '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.7rGwkO/usr/bin/libclang_rt.ubsan_ios_dynamic.dylib'), '/Applications/Xcode-beta.app/Contents/Developer/Toolchains<…>'
default	11:10:15.030478-0500	kernel	AMFI: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.7rGwkO/usr/bin/debugserver' is adhoc signed.
default	11:10:15.030608-0500	kernel	AMFI: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.7rGwkO/usr/bin/debugserver': unsuitable CT policy 0 for this platform/device, rejecting signature.
default	11:10:15.034358-0500	ReportCrash	ASI found [dyld] (sensitive) 'Library not loaded: @rpath/libclang_rt.ubsan_ios_dynamic.dylib
  Referenced from: /private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.7rGwkO/usr/bin/hello
  Reason: tried: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.7rGwkO/usr/bin/libclang_rt.ubsan_ios_dynamic.dylib' (file system sandbox blocked mmap() of '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.7rGwkO/usr/bin/libclang_rt.ubsan_ios_dynamic.dylib'), '/Applications/Xcode-beta.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/13.1.6/lib/darwin/libclang_rt.ubsan_ios_dynamic.dylib' (no such file), '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.7rGwkO/usr/bin/libclang_rt.ubsan_ios_dynamic.dylib' (file system sandbox blocked mmap() of '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.7rGwkO/usr/bin/libclang_rt.ubsan_ios_dynamic.dylib'), '/Applications/Xcode-beta.app/Contents/Developer/Toolchains<…>'
default	11:10:25.056121-0500	ReportCrash	ASI found [dyld] (sensitive) 'Library not loaded: @rpath/libclang_rt.ubsan_ios_dynamic.dylib
  Referenced from: /private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.7rGwkO/usr/bin/hello
  Reason: tried: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.7rGwkO/usr/bin/libclang_rt.ubsan_ios_dynamic.dylib' (file system sandbox blocked mmap() of '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.7rGwkO/usr/bin/libclang_rt.ubsan_ios_dynamic.dylib'), '/Applications/Xcode-beta.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/13.1.6/lib/darwin/libclang_rt.ubsan_ios_dynamic.dylib' (no such file), '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.7rGwkO/usr/bin/libclang_rt.ubsan_ios_dynamic.dylib' (file system sandbox blocked mmap() of '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.7rGwkO/usr/bin/libclang_rt.ubsan_ios_dynamic.dylib'), '/Applications/Xcode-beta.app/Contents/Developer/Toolchains<…>'
default	11:10:25.056224-0500	kernel	AMFI: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.7rGwkO/usr/bin/debugserver' is adhoc signed.
default	11:10:25.056391-0500	kernel	AMFI: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.7rGwkO/usr/bin/debugserver': unsuitable CT policy 0 for this platform/device, rejecting signature.
default	11:10:35.078013-0500	ReportCrash	ASI found [dyld] (sensitive) 'Library not loaded: @rpath/libclang_rt.ubsan_ios_dynamic.dylib
  Referenced from: /private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.7rGwkO/usr/bin/hello
  Reason: tried: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.7rGwkO/usr/bin/libclang_rt.ubsan_ios_dynamic.dylib' (file system sandbox blocked mmap() of '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.7rGwkO/usr/bin/libclang_rt.ubsan_ios_dynamic.dylib'), '/Applications/Xcode-beta.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/13.1.6/lib/darwin/libclang_rt.ubsan_ios_dynamic.dylib' (no such file), '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.7rGwkO/usr/bin/libclang_rt.ubsan_ios_dynamic.dylib' (file system sandbox blocked mmap() of '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.7rGwkO/usr/bin/libclang_rt.ubsan_ios_dynamic.dylib'), '/Applications/Xcode-beta.app/Contents/Developer/Toolchains<…>'
default	11:10:35.079694-0500	kernel	AMFI: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.7rGwkO/usr/bin/debugserver' is adhoc signed.
default	11:10:35.079823-0500	kernel	AMFI: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.7rGwkO/usr/bin/debugserver': unsuitable CT policy 0 for this platform/device, rejecting signature.
```

### macOS 12.2.1 (21D62) on X86_64 on THU 24 FEB 2022 at 0500 US EST for iPhone 11 when using iOS_15.4_19E5235a
#### Case 2: Build ./example/cryptex/ which includes PR48 + PR49 {updated entitlements and debugserver}
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/xsscx/srd/main/srd_tools-24.100.3/example-cryptex/build-asan.sh)"
```

### Result == Works
```
(lldb) image dump sections
Dumping sections for 2 modules.
Sections for '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.pU5TsF/usr/bin/hello(0x00000001029c8000)' (arm64e):
  SectID     Type             Load Address                             Perm File Off.  File Size  Flags      Section Name
  ---------- ---------------- ---------------------------------------  ---- ---------- ---------- ---------- ----------------------------
  0x00000100 container        [0x0000000000000000-0x0000000100000000)* ---  0x00000000 0x00000000 0x00000000 hello.__PAGEZERO
  0x00000200 container        [0x00000001029c8000-0x00000001029d4000)  r-x  0x00000000 0x0000c000 0x00000000 hello.__TEXT
  0x00000001 code             [0x00000001029cf96c-0x00000001029cfdec)  r-x  0x0000796c 0x00000480 0x80000400 hello.__TEXT.__text
  0x00000002 code             [0x00000001029cfdec-0x00000001029cfebc)  r-x  0x00007dec 0x000000d0 0x80000408 hello.__TEXT.__auth_stubs
  0x00000003 regular          [0x00000001029cfebc-0x00000001029cfec0)  r-x  0x00007ebc 0x00000004 0x00000016 hello.__TEXT.__init_offsets
  0x00000004 regular          [0x00000001029cfec0-0x00000001029cff60)  r-x  0x00007ec0 0x000000a0 0x00000000 hello.__TEXT.__asan_cstring
  0x00000005 data-cstr        [0x00000001029cff60-0x00000001029cff8f)  r-x  0x00007f60 0x0000002f 0x00000002 hello.__TEXT.__cstring
  0x00000006 regular          [0x00000001029cff8f-0x00000001029cff97)  r-x  0x00007f8f 0x00000008 0x00000000 hello.__TEXT.__const
  0x00000007 compact-unwind   [0x00000001029cff98-0x00000001029cffe8)  r-x  0x00007f98 0x00000050 0x00000000 hello.__TEXT.__unwind_info
  0x00000008 data-cstr        [0x00000001029d0000-0x00000001029d001e)  r-x  0x00008000 0x0000001e 0x00000002 hello.__TEXT.__oslogstring
  0x00000300 container        [0x00000001029d4000-0x00000001029d8000)  rw-  0x0000c000 0x00004000 0x00000010 hello.__DATA_CONST
  0x00000009 data-ptrs        [0x00000001029d4000-0x00000001029d4068)  rw-  0x0000c000 0x00000068 0x00000006 hello.__DATA_CONST.__auth_got
  0x0000000a data-ptrs        [0x00000001029d4068-0x00000001029d4080)  rw-  0x0000c068 0x00000018 0x00000006 hello.__DATA_CONST.__got
  0x0000000b data-ptrs        [0x00000001029d4080-0x00000001029d4088)  rw-  0x0000c080 0x00000008 0x0000000a hello.__DATA_CONST.__mod_term_func
  0x0000000c regular          [0x00000001029d4088-0x00000001029d40b8)  rw-  0x0000c088 0x00000030 0x00000000 hello.__DATA_CONST.__const
  0x00000400 container        [0x00000001029d8000-0x00000001029dc000)  rw-  0x00010000 0x00004000 0x00000000 hello.__DATA
  0x0000000d regular          [0x00000001029d8000-0x00000001029d80c0)  rw-  0x00010000 0x000000c0 0x00000000 hello.__DATA.__asan_globals
  0x0000000e regular          [0x00000001029d80c0-0x00000001029d80f0)  rw-  0x000100c0 0x00000030 0x00000000 hello.__DATA.__asan_liveness
  0x0000000f zero-fill        [0x00000001029d80f0-0x00000001029d80f8)  rw-  0x00000000 0x00000000 0x00000001 hello.__DATA.__common
  0x00000500 container        [0x00000001029dc000-0x00000001029e4000)  r--  0x00014000 0x00005150 0x00000000 hello.__LINKEDIT
Sections for '/Users/xss/Library/Developer/Xcode/iOS DeviceSupport/15.4 (19E5225g) arm64e/Symbols/usr/lib/dyld' (arm64e):
  SectID     Type             Load Address                             Perm File Off.  File Size  Flags      Section Name
  ---------- ---------------- ---------------------------------------  ---- ---------- ---------- ---------- ----------------------------
  0x00000100 container        [0x0000000102b7c000-0x0000000102bd4000)  r-x  0x00000000 0x00058000 0x00000000 dyld.__TEXT
  0x00000001 code             [0x0000000102b7d000-0x0000000102bca3bc)  r-x  0x00001000 0x0004d3bc 0x80000400 dyld.__TEXT.__text
  0x00000002 regular          [0x0000000102bca3c0-0x0000000102bcb2f0)  r-x  0x0004e3c0 0x00000f30 0x00000000 dyld.__TEXT.__const
  0x00000003 data-cstr        [0x0000000102bcb2f0-0x0000000102bd385a)  r-x  0x0004f2f0 0x0000856a 0x00000002 dyld.__TEXT.__cstring
  0x00000004 compact-unwind   [0x0000000102bd385c-0x0000000102bd3b70)  r-x  0x0005785c 0x00000314 0x00000000 dyld.__TEXT.__unwind_info
  0x00000200 container        [0x0000000102bd4000-0x0000000102be8000)  rw-  0x00058000 0x00014000 0x00000010 dyld.__DATA_CONST
  0x00000005 regular          [0x0000000102bd4000-0x0000000102bd4070)  rw-  0x00058000 0x00000070 0x00000000 dyld.__DATA_CONST.__auth_ptr
  0x00000006 regular          [0x0000000102bd4070-0x0000000102bd7c98)  rw-  0x00058070 0x00003c28 0x00000000 dyld.__DATA_CONST.__const
  0x00000007 regular          [0x0000000102bd7c98-0x0000000102be7c98)  rw-  0x0005bc98 0x00010000 0x00000000 dyld.__DATA_CONST.__bss
  0x00000300 container        [0x0000000102be8000-0x0000000102bec000)  rw-  0x0006c000 0x00004000 0x00000000 dyld.__DATA
  0x00000008 data             [0x0000000102be8000-0x0000000102be813c)  rw-  0x0006c000 0x0000013c 0x00000000 dyld.__DATA.__data
  0x00000009 regular          [0x0000000102be8140-0x0000000102be82b0)  rw-  0x0006c140 0x00000170 0x00000000 dyld.__DATA.__all_image_info
  0x0000000a regular          [0x0000000102be82b0-0x0000000102be82f0)  rw-  0x0006c2b0 0x00000040 0x00000000 dyld.__DATA.__crash_info
  0x0000000b zero-fill        [0x0000000102be8300-0x0000000102be9cf8)  rw-  0x00000000 0x00000000 0x00000001 dyld.__DATA.__common
  0x0000000c zero-fill        [0x0000000102be9cf8-0x0000000102bea1dc)  rw-  0x00000000 0x00000000 0x00000001 dyld.__DATA.__bss
  0x00000400 container        [0x0000000102bec000-0x0000000102c24000)  r--  0x00070000 0x000356f0 0x00000000 dyld.__LINKEDIT
```

#### Results for UBSAN dylib and hello.c example
```
default	10:07:52.191668-0500	debugserver	debugserver will use ASL for internal logging.
default	10:07:52.191746-0500	debugserver	debugserver-@(#)PROGRAM:LLDB  PROJECT:lldb-1316.2.4.16
 for arm64.
default	10:07:52.191785-0500	debugserver	Listening to port 2345 for a connection from 0.0.0.0...
default	10:08:02.176695-0500	kernel	AMFI: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.LCIv75/usr/bin/hello' is adhoc signed.
default	10:08:02.176819-0500	kernel	AMFI: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.LCIv75/usr/bin/hello': unsuitable CT policy 0 for this platform/device, rejecting signature.
default	10:08:12.190854-0500	kernel	AMFI: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.LCIv75/usr/bin/hello' is adhoc signed.
default	10:08:12.190975-0500	kernel	AMFI: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.LCIv75/usr/bin/hello': unsuitable CT policy 0 for this platform/device, rejecting signature.
```

## Observation

AMFI Research complains about __debugserver__:
```
default	11:10:35.079694-0500	kernel	AMFI: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.7rGwkO/usr/bin/debugserver' is adhoc signed.
default	11:10:35.079823-0500	kernel	AMFI: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.7rGwkO/usr/bin/debugserver': unsuitable CT policy 0 for this platform/device, rejecting signature.
```

## SAT 26 FEB 2022 Spot Check - debugserver not working - iPhone 12

```
default	10:10:51.684679-0500	kernel	AMFI: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.y2awNR/usr/bin/debugserver' is adhoc signed.
default	10:10:51.684818-0500	kernel	AMFI: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.y2awNR/usr/bin/debugserver': unsuitable CT policy 0 for this platform/device, rejecting signature.
```

### Visual Representation of the Issue(s) - below, debugserver causing AMFI to throw() on iPhone 11

<img src="https://xss.cx/2022/02/25/img/srd0009-iphone11-debugserver-adhoc_signed-ct-coretrust-rejected-amfi_research-example-001.png" alt="Picture at Left showing the make and install process for debugserver with Picture at Right showing the SRD iPhone 11 Console Log" style="height: 800px; width:1000px;"/>

### Visual Representation of the Issue(s) - below, debugserver causing AMFI to throw() on iPhone 12

<img src="https://xss.cx/2022/02/25/img/srd0037-iphone12-debugserver-adhoc_signed-ct-coretrust-rejected-amfi_research-example-001.png" alt="Picture at Left showing the make and install process for debugserver with Picture at Right showing the SRD iPhone 12 Console Log" style="height: 800px; width:1000px;"/>

## SAT 26 FEB 2022 Spot Check - ubsan working iPhone 12

<img src="https://xss.cx/2022/02/25/img/srd0037-ubsan-working-macos_1221_example-no-entitlements-sample-001.png" alt="Picture at Left showing the make and install process for debugserver with Picture at Right showing the SRD iPhone 12 Console Log" style="height: 800px; width:1000px;"/>


## SAT 26 FEB 2022 Spot Check - asan working iPhone 12

<img src="https://xss.cx/2022/02/25/img/srd0037-asan-working-macos_1221_example-no-entitlements-sample-001.png" alt="Picture at Left showing the make and install process for debugserver with Picture at Right showing the SRD iPhone 12 Console Log" style="height: 800px; width:1000px;"/>


## SAT 26 FEB 2022 Spot Check - ubsan _not_ working iPhone 12

<img src="https://xss.cx/2022/02/25/img/srd0037-ubsan-not_working-macos_1221_example-no-entitlements-sample-001.png" alt="Picture at Left showing the make and install process for debugserver with Picture at Right showing the SRD iPhone 12 Console Log" style="height: 800px; width:1000px;"/>

## MON 28 FEB 2022 Spot Check - asan working iPhone 11

<img src="https://xss.cx/2022/02/28/img/srd0009-applesecurityresearchdevice-debugserver-amfi-research-working-entitlement-example-001.png" alt="Picture at Left showing the make and install process for debugserver with Picture at Right showing the SRD iPhone 12 Console Log" style="height: 800px; width:1000px;"/>

## Testing iOS 15.4_19E5241a
```
15.4_19E5241a looks fine from macOS 12.2.1 (21D62) for iPhone 11 & iPhone 12
```

## SUMMARY
```
PR42 should be Merged because is suffers from the same CT | AMFI Research Issues in PR48 & PR49 which is that a binary in the SRD Trust Cache is adhoc signed, unsuitable CT policy 0 for this platform/device, rejecting signature.
```

### DATAPOINT WED 2 MAR 2022
UBSAN working on iPhone 11 iOS 15.4_19E5241a with personalization from macOS 12.2.1 (21D62) X86_64
```
./debugserver 192.168.3.83:1921 ./hello
debugserver-@(#)PROGRAM:LLDB  PROJECT:lldb-1316.2.4.16
 for arm64.
Listening to port 1921 for a connection from 192.168.3.83...
Got a connection, launched process ./hello (pid = 821).
Exiting.
date
Wed Mar  2 10:10:49 EST 2022
uname -a
Darwin SRD0009 21.4.0 Darwin Kernel Version 21.4.0: Mon Feb 21 22:46:43 PST 2022; root:xnu-8020.102.3~2/RELEASE_ARM64_T8030 iPhone12,1 Toybox
```
### SRD Console Log iPhone 11
```
default	10:01:26.111783-0500	debugserver	debugserver will use ASL for internal logging.
default	10:01:26.111870-0500	debugserver	debugserver-@(#)PROGRAM:LLDB  PROJECT:lldb-1316.2.4.16
 for arm64.
default	10:01:26.111913-0500	debugserver	Listening to port 2345 for a connection from 0.0.0.0...
default	10:04:54.313806-0500	dropbear	Password auth succeeded for 'root' from 192.168.3.83:59300
default	10:04:54.342422-0500	dropbear	CRYPTEX_SHELL specified. User shell is now '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.xEXHz4/usr/bin/sh'
default	10:04:54.346293-0500	dropbear	Setting PATH to '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.xEXHz4/sbin:/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.xEXHz4/bin:/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.xEXHz4/usr/bin:/sbin:/bin:/usr/bin'
default	10:04:54.349047-0500	dropbear	Starting shell: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.xEXHz4/usr/bin/sh'
error	10:04:59.318826-0500	kernel	1 duplicate report for Sandbox: mobile_storage_p(281) deny(1) file-read-metadata /private/var/run/com.apple.security.cryptexd/codex.system/live/com.example.cryptex/cpxd
default	10:05:17.714731-0500	debugserver	debugserver will use ASL for internal logging.
default	10:05:17.720081-0500	debugserver	[LaunchAttach] (820) about to task_for_pid(821)
default	10:05:17.720256-0500	debugserver	[LaunchAttach] (820) successfully task_for_pid(821)'ed
default	10:05:17.722193-0500	debugserver	[LaunchAttach] (820) About to ptrace(PT_ATTACHEXC, 821)...
default	10:05:17.722981-0500	debugserver	Initializing connection
default	10:05:17.724328-0500	debugserver	Removing all cached process handles
default	10:05:17.725372-0500	debugserver	Sending handshake request attempt #1 to server
default	10:05:17.725578-0500	debugserver	Creating connection to com.apple.runningboard
default	10:05:17.739305-0500	debugserver	Handshake succeeded
default	10:05:17.739913-0500	debugserver	Identity resolved as anon<debugserver>
default	10:05:17.743817-0500	debugserver	BKSApplicationStateMonitor updated with invalid process
default	10:05:17.747795-0500	debugserver	BKSApplicationStateMonitor updated with invalid process
default	10:05:17.844341-0500	debugserver	[LaunchAttach] (820) Completed ptrace(PT_ATTACHEXC, 821) == 0
default	10:05:17.871484-0500	debugserver	networkd_settings_read_from_file initialized networkd settings by reading plist directly
default	10:05:17.871836-0500	debugserver	networkd_settings_read_from_file initialized networkd settings by reading plist directly
default	10:05:50.634277-0500	debugserver	[LaunchAttach] Successfully launched ./hello (pid = 821).
```

### DATAPOINT WED 2 MAR 2022
UBSAN working on iPhone 12 iOS 15.4_19E5241a with personalization from macOS 12.2.1 (21D62) X86_64
```
./debugserver 192.168.3.83:1921 ./hello
debugserver-@(#)PROGRAM:LLDB  PROJECT:lldb-1316.2.4.16
 for arm64.
Listening to port 1921 for a connection from 192.168.3.83...
Got a connection, launched process ./hello (pid = 567).
Exiting.
date
Wed Mar  2 10:13:34 EST 2022
uname -a
Darwin SRD0037 21.4.0 Darwin Kernel Version 21.4.0: Mon Feb 21 22:46:42 PST 2022; root:xnu-8020.102.3~2/RELEASE_ARM64_T8101 iPhone13,2 Toybox
```

### SRD Console Log
```
default	10:05:17.844341-0500	debugserver	[LaunchAttach] (820) Completed ptrace(PT_ATTACHEXC, 821) == 0
default	10:05:17.871484-0500	debugserver	networkd_settings_read_from_file initialized networkd settings by reading plist directly
default	10:05:17.871836-0500	debugserver	networkd_settings_read_from_file initialized networkd settings by reading plist directly
default	10:05:50.634277-0500	debugserver	[LaunchAttach] Successfully launched ./hello (pid = 821).
default	10:10:45.753757-0500	debugserver	Got a 'k' packet, killing the inferior process.
default	10:10:45.753904-0500	debugserver	Sending ptrace PT_KILL to terminate inferior process pid 821.
default	10:10:45.754116-0500	debugserver	1 +0.000000 sec [0334/0103]: error: ::ptrace (request = PT_THUPDATE, pid = 0x0335, tid = 0x2103, signal = 0) err = Resource busy (0x00000010)
default	10:10:45.754523-0500	debugserver	2 +0.000474 sec [0334/0103]: error: ::task_resume ( target_task = 0x1603 ) err = (os/kern) failure (0x00000005)
default	10:10:45.754950-0500	debugserver	Waited 0 ms for process to be reaped (state = Exited)
default	10:10:45.755254-0500	debugserver	debugserver's process monitoring thread has exited.
default	10:10:45.755379-0500	debugserver	debugserver about to shut down packet communications to lldb.
default	10:10:45.755552-0500	debugserver	3 +0.001083 sec [0334/1807]: error: ::read ( 8, 0x16b386b18, 1024 ) => -1 err = Bad file descriptor (0x00000009)
```

### DATAPOINT SAT 12 MAR 2022
```
default	07:55:19.820102-0500	dropbear	Password auth succeeded for 'root' from 192.168.3.47:49380
default	07:55:22.262186-0500	dropbear	CRYPTEX_SHELL specified. User shell is now '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.ngoqXx/usr/bin/sh'
default	07:55:22.264880-0500	dropbear	Setting PATH to '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.ngoqXx/sbin:/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.ngoqXx/bin:/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.ngoqXx/usr/bin:/sbin:/bin:/usr/bin'
default	07:55:22.266797-0500	dropbear	Starting shell: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.ngoqXx/usr/bin/sh'
default	07:55:22.268325-0500	kernel	AMFI: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.ngoqXx/usr/bin/toybox' is adhoc signed.
default	07:55:22.268399-0500	kernel	AMFI: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.ngoqXx/usr/bin/toybox': unsuitable CT policy 0 for this platform/device, rejecting signature.
error	07:55:37.586630-0500	simple-server	A client has connected!
error	07:55:37.587091-0500	simple-server	Waiting for a client to connect...
```
### iPhone 12 Console Log | toybox: unsuitable CT policy
<img src="https://xss.cx/2022/03/12/img/srd0037-coretrust-amfi-research-unsuitable-ct-policy-signature-rejected-sample-001.png" alt="CoreTrust, AMFI research, Signature Rejection, Apple Security Research Device, iPhone 12" style="height: 800px; width:1000px;"/>

### DATAPOINT WEV 23 MAR 2022
```
default	08:03:28.182569-0400	dropbear	Password auth succeeded for 'root' from 192.168.3.47:50572
default	08:03:28.227341-0400	dropbear	CRYPTEX_SHELL specified. User shell is now '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.lEeWIA/usr/bin/sh'
default	08:03:28.230856-0400	dropbear	Setting PATH to '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.lEeWIA/sbin:/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.lEeWIA/bin:/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.lEeWIA/usr/bin:/sbin:/bin:/usr/bin'
default	08:03:28.233284-0400	dropbear	Starting shell: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.lEeWIA/usr/bin/sh'
default	08:03:33.182899-0400	kernel	AMFI: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.lEeWIA/usr/bin/debugserver' is adhoc signed.
default	08:03:33.183049-0400	kernel	AMFI: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.lEeWIA/usr/bin/debugserver': unsuitable CT policy 0 for this platform/device, rejecting signature.
error	08:03:37.335777-0400	kernel	1 duplicate report for Sandbox: mobile_storage_p(300) deny(1) file-read-metadata /private/var/run/com.apple.security.cryptexd/codex.system/live/com.example.cryptex/cpxd
default	08:03:43.223196-0400	kernel	AMFI: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.lEeWIA/usr/bin/debugserver' is adhoc signed.
default	08:03:43.223356-0400	kernel	AMFI: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.lEeWIA/usr/bin/debugserver': unsuitable CT policy 0 for this platform/device, rejecting signature.
```

#### Observation
This:
```
kernel	AMFI: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.lEeWIA/usr/bin/debugserver' is adhoc signed.
```
has been a problem since inception.
