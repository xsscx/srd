# iPhone 11 Register Fuzzing on the Apple Security Research Device as 'root' from the cryptex

CAVEAT: User = root and I'm Side-loading executable code onto the device with arbitrary entitlements at the same permission level as Apple operating system components.
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
RESULT
------
SIGILL

Full Report to Follow.....
