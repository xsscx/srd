# Landing for debugserver on Apple Security Research Device 
October 25, 2021: In iOS 15.1 Apple added a new entitlement called research.com.apple.license-to-operate to support Frida and other research tools for the Apple Security Research Device. This entitlement allows tools to bypass the PPL codesigning protections and the usual task-port policies to inject code into any process running on the system (platform and non-platform). 

See URL https://github.com/apple/security-research-device/issues/13
