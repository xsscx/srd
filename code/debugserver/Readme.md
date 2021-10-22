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
default	17:10:43.273081-0400	debugserver	debugserver will use ASL for internal logging.
default	17:10:43.275248-0400	debugserver	networkd_settings_read_from_file initialized networkd settings by reading plist directly
default	17:10:43.276035-0400	debugserver	networkd_settings_read_from_file initialized networkd settings by reading plist directly
default	17:10:43.277914-0400	debugserver	1 +0.000000 sec [0260/0103]: ::listen or ::bind failed err = 0x00000000
default	17:10:58.219566-0400	debugserver	debugserver will use ASL for internal logging.
error	17:10:58.222649-0400	kernel	1 duplicate report for Sandbox: debugserver(606) deny(1) network-bind*:1921
error	17:10:58.222718-0400	kernel	Sandbox: debugserver(609) deny(1) process-fork
default	17:10:58.229412-0400	debugserver	1 +0.000000 sec [0261/0103]: error: ::posix_spawnp ( pid => 0, path = '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.uCDlik/usr/bin/hello', file_actions = 0x16d83de90, attr = 0x16d83dea8, argv = 0x113f041e0, envp = 0x113f043d0 ) err = Operation not permitted (0x00000001)
default	17:10:58.229491-0400	debugserver	2 +0.006306 sec [0261/0103]: RNBRunLoopLaunchInferior DNBProcessLaunch() returned error: 'Operation not permitted'
default	17:11:36.616352-0400	debugserver	debugserver will use ASL for internal logging.
default	17:11:36.617736-0400	debugserver	[LaunchAttach] (614) about to task_for_pid(492)
default	17:11:36.617882-0400	debugserver	error: [LaunchAttach] MachTask::TaskPortForProcessID task_for_pid(492) failed: ::task_for_pid ( target_tport = 0x0203, pid = 492, &task ) => err = 0x00000005 ((os/kern) failure)
default	17:11:36.618093-0400	debugserver	1 +0.000000 sec [0266/0103]: error: ::task_for_pid ( target_tport = 0x0203, pid = 492, &task ) => err = 0x00000005 ((os/kern) failure) err = ::task_for_pid ( target_tport = 0x0203, pid = 492, &task ) => err = 0x00000005 ((os/kern) failure) (0x00000005)
default	17:11:36.711496-0400	debugserver	[LaunchAttach] (614) about to task_for_pid(492)
default	17:11:36.711530-0400	debugserver	error: [LaunchAttach] MachTask::TaskPortForProcessID task_for_pid(492) failed: ::task_for_pid ( target_tport = 0x0203, pid = 492, &task ) => err = 0x00000005 ((os/kern) failure)
default	17:11:36.711570-0400	debugserver	2 +0.083335 sec [0266/0103]: error: ::task_for_pid ( target_tport = 0x0203, pid = 492, &task ) => err = 0x00000005 ((os/kern) failure) err = ::task_for_pid ( target_tport = 0x0203, pid = 492, &task ) => err = 0x00000005 ((os/kern) failure) (0x00000005)
default	17:11:36.748117-0400	debugserver	[LaunchAttach] (614) about to task_for_pid(492)
default	17:11:36.748368-0400	debugserver	error: [LaunchAttach] MachTask::TaskPortForProcessID task_for_pid(492) failed: ::task_for_pid ( target_tport = 0x0203, pid = 492, &task ) => err = 0x00000005 ((os/kern) failure)
default	17:11:36.748572-0400	debugserver	3 +0.047121 sec [0266/0103]: error: ::task_for_pid ( target_tport = 0x0203, pid = 492, &task ) => err = 0x00000005 ((os/kern) failure) err = ::task_for_pid ( target_tport = 0x0203, pid = 492, &task ) => err = 0x00000005 ((os/kern) failure) (0x00000005)
default	17:11:36.782155-0400	debugserver	[LaunchAttach] (614) about to task_for_pid(492)
default	17:11:36.782313-0400	debugserver	error: [LaunchAttach] MachTask::TaskPortForProcessID task_for_pid(492) failed: ::task_for_pid ( target_tport = 0x0203, pid = 492, &task ) => err = 0x00000005 ((os/kern) failure)
default	17:11:36.782429-0400	debugserver	4 +0.033930 sec [0266/0103]: error: ::task_for_pid ( target_tport = 0x0203, pid = 492, &task ) => err = 0x00000005 ((os/kern) failure) err = ::task_for_pid ( target_tport = 0x0203, pid = 492, &task ) => err = 0x00000005 ((os/kern) failure) (0x00000005)
default	17:11:36.879933-0400	debugserver	[LaunchAttach] (614) about to task_for_pid(492)
default	17:11:36.880083-0400	debugserver	error: [LaunchAttach] MachTask::TaskPortForProcessID task_for_pid(492) failed: ::task_for_pid ( target_tport = 0x0203, pid = 492, &task ) => err = 0x00000005 ((os/kern) failure)
default	17:11:36.880198-0400	debugserver	5 +0.097758 sec [0266/0103]: error: ::task_for_pid ( target_tport = 0x0203, pid = 492, &task ) => err = 0x00000005 ((os/kern) failure) err = ::task_for_pid ( target_tport = 0x0203, pid = 492, &task ) => err = 0x00000005 ((os/kern) failure) (0x00000005)
default	17:11:36.973921-0400	debugserver	[LaunchAttach] (614) about to task_for_pid(492)
default	17:11:36.974261-0400	debugserver	error: [LaunchAttach] MachTask::TaskPortForProcessID task_for_pid(492) failed: ::task_for_pid ( target_tport = 0x0203, pid = 492, &task ) => err = 0x00000005 ((os/kern) failure)
default	17:11:36.974396-0400	debugserver	6 +0.094127 sec [0266/0103]: error: ::task_for_pid ( target_tport = 0x0203, pid = 492, &task ) => err = 0x00000005 ((os/kern) failure) err = ::task_for_pid ( target_tport = 0x0203, pid = 492, &task ) => err = 0x00000005 ((os/kern) failure) (0x00000005)
default	17:11:37.008919-0400	debugserver	[LaunchAttach] (614) about to task_for_pid(492)
default	17:11:37.009278-0400	debugserver	error: [LaunchAttach] MachTask::TaskPortForProcessID task_for_pid(492) failed: ::task_for_pid ( target_tport = 0x0203, pid = 492, &task ) => err = 0x00000005 ((os/kern) failure)
default	17:11:37.009351-0400	debugserver	7 +0.031595 sec [0266/0103]: error: ::task_for_pid ( target_tport = 0x0203, pid = 492, &task ) => err = 0x00000005 ((os/kern) failure) err = ::task_for_pid ( target_tport = 0x0203, pid = 492, &task ) => err = 0x00000005 ((os/kern) failure) (0x00000005)
default	17:11:37.116267-0400	debugserver	[LaunchAttach] (614) about to task_for_pid(492)
default	17:11:37.116417-0400	debugserver	error: [LaunchAttach] MachTask::TaskPortForProcessID task_for_pid(492) failed: ::task_for_pid ( target_tport = 0x0203, pid = 492, &task ) => err = 0x00000005 ((os/kern) failure)
default	17:11:37.116648-0400	debugserver	8 +0.110686 sec [0266/0103]: error: ::task_for_pid ( target_tport = 0x0203, pid = 492, &task ) => err = 0x00000005 ((os/kern) failure) err = ::task_for_pid ( target_tport = 0x0203, pid = 492, &task ) => err = 0x00000005 ((os/kern) failure) (0x00000005)
default	17:11:37.133738-0400	debugserver	[LaunchAttach] (614) about to task_for_pid(492)
default	17:11:37.133886-0400	debugserver	error: [LaunchAttach] MachTask::TaskPortForProcessID task_for_pid(492) failed: ::task_for_pid ( target_tport = 0x0203, pid = 492, &task ) => err = 0x00000005 ((os/kern) failure)
default	17:11:37.134006-0400	debugserver	9 +0.017398 sec [0266/0103]: error: ::task_for_pid ( target_tport = 0x0203, pid = 492, &task ) => err = 0x00000005 ((os/kern) failure) err = ::task_for_pid ( target_tport = 0x0203, pid = 492, &task ) => err = 0x00000005 ((os/kern) failure) (0x00000005)
default	17:11:37.244204-0400	debugserver	[LaunchAttach] (614) about to task_for_pid(492)
default	17:11:37.244355-0400	debugserver	error: [LaunchAttach] MachTask::TaskPortForProcessID task_for_pid(492) failed: ::task_for_pid ( target_tport = 0x0203, pid = 492, &task ) => err = 0x00000005 ((os/kern) failure)
default	17:11:37.244509-0400	debugserver	10 +0.110505 sec [0266/0103]: error: ::task_for_pid ( target_tport = 0x0203, pid = 492, &task ) => err = 0x00000005 ((os/kern) failure) err = ::task_for_pid ( target_tport = 0x0203, pid = 492, &task ) => err = 0x00000005 ((os/kern) failure) (0x00000005)
default	17:11:37.354998-0400	debugserver	error: MachTask::StartExceptionThread (): task invalid, exception thread start failed.
default	17:11:37.355139-0400	debugserver	error: [LaunchAttach] END (614) MachProcess::AttachForDebug failed to start exception thread attaching to pid 492: unable to start the exception thread
default	17:22:50.325968-0400	debugserver	debugserver will use ASL for internal logging.
default	17:22:50.328645-0400	debugserver	[LaunchAttach] (636) about to task_for_pid(492)
default	17:22:50.328797-0400	debugserver	error: [LaunchAttach] MachTask::TaskPortForProcessID task_for_pid(492) failed: ::task_for_pid ( target_tport = 0x0203, pid = 492, &task ) => err = 0x00000005 ((os/kern) failure)
default	17:22:50.329006-0400	debugserver	1 +0.000000 sec [027c/0103]: error: ::task_for_pid ( target_tport = 0x0203, pid = 492, &task ) => err = 0x00000005 ((os/kern) failure) err = ::task_for_pid ( target_tport = 0x0203, pid = 492, &task ) => err = 0x00000005 ((os/kern) failure) (0x00000005)
default	17:22:50.387343-0400	debugserver	[LaunchAttach] (636) about to task_for_pid(492)
default	17:22:50.387490-0400	debugserver	error: [LaunchAttach] MachTask::TaskPortForProcessID task_for_pid(492) failed: ::task_for_pid ( target_tport = 0x0203, pid = 492, &task ) => err = 0x00000005 ((os/kern) failure)
default	17:22:50.387634-0400	debugserver	2 +0.058694 sec [027c/0103]: error: ::task_for_pid ( target_tport = 0x0203, pid = 492, &task ) => err = 0x00000005 ((os/kern) failure) err = ::task_for_pid ( target_tport = 0x0203, pid = 492, &task ) => err = 0x00000005 ((os/kern) failure) (0x00000005)
default	17:22:50.445914-0400	debugserver	[LaunchAttach] (636) about to task_for_pid(492)
default	17:22:50.446063-0400	debugserver	error: [LaunchAttach] MachTask::TaskPortForProcessID task_for_pid(492) failed: ::task_for_pid ( target_tport = 0x0203, pid = 492, &task ) => err = 0x00000005 ((os/kern) failure)
default	17:22:50.446181-0400	debugserver	3 +0.058539 sec [027c/0103]: error: ::task_for_pid ( target_tport = 0x0203, pid = 492, &task ) => err = 0x00000005 ((os/kern) failure) err = ::task_for_pid ( target_tport = 0x0203, pid = 492, &task ) => err = 0x00000005 ((os/kern) failure) (0x00000005)
default	17:22:50.546936-0400	debugserver	[LaunchAttach] (636) about to task_for_pid(492)
default	17:22:50.547086-0400	debugserver	error: [LaunchAttach] MachTask::TaskPortForProcessID task_for_pid(492) failed: ::task_for_pid ( target_tport = 0x0203, pid = 492, &task ) => err = 0x00000005 ((os/kern) failure)
default	17:22:50.547203-0400	debugserver	4 +0.101009 sec [027c/0103]: error: ::task_for_pid ( target_tport = 0x0203, pid = 492, &task ) => err = 0x00000005 ((os/kern) failure) err = ::task_for_pid ( target_tport = 0x0203, pid = 492, &task ) => err = 0x00000005 ((os/kern) failure) (0x00000005)
default	17:22:50.647954-0400	debugserver	[LaunchAttach] (636) about to task_for_pid(492)
default	17:22:50.648099-0400	debugserver	error: [LaunchAttach] MachTask::TaskPortForProcessID task_for_pid(492) failed: ::task_for_pid ( target_tport = 0x0203, pid = 492, &task ) => err = 0x00000005 ((os/kern) failure)
default	17:22:50.648217-0400	debugserver	5 +0.101039 sec [027c/0103]: error: ::task_for_pid ( target_tport = 0x0203, pid = 492, &task ) => err = 0x00000005 ((os/kern) failure) err = ::task_for_pid ( target_tport = 0x0203, pid = 492, &task ) => err = 0x00000005 ((os/kern) failure) (0x00000005)
default	17:22:50.748924-0400	debugserver	[LaunchAttach] (636) about to task_for_pid(492)
default	17:22:50.749072-0400	debugserver	error: [LaunchAttach] MachTask::TaskPortForProcessID task_for_pid(492) failed: ::task_for_pid ( target_tport = 0x0203, pid = 492, &task ) => err = 0x00000005 ((os/kern) failure)
default	17:22:50.749219-0400	debugserver	6 +0.101008 sec [027c/0103]: error: ::task_for_pid ( target_tport = 0x0203, pid = 492, &task ) => err = 0x00000005 ((os/kern) failure) err = ::task_for_pid ( target_tport = 0x0203, pid = 492, &task ) => err = 0x00000005 ((os/kern) failure) (0x00000005)
default	17:22:50.799984-0400	debugserver	[LaunchAttach] (636) about to task_for_pid(492)
default	17:22:50.800132-0400	debugserver	error: [LaunchAttach] MachTask::TaskPortForProcessID task_for_pid(492) failed: ::task_for_pid ( target_tport = 0x0203, pid = 492, &task ) => err = 0x00000005 ((os/kern) failure)
default	17:22:50.800318-0400	debugserver	7 +0.051033 sec [027c/0103]: error: ::task_for_pid ( target_tport = 0x0203, pid = 492, &task ) => err = 0x00000005 ((os/kern) failure) err = ::task_for_pid ( target_tport = 0x0203, pid = 492, &task ) => err = 0x00000005 ((os/kern) failure) (0x00000005)
default	17:22:50.849447-0400	debugserver	[LaunchAttach] (636) about to task_for_pid(492)
default	17:22:50.849597-0400	debugserver	error: [LaunchAttach] MachTask::TaskPortForProcessID task_for_pid(492) failed: ::task_for_pid ( target_tport = 0x0203, pid = 492, &task ) => err = 0x00000005 ((os/kern) failure)
default	17:22:50.849878-0400	debugserver	8 +0.049464 sec [027c/0103]: error: ::task_for_pid ( target_tport = 0x0203, pid = 492, &task ) => err = 0x00000005 ((os/kern) failure) err = ::task_for_pid ( target_tport = 0x0203, pid = 492, &task ) => err = 0x00000005 ((os/kern) failure) (0x00000005)
default	17:22:50.870748-0400	debugserver	[LaunchAttach] (636) about to task_for_pid(492)
default	17:22:50.870893-0400	debugserver	error: [LaunchAttach] MachTask::TaskPortForProcessID task_for_pid(492) failed: ::task_for_pid ( target_tport = 0x0203, pid = 492, &task ) => err = 0x00000005 ((os/kern) failure)
default	17:22:50.871009-0400	debugserver	9 +0.021256 sec [027c/0103]: error: ::task_for_pid ( target_tport = 0x0203, pid = 492, &task ) => err = 0x00000005 ((os/kern) failure) err = ::task_for_pid ( target_tport = 0x0203, pid = 492, &task ) => err = 0x00000005 ((os/kern) failure) (0x00000005)
default	17:22:50.881828-0400	debugserver	[LaunchAttach] (636) about to task_for_pid(492)
default	17:22:50.881973-0400	debugserver	error: [LaunchAttach] MachTask::TaskPortForProcessID task_for_pid(492) failed: ::task_for_pid ( target_tport = 0x0203, pid = 492, &task ) => err = 0x00000005 ((os/kern) failure)
default	17:22:50.882107-0400	debugserver	10 +0.011081 sec [027c/0103]: error: ::task_for_pid ( target_tport = 0x0203, pid = 492, &task ) => err = 0x00000005 ((os/kern) failure) err = ::task_for_pid ( target_tport = 0x0203, pid = 492, &task ) => err = 0x00000005 ((os/kern) failure) (0x00000005)
default	17:22:50.924557-0400	debugserver	error: MachTask::StartExceptionThread (): task invalid, exception thread start failed.
default	17:22:50.924746-0400	debugserver	error: [LaunchAttach] END (636) MachProcess::AttachForDebug failed to start exception thread attaching to pid 492: unable to start the exception thread
default	17:23:04.137403-0400	debugserver	debugserver will use ASL for internal logging.
default	17:23:04.141069-0400	debugserver	1 +0.000000 sec [027d/0103]: error: ::posix_spawnp ( pid => 0, path = '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.uCDlik/usr/bin/hello', file_actions = 0x16af5de90, attr = 0x16af5dea8, argv = 0x106008340, envp = 0x10600c310 ) err = Operation not permitted (0x00000001)
default	17:23:04.141227-0400	debugserver	2 +0.000263 sec [027d/0103]: RNBRunLoopLaunchInferior DNBProcessLaunch() returned error: 'Operation not permitted'
default	17:23:11.201272-0400	debugserver	debugserver will use ASL for internal logging.
default	17:23:11.203728-0400	debugserver	networkd_settings_read_from_file initialized networkd settings by reading plist directly
default	17:23:11.204539-0400	debugserver	networkd_settings_read_from_file initialized networkd settings by reading plist directly
error	17:23:11.206373-0400	kernel	1 duplicate report for Sandbox: debugserver(609) deny(1) process-fork
error	17:23:11.206442-0400	kernel	Sandbox: debugserver(638) deny(1) network-bind*:1921
default	17:23:11.206582-0400	debugserver	1 +0.000000 sec [027e/0103]: ::listen or ::bind failed err = 0x00000000
default	17:23:19.599503-0400	debugserver	debugserver will use ASL for internal logging.
error	17:23:19.602623-0400	kernel	Sandbox: debugserver(639) deny(1) process-fork
default	17:23:19.603013-0400	debugserver	1 +0.000000 sec [027f/0103]: error: ::posix_spawnp ( pid => 0, path = '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.uCDlik/usr/bin/hello', file_actions = 0x16d051e90, attr = 0x16d051ea8, argv = 0x155d08340, envp = 0x155d0c480 ) err = Operation not permitted (0x00000001)
default	17:23:19.603365-0400	debugserver	2 +0.000333 sec [027f/0103]: RNBRunLoopLaunchInferior DNBProcessLaunch() returned error: 'Operation not permitted'
default	17:23:33.424299-0400	debugserver	debugserver will use ASL for internal logging.
default	17:23:33.425683-0400	debugserver	[LaunchAttach] (641) about to task_for_pid(492)
default	17:23:33.425960-0400	debugserver	error: [LaunchAttach] MachTask::TaskPortForProcessID task_for_pid(492) failed: ::task_for_pid ( target_tport = 0x0203, pid = 492, &task ) => err = 0x00000005 ((os/kern) failure)
default	17:23:33.426196-0400	debugserver	1 +0.000000 sec [0281/0103]: error: ::task_for_pid ( target_tport = 0x0203, pid = 492, &task ) => err = 0x00000005 ((os/kern) failure) err = ::task_for_pid ( target_tport = 0x0203, pid = 492, &task ) => err = 0x00000005 ((os/kern) failure) (0x00000005)
default	17:23:33.480108-0400	debugserver	[LaunchAttach] (641) about to task_for_pid(492)
default	17:23:33.480293-0400	debugserver	error: [LaunchAttach] MachTask::TaskPortForProcessID task_for_pid(492) failed: ::task_for_pid ( target_tport = 0x0203, pid = 492, &task ) => err = 0x00000005 ((os/kern) failure)
default	17:23:33.480418-0400	debugserver	2 +0.054414 sec [0281/0103]: error: ::task_for_pid ( target_tport = 0x0203, pid = 492, &task ) => err = 0x00000005 ((os/kern) failure) err = ::task_for_pid ( target_tport = 0x0203, pid = 492, &task ) => err = 0x00000005 ((os/kern) failure) (0x00000005)
default	17:23:33.491111-0400	debugserver	[LaunchAttach] (641) about to task_for_pid(492)
default	17:23:33.491255-0400	debugserver	error: [LaunchAttach] MachTask::TaskPortForProcessID task_for_pid(492) failed: ::task_for_pid ( target_tport = 0x0203, pid = 492, &task ) => err = 0x00000005 ((os/kern) failure)
default	17:23:33.491373-0400	debugserver	3 +0.010930 sec [0281/0103]: error: ::task_for_pid ( target_tport = 0x0203, pid = 492, &task ) => err = 0x00000005 ((os/kern) failure) err = ::task_for_pid ( target_tport = 0x0203, pid = 492, &task ) => err = 0x00000005 ((os/kern) failure) (0x00000005)
default	17:23:33.502196-0400	debugserver	[LaunchAttach] (641) about to task_for_pid(492)
default	17:23:33.502346-0400	debugserver	error: [LaunchAttach] MachTask::TaskPortForProcessID task_for_pid(492) failed: ::task_for_pid ( target_tport = 0x0203, pid = 492, &task ) => err = 0x00000005 ((os/kern) failure)
default	17:23:33.502463-0400	debugserver	4 +0.011103 sec [0281/0103]: error: ::task_for_pid ( target_tport = 0x0203, pid = 492, &task ) => err = 0x00000005 ((os/kern) failure) err = ::task_for_pid ( target_tport = 0x0203, pid = 492, &task ) => err = 0x00000005 ((os/kern) failure) (0x00000005)
default	17:23:33.612708-0400	debugserver	[LaunchAttach] (641) about to task_for_pid(492)
default	17:23:33.612859-0400	debugserver	error: [LaunchAttach] MachTask::TaskPortForProcessID task_for_pid(492) failed: ::task_for_pid ( target_tport = 0x0203, pid = 492, &task ) => err = 0x00000005 ((os/kern) failure)
default	17:23:33.612977-0400	debugserver	5 +0.110518 sec [0281/0103]: error: ::task_for_pid ( target_tport = 0x0203, pid = 492, &task ) => err = 0x00000005 ((os/kern) failure) err = ::task_for_pid ( target_tport = 0x0203, pid = 492, &task ) => err = 0x00000005 ((os/kern) failure) (0x00000005)
default	17:23:33.655580-0400	debugserver	[LaunchAttach] (641) about to task_for_pid(492)
default	17:23:33.655731-0400	debugserver	error: [LaunchAttach] MachTask::TaskPortForProcessID task_for_pid(492) failed: ::task_for_pid ( target_tport = 0x0203, pid = 492, &task ) => err = 0x00000005 ((os/kern) failure)
default	17:23:33.655848-0400	debugserver	6 +0.042861 sec [0281/0103]: error: ::task_for_pid ( target_tport = 0x0203, pid = 492, &task ) => err = 0x00000005 ((os/kern) failure) err = ::task_for_pid ( target_tport = 0x0203, pid = 492, &task ) => err = 0x00000005 ((os/kern) failure) (0x00000005)
default	17:23:33.722917-0400	debugserver	[LaunchAttach] (641) about to task_for_pid(492)
default	17:23:33.723064-0400	debugserver	error: [LaunchAttach] MachTask::TaskPortForProcessID task_for_pid(492) failed: ::task_for_pid ( target_tport = 0x0203, pid = 492, &task ) => err = 0x00000005 ((os/kern) failure)
default	17:23:33.723197-0400	debugserver	7 +0.067253 sec [0281/0103]: error: ::task_for_pid ( target_tport = 0x0203, pid = 492, &task ) => err = 0x00000005 ((os/kern) failure) err = ::task_for_pid ( target_tport = 0x0203, pid = 492, &task ) => err = 0x00000005 ((os/kern) failure) (0x00000005)
default	17:23:33.798516-0400	debugserver	[LaunchAttach] (641) about to task_for_pid(492)
default	17:23:33.798789-0400	debugserver	error: [LaunchAttach] MachTask::TaskPortForProcessID task_for_pid(492) failed: ::task_for_pid ( target_tport = 0x0203, pid = 492, &task ) => err = 0x00000005 ((os/kern) failure)
default	17:23:33.799060-0400	debugserver	8 +0.075858 sec [0281/0103]: error: ::task_for_pid ( target_tport = 0x0203, pid = 492, &task ) => err = 0x00000005 ((os/kern) failure) err = ::task_for_pid ( target_tport = 0x0203, pid = 492, &task ) => err = 0x00000005 ((os/kern) failure) (0x00000005)
default	17:23:33.855154-0400	debugserver	[LaunchAttach] (641) about to task_for_pid(492)
default	17:23:33.855299-0400	debugserver	error: [LaunchAttach] MachTask::TaskPortForProcessID task_for_pid(492) failed: ::task_for_pid ( target_tport = 0x0203, pid = 492, &task ) => err = 0x00000005 ((os/kern) failure)
default	17:23:33.855418-0400	debugserver	9 +0.056449 sec [0281/0103]: error: ::task_for_pid ( target_tport = 0x0203, pid = 492, &task ) => err = 0x00000005 ((os/kern) failure) err = ::task_for_pid ( target_tport = 0x0203, pid = 492, &task ) => err = 0x00000005 ((os/kern) failure) (0x00000005)
default	17:23:33.866178-0400	debugserver	[LaunchAttach] (641) about to task_for_pid(492)
default	17:23:33.866323-0400	debugserver	error: [LaunchAttach] MachTask::TaskPortForProcessID task_for_pid(492) failed: ::task_for_pid ( target_tport = 0x0203, pid = 492, &task ) => err = 0x00000005 ((os/kern) failure)
default	17:23:33.866441-0400	debugserver	10 +0.011025 sec [0281/0103]: error: ::task_for_pid ( target_tport = 0x0203, pid = 492, &task ) => err = 0x00000005 ((os/kern) failure) err = ::task_for_pid ( target_tport = 0x0203, pid = 492, &task ) => err = 0x00000005 ((os/kern) failure) (0x00000005)
default	17:23:33.877352-0400	debugserver	error: MachTask::StartExceptionThread (): task invalid, exception thread start failed.
default	17:23:33.877494-0400	debugserver	error: [LaunchAttach] END (641) MachProcess::AttachForDebug failed to start exception thread attaching to pid 492: unable to start the exception thread
default	17:40:30.079682-0400	debugserver	debugserver will use ASL for internal logging.
error	17:40:30.083488-0400	kernel	Sandbox: debugserver(666) deny(1) process-fork
default	17:40:30.083986-0400	debugserver	1 +0.000000 sec [029a/0103]: error: ::posix_spawnp ( pid => 0, path = '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.D3MTji/usr/bin/hello', file_actions = 0x16b059ed0, attr = 0x16b059ee8, argv = 0x106004210, envp = 0x1060043a0 ) err = Operation not permitted (0x00000001)
default	17:40:30.084086-0400	debugserver	2 +0.000194 sec [029a/0103]: RNBRunLoopLaunchInferior DNBProcessLaunch() returned error: 'Operation not permitted'
default	17:46:49.870857-0400	debugserver	debugserver will use ASL for internal logging.
error	17:46:49.873629-0400	kernel	Sandbox: debugserver(683) deny(1) process-fork
default	17:46:49.873919-0400	debugserver	1 +0.000000 sec [02ab/0103]: error: ::posix_spawnp ( pid => 0, path = '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.oxSZXn/usr/bin/hello', file_actions = 0x16f5a1e90, attr = 0x16f5a1ea8, argv = 0x101a041e0, envp = 0x101a043d0 ) err = Operation not permitted (0x00000001)
default	17:46:49.873997-0400	debugserver	2 +0.000143 sec [02ab/0103]: RNBRunLoopLaunchInferior DNBProcessLaunch() returned error: 'Operation not permitted'
default	17:47:14.542088-0400	debugserver	debugserver will use ASL for internal logging.
default	17:47:14.544521-0400	debugserver	networkd_settings_read_from_file initialized networkd settings by reading plist directly
default	17:47:14.545396-0400	debugserver	networkd_settings_read_from_file initialized networkd settings by reading plist directly
error	17:47:14.547108-0400	kernel	Sandbox: debugserver(684) deny(1) network-bind*:1921
default	17:47:14.547333-0400	debugserver	1 +0.000000 sec [02ac/0103]: ::listen or ::bind failed err = 0x00000000
default	17:47:30.107094-0400	debugserver	debugserver will use ASL for internal logging.
default	17:47:30.108309-0400	debugserver	[LaunchAttach] (687) about to task_for_pid(673)
default	17:47:30.108458-0400	debugserver	error: [LaunchAttach] MachTask::TaskPortForProcessID task_for_pid(673) failed: ::task_for_pid ( target_tport = 0x0203, pid = 673, &task ) => err = 0x00000005 ((os/kern) failure)
default	17:47:30.108604-0400	debugserver	1 +0.000000 sec [02af/0103]: error: ::task_for_pid ( target_tport = 0x0203, pid = 673, &task ) => err = 0x00000005 ((os/kern) failure) err = ::task_for_pid ( target_tport = 0x0203, pid = 673, &task ) => err = 0x00000005 ((os/kern) failure) (0x00000005)
default	17:47:30.185908-0400	debugserver	[LaunchAttach] (687) about to task_for_pid(673)
default	17:47:30.186244-0400	debugserver	error: [LaunchAttach] MachTask::TaskPortForProcessID task_for_pid(673) failed: ::task_for_pid ( target_tport = 0x0203, pid = 673, &task ) => err = 0x00000005 ((os/kern) failure)
default	17:47:30.186415-0400	debugserver	2 +0.077632 sec [02af/0103]: error: ::task_for_pid ( target_tport = 0x0203, pid = 673, &task ) => err = 0x00000005 ((os/kern) failure) err = ::task_for_pid ( target_tport = 0x0203, pid = 673, &task ) => err = 0x00000005 ((os/kern) failure) (0x00000005)
default	17:47:30.212564-0400	debugserver	[LaunchAttach] (687) about to task_for_pid(673)
default	17:47:30.212714-0400	debugserver	error: [LaunchAttach] MachTask::TaskPortForProcessID task_for_pid(673) failed: ::task_for_pid ( target_tport = 0x0203, pid = 673, &task ) => err = 0x00000005 ((os/kern) failure)
default	17:47:30.212862-0400	debugserver	3 +0.026582 sec [02af/0103]: error: ::task_for_pid ( target_tport = 0x0203, pid = 673, &task ) => err = 0x00000005 ((os/kern) failure) err = ::task_for_pid ( target_tport = 0x0203, pid = 673, &task ) => err = 0x00000005 ((os/kern) failure) (0x00000005)
default	17:47:30.223603-0400	debugserver	[LaunchAttach] (687) about to task_for_pid(673)
default	17:47:30.223751-0400	debugserver	error: [LaunchAttach] MachTask::TaskPortForProcessID task_for_pid(673) failed: ::task_for_pid ( target_tport = 0x0203, pid = 673, &task ) => err = 0x00000005 ((os/kern) failure)
default	17:47:30.223875-0400	debugserver	4 +0.011053 sec [02af/0103]: error: ::task_for_pid ( target_tport = 0x0203, pid = 673, &task ) => err = 0x00000005 ((os/kern) failure) err = ::task_for_pid ( target_tport = 0x0203, pid = 673, &task ) => err = 0x00000005 ((os/kern) failure) (0x00000005)
default	17:47:30.234685-0400	debugserver	[LaunchAttach] (687) about to task_for_pid(673)
default	17:47:30.234831-0400	debugserver	error: [LaunchAttach] MachTask::TaskPortForProcessID task_for_pid(673) failed: ::task_for_pid ( target_tport = 0x0203, pid = 673, &task ) => err = 0x00000005 ((os/kern) failure)
default	17:47:30.235039-0400	debugserver	5 +0.011123 sec [02af/0103]: error: ::task_for_pid ( target_tport = 0x0203, pid = 673, &task ) => err = 0x00000005 ((os/kern) failure) err = ::task_for_pid ( target_tport = 0x0203, pid = 673, &task ) => err = 0x00000005 ((os/kern) failure) (0x00000005)
default	17:47:30.345509-0400	debugserver	[LaunchAttach] (687) about to task_for_pid(673)
default	17:47:30.345662-0400	debugserver	error: [LaunchAttach] MachTask::TaskPortForProcessID task_for_pid(673) failed: ::task_for_pid ( target_tport = 0x0203, pid = 673, &task ) => err = 0x00000005 ((os/kern) failure)
default	17:47:30.345808-0400	debugserver	6 +0.110646 sec [02af/0103]: error: ::task_for_pid ( target_tport = 0x0203, pid = 673, &task ) => err = 0x00000005 ((os/kern) failure) err = ::task_for_pid ( target_tport = 0x0203, pid = 673, &task ) => err = 0x00000005 ((os/kern) failure) (0x00000005)
default	17:47:30.433329-0400	debugserver	[LaunchAttach] (687) about to task_for_pid(673)
default	17:47:30.433478-0400	debugserver	error: [LaunchAttach] MachTask::TaskPortForProcessID task_for_pid(673) failed: ::task_for_pid ( target_tport = 0x0203, pid = 673, &task ) => err = 0x00000005 ((os/kern) failure)
default	17:47:30.433597-0400	debugserver	7 +0.087964 sec [02af/0103]: error: ::task_for_pid ( target_tport = 0x0203, pid = 673, &task ) => err = 0x00000005 ((os/kern) failure) err = ::task_for_pid ( target_tport = 0x0203, pid = 673, &task ) => err = 0x00000005 ((os/kern) failure) (0x00000005)
default	17:47:30.534362-0400	debugserver	[LaunchAttach] (687) about to task_for_pid(673)
default	17:47:30.534507-0400	debugserver	error: [LaunchAttach] MachTask::TaskPortForProcessID task_for_pid(673) failed: ::task_for_pid ( target_tport = 0x0203, pid = 673, &task ) => err = 0x00000005 ((os/kern) failure)
default	17:47:30.534763-0400	debugserver	8 +0.101065 sec [02af/0103]: error: ::task_for_pid ( target_tport = 0x0203, pid = 673, &task ) => err = 0x00000005 ((os/kern) failure) err = ::task_for_pid ( target_tport = 0x0203, pid = 673, &task ) => err = 0x00000005 ((os/kern) failure) (0x00000005)
default	17:47:30.566015-0400	debugserver	[LaunchAttach] (687) about to task_for_pid(673)
default	17:47:30.566162-0400	debugserver	error: [LaunchAttach] MachTask::TaskPortForProcessID task_for_pid(673) failed: ::task_for_pid ( target_tport = 0x0203, pid = 673, &task ) => err = 0x00000005 ((os/kern) failure)
default	17:47:30.566277-0400	debugserver	9 +0.031600 sec [02af/0103]: error: ::task_for_pid ( target_tport = 0x0203, pid = 673, &task ) => err = 0x00000005 ((os/kern) failure) err = ::task_for_pid ( target_tport = 0x0203, pid = 673, &task ) => err = 0x00000005 ((os/kern) failure) (0x00000005)
default	17:47:30.659693-0400	debugserver	[LaunchAttach] (687) about to task_for_pid(673)
default	17:47:30.659847-0400	debugserver	error: [LaunchAttach] MachTask::TaskPortForProcessID task_for_pid(673) failed: ::task_for_pid ( target_tport = 0x0203, pid = 673, &task ) => err = 0x00000005 ((os/kern) failure)
default	17:47:30.660002-0400	debugserver	10 +0.093688 sec [02af/0103]: error: ::task_for_pid ( target_tport = 0x0203, pid = 673, &task ) => err = 0x00000005 ((os/kern) failure) err = ::task_for_pid ( target_tport = 0x0203, pid = 673, &task ) => err = 0x00000005 ((os/kern) failure) (0x00000005)
default	17:47:30.709997-0400	debugserver	error: MachTask::StartExceptionThread (): task invalid, exception thread start failed.
default	17:47:30.710146-0400	debugserver	error: [LaunchAttach] END (687) MachProcess::AttachForDebug failed to start exception thread attaching to pid 673: unable to start the exception thread

```

# Result 3
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
