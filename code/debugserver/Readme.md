# Landing for debugserver on Apple Security Research Device 
October 25, 2021: In iOS 15.1 Apple added a new entitlement called research.com.apple.license-to-operate to support Frida and other research tools for the Apple Security Research Device. This entitlement allows tools to bypass the PPL codesigning protections and the usual task-port policies to inject code into any process running on the system (platform and non-platform). Unfortunately, this doesn't work due to a number of issues.


IPSW == iPhone11,8,iPhone12,1_15.2_19C5026i_Restore.ipsw
# FB9737956 | SRD | Entitlement: research_com_apple.license-to-operate | User Experience (UX): Features Unavailable | Reason: Quality Assurance 
```
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/ PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
        <key>research.com.apple.license-to-operate</key> <true/>
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
# Datapoints
APPLE: See Issue #4: https://github.com/xsscx/srd/issues/4

See URL https://srd.cx/debugserver-installation-configuration/ 

See URL https://github.com/frida/frida-core/pull/400
