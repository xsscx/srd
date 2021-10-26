# Landing for debugserver on Apple Security Research Device 

APPLE: See Issue #4: https://github.com/xsscx/srd/issues/4

See URL https://srd.cx/debugserver-installation-configuration/ 

See URL https://github.com/frida/frida-core/pull/400

IPSW == iPhone11,8,iPhone12,1_15.1_19B74_Restore.ipsw

## UPDATED: October 26, 2021: debugserver with updated entitlement research.com.apple.license-to-operate
```
(lldb)  process connect connect://192.168.3.77:1921
Process 731 stopped
* thread #1, queue = 'com.apple.main-thread', stop reason = signal SIGSTOP
    frame #0: 0x00000001b7526504 libsystem_kernel.dylib`mach_msg_trap + 8
libsystem_kernel.dylib`mach_msg_trap:
->  0x1b7526504 <+8>: ret

libsystem_kernel.dylib`mach_msg_overwrite_trap:
    0x1b7526508 <+0>: mov    x16, #-0x20
    0x1b752650c <+4>: svc    #0x80
    0x1b7526510 <+8>: ret
Target 0: (a-Shell) stopped.
(lldb) c
Process 731 resuming
(lldb) c
error: Process is running.  Use 'process interrupt' to pause execution.
Process 731 stopped
* thread #12, stop reason = EXC_BAD_ACCESS (code=1, address=0x30)
    frame #0: 0x000000011e2533ac libLLVM`llvm::PMTopLevelManager::addImmutablePass(llvm::ImmutablePass*) + 172
libLLVM`llvm::PMTopLevelManager::addImmutablePass:
->  0x11e2533ac <+172>: ldp    x22, x23, [x0, #0x30]
    0x11e2533b0 <+176>: cmp    x22, x23
    0x11e2533b4 <+180>: b.eq   0x11e253488               ; <+392>
    0x11e2533b8 <+184>: add    x24, x20, #0x188          ; =0x188
Target 0: (a-Shell) stopped.
(lldb) bt
* thread #12, stop reason = EXC_BAD_ACCESS (code=1, address=0x30)
  * frame #0: 0x000000011e2533ac libLLVM`llvm::PMTopLevelManager::addImmutablePass(llvm::ImmutablePass*) + 172
    frame #1: 0x000000011e252654 libLLVM`llvm::PMTopLevelManager::schedulePass(llvm::Pass*) + 1232
    frame #2: 0x000000011c0b24fc clang`(anonymous namespace)::EmitAssemblyHelper::EmitAssemblyWithNewPassManager(clang::BackendAction, std::__1::unique_ptr<llvm::raw_pwrite_stream, std::__1::default_delete<llvm::raw_pwrite_stream> >) + 9288
    frame #3: 0x000000011c0ade34 clang`clang::EmitBackendOutput(clang::DiagnosticsEngine&, clang::HeaderSearchOptions const&, clang::CodeGenOptions const&, clang::TargetOptions const&, clang::LangOptions const&, llvm::DataLayout const&, llvm::Module*, clang::BackendAction, std::__1::unique_ptr<llvm::raw_pwrite_stream, std::__1::default_delete<llvm::raw_pwrite_stream> >) + 1588
    frame #4: 0x000000011c2f4278 clang`clang::BackendConsumer::HandleTranslationUnit(clang::ASTContext&) + 768
    frame #5: 0x000000011b1d9770 clang`clang::ParseAST(clang::Sema&, bool, bool) + 508
    frame #6: 0x000000011cdd4108 clang`clang::FrontendAction::Execute() + 108
    frame #7: 0x000000011cd704b8 clang`clang::CompilerInstance::ExecuteAction(clang::FrontendAction&) + 796
    frame #8: 0x000000011b7b99e8 clang`clang::ExecuteCompilerInvocation(clang::CompilerInstance*) + 1272
    frame #9: 0x000000011b047258 clang`cc1_main(llvm::ArrayRef<char const*>, char const*, void*) + 1912
    frame #10: 0x000000011b045c8c clang`ExecuteCC1Tool(llvm::SmallVectorImpl<char const*>&) + 1104
    frame #11: 0x000000011b0457c0 clang`main + 10412
    frame #12: 0x0000000102ab7434 ios_system`run_function + 536
    frame #13: 0x00000001f09869a4 libsystem_pthread.dylib`_pthread_start + 148
(lldb) re re --all
General Purpose Registers:
        x0 = 0x0000000000000000
        x1 = 0x00000001207b6168  libLLVM`llvm::TargetTransformInfoWrapperPass::ID
        x2 = 0x000000016dc16718
        x3 = 0x0000000119018b88
        x4 = 0x000000011744ca80
        x5 = 0x0000000000000018
        x6 = 0x000000000000000b
        x7 = 0x0000000000000010
        x8 = 0x0000000000000000
        x9 = 0x0000000000000000
       x10 = 0x0000000000000026
       x11 = 0x0000000000000000
       x12 = 0xffffffffffffe000
       x13 = 0x00000001207b6168  libLLVM`llvm::TargetTransformInfoWrapperPass::ID
       x14 = 0x0000000000000001
       x15 = 0xfffffffffffff000
       x16 = 0x00000000000008fd
       x17 = 0x00000000000008fd
       x18 = 0x0000000000000000
       x19 = 0x0000000280dba1c0
       x20 = 0x00000001190189a0
       x21 = 0x0000000119018b20
       x22 = 0x0000000119018820
       x23 = 0x0000000000000000
       x24 = 0x0000000119018c30
       x25 = 0x000000016dc169e8
       x26 = 0x0000000000000005
       x27 = 0x0000000000000000
       x28 = 0x0000000119018b28
        fp = 0x000000016dc16760
        lr = 0x000000011e2533ac  libLLVM`llvm::PMTopLevelManager::addImmutablePass(llvm::ImmutablePass*) + 172
        sp = 0x000000016dc16710
        pc = 0x000000011e2533ac  libLLVM`llvm::PMTopLevelManager::addImmutablePass(llvm::ImmutablePass*) + 172
      cpsr = 0x60000000
        w0 = 0x00000000
        w1 = 0x207b6168
        w2 = 0x6dc16718
        w3 = 0x19018b88
        w4 = 0x1744ca80
        w5 = 0x00000018
        w6 = 0x0000000b
        w7 = 0x00000010
        w8 = 0x00000000
        w9 = 0x00000000
       w10 = 0x00000026
       w11 = 0x00000000
       w12 = 0xffffe000
       w13 = 0x207b6168
       w14 = 0x00000001
       w15 = 0xfffff000
       w16 = 0x000008fd
       w17 = 0x000008fd
       w18 = 0x00000000
       w19 = 0x80dba1c0
       w20 = 0x190189a0
       w21 = 0x19018b20
       w22 = 0x19018820
       w23 = 0x00000000
       w24 = 0x19018c30
       w25 = 0x6dc169e8
       w26 = 0x00000005
       w27 = 0x00000000
       w28 = 0x19018b28
```

```
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/ PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
        <key>com.apple.springboard.debugapplications</key> <true/>
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
