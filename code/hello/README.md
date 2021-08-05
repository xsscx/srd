# Hello!

This is the landing page for Feedback FB9289266

In this example we compile a simple binary that prints to
stdout and to the system log, and install a service to
run it again and again. The Makefile contains examples
for ASAN, UBSAN & other Sanitizers.

You can view this log from the Console application on your
Mac.

The binary is compiled and ad-hoc signed, then placed
into `/usr/bin` inside the cryptex. The
[launchd plist](hello.plist) is placed into
`/Library/LaunchDaemons` in the cryptex and will keep
starting `hello`.

** Updated with Information from Apple Feedback

This Makefile is a work in progress.

Big THANK YOU to the person at Apple who is handling this Feedback Report... A+ information conveyed to Cohort.

This Directory will be the placeholder for the verified working example of hello.c for ASAN and UBSAN.

PR's welcome!

Updated Thrusday August 5, 2021 by DHOYT
