# Hello! Makefile contains ASAN and libgmalloc.dylib example

In this example we compile a simple binary that prints to
stdout and to the system log, and install a service to
run it again and again.

You can view this log from the Console application on your
Mac.

The binary is compiled and ad-hoc signed, then placed
into `/usr/bin` inside the cryptex. The
[launchd plist](hello.plist) is placed into
`/Library/LaunchDaemons` in the cryptex and will keep
starting `hello`.
