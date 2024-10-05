# macOS 12.3 Beta 5 | 21E5227a | CoreTrust | AMFI | Magic Number | Malformed Mach-o file | Cryptex

### Error Sample
```
2022-03-01 11:37:10.295422-0500 0xf733c    Error       0x0                  49038  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: fat file: 0xbebafeca: [79: Inappropriate file type or format]
2022-03-01 11:37:10.308664-0500 0xf733c    Error       0x0                  49038  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: fat file: 0xbebafeca: [79: Inappropriate file type or format]
2022-03-01 11:37:10.310252-0500 0xf733c    Error       0x0                  49038  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: fat file: 0xbebafeca: [79: Inappropriate file type or format]
```

### Magic Number Samples
```
hexdump -n 4 hello
0000000 cf fa ed fe

hexdump -n 4 cryptex-run
0000000 cf fa ed fe

hexdump -n 4 debugserver
0000000 ca fe ba be

hexdump -n 4 dropbear
0000000 cf fa ed fe

hexdump -n 4 frida-server
0000000 cf fa ed fe

hexdump -n 4 hello
0000000 cf fa ed fe

hexdump -n 4 nvram
0000000 cf fa ed fe

hexdump -n 4 simple-server
0000000 cf fa ed fe

hexdump -n 4 simple-shell
0000000 cf fa ed fe

hexdump -n 4 toybox
0000000 cf fa ed fe

hexdump -n 4 usr/lib/frida/frida-agent.dylib
0000000 ca fe ba be
```



