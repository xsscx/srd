### Apple Security Research Device | TFTP Server & Client with Makefile for ARM SRD

Working Binary Files for your SRD and a Makefile that works for Cross Compilation..

Works 100% .. Ask Questions if you need help....

Questions?? Open an Issue or reach out on Slack in #srd-platform-development

:-)

Toolchain Details
-----
XNU Export
```
export XNU_VERSION=xnu-7195.81.3
```
X86_64
```
xcode-select -p
/Applications/Xcode.app/Contents/Developer

clang -v
Apple clang version 13.0.0 (clang-1300.0.18.6)
Target: arm64-apple-darwin20.5.0
Thread model: posix
InstalledDir: /Applications/Xcode-beta.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin
iOS SDK at /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS14.5.sdk
iOS SDK at /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS15.0.sdk
```

M1 Apple Silicon
```
xcode-select -p
/Applications/Xcode-beta.app/Contents/Developer

clang -v
Apple clang version 13.0.0 (clang-1300.0.18.6)
Target: arm64-apple-darwin20.5.0
Thread model: posix
InstalledDir: /Applications/Xcode-beta.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin
iOS SDK at /Applications/Xcode-beta.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS15.0.sdk
```
```
iOS SDK 15
iOS SDK 14
iOS 14Beta7
iOS 15Beta2
```

ORIGINAL README

tftp
This is a simple tftp server/client that can be used to transfer a file. It also displays information as the transfer takes place, showing you the packet sizes being sent, the ACK receiving, etc. Heavily inspired by Beej's guide to network programming.

Both the client and server are set on port 69 by default, but this may not be accessible to you, so you can change the port (and host) if you need to.

The received file is named "recvfile.txt" so you can see what was sent and it won't replace the file (in case you choose to do it in the same folder, which you can. It's pretty full featured and will try to resend failed packets a certain number of times before it gives up.

Installation
make
Uninstallation
make clean
Usage
Server
./server [-p port]
Client
./client [-p port] [-h hostname] -f filename
