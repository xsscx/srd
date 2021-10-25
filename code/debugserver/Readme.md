# Landing for debugserver on Apple Security Research Device 

See URL https://srd.cx/debugserver-installation-configuration/ 

See URL https://github.com/frida/frida-core/pull/400

## UPDATED: October 26, 2021: debugserver with updated entitlement research.com.apple.license-to-operate

```
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/ PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
        <key>com.apple.springboard.debugapplications</key> <true/>
        <key>research.com.apple.license-to-operate</key> <true/>
        <key>run-unsigned-code</key>
        <true/>
        <key>get-task-allow</key>
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