```
2022-03-01 11:49:37.356385-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:hdi] mntfd fd[11]: type = S_IFDIR, size = 64, flags = <private>, path = <private>
2022-03-01 11:49:37.385362-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:trust-cache] [anonymous]: building trust cache from: <private>
2022-03-01 11:49:37.385686-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:trust-cache] [anonymous]: found regular file: <private>
2022-03-01 11:49:37.385954-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not a mach binary: 0x6d783f3c: [92: Illegal byte sequence]
2022-03-01 11:49:37.386010-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:dyld-cache] [anonymous]: not a dyld shared cache: <private>: [88: Malformed Mach-o file]
2022-03-01 11:49:37.386024-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:trust-cache] [anonymous]: not a shared cache
2022-03-01 11:49:37.386044-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:trust-cache] [anonymous]: found regular file: <private>
2022-03-01 11:49:37.386193-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not a mach binary: 0x6d783f3c: [92: Illegal byte sequence]
2022-03-01 11:49:37.386224-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:dyld-cache] [anonymous]: not a dyld shared cache: <private>: [88: Malformed Mach-o file]
2022-03-01 11:49:37.386235-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:trust-cache] [anonymous]: not a shared cache
2022-03-01 11:49:37.386251-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:trust-cache] [anonymous]: found regular file: <private>
2022-03-01 11:49:37.386372-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not a mach binary: 0x6d783f3c: [92: Illegal byte sequence]
2022-03-01 11:49:37.386403-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:dyld-cache] [anonymous]: not a dyld shared cache: <private>: [88: Malformed Mach-o file]
2022-03-01 11:49:37.386416-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:trust-cache] [anonymous]: not a shared cache
2022-03-01 11:49:37.386448-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:trust-cache] [anonymous]: found regular file: <private>
2022-03-01 11:49:37.386632-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not a mach binary: 0x6d783f3c: [92: Illegal byte sequence]
2022-03-01 11:49:37.386655-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:dyld-cache] [anonymous]: not a dyld shared cache: <private>: [88: Malformed Mach-o file]
2022-03-01 11:49:37.386767-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:trust-cache] [anonymous]: not a shared cache
2022-03-01 11:49:37.386917-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:trust-cache] [anonymous]: found regular file: <private>
2022-03-01 11:49:37.387150-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not a mach binary: 0x6d783f3c: [92: Illegal byte sequence]
2022-03-01 11:49:37.387171-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:dyld-cache] [anonymous]: not a dyld shared cache: <private>: [88: Malformed Mach-o file]
2022-03-01 11:49:37.387240-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:trust-cache] [anonymous]: not a shared cache
2022-03-01 11:49:37.387339-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:trust-cache] [anonymous]: found regular file: <private>
2022-03-01 11:49:37.387572-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not a mach binary: 0x6d783f3c: [92: Illegal byte sequence]
2022-03-01 11:49:37.387605-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:dyld-cache] [anonymous]: not a dyld shared cache: <private>: [88: Malformed Mach-o file]
2022-03-01 11:49:37.387619-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:trust-cache] [anonymous]: not a shared cache
2022-03-01 11:49:37.387667-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:trust-cache] [anonymous]: found regular file: <private>
2022-03-01 11:49:37.387866-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not a mach binary: 0x6d783f3c: [92: Illegal byte sequence]
2022-03-01 11:49:37.387891-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:dyld-cache] [anonymous]: not a dyld shared cache: <private>: [88: Malformed Mach-o file]
2022-03-01 11:49:37.387945-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:trust-cache] [anonymous]: not a shared cache
2022-03-01 11:49:37.391652-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:trust-cache] [anonymous]: found regular file: <private>
2022-03-01 11:49:37.396193-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: initialized header:
    magic = 0xfeedfacf
    cpu type = 0x100000c
    cpu subtype = 0x80000002
    file type = 0x2
    ncmds = 18
    sizeofcmds = 1240
    flags = 0x200085
2022-03-01 11:49:37.396250-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x19
2022-03-01 11:49:37.396262-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x19
2022-03-01 11:49:37.396272-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x19
2022-03-01 11:49:37.396282-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x19
2022-03-01 11:49:37.396291-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x80000034
2022-03-01 11:49:37.396302-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x80000033
2022-03-01 11:49:37.396312-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x2
2022-03-01 11:49:37.396320-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0xb
2022-03-01 11:49:37.396368-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0xe
2022-03-01 11:49:37.396393-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x1b
2022-03-01 11:49:37.396410-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x32
2022-03-01 11:49:37.396453-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x2a
2022-03-01 11:49:37.396488-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x80000028
2022-03-01 11:49:37.396586-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x2c
2022-03-01 11:49:37.396715-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0xc
2022-03-01 11:49:37.396767-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x26
2022-03-01 11:49:37.396817-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x29
2022-03-01 11:49:37.396856-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: found
    ldcmd->cmd = 0x1d
    ldcmd->cmdsize = 16
2022-03-01 11:49:37.396909-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: parsing
    cmd->cmd = 0x1d
    cmd->cmdsize = 16
    cmd->dataoff = 66656
    cmd->datasize = 19504
2022-03-01 11:49:37.397113-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] found code directory: type = 0, off = 52
2022-03-01 11:49:37.397130-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] read code directory header: idx = 0, hash type = 2, csid offset = 88, length = 909
2022-03-01 11:49:37.397140-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] reading code directory: hash type = 2, length = 909
2022-03-01 11:49:37.397171-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] computed digest: <private>
2022-03-01 11:49:37.397230-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] code signing identity: <private>
2022-03-01 11:49:37.397273-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] code directory: identity = <private>, hash = <private>
2022-03-01 11:49:37.397328-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: extracted cdhash: cmd = 0x1d, idx = 17
2022-03-01 11:49:37.397364-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] previously-encountered code directory: superblob idx = 0, last idx = 0, type = 0, off = 52
2022-03-01 11:49:37.397392-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] not a code directory: 0x2
2022-03-01 11:49:37.397429-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] not a code directory: 0x5
2022-03-01 11:49:37.397442-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] not a code directory: 0x7
2022-03-01 11:49:37.397476-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] not a code directory: 0x10000
2022-03-01 11:49:37.397491-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] exhausted cs blobs: cnt = 5
2022-03-01 11:49:37.397581-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: no more cs blobs
2022-03-01 11:49:37.397688-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:trust-cache] [anonymous]: found regular file: <private>
2022-03-01 11:49:37.402822-0500 0xfec8f    Error       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: fat file: 0xbebafeca: [79: Inappropriate file type or format]
2022-03-01 11:49:37.402864-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-fat] [anonymous]: initialized fat header:
        magic = 0xcafebabe
        nfat = 2
2022-03-01 11:49:37.402876-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-fat] [anonymous]: fat file has 2 archs
2022-03-01 11:49:37.402912-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-fat] [anonymous]: found slice: off = 16384, length = 638016
2022-03-01 11:49:37.402955-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: initialized header:
    magic = 0xfeedfacf
    cpu type = 0x100000c
    cpu subtype = 0
    file type = 0x2
    ncmds = 33
    sizeofcmds = 3560
    flags = 0x218085
2022-03-01 11:49:37.402972-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x19
2022-03-01 11:49:37.402982-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x19
2022-03-01 11:49:37.402991-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x19
2022-03-01 11:49:37.403002-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x19
2022-03-01 11:49:37.403062-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x19
2022-03-01 11:49:37.403090-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x80000034
2022-03-01 11:49:37.403167-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x80000033
2022-03-01 11:49:37.403206-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x2
2022-03-01 11:49:37.403272-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0xb
2022-03-01 11:49:37.403315-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0xe
2022-03-01 11:49:37.403358-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x1b
2022-03-01 11:49:37.403415-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x32
2022-03-01 11:49:37.403497-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x2a
2022-03-01 11:49:37.403546-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x80000028
2022-03-01 11:49:37.403566-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0xc
2022-03-01 11:49:37.403587-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0xc
2022-03-01 11:49:37.403607-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0xc
2022-03-01 11:49:37.403628-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0xc
2022-03-01 11:49:37.403678-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0xc
2022-03-01 11:49:37.403703-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0xc
2022-03-01 11:49:37.403745-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0xc
2022-03-01 11:49:37.403802-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0xc
2022-03-01 11:49:37.403849-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0xc
2022-03-01 11:49:37.403897-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0xc
2022-03-01 11:49:37.403954-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0xc
2022-03-01 11:49:37.403973-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0xc
2022-03-01 11:49:37.403994-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0xc
2022-03-01 11:49:37.404015-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0xc
2022-03-01 11:49:37.404092-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0xc
2022-03-01 11:49:37.404102-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0xc
2022-03-01 11:49:37.404118-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x26
2022-03-01 11:49:37.404148-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x29
2022-03-01 11:49:37.404170-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: found
    ldcmd->cmd = 0x1d
    ldcmd->cmdsize = 16
2022-03-01 11:49:37.404193-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: parsing
    cmd->cmd = 0x1d
    cmd->cmdsize = 16
    cmd->dataoff = 613312
    cmd->datasize = 24704
2022-03-01 11:49:37.409515-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] found code directory: type = 0, off = 52
2022-03-01 11:49:37.409596-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] read code directory header: idx = 0, hash type = 2, csid offset = 88, length = 5134
2022-03-01 11:49:37.409619-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] reading code directory: hash type = 2, length = 5134
2022-03-01 11:49:37.409676-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] computed digest: <private>
2022-03-01 11:49:37.409728-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] code signing identity: <private>
2022-03-01 11:49:37.409742-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] code directory: identity = <private>, hash = <private>
2022-03-01 11:49:37.409768-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: extracted cdhash: cmd = 0x1d, idx = 32
2022-03-01 11:49:37.409828-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] previously-encountered code directory: superblob idx = 0, last idx = 0, type = 0, off = 52
2022-03-01 11:49:37.409848-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] not a code directory: 0x2
2022-03-01 11:49:37.409884-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] not a code directory: 0x5
2022-03-01 11:49:37.409985-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] not a code directory: 0x7
2022-03-01 11:49:37.410048-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] not a code directory: 0x10000
2022-03-01 11:49:37.410123-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] exhausted cs blobs: cnt = 5
2022-03-01 11:49:37.410166-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: no more cs blobs
2022-03-01 11:49:37.410232-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-fat] [anonymous]: found slice: off = 655360, length = 658032
2022-03-01 11:49:37.410739-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: initialized header:
    magic = 0xfeedfacf
    cpu type = 0x100000c
    cpu subtype = 0x80000002
    file type = 0x2
    ncmds = 33
    sizeofcmds = 3720
    flags = 0x218085
2022-03-01 11:49:37.410774-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x19
2022-03-01 11:49:37.410795-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x19
2022-03-01 11:49:37.410817-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x19
2022-03-01 11:49:37.410834-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x19
2022-03-01 11:49:37.410853-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x19
2022-03-01 11:49:37.410871-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x80000034
2022-03-01 11:49:37.410888-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x80000033
2022-03-01 11:49:37.410960-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x2
2022-03-01 11:49:37.411048-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0xb
2022-03-01 11:49:37.411120-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0xe
2022-03-01 11:49:37.411198-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x1b
2022-03-01 11:49:37.411217-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x32
2022-03-01 11:49:37.411271-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x2a
2022-03-01 11:49:37.411325-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x80000028
2022-03-01 11:49:37.411408-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0xc
2022-03-01 11:49:37.411445-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0xc
2022-03-01 11:49:37.411489-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0xc
2022-03-01 11:49:37.411522-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0xc
2022-03-01 11:49:37.411596-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0xc
2022-03-01 11:49:37.411648-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0xc
2022-03-01 11:49:37.411672-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0xc
2022-03-01 11:49:37.411705-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0xc
2022-03-01 11:49:37.411759-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0xc
2022-03-01 11:49:37.411787-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0xc
2022-03-01 11:49:37.411804-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0xc
2022-03-01 11:49:37.411877-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0xc
2022-03-01 11:49:37.411979-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0xc
2022-03-01 11:49:37.412008-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0xc
2022-03-01 11:49:37.412084-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0xc
2022-03-01 11:49:37.412123-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0xc
2022-03-01 11:49:37.412211-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x26
2022-03-01 11:49:37.412312-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x29
2022-03-01 11:49:37.412389-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: found
    ldcmd->cmd = 0x1d
    ldcmd->cmdsize = 16
2022-03-01 11:49:37.412410-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: parsing
    cmd->cmd = 0x1d
    cmd->cmdsize = 16
    cmd->dataoff = 633168
    cmd->datasize = 24864
2022-03-01 11:49:37.412851-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] found code directory: type = 0, off = 52
2022-03-01 11:49:37.412884-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] read code directory header: idx = 0, hash type = 2, csid offset = 88, length = 5294
2022-03-01 11:49:37.412902-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] reading code directory: hash type = 2, length = 5294
2022-03-01 11:49:37.413001-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] computed digest: <private>
2022-03-01 11:49:37.413047-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] code signing identity: <private>
2022-03-01 11:49:37.413071-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] code directory: identity = <private>, hash = <private>
2022-03-01 11:49:37.413094-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: extracted cdhash: cmd = 0x1d, idx = 32
2022-03-01 11:49:37.413116-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] previously-encountered code directory: superblob idx = 0, last idx = 0, type = 0, off = 52
2022-03-01 11:49:37.413135-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] not a code directory: 0x2
2022-03-01 11:49:37.413168-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] not a code directory: 0x5
2022-03-01 11:49:37.413268-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] not a code directory: 0x7
2022-03-01 11:49:37.413330-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] not a code directory: 0x10000
2022-03-01 11:49:37.413416-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] exhausted cs blobs: cnt = 5
2022-03-01 11:49:37.413490-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: no more cs blobs
2022-03-01 11:49:37.413712-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:trust-cache] [anonymous]: found regular file: <private>
2022-03-01 11:49:37.420448-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: initialized header:
    magic = 0xfeedfacf
    cpu type = 0x100000c
    cpu subtype = 0x80000002
    file type = 0x2
    ncmds = 19
    sizeofcmds = 1792
    flags = 0x200085
2022-03-01 11:49:37.420473-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x19
2022-03-01 11:49:37.420506-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x19
2022-03-01 11:49:37.420515-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x19
2022-03-01 11:49:37.420523-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x19
2022-03-01 11:49:37.420532-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x19
2022-03-01 11:49:37.420540-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x80000034
2022-03-01 11:49:37.420548-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x80000033
2022-03-01 11:49:37.420556-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x2
2022-03-01 11:49:37.420588-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0xb
2022-03-01 11:49:37.420639-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0xe
2022-03-01 11:49:37.420672-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x1b
2022-03-01 11:49:37.420741-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x32
2022-03-01 11:49:37.420801-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x2a
2022-03-01 11:49:37.420813-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x80000028
2022-03-01 11:49:37.420822-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x2c
2022-03-01 11:49:37.420851-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0xc
2022-03-01 11:49:37.420879-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x26
2022-03-01 11:49:37.420908-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x29
2022-03-01 11:49:37.420991-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: found
    ldcmd->cmd = 0x1d
    ldcmd->cmdsize = 16
2022-03-01 11:49:37.421017-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: parsing
    cmd->cmd = 0x1d
    cmd->cmdsize = 16
    cmd->dataoff = 352080
    cmd->datasize = 21792
2022-03-01 11:49:37.421171-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] found code directory: type = 0, off = 52
2022-03-01 11:49:37.421186-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] read code directory header: idx = 0, hash type = 2, csid offset = 88, length = 3114
2022-03-01 11:49:37.421195-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] reading code directory: hash type = 2, length = 3114
2022-03-01 11:49:37.421214-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] computed digest: <private>
2022-03-01 11:49:37.421227-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] code signing identity: <private>
2022-03-01 11:49:37.421237-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] code directory: identity = <private>, hash = <private>
2022-03-01 11:49:37.421268-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: extracted cdhash: cmd = 0x1d, idx = 18
2022-03-01 11:49:37.421307-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] previously-encountered code directory: superblob idx = 0, last idx = 0, type = 0, off = 52
2022-03-01 11:49:37.421323-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] not a code directory: 0x2
2022-03-01 11:49:37.421343-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] not a code directory: 0x5
2022-03-01 11:49:37.421364-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] not a code directory: 0x7
2022-03-01 11:49:37.421386-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] not a code directory: 0x10000
2022-03-01 11:49:37.421478-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] exhausted cs blobs: cnt = 5
2022-03-01 11:49:37.421514-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: no more cs blobs
2022-03-01 11:49:37.421562-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:trust-cache] [anonymous]: found regular file: <private>
2022-03-01 11:49:37.426484-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: initialized header:
    magic = 0xfeedfacf
    cpu type = 0x100000c
    cpu subtype = 0x80000002
    file type = 0x2
    ncmds = 23
    sizeofcmds = 2728
    flags = 0x200085
2022-03-01 11:49:37.426529-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x19
2022-03-01 11:49:37.426548-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x19
2022-03-01 11:49:37.426575-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x19
2022-03-01 11:49:37.426585-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x19
2022-03-01 11:49:37.426593-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x19
2022-03-01 11:49:37.426601-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x80000034
2022-03-01 11:49:37.426609-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x80000033
2022-03-01 11:49:37.426617-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x2
2022-03-01 11:49:37.426652-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0xb
2022-03-01 11:49:37.426735-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0xe
2022-03-01 11:49:37.426798-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x1b
2022-03-01 11:49:37.426879-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x32
2022-03-01 11:49:37.426899-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x2a
2022-03-01 11:49:37.426986-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x80000028
2022-03-01 11:49:37.427060-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x2c
2022-03-01 11:49:37.427112-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0xc
2022-03-01 11:49:37.427191-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0xc
2022-03-01 11:49:37.427208-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0xc
2022-03-01 11:49:37.427266-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0xc
2022-03-01 11:49:37.427322-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0xc
2022-03-01 11:49:37.427389-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x26
2022-03-01 11:49:37.427464-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x29
2022-03-01 11:49:37.427534-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: found
    ldcmd->cmd = 0x1d
    ldcmd->cmdsize = 16
2022-03-01 11:49:37.427618-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: parsing
    cmd->cmd = 0x1d
    cmd->cmdsize = 16
    cmd->dataoff = 5747376
    cmd->datasize = 82736
2022-03-01 11:49:37.427810-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] found code directory: type = 0, off = 52
2022-03-01 11:49:37.427826-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] read code directory header: idx = 0, hash type = 2, csid offset = 88, length = 45271
2022-03-01 11:49:37.427835-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] reading code directory: hash type = 2, length = 45271
2022-03-01 11:49:37.428139-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] computed digest: <private>
2022-03-01 11:49:37.428160-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] code signing identity: <private>
2022-03-01 11:49:37.428171-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] code directory: identity = <private>, hash = <private>
2022-03-01 11:49:37.428204-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: extracted cdhash: cmd = 0x1d, idx = 22
2022-03-01 11:49:37.428221-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] previously-encountered code directory: superblob idx = 0, last idx = 0, type = 0, off = 52
2022-03-01 11:49:37.428230-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] not a code directory: 0x2
2022-03-01 11:49:37.428237-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] not a code directory: 0x5
2022-03-01 11:49:37.428245-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] not a code directory: 0x7
2022-03-01 11:49:37.428252-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] not a code directory: 0x10000
2022-03-01 11:49:37.428276-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] exhausted cs blobs: cnt = 5
2022-03-01 11:49:37.428334-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: no more cs blobs
2022-03-01 11:49:37.428404-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:trust-cache] [anonymous]: found regular file: <private>
2022-03-01 11:49:37.428564-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: initialized header:
    magic = 0xfeedfacf
    cpu type = 0x100000c
    cpu subtype = 0x80000002
    file type = 0x2
    ncmds = 18
    sizeofcmds = 1240
    flags = 0x200085
2022-03-01 11:49:37.428580-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x19
2022-03-01 11:49:37.428590-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x19
2022-03-01 11:49:37.428618-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x19
2022-03-01 11:49:37.428664-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x19
2022-03-01 11:49:37.428715-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x80000034
2022-03-01 11:49:37.428757-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x80000033
2022-03-01 11:49:37.428802-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x2
2022-03-01 11:49:37.428820-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0xb
2022-03-01 11:49:37.428901-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0xe
2022-03-01 11:49:37.428926-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x1b
2022-03-01 11:49:37.428994-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x32
2022-03-01 11:49:37.429026-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x2a
2022-03-01 11:49:37.429036-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x80000028
2022-03-01 11:49:37.429056-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x2c
2022-03-01 11:49:37.429076-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0xc
2022-03-01 11:49:37.429096-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x26
2022-03-01 11:49:37.429134-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x29
2022-03-01 11:49:37.429174-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: found
    ldcmd->cmd = 0x1d
    ldcmd->cmdsize = 16
2022-03-01 11:49:37.429206-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: parsing
    cmd->cmd = 0x1d
    cmd->cmdsize = 16
    cmd->dataoff = 66192
    cmd->datasize = 18800
2022-03-01 11:49:37.429316-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] found code directory: type = 0, off = 36
2022-03-01 11:49:37.429330-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] read code directory header: idx = 0, hash type = 2, csid offset = 88, length = 743
2022-03-01 11:49:37.429339-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] reading code directory: hash type = 2, length = 743
2022-03-01 11:49:37.429390-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] computed digest: <private>
2022-03-01 11:49:37.429408-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] code signing identity: <private>
2022-03-01 11:49:37.429476-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] code directory: identity = <private>, hash = <private>
2022-03-01 11:49:37.429497-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: extracted cdhash: cmd = 0x1d, idx = 17
2022-03-01 11:49:37.429568-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] previously-encountered code directory: superblob idx = 0, last idx = 0, type = 0, off = 36
2022-03-01 11:49:37.429624-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] not a code directory: 0x2
2022-03-01 11:49:37.429707-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] not a code directory: 0x10000
2022-03-01 11:49:37.429769-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] exhausted cs blobs: cnt = 3
2022-03-01 11:49:37.429841-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: no more cs blobs
2022-03-01 11:49:37.429935-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:trust-cache] [anonymous]: found regular file: <private>
2022-03-01 11:49:37.430132-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: initialized header:
    magic = 0xfeedfacf
    cpu type = 0x100000c
    cpu subtype = 0x80000002
    file type = 0x2
    ncmds = 21
    sizeofcmds = 1576
    flags = 0x200085
2022-03-01 11:49:37.430150-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x19
2022-03-01 11:49:37.430160-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x19
2022-03-01 11:49:37.430208-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x19
2022-03-01 11:49:37.430261-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x19
2022-03-01 11:49:37.430327-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x19
2022-03-01 11:49:37.430413-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x80000034
2022-03-01 11:49:37.430473-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x80000033
2022-03-01 11:49:37.430525-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x2
2022-03-01 11:49:37.430577-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0xb
2022-03-01 11:49:37.430641-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0xe
2022-03-01 11:49:37.430695-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x1b
2022-03-01 11:49:37.430744-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x32
2022-03-01 11:49:37.430803-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x2a
2022-03-01 11:49:37.430863-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x80000028
2022-03-01 11:49:37.430917-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x2c
2022-03-01 11:49:37.430959-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0xc
2022-03-01 11:49:37.431005-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0xc
2022-03-01 11:49:37.431057-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0xc
2022-03-01 11:49:37.431123-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x26
2022-03-01 11:49:37.431167-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x29
2022-03-01 11:49:37.431213-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: found
    ldcmd->cmd = 0x1d
    ldcmd->cmdsize = 16
2022-03-01 11:49:37.431266-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: parsing
    cmd->cmd = 0x1d
    cmd->cmdsize = 16
    cmd->dataoff = 54016
    cmd->datasize = 18704
2022-03-01 11:49:37.431387-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] found code directory: type = 0, off = 36
2022-03-01 11:49:37.431399-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] read code directory header: idx = 0, hash type = 2, csid offset = 88, length = 647
2022-03-01 11:49:37.431407-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] reading code directory: hash type = 2, length = 647
2022-03-01 11:49:37.431472-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] computed digest: <private>
2022-03-01 11:49:37.431532-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] code signing identity: <private>
2022-03-01 11:49:37.431578-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] code directory: identity = <private>, hash = <private>
2022-03-01 11:49:37.431629-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: extracted cdhash: cmd = 0x1d, idx = 20
2022-03-01 11:49:37.431690-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] previously-encountered code directory: superblob idx = 0, last idx = 0, type = 0, off = 36
2022-03-01 11:49:37.431739-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] not a code directory: 0x2
2022-03-01 11:49:37.431784-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] not a code directory: 0x10000
2022-03-01 11:49:37.431835-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] exhausted cs blobs: cnt = 3
2022-03-01 11:49:37.431890-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: no more cs blobs
2022-03-01 11:49:37.431949-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:trust-cache] [anonymous]: found regular file: <private>
2022-03-01 11:49:37.432103-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: initialized header:
    magic = 0xfeedfacf
    cpu type = 0x100000c
    cpu subtype = 0x80000002
    file type = 0x2
    ncmds = 18
    sizeofcmds = 1240
    flags = 0x200085
2022-03-01 11:49:37.432117-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x19
2022-03-01 11:49:37.432126-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x19
2022-03-01 11:49:37.432134-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x19
2022-03-01 11:49:37.432186-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x19
2022-03-01 11:49:37.432230-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x80000034
2022-03-01 11:49:37.432290-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x80000033
2022-03-01 11:49:37.432333-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x2
2022-03-01 11:49:37.432375-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0xb
2022-03-01 11:49:37.432420-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0xe
2022-03-01 11:49:37.432477-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x1b
2022-03-01 11:49:37.432518-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x32
2022-03-01 11:49:37.432568-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x2a
2022-03-01 11:49:37.432615-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x80000028
2022-03-01 11:49:37.432677-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x2c
2022-03-01 11:49:37.432739-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0xc
2022-03-01 11:49:37.432756-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x26
2022-03-01 11:49:37.432814-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x29
2022-03-01 11:49:37.432836-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: found
    ldcmd->cmd = 0x1d
    ldcmd->cmdsize = 16
2022-03-01 11:49:37.432903-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: parsing
    cmd->cmd = 0x1d
    cmd->cmdsize = 16
    cmd->dataoff = 66864
    cmd->datasize = 19504
2022-03-01 11:49:37.433054-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] found code directory: type = 0, off = 52
2022-03-01 11:49:37.433074-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] read code directory header: idx = 0, hash type = 2, csid offset = 88, length = 911
2022-03-01 11:49:37.433100-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] reading code directory: hash type = 2, length = 911
2022-03-01 11:49:37.433200-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] computed digest: <private>
2022-03-01 11:49:37.433241-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] code signing identity: <private>
2022-03-01 11:49:37.433280-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] code directory: identity = <private>, hash = <private>
2022-03-01 11:49:37.433367-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: extracted cdhash: cmd = 0x1d, idx = 17
2022-03-01 11:49:37.433400-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] previously-encountered code directory: superblob idx = 0, last idx = 0, type = 0, off = 52
2022-03-01 11:49:37.433420-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] not a code directory: 0x2
2022-03-01 11:49:37.433479-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] not a code directory: 0x5
2022-03-01 11:49:37.433517-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] not a code directory: 0x7
2022-03-01 11:49:37.433552-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] not a code directory: 0x10000
2022-03-01 11:49:37.433591-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] exhausted cs blobs: cnt = 5
2022-03-01 11:49:37.433669-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: no more cs blobs
2022-03-01 11:49:37.433744-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:trust-cache] [anonymous]: found regular file: <private>
2022-03-01 11:49:37.433905-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: initialized header:
    magic = 0xfeedfacf
    cpu type = 0x100000c
    cpu subtype = 0x80000002
    file type = 0x2
    ncmds = 18
    sizeofcmds = 1240
    flags = 0x200085
2022-03-01 11:49:37.433942-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x19
2022-03-01 11:49:37.433970-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x19
2022-03-01 11:49:37.433982-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x19
2022-03-01 11:49:37.433994-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x19
2022-03-01 11:49:37.434039-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x80000034
2022-03-01 11:49:37.434102-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x80000033
2022-03-01 11:49:37.434143-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x2
2022-03-01 11:49:37.434218-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0xb
2022-03-01 11:49:37.434261-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0xe
2022-03-01 11:49:37.434371-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x1b
2022-03-01 11:49:37.434453-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x32
2022-03-01 11:49:37.434535-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x2a
2022-03-01 11:49:37.434610-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x80000028
2022-03-01 11:49:37.434625-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x2c
2022-03-01 11:49:37.434696-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0xc
2022-03-01 11:49:37.434738-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x26
2022-03-01 11:49:37.434768-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x29
2022-03-01 11:49:37.434821-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: found
    ldcmd->cmd = 0x1d
    ldcmd->cmdsize = 16
2022-03-01 11:49:37.434918-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: parsing
    cmd->cmd = 0x1d
    cmd->cmdsize = 16
    cmd->dataoff = 67248
    cmd->datasize = 19504
2022-03-01 11:49:37.435136-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] found code directory: type = 0, off = 52
2022-03-01 11:49:37.435157-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] read code directory header: idx = 0, hash type = 2, csid offset = 88, length = 910
2022-03-01 11:49:37.435170-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] reading code directory: hash type = 2, length = 910
2022-03-01 11:49:37.435204-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] computed digest: <private>
2022-03-01 11:49:37.435219-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] code signing identity: <private>
2022-03-01 11:49:37.435266-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] code directory: identity = <private>, hash = <private>
2022-03-01 11:49:37.435288-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: extracted cdhash: cmd = 0x1d, idx = 17
2022-03-01 11:49:37.435377-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] previously-encountered code directory: superblob idx = 0, last idx = 0, type = 0, off = 52
2022-03-01 11:49:37.435422-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] not a code directory: 0x2
2022-03-01 11:49:37.435444-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] not a code directory: 0x5
2022-03-01 11:49:37.435504-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] not a code directory: 0x7
2022-03-01 11:49:37.435595-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] not a code directory: 0x10000
2022-03-01 11:49:37.435610-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] exhausted cs blobs: cnt = 5
2022-03-01 11:49:37.435656-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: no more cs blobs
2022-03-01 11:49:37.435701-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:trust-cache] [anonymous]: found regular file: <private>
2022-03-01 11:49:37.435953-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: initialized header:
    magic = 0xfeedfacf
    cpu type = 0x100000c
    cpu subtype = 0x80000002
    file type = 0x2
    ncmds = 23
    sizeofcmds = 1920
    flags = 0x200085
2022-03-01 11:49:37.435976-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x19
2022-03-01 11:49:37.435989-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x19
2022-03-01 11:49:37.435998-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x19
2022-03-01 11:49:37.436006-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x19
2022-03-01 11:49:37.436014-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x19
2022-03-01 11:49:37.436022-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x80000034
2022-03-01 11:49:37.436031-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x80000033
2022-03-01 11:49:37.436039-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x2
2022-03-01 11:49:37.436047-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0xb
2022-03-01 11:49:37.436076-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0xe
2022-03-01 11:49:37.436126-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x1b
2022-03-01 11:49:37.436158-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x32
2022-03-01 11:49:37.436180-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x2a
2022-03-01 11:49:37.436209-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x80000028
2022-03-01 11:49:37.436231-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x2c
2022-03-01 11:49:37.436260-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0xc
2022-03-01 11:49:37.436306-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0xc
2022-03-01 11:49:37.436321-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0xc
2022-03-01 11:49:37.436353-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0xc
2022-03-01 11:49:37.436408-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0xc
2022-03-01 11:49:37.436447-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x26
2022-03-01 11:49:37.436479-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x29
2022-03-01 11:49:37.436523-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: found
    ldcmd->cmd = 0x1d
    ldcmd->cmdsize = 16
2022-03-01 11:49:37.436587-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: parsing
    cmd->cmd = 0x1d
    cmd->cmdsize = 16
    cmd->dataoff = 380752
    cmd->datasize = 22048
2022-03-01 11:49:37.436680-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] found code directory: type = 0, off = 52
2022-03-01 11:49:37.436693-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] read code directory header: idx = 0, hash type = 2, csid offset = 88, length = 3336
2022-03-01 11:49:37.436702-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] reading code directory: hash type = 2, length = 3336
2022-03-01 11:49:37.436721-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] computed digest: <private>
2022-03-01 11:49:37.436748-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] code signing identity: <private>
2022-03-01 11:49:37.436762-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] code directory: identity = <private>, hash = <private>
2022-03-01 11:49:37.436775-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: extracted cdhash: cmd = 0x1d, idx = 22
2022-03-01 11:49:37.436803-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] previously-encountered code directory: superblob idx = 0, last idx = 0, type = 0, off = 52
2022-03-01 11:49:37.436824-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] not a code directory: 0x2
2022-03-01 11:49:37.436849-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] not a code directory: 0x5
2022-03-01 11:49:37.436894-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] not a code directory: 0x7
2022-03-01 11:49:37.436906-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] not a code directory: 0x10000
2022-03-01 11:49:37.436935-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] exhausted cs blobs: cnt = 5
2022-03-01 11:49:37.436960-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: no more cs blobs
2022-03-01 11:49:37.437123-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:trust-cache] [anonymous]: found regular file: <private>
2022-03-01 11:49:37.437255-0500 0xfec8f    Error       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: fat file: 0xbebafeca: [79: Inappropriate file type or format]
2022-03-01 11:49:37.437275-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-fat] [anonymous]: initialized fat header:
        magic = 0xcafebabe
        nfat = 2
2022-03-01 11:49:37.437285-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-fat] [anonymous]: fat file has 2 archs
2022-03-01 11:49:37.437295-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-fat] [anonymous]: found slice: off = 16384, length = 19677696
2022-03-01 11:49:37.437307-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: initialized header:
    magic = 0xfeedfacf
    cpu type = 0x100000c
    cpu subtype = 0
    file type = 0x6
    ncmds = 15
    sizeofcmds = 1872
    flags = 0x100085
2022-03-01 11:49:37.437317-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x19
2022-03-01 11:49:37.437325-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x19
2022-03-01 11:49:37.437334-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x19
2022-03-01 11:49:37.437375-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0xd
2022-03-01 11:49:37.437431-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x80000022
2022-03-01 11:49:37.437490-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x2
2022-03-01 11:49:37.437519-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0xb
2022-03-01 11:49:37.437568-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x1b
2022-03-01 11:49:37.437614-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x25
2022-03-01 11:49:37.437652-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x2a
2022-03-01 11:49:37.437679-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x2c
2022-03-01 11:49:37.437693-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0xc
2022-03-01 11:49:37.437715-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x26
2022-03-01 11:49:37.437745-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x29
2022-03-01 11:49:37.437756-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: found
    ldcmd->cmd = 0x1d
    ldcmd->cmdsize = 16
2022-03-01 11:49:37.437793-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: parsing
    cmd->cmd = 0x1d
    cmd->cmdsize = 16
    cmd->dataoff = 19412640
    cmd->datasize = 265056
2022-03-01 11:49:37.440748-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] found code directory: type = 0, off = 44
2022-03-01 11:49:37.440766-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] read code directory header: idx = 0, hash type = 1, csid offset = 88, length = 94951
2022-03-01 11:49:37.440781-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] reading code directory: hash type = 1, length = 94951
2022-03-01 11:49:37.445679-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] computed digest: <private>
2022-03-01 11:49:37.445705-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] code signing identity: <private>
2022-03-01 11:49:37.445717-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] code directory: identity = <private>, hash = <private>
2022-03-01 11:49:37.445728-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: extracted cdhash: cmd = 0x1d, idx = 14
2022-03-01 11:49:37.445739-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] previously-encountered code directory: superblob idx = 0, last idx = 0, type = 0, off = 44
2022-03-01 11:49:37.445747-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] not a code directory: 0x2
2022-03-01 11:49:37.445755-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] found code directory: type = 0x1000, off = 95179
2022-03-01 11:49:37.445763-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] read code directory header: idx = 2, hash type = 2, csid offset = 88, length = 151855
2022-03-01 11:49:37.445771-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] reading code directory: hash type = 2, length = 151855
2022-03-01 11:49:37.446642-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] computed digest: <private>
2022-03-01 11:49:37.446666-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] code signing identity: <private>
2022-03-01 11:49:37.446676-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] code directory: identity = <private>, hash = <private>
2022-03-01 11:49:37.446686-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: extracted cdhash: cmd = 0x1d, idx = 14
2022-03-01 11:49:37.446696-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] previously-encountered code directory: superblob idx = 0, last idx = 2, type = 0, off = 44
2022-03-01 11:49:37.446704-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] not a code directory: 0x2
2022-03-01 11:49:37.446712-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] previously-encountered code directory: superblob idx = 2, last idx = 2, type = 0x1000, off = 95179
2022-03-01 11:49:37.446719-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] not a code directory: 0x10000
2022-03-01 11:49:37.446726-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] exhausted cs blobs: cnt = 4
2022-03-01 11:49:37.446735-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: no more cs blobs
2022-03-01 11:49:37.446753-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-fat] [anonymous]: found slice: off = 19709952, length = 20267616
2022-03-01 11:49:37.446977-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: initialized header:
    magic = 0xfeedfacf
    cpu type = 0x100000c
    cpu subtype = 0x80000002
    file type = 0x6
    ncmds = 17
    sizeofcmds = 1944
    flags = 0x100085
2022-03-01 11:49:37.447000-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x19
2022-03-01 11:49:37.447012-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x19
2022-03-01 11:49:37.447022-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x19
2022-03-01 11:49:37.447030-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x19
2022-03-01 11:49:37.447038-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0xd
2022-03-01 11:49:37.447046-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x80000034
2022-03-01 11:49:37.447054-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x80000033
2022-03-01 11:49:37.447062-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x2
2022-03-01 11:49:37.447070-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0xb
2022-03-01 11:49:37.447089-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x1b
2022-03-01 11:49:37.447113-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x32
2022-03-01 11:49:37.447130-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x2a
2022-03-01 11:49:37.447147-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x2c
2022-03-01 11:49:37.447200-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0xc
2022-03-01 11:49:37.447221-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x26
2022-03-01 11:49:37.447264-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: not code signature: 0x29
2022-03-01 11:49:37.447288-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: found
    ldcmd->cmd = 0x1d
    ldcmd->cmdsize = 16
2022-03-01 11:49:37.447307-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: parsing
    cmd->cmd = 0x1d
    cmd->cmdsize = 16
    cmd->dataoff = 19995168
    cmd->datasize = 272448
2022-03-01 11:49:37.449446-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] found code directory: type = 0, off = 44
2022-03-01 11:49:37.449478-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] read code directory header: idx = 0, hash type = 1, csid offset = 88, length = 97791
2022-03-01 11:49:37.449489-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] reading code directory: hash type = 1, length = 97791
2022-03-01 11:49:37.450014-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] computed digest: <private>
2022-03-01 11:49:37.450041-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] code signing identity: <private>
2022-03-01 11:49:37.450052-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] code directory: identity = <private>, hash = <private>
2022-03-01 11:49:37.450065-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: extracted cdhash: cmd = 0x1d, idx = 16
2022-03-01 11:49:37.450075-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] previously-encountered code directory: superblob idx = 0, last idx = 0, type = 0, off = 44
2022-03-01 11:49:37.450084-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] not a code directory: 0x2
2022-03-01 11:49:37.450091-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] found code directory: type = 0x1000, off = 98019
2022-03-01 11:49:37.450099-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] read code directory header: idx = 2, hash type = 2, csid offset = 88, length = 156399
2022-03-01 11:49:37.450108-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] reading code directory: hash type = 2, length = 156399
2022-03-01 11:49:37.450885-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] computed digest: <private>
2022-03-01 11:49:37.450909-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] code signing identity: <private>
2022-03-01 11:49:37.450926-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] code directory: identity = <private>, hash = <private>
2022-03-01 11:49:37.450943-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: extracted cdhash: cmd = 0x1d, idx = 16
2022-03-01 11:49:37.450959-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] previously-encountered code directory: superblob idx = 0, last idx = 2, type = 0, off = 44
2022-03-01 11:49:37.450974-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] not a code directory: 0x2
2022-03-01 11:49:37.450988-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] previously-encountered code directory: superblob idx = 2, last idx = 2, type = 0x1000, off = 98019
2022-03-01 11:49:37.451002-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] not a code directory: 0x10000
2022-03-01 11:49:37.451012-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] exhausted cs blobs: cnt = 4
2022-03-01 11:49:37.451073-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:mach-object] [anonymous]: no more cs blobs
2022-03-01 11:49:37.451394-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:trust-cache] [anonymous]: wrote module header: <private>
2022-03-01 11:49:37.451421-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:trust-cache] [anonymous]: wrote cdhash: <private>
2022-03-01 11:49:37.451432-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:trust-cache] [anonymous]: wrote cdhash: <private>
2022-03-01 11:49:37.451440-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:trust-cache] [anonymous]: wrote cdhash: <private>
2022-03-01 11:49:37.451478-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:trust-cache] [anonymous]: wrote cdhash: <private>
2022-03-01 11:49:37.451515-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:trust-cache] [anonymous]: wrote cdhash: <private>
2022-03-01 11:49:37.451707-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:trust-cache] [anonymous]: wrote cdhash: <private>
2022-03-01 11:49:37.451841-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:trust-cache] [anonymous]: wrote cdhash: <private>
2022-03-01 11:49:37.451890-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:trust-cache] [anonymous]: wrote cdhash: <private>
2022-03-01 11:49:37.451935-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:trust-cache] [anonymous]: wrote cdhash: <private>
2022-03-01 11:49:37.451965-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:trust-cache] [anonymous]: wrote cdhash: <private>
2022-03-01 11:49:37.452013-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:trust-cache] [anonymous]: wrote cdhash: <private>
2022-03-01 11:49:37.452036-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:trust-cache] [anonymous]: wrote cdhash: <private>
2022-03-01 11:49:37.452093-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:trust-cache] [anonymous]: wrote cdhash: <private>
2022-03-01 11:49:37.452120-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:trust-cache] [anonymous]: wrote cdhash: <private>
2022-03-01 11:49:37.452282-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:utility] wrote 358 bytes
2022-03-01 11:49:37.452631-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:utility] wrote 311 bytes
2022-03-01 11:49:37.465798-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: (libcryptex.dylib) [com.apple.libcryptex:cryptex] [anonymous]: setting name: <private>
2022-03-01 11:49:37.465847-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: (libcryptex.dylib) [com.apple.libcryptex:cryptex.core] [anonymous]: setting name: <private>
2022-03-01 11:49:37.465934-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: (libcryptex_core.dylib) [com.apple.libcryptex:cryptex.core] <private>: core has research dmg asset
2022-03-01 11:49:37.466051-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: (libcryptex_core.dylib) [com.apple.libcryptex:cryptex.core] <private>: no asset of type: im4m
2022-03-01 11:49:37.466108-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: (libcryptex_core.dylib) [com.apple.libcryptex:cryptex.core] <private>: no asset of type: pdmg
2022-03-01 11:49:37.466161-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: (libcryptex.dylib) [com.apple.libcryptex:bundle] [anonymous]: identity: bord = 0xc, chip = 0x8101, sdom = 0x1
2022-03-01 11:49:37.466204-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: (libcryptex.dylib) [com.apple.libcryptex:bundle] [anonymous]: variant: <private>
2022-03-01 11:49:37.466243-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: (libcryptex.dylib) [com.apple.libcryptex:bundle] [anonymous]: adding asset: type = cpxd, name = <private>
2022-03-01 11:49:37.466280-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: (libcryptex.dylib) [com.apple.libcryptex:bundle] [anonymous]: adding asset: type = ltrs, name = (null)
2022-03-01 11:49:37.466327-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: (libcryptex.dylib) [com.apple.libcryptex:bundle] [anonymous]: adding asset: type = c411, name = (null)
2022-03-01 11:49:37.466359-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: (libcryptex.dylib) [com.apple.libcryptex:cryptex] <private>: no asset of type: im4m
2022-03-01 11:49:37.466393-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: (libcryptex.dylib) [com.apple.libcryptex:bundle] [anonymous]: skip adding internal asset root
2022-03-01 11:49:37.466428-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: (libcryptex.dylib) [com.apple.libcryptex:cryptex] <private>: no asset of type: pdmg
2022-03-01 11:49:37.466518-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: (libcryptex.dylib) [com.apple.libcryptex:bundle] [anonymous]: adding build identity:
<private>
2022-03-01 11:49:37.466546-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: (libcryptex.dylib) [com.apple.libcryptex:bundle] [anonymous]: adding cryptex bundle asset: <private>
2022-03-01 11:49:37.466573-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: (libcryptex.dylib) [com.apple.libcryptex:bundle] [anonymous]: adding cryptex bundle asset: <private>
2022-03-01 11:49:37.466594-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: (libcryptex.dylib) [com.apple.libcryptex:bundle] [anonymous]: adding cryptex bundle asset: <private>
2022-03-01 11:49:37.466626-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: (libcryptex.dylib) [com.apple.libcryptex:bundle] [anonymous]: skip adding internal asset root
2022-03-01 11:49:37.466923-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: (libcryptex.dylib) [com.apple.libcryptex:utility] wrote 1047 bytes
2022-03-01 11:49:37.490096-0500 0xfec8f    Error       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:utility] renameat: [66: Directory not empty]
2022-03-01 11:49:37.490477-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:utility] renameat succeeded
2022-03-01 11:49:37.490681-0500 0xfec8f    Debug       0x0                  65665  0    cryptexctl.research: [com.apple.libcryptex:utility] renameat succeeded
```
