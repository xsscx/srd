# toybox for SRD on iOS 15.x

The NET uploads are Uploaded and in the next few days I'll get the Build Pipeline fixed up and re-automated.

Apple SRD Build Note
-----
These were the changes made to toybox to get a Build for iOS:

macos_miniconfig
----
Removed CONFIG vi=y

Makefile
-----
Remove echo CONFIG_VI=y >> toybox-src/kconfig/macos_miniconfig

That will Build toybox for cryptex from Commit https://github.com/landley/toybox/commit/6cc6d5b0651f1eba689a9c6e6d53d4502334208b

Target SDK
-----
```
[example-cryptex] - macOS SDK at /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX12.1.sdk
[example-cryptex] - iOS SDK at /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS15.2.sdk
```
My iOS 15.2 SRD Cryptex DMG contains the latest toybox unstripped here https://github.com/xsscx/srd/blob/main/dmg/19C56-toyboxunstripped.dmg which contains the arm64e build for toybox unstripped.
