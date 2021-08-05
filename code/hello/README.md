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

This is the current work-in-progress status of implementing the Sanitizers..
```
Date/Time:           2021-08-04 17:15:36.3220 -0400
Launch Time:         2021-08-04 17:15:36.2873 -0400
OS Version:          iPhone OS 14.7.1 (18G82)
Release Type:        User
Baseband Version:    2.05.01
Report Version:      104

Exception Type:  EXC_CRASH (SIGABRT)
Exception Codes: 0x0000000000000000, 0x0000000000000000
Exception Note:  EXC_CORPSE_NOTIFY
Termination Reason: DYLD; [1]
dyld: Using shared cache: 7E549C44-E1FA-3857-8557-930654B7D002
dependent dylib '@rpath/libclang_rt.ubsan_ios_dynamic.dylib' not found for '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.MxTb9f/usr/bin/hello', tried but didn't find: '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.MxTb9f/usr/bin//libclang_rt.ubsan_ios_dynamic.dylib' '/Applications/Xcode-beta.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/13.0.0/lib/darwin/libclang_rt.ubsan_ios_dynamic.dylib' '@rpath/libclang_rt.ubsan_ios_dynamic.dylib' '/usr/local/lib/libclang_rt.ubsan_ios_dynamic.dylib' '/usr/lib/libclang_rt.ubsan_ios_dynamic.dylib'

Highlighted by Thread:  0

Backtrace not available

No thread state (register information) available

Binary Images:
Binary images description not available

Error Formulating Crash Report:_dyld_process_info_create failed with 6
Failed to create CSSymbolicatorRef - corpse still valid ¯\_(ツ)_/¯
Failed to extract dyld error info: The size of the data is not what is expected

EOF

```
```
 nm -a src/hello/hello
0000000100007e40 s _.str
0000000100007e80 s _.str.1
0000000100007ec0 s _.str.2
00000001000100f0 s ____asan_globals_registered
00000001000100c0 s ___asan_binder_.str
00000001000100d0 s ___asan_binder_.str.1
00000001000100e0 s ___asan_binder_.str.2
0000000100010000 s ___asan_global_.str
0000000100010040 s ___asan_global_.str.1
0000000100010080 s ___asan_global_.str.2
                 U ___asan_init
                 U ___asan_option_detect_stack_use_after_return
                 U ___asan_register_image_globals
                 U ___asan_report_store1
                 U ___asan_report_store4
                 U ___asan_shadow_memory_dynamic_address
                 U ___asan_stack_malloc_0
                 U ___asan_unregister_image_globals
                 U ___asan_version_mismatch_check_apple_clang_1300
0000000100007b84 t ___os_log_helper_16_0_1_4_0
                 U ___stack_chk_fail
                 U ___stack_chk_guard
0000000100000000 T __mh_execute_header
                 U __os_log_impl
0000000100007d24 t _asan.module_ctor
0000000100007d54 t _asan.module_dtor
                 U _getpid
000000010000794c T _main
                 U _os_log_create
                 U _os_log_type_enabled
                 U _printf
```
```
otool -l src/hello/hello
src/hello/hello:
Load command 0
      cmd LC_SEGMENT_64
  cmdsize 72
  segname __PAGEZERO
   vmaddr 0x0000000000000000
   vmsize 0x0000000100000000
  fileoff 0
 filesize 0
  maxprot 0x00000000
 initprot 0x00000000
   nsects 0
    flags 0x0
Load command 1
      cmd LC_SEGMENT_64
  cmdsize 792
  segname __TEXT
   vmaddr 0x0000000100000000
   vmsize 0x000000000000c000
  fileoff 0
 filesize 49152
  maxprot 0x00000005
 initprot 0x00000005
   nsects 9
    flags 0x0
Section
  sectname __text
   segname __TEXT
      addr 0x000000010000794c
      size 0x0000000000000420
    offset 31052
     align 2^2 (4)
    reloff 0
    nreloc 0
     flags 0x80000400
 reserved1 0
 reserved2 0
Section
  sectname __auth_stubs
   segname __TEXT
      addr 0x0000000100007d6c
      size 0x00000000000000d0
    offset 32108
     align 2^2 (4)
    reloff 0
    nreloc 0
     flags 0x80000408
 reserved1 0 (index into indirect symbol table)
 reserved2 16 (size of stubs)
Section
  sectname __init_offsets
   segname __TEXT
      addr 0x0000000100007e3c
      size 0x0000000000000004
    offset 32316
     align 2^2 (4)
    reloff 0
    nreloc 0
     flags 0x00000016
 reserved1 0
 reserved2 0
Section
  sectname __asan_cstring
   segname __TEXT
      addr 0x0000000100007e40
      size 0x00000000000000c0
    offset 32320
     align 2^5 (32)
    reloff 0
    nreloc 0
     flags 0x00000000
 reserved1 0
 reserved2 0
Section
  sectname __cstring
   segname __TEXT
      addr 0x0000000100007f00
      size 0x000000000000002f
    offset 32512
     align 2^0 (1)
    reloff 0
    nreloc 0
     flags 0x00000002
 reserved1 0
 reserved2 0
Section
  sectname __const
   segname __TEXT
      addr 0x0000000100007f2f
      size 0x0000000000000008
    offset 32559
     align 2^0 (1)
    reloff 0
    nreloc 0
     flags 0x00000000
 reserved1 0
 reserved2 0
Section
  sectname __unwind_info
   segname __TEXT
      addr 0x0000000100007f38
      size 0x0000000000000060
    offset 32568
     align 2^2 (4)
    reloff 0
    nreloc 0
     flags 0x00000000
 reserved1 0
 reserved2 0
Section
  sectname __eh_frame
   segname __TEXT
      addr 0x0000000100007f98
      size 0x0000000000000054
    offset 32664
     align 2^3 (8)
    reloff 0
    nreloc 0
     flags 0x00000000
 reserved1 0
 reserved2 0
Section
  sectname __oslogstring
   segname __TEXT
      addr 0x0000000100008000
      size 0x000000000000001e
    offset 32768
     align 2^14 (16384)
    reloff 0
    nreloc 0
     flags 0x00000002
 reserved1 0
 reserved2 0
Load command 2
      cmd LC_SEGMENT_64
  cmdsize 392
  segname __DATA_CONST
   vmaddr 0x000000010000c000
   vmsize 0x0000000000004000
  fileoff 49152
 filesize 16384
  maxprot 0x00000003
 initprot 0x00000003
   nsects 4
    flags 0x10
Section
  sectname __auth_got
   segname __DATA_CONST
      addr 0x000000010000c000
      size 0x0000000000000068
    offset 49152
     align 2^3 (8)
    reloff 0
    nreloc 0
     flags 0x00000006
 reserved1 13 (index into indirect symbol table)
 reserved2 0
Section
  sectname __got
   segname __DATA_CONST
      addr 0x000000010000c068
      size 0x0000000000000018
    offset 49256
     align 2^3 (8)
    reloff 0
    nreloc 0
     flags 0x00000006
 reserved1 26 (index into indirect symbol table)
 reserved2 0
Section
  sectname __mod_term_func
   segname __DATA_CONST
      addr 0x000000010000c080
      size 0x0000000000000008
    offset 49280
     align 2^3 (8)
    reloff 0
    nreloc 0
     flags 0x0000000a
 reserved1 0
 reserved2 0
Section
  sectname __const
   segname __DATA_CONST
      addr 0x000000010000c088
      size 0x0000000000000030
    offset 49288
     align 2^3 (8)
    reloff 0
    nreloc 0
     flags 0x00000000
 reserved1 0
 reserved2 0
Load command 3
      cmd LC_SEGMENT_64
  cmdsize 312
  segname __DATA
   vmaddr 0x0000000100010000
   vmsize 0x0000000000004000
  fileoff 65536
 filesize 16384
  maxprot 0x00000003
 initprot 0x00000003
   nsects 3
    flags 0x0
Section
  sectname __asan_globals
   segname __DATA
      addr 0x0000000100010000
      size 0x00000000000000c0
    offset 65536
     align 2^4 (16)
    reloff 0
    nreloc 0
     flags 0x00000000
 reserved1 0
 reserved2 0
Section
  sectname __asan_liveness
   segname __DATA
      addr 0x00000001000100c0
      size 0x0000000000000030
    offset 65728
     align 2^3 (8)
    reloff 0
    nreloc 0
     flags 0x00000000
 reserved1 0
 reserved2 0
Section
  sectname __common
   segname __DATA
      addr 0x00000001000100f0
      size 0x0000000000000008
    offset 0
     align 2^3 (8)
    reloff 0
    nreloc 0
     flags 0x00000001
 reserved1 0
 reserved2 0
Load command 4
      cmd LC_SEGMENT_64
  cmdsize 72
  segname __LINKEDIT
   vmaddr 0x0000000100014000
   vmsize 0x0000000000008000
  fileoff 81920
 filesize 20816
  maxprot 0x00000001
 initprot 0x00000001
   nsects 0
    flags 0x0
Load command 5
      cmd LC_DYLD_CHAINED_FIXUPS
  cmdsize 16
  dataoff 81920
 datasize 552
Load command 6
      cmd LC_DYLD_EXPORTS_TRIE
  cmdsize 16
  dataoff 82472
 datasize 48
Load command 7
     cmd LC_SYMTAB
 cmdsize 24
  symoff 82536
   nsyms 31
  stroff 83152
 strsize 648
Load command 8
            cmd LC_DYSYMTAB
        cmdsize 80
      ilocalsym 0
      nlocalsym 13
     iextdefsym 13
     nextdefsym 2
      iundefsym 15
      nundefsym 16
         tocoff 0
           ntoc 0
      modtaboff 0
        nmodtab 0
   extrefsymoff 0
    nextrefsyms 0
 indirectsymoff 83032
  nindirectsyms 29
      extreloff 0
        nextrel 0
      locreloff 0
        nlocrel 0
Load command 9
          cmd LC_LOAD_DYLINKER
      cmdsize 32
         name /usr/lib/dyld (offset 12)
Load command 10
     cmd LC_UUID
 cmdsize 24
    uuid 2597A29E-960C-3C07-B312-9B2B900C3EC7
Load command 11
      cmd LC_BUILD_VERSION
  cmdsize 32
 platform 2
    minos 15.0
      sdk 15.0
   ntools 1
     tool 3
  version 710.1
Load command 12
      cmd LC_SOURCE_VERSION
  cmdsize 16
  version 0.0
Load command 13
       cmd LC_MAIN
   cmdsize 24
  entryoff 31052
 stacksize 0
Load command 14
          cmd LC_ENCRYPTION_INFO_64
      cmdsize 24
     cryptoff 16384
    cryptsize 16384
      cryptid 0
          pad 0
Load command 15
          cmd LC_LOAD_DYLIB
      cmdsize 72
         name @rpath/libclang_rt.asan_ios_dynamic.dylib (offset 24)
   time stamp 2 Wed Dec 31 19:00:02 1969
      current version 0.0.0
compatibility version 0.0.0
Load command 16
          cmd LC_LOAD_DYLIB
      cmdsize 56
         name /usr/lib/libSystem.B.dylib (offset 24)
   time stamp 2 Wed Dec 31 19:00:02 1969
      current version 1311.0.0
compatibility version 1.0.0
Load command 17
          cmd LC_RPATH
      cmdsize 32
         path @executable_path (offset 12)
Load command 18
          cmd LC_RPATH
      cmdsize 128
         path /Applications/Xcode-beta.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/13.0.0/lib/darwin (offset 12)
Load command 19
      cmd LC_FUNCTION_STARTS
  cmdsize 16
  dataoff 82520
 datasize 16
Load command 20
      cmd LC_DATA_IN_CODE
  cmdsize 16
  dataoff 82536
 datasize 0
Load command 21
      cmd LC_CODE_SIGNATURE
  cmdsize 16
  dataoff 83808
 datasize 18928
```
