# debugserver for Apple Security Research Device

11 JAN 2022 - Read more at URL https://srd.cx/debugserver-installation-configuration/
```
(lldb) image dump sections
Dumping sections for 2 modules.
Sections for '/private/var/run/com.apple.security.cryptexd/mnt/com.example.cryptex.OjRKMf/usr/bin/hello(0x0000000104b50000)' (arm64e):
  SectID     Type             Load Address                             Perm File Off.  File Size  Flags      Section Name
  ---------- ---------------- ---------------------------------------  ---- ---------- ---------- ---------- ----------------------------
  0x00000100 container        [0x0000000000000000-0x0000000100000000)* ---  0x00000000 0x00000000 0x00000000 hello.__PAGEZERO
  0x00000200 container        [0x0000000104b50000-0x0000000104b5c000)  r-x  0x00000000 0x0000c000 0x00000000 hello.__TEXT
  0x00000001 code             [0x0000000104b5794c-0x0000000104b57d6c)  r-x  0x0000794c 0x00000420 0x80000400 hello.__TEXT.__text
  0x00000002 code             [0x0000000104b57d6c-0x0000000104b57e3c)  r-x  0x00007d6c 0x000000d0 0x80000408 hello.__TEXT.__auth_stubs
  0x00000003 regular          [0x0000000104b57e3c-0x0000000104b57e40)  r-x  0x00007e3c 0x00000004 0x00000016 hello.__TEXT.__init_offsets
  0x00000004 regular          [0x0000000104b57e40-0x0000000104b57f00)  r-x  0x00007e40 0x000000c0 0x00000000 hello.__TEXT.__asan_cstring
  0x00000005 data-cstr        [0x0000000104b57f00-0x0000000104b57f2f)  r-x  0x00007f00 0x0000002f 0x00000002 hello.__TEXT.__cstring
  0x00000006 regular          [0x0000000104b57f2f-0x0000000104b57f37)  r-x  0x00007f2f 0x00000008 0x00000000 hello.__TEXT.__const
  0x00000007 compact-unwind   [0x0000000104b57f38-0x0000000104b57f98)  r-x  0x00007f38 0x00000060 0x00000000 hello.__TEXT.__unwind_info
  0x00000008 eh-frame         [0x0000000104b57f98-0x0000000104b57fec)  r-x  0x00007f98 0x00000054 0x00000000 hello.__TEXT.__eh_frame
  0x00000009 data-cstr        [0x0000000104b58000-0x0000000104b5801e)  r-x  0x00008000 0x0000001e 0x00000002 hello.__TEXT.__oslogstring
  0x00000300 container        [0x0000000104b5c000-0x0000000104b60000)  rw-  0x0000c000 0x00004000 0x00000010 hello.__DATA_CONST
  0x0000000a data-ptrs        [0x0000000104b5c000-0x0000000104b5c068)  rw-  0x0000c000 0x00000068 0x00000006 hello.__DATA_CONST.__auth_got
  0x0000000b data-ptrs        [0x0000000104b5c068-0x0000000104b5c080)  rw-  0x0000c068 0x00000018 0x00000006 hello.__DATA_CONST.__got
  0x0000000c data-ptrs        [0x0000000104b5c080-0x0000000104b5c088)  rw-  0x0000c080 0x00000008 0x0000000a hello.__DATA_CONST.__mod_term_func
  0x0000000d regular          [0x0000000104b5c088-0x0000000104b5c0b8)  rw-  0x0000c088 0x00000030 0x00000000 hello.__DATA_CONST.__const
  0x00000400 container        [0x0000000104b60000-0x0000000104b64000)  rw-  0x00010000 0x00004000 0x00000000 hello.__DATA
  0x0000000e regular          [0x0000000104b60000-0x0000000104b600c0)  rw-  0x00010000 0x000000c0 0x00000000 hello.__DATA.__asan_globals
  0x0000000f regular          [0x0000000104b600c0-0x0000000104b600f0)  rw-  0x000100c0 0x00000030 0x00000000 hello.__DATA.__asan_liveness
  0x00000010 zero-fill        [0x0000000104b600f0-0x0000000104b600f8)  rw-  0x00000000 0x00000000 0x00000001 hello.__DATA.__common
  0x00000500 container        [0x0000000104b64000-0x0000000104b6c000)  r--  0x00014000 0x00005150 0x00000000 hello.__LINKEDIT
Sections for '/Users/xss/Library/Developer/Xcode/iOS DeviceSupport/15.1 (19B74) arm64e/Symbols/usr/lib/dyld' (arm64e):
  SectID     Type             Load Address                             Perm File Off.  File Size  Flags      Section Name
  ---------- ---------------- ---------------------------------------  ---- ---------- ---------- ---------- ----------------------------
  0x00000100 container        [0x0000000104f40000-0x0000000104f98000)  r-x  0x00000000 0x00058000 0x00000000 dyld.__TEXT
  0x00000001 code             [0x0000000104f41000-0x0000000104f8dd90)  r-x  0x00001000 0x0004cd90 0x80000400 dyld.__TEXT.__text
  0x00000002 regular          [0x0000000104f8dd90-0x0000000104f8ec50)  r-x  0x0004dd90 0x00000ec0 0x00000000 dyld.__TEXT.__const
  0x00000003 data-cstr        [0x0000000104f8ec50-0x0000000104f971b4)  r-x  0x0004ec50 0x00008564 0x00000002 dyld.__TEXT.__cstring
  0x00000004 compact-unwind   [0x0000000104f971b4-0x0000000104f974c8)  r-x  0x000571b4 0x00000314 0x00000000 dyld.__TEXT.__unwind_info
  0x00000200 container        [0x0000000104f98000-0x0000000104fa4000)  rw-  0x00058000 0x0000c000 0x00000010 dyld.__DATA_CONST
  0x00000005 regular          [0x0000000104f98000-0x0000000104f98070)  rw-  0x00058000 0x00000070 0x00000000 dyld.__DATA_CONST.__auth_ptr
  0x00000006 regular          [0x0000000104f98070-0x0000000104f9bc58)  rw-  0x00058070 0x00003be8 0x00000000 dyld.__DATA_CONST.__const
  0x00000007 regular          [0x0000000104f9bc58-0x0000000104fa3c58)  rw-  0x0005bc58 0x00008000 0x00000000 dyld.__DATA_CONST.__bss
  0x00000300 container        [0x0000000104fa4000-0x0000000104fa8000)  rw-  0x00064000 0x00004000 0x00000000 dyld.__DATA
  0x00000008 data             [0x0000000104fa4000-0x0000000104fa413c)  rw-  0x00064000 0x0000013c 0x00000000 dyld.__DATA.__data
  0x00000009 regular          [0x0000000104fa4140-0x0000000104fa42b0)  rw-  0x00064140 0x00000170 0x00000000 dyld.__DATA.__all_image_info
  0x0000000a regular          [0x0000000104fa42b0-0x0000000104fa42f0)  rw-  0x000642b0 0x00000040 0x00000000 dyld.__DATA.__crash_info
  0x0000000b zero-fill        [0x0000000104fa4300-0x0000000104fa5cf8)  rw-  0x00000000 0x00000000 0x00000001 dyld.__DATA.__common
  0x0000000c zero-fill        [0x0000000104fa5cf8-0x0000000104fa61dc)  rw-  0x00000000 0x00000000 0x00000001 dyld.__DATA.__bss
  0x00000400 container        [0x0000000104fa8000-0x0000000104fe0000)  r--  0x00068000 0x00035410 0x00000000 dyld.__LINKEDIT
(lldb)
```
