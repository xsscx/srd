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
# Update 1 - October 22, 2021
We're back to this again...
```
Connected: no
can't list processes on remote
can't launch from remote
... the list goes on...
```

# Plist File

xmllint says....
```
xmllint src/debugserver/debugserver.plist
<?xml version="1.0"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>com.apple.system-task-ports</key>
	<true/>
	<key>com.apple.springboard.debugapplications</key>
	<true/>
	<key>get-task-allow</key>
	<true/>
	<key>task_for_pid-allow</key>
	<true/>
	<key>run-unsigned-code</key>
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
