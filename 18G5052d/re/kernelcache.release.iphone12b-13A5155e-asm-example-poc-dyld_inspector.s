;xcrun -sdk iphoneos clang -g -O2  -mios-version-min=14.3 -DDEBUG=0  -Wall -Wpedantic -Wno-gnu -Werror -Wunused-variable -o j.out code.s
;
; This code was Released into the Public Domain and written by @5aelo of Google Project Zero 
; Hand-Rolled for your smoking enjoyment on the Apple Security Research Device by David Hoyt | SRD0009 | @h02332
;
;
  .section	__TEXT,__text,regular,pure_instructions
	.build_version ios, 14, 0	sdk_version 14, 3
	.ptrauth_abi_version 0
	.file	1 "dyld_inspector" "dyld_inspector/AppDelegate.m"
	.file	2 "dyld_inspector" "dyld_inspector/AppDelegate.h"
	.private_extern	_isReadable             ; -- Begin function isReadable
	.globl	_isReadable
	.p2align	2
_isReadable:                            ; @isReadable
Lfunc_begin0:
	.loc	1 14 0                          ; dyld_inspector/AppDelegate.m:14:0
	.cfi_startproc
; %bb.0:
	;DEBUG_VALUE: isReadable:addr <- $x0
	pacibsp
	sub	sp, sp, #48                     ; =48
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32                    ; =32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	mov	x19, x0
Ltmp0:
	;DEBUG_VALUE: isReadable:pfds <- 0
	;DEBUG_VALUE: isReadable:addr <- $x19
	.loc	1 15 9 prologue_end             ; dyld_inspector/AppDelegate.m:15:9
	str	xzr, [sp, #8]
Ltmp1:
	;DEBUG_VALUE: isReadable:pfds <- [DW_OP_plus_uconst 8, DW_OP_deref] $sp
	.loc	1 16 9                          ; dyld_inspector/AppDelegate.m:16:9
	add	x0, sp, #8                      ; =8
	bl	_pipe
Ltmp2:
	.loc	1 16 9 is_stmt 0                ; dyld_inspector/AppDelegate.m:16:9
	cbnz	w0, LBB0_2
Ltmp3:
; %bb.1:
	;DEBUG_VALUE: isReadable:addr <- $x19
	;DEBUG_VALUE: isReadable:pfds <- [DW_OP_plus_uconst 8, DW_OP_deref] $sp
	.loc	1 20 25 is_stmt 1               ; dyld_inspector/AppDelegate.m:20:25
	ldr	w0, [sp, #12]
	.loc	1 20 19 is_stmt 0               ; dyld_inspector/AppDelegate.m:20:19
	mov	x1, x19
	mov	w2, #8
	bl	_write
Ltmp4:
	mov	x19, x0
Ltmp5:
	;DEBUG_VALUE: isReadable:ret <- $x19
	.loc	1 22 11 is_stmt 1               ; dyld_inspector/AppDelegate.m:22:11
	ldr	w0, [sp, #8]
	.loc	1 22 5 is_stmt 0                ; dyld_inspector/AppDelegate.m:22:5
	bl	_close
Ltmp6:
	.loc	1 23 11 is_stmt 1               ; dyld_inspector/AppDelegate.m:23:11
	ldr	w0, [sp, #12]
	.loc	1 23 5 is_stmt 0                ; dyld_inspector/AppDelegate.m:23:5
	bl	_close
Ltmp7:
	.loc	1 24 16 is_stmt 1               ; dyld_inspector/AppDelegate.m:24:16
	cmp	x19, #0                         ; =0
	cset	w0, gt
	.loc	1 24 5 is_stmt 0                ; dyld_inspector/AppDelegate.m:24:5
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
Ltmp8:
	add	sp, sp, #48                     ; =48
Ltmp9:
	retab
LBB0_2:
Ltmp10:
	;DEBUG_VALUE: isReadable:addr <- $x19
	;DEBUG_VALUE: isReadable:pfds <- [DW_OP_plus_uconst 8, DW_OP_deref] $sp
	.loc	1 17 9 is_stmt 1                ; dyld_inspector/AppDelegate.m:17:9
	bl	_isReadable.cold.1
Ltmp11:
Lfunc_end0:
	.cfi_endproc
	.file	3 "/Applications/Xcode-beta.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS15.0.sdk/usr/include" "unistd.h"
                                        ; -- End function
	.private_extern	_isWritable             ; -- Begin function isWritable
	.globl	_isWritable
	.p2align	2
_isWritable:                            ; @isWritable
Lfunc_begin1:
	.loc	1 27 0                          ; dyld_inspector/AppDelegate.m:27:0
	.cfi_startproc
; %bb.0:
	;DEBUG_VALUE: isWritable:addr <- $x0
	pacibsp
	sub	sp, sp, #48                     ; =48
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32                    ; =32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	mov	x19, x0
Ltmp12:
	;DEBUG_VALUE: isWritable:addr <- $x19
	.loc	1 30 10 prologue_end            ; dyld_inspector/AppDelegate.m:30:10
	bl	_isReadable
Ltmp13:
	.loc	1 30 9 is_stmt 0                ; dyld_inspector/AppDelegate.m:30:9
	cbz	w0, LBB1_4
Ltmp14:
; %bb.1:
	;DEBUG_VALUE: isWritable:addr <- $x19
	.loc	1 34 9 is_stmt 1                ; dyld_inspector/AppDelegate.m:34:9
	str	xzr, [sp, #8]
Ltmp15:
	.loc	1 35 9                          ; dyld_inspector/AppDelegate.m:35:9
	add	x0, sp, #8                      ; =8
	bl	_pipe
Ltmp16:
	.loc	1 35 9 is_stmt 0                ; dyld_inspector/AppDelegate.m:35:9
	cbnz	w0, LBB1_5
Ltmp17:
; %bb.2:
	;DEBUG_VALUE: isWritable:addr <- $x19
	.loc	1 39 13 is_stmt 1               ; dyld_inspector/AppDelegate.m:39:13
	ldr	w8, [x19]
Ltmp18:
	;DEBUG_VALUE: isWritable:v <- $w8
	.loc	1 39 9 is_stmt 0                ; dyld_inspector/AppDelegate.m:39:9
	str	w8, [sp, #4]
	.loc	1 40 25 is_stmt 1               ; dyld_inspector/AppDelegate.m:40:25
	ldr	w0, [sp, #12]
Ltmp19:
	;DEBUG_VALUE: isWritable:v <- [DW_OP_plus_uconst 4, DW_OP_deref] $sp
	.loc	1 40 19 is_stmt 0               ; dyld_inspector/AppDelegate.m:40:19
	add	x1, sp, #4                      ; =4
	mov	w2, #4
	bl	_write
Ltmp20:
	;DEBUG_VALUE: isWritable:ret <- $x0
	.loc	1 41 9 is_stmt 1                ; dyld_inspector/AppDelegate.m:41:9
	cmp	x0, #4                          ; =4
	b.ne	LBB1_6
Ltmp21:
; %bb.3:
	;DEBUG_VALUE: isWritable:addr <- $x19
	;DEBUG_VALUE: isWritable:ret <- $x0
	;DEBUG_VALUE: isWritable:v <- [DW_OP_plus_uconst 4, DW_OP_deref] $sp
	.loc	1 45 16                         ; dyld_inspector/AppDelegate.m:45:16
	ldr	w0, [sp, #8]
Ltmp22:
	.loc	1 45 11 is_stmt 0               ; dyld_inspector/AppDelegate.m:45:11
	mov	x1, x19
	mov	w2, #4
	bl	_read
Ltmp23:
	mov	x19, x0
Ltmp24:
	;DEBUG_VALUE: isWritable:addr <- [DW_OP_LLVM_entry_value 1] $x0
	;DEBUG_VALUE: isWritable:ret <- $x19
	.loc	1 47 11 is_stmt 1               ; dyld_inspector/AppDelegate.m:47:11
	ldr	w0, [sp, #8]
	.loc	1 47 5 is_stmt 0                ; dyld_inspector/AppDelegate.m:47:5
	bl	_close
Ltmp25:
	.loc	1 48 11 is_stmt 1               ; dyld_inspector/AppDelegate.m:48:11
	ldr	w0, [sp, #12]
	.loc	1 48 5 is_stmt 0                ; dyld_inspector/AppDelegate.m:48:5
	bl	_close
Ltmp26:
	.loc	1 49 16 is_stmt 1               ; dyld_inspector/AppDelegate.m:49:16
	cmp	x19, #0                         ; =0
	cset	w0, gt
Ltmp27:
LBB1_4:
	.loc	1 50 1                          ; dyld_inspector/AppDelegate.m:50:1
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #48                     ; =48
	retab
LBB1_5:
Ltmp28:
	;DEBUG_VALUE: isWritable:addr <- $x19
	.loc	1 36 9                          ; dyld_inspector/AppDelegate.m:36:9
	bl	_isWritable.cold.2
Ltmp29:
LBB1_6:
	;DEBUG_VALUE: isWritable:addr <- $x19
	;DEBUG_VALUE: isWritable:ret <- $x0
	;DEBUG_VALUE: isWritable:v <- [DW_OP_plus_uconst 4, DW_OP_deref] $sp
	.loc	1 42 9                          ; dyld_inspector/AppDelegate.m:42:9
	bl	_isWritable.cold.1
Ltmp30:
Lfunc_end1:
	.cfi_endproc
                                        ; -- End function
	.private_extern	_inspectSharedCache     ; -- Begin function inspectSharedCache
	.globl	_inspectSharedCache
	.p2align	2
_inspectSharedCache:                    ; @inspectSharedCache
Lfunc_begin2:
	.loc	1 52 0                          ; dyld_inspector/AppDelegate.m:52:0
	.cfi_startproc
; %bb.0:
	pacibsp
	sub	sp, sp, #128                    ; =128
	stp	x28, x27, [sp, #32]             ; 16-byte Folded Spill
	stp	x26, x25, [sp, #48]             ; 16-byte Folded Spill
	stp	x24, x23, [sp, #64]             ; 16-byte Folded Spill
	stp	x22, x21, [sp, #80]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #96]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #112]            ; 16-byte Folded Spill
	add	x29, sp, #112                   ; =112
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	.cfi_offset w23, -56
	.cfi_offset w24, -64
	.cfi_offset w25, -72
	.cfi_offset w26, -80
	.cfi_offset w27, -88
	.cfi_offset w28, -96
	mov	x26, #16384
	movk	x26, #32768, lsl #16
	movk	x26, #2, lsl #32
	mov	x22, #8589918208
	movk	x22, #32767, lsl #16
Ltmp31:
	;DEBUG_VALUE: inspectSharedCache:end <- 10737418240
	;DEBUG_VALUE: inspectSharedCache:start <- 6442450944
	sub	x19, x26, #8, lsl #12           ; =32768
Ltmp32:
LBB2_1:                                 ; =>This Inner Loop Header: Depth=1
	;DEBUG_VALUE: inspectSharedCache:end <- 10737418240
	;DEBUG_VALUE: inspectSharedCache:start <- [DW_OP_plus_uconst 16384, DW_OP_stack_value] $x22
	.loc	1 57 13 prologue_end            ; dyld_inspector/AppDelegate.m:57:13
	add	x22, x22, #4, lsl #12           ; =16384
Ltmp33:
	mov	x0, x22
	bl	_isReadable
Ltmp34:
	.loc	1 57 13 is_stmt 0               ; dyld_inspector/AppDelegate.m:57:13
	cbnz	w0, LBB2_4
Ltmp35:
; %bb.2:                                ;   in Loop: Header=BB2_1 Depth=1
	;DEBUG_VALUE: inspectSharedCache:end <- 10737418240
	;DEBUG_VALUE: inspectSharedCache:start <- [DW_OP_plus_uconst 32768, DW_OP_stack_value] $x22
	.loc	1 56 5 is_stmt 1                ; dyld_inspector/AppDelegate.m:56:5
	cmp	x22, x19
	b.lo	LBB2_1
Ltmp36:
; %bb.3:
	;DEBUG_VALUE: inspectSharedCache:start <- [DW_OP_plus_uconst 32768, DW_OP_stack_value] $x22
	;DEBUG_VALUE: inspectSharedCache:end <- 10737418240
	.loc	1 0 0 is_stmt 0                 ; dyld_inspector/AppDelegate.m:0:0
	sub	x22, x26, #4, lsl #12           ; =16384
Ltmp37:
LBB2_4:                                 ; =>This Inner Loop Header: Depth=1
	mov	x19, x26
Ltmp38:
	;DEBUG_VALUE: inspectSharedCache:end <- [DW_OP_constu 16384, DW_OP_minus, DW_OP_stack_value] $x19
	.loc	1 61 16 is_stmt 1               ; dyld_inspector/AppDelegate.m:61:16
	sub	x26, x26, #4, lsl #12           ; =16384
Ltmp39:
	.loc	1 61 5 is_stmt 0                ; dyld_inspector/AppDelegate.m:61:5
	cmp	x26, x22
	b.ls	LBB2_9
Ltmp40:
; %bb.5:                                ;   in Loop: Header=BB2_4 Depth=1
	;DEBUG_VALUE: inspectSharedCache:end <- [DW_OP_constu 16384, DW_OP_minus, DW_OP_stack_value] $x19
	.loc	1 62 13 is_stmt 1               ; dyld_inspector/AppDelegate.m:62:13
	sub	x0, x19, #8, lsl #12            ; =32768
	bl	_isReadable
Ltmp41:
	.loc	1 62 13 is_stmt 0               ; dyld_inspector/AppDelegate.m:62:13
	cbz	w0, LBB2_4
Ltmp42:
; %bb.6:
	;DEBUG_VALUE: inspectSharedCache:end <- [DW_OP_constu 16384, DW_OP_minus, DW_OP_stack_value] $x19
	.loc	1 0 13                          ; dyld_inspector/AppDelegate.m:0:13
	mov	x23, x22
Ltmp43:
LBB2_7:                                 ; =>This Inner Loop Header: Depth=1
	;DEBUG_VALUE: inspectSharedCache:end <- [DW_OP_constu 16384, DW_OP_minus, DW_OP_stack_value] $x19
	;DEBUG_VALUE: inspectSharedCache:writable_start <- $x23
	.loc	1 68 13 is_stmt 1               ; dyld_inspector/AppDelegate.m:68:13
	mov	x0, x23
	bl	_isWritable
Ltmp44:
	.loc	1 68 13 is_stmt 0               ; dyld_inspector/AppDelegate.m:68:13
	cbnz	w0, LBB2_10
Ltmp45:
; %bb.8:                                ;   in Loop: Header=BB2_7 Depth=1
	;DEBUG_VALUE: inspectSharedCache:writable_start <- $x23
	;DEBUG_VALUE: inspectSharedCache:end <- [DW_OP_constu 16384, DW_OP_minus, DW_OP_stack_value] $x19
	.loc	1 67 49 is_stmt 1               ; dyld_inspector/AppDelegate.m:67:49
	add	x23, x23, #4, lsl #12           ; =16384
Ltmp46:
	;DEBUG_VALUE: inspectSharedCache:writable_start <- $x23
	.loc	1 67 5 is_stmt 0                ; dyld_inspector/AppDelegate.m:67:5
	cmp	x23, x26
	b.lo	LBB2_7
	b	LBB2_10
Ltmp47:
LBB2_9:
	;DEBUG_VALUE: inspectSharedCache:end <- [DW_OP_constu 16384, DW_OP_minus, DW_OP_stack_value] $x19
	.loc	1 0 5                           ; dyld_inspector/AppDelegate.m:0:5
	mov	x23, x22
Ltmp48:
LBB2_10:
	;DEBUG_VALUE: inspectSharedCache:end <- [DW_OP_constu 16384, DW_OP_minus, DW_OP_stack_value] $x19
	.loc	1 72 30 is_stmt 1               ; dyld_inspector/AppDelegate.m:72:30
	adrp	x24, _OBJC_CLASSLIST_REFERENCES_$_@PAGE
	ldr	x0, [x24, _OBJC_CLASSLIST_REFERENCES_$_@PAGEOFF]
Lloh0:
	adrp	x8, _OBJC_SELECTOR_REFERENCES_@PAGE
Lloh1:
	ldr	x21, [x8, _OBJC_SELECTOR_REFERENCES_@PAGEOFF]
	mov	x1, x21
	bl	_objc_msgSend
Ltmp49:
	;DEBUG_VALUE: inspectSharedCache:zeroMap <- $x0
	.loc	1 0 30 is_stmt 0                ; dyld_inspector/AppDelegate.m:0:30
	; InlineAsm Start
	mov	x29, x29	; marker for objc_retainAutoreleaseReturnValue
	; InlineAsm End
	.loc	1 72 30                         ; dyld_inspector/AppDelegate.m:72:30
	bl	_objc_retainAutoreleasedReturnValue
Ltmp50:
	mov	x20, x0
	.loc	1 73 35 is_stmt 1               ; dyld_inspector/AppDelegate.m:73:35
	ldr	x0, [x24, _OBJC_CLASSLIST_REFERENCES_$_@PAGEOFF]
	mov	x1, x21
	bl	_objc_msgSend
Ltmp51:
	;DEBUG_VALUE: inspectSharedCache:taggetPtrMap <- $x0
	.loc	1 0 35 is_stmt 0                ; dyld_inspector/AppDelegate.m:0:35
	; InlineAsm Start
	mov	x29, x29	; marker for objc_retainAutoreleaseReturnValue
	; InlineAsm End
	.loc	1 73 35                         ; dyld_inspector/AppDelegate.m:73:35
	bl	_objc_retainAutoreleasedReturnValue
Ltmp52:
	.loc	1 0 35                          ; dyld_inspector/AppDelegate.m:0:35
	str	x0, [sp, #16]                   ; 8-byte Folded Spill
	.loc	1 74 33 is_stmt 1               ; dyld_inspector/AppDelegate.m:74:33
	ldr	x0, [x24, _OBJC_CLASSLIST_REFERENCES_$_@PAGEOFF]
	mov	x1, x21
	bl	_objc_msgSend
Ltmp53:
	;DEBUG_VALUE: inspectSharedCache:pointerMap <- $x0
	.loc	1 0 33 is_stmt 0                ; dyld_inspector/AppDelegate.m:0:33
	; InlineAsm Start
	mov	x29, x29	; marker for objc_retainAutoreleaseReturnValue
	; InlineAsm End
	.loc	1 74 33                         ; dyld_inspector/AppDelegate.m:74:33
	bl	_objc_retainAutoreleasedReturnValue
Ltmp54:
	mov	x21, x0
	.loc	1 76 5 is_stmt 1                ; dyld_inspector/AppDelegate.m:76:5
	stp	x22, x26, [sp]
Lloh2:
	adrp	x0, l_.str.2@PAGE
Lloh3:
	add	x0, x0, l_.str.2@PAGEOFF
	bl	_printf
Ltmp55:
	.loc	1 77 113                        ; dyld_inspector/AppDelegate.m:77:113
	sub	x8, x23, x22
	.loc	1 77 5 is_stmt 0                ; dyld_inspector/AppDelegate.m:77:5
	stp	x23, x8, [sp]
Lloh4:
	adrp	x0, l_.str.3@PAGE
Lloh5:
	add	x0, x0, l_.str.3@PAGEOFF
	bl	_printf
Ltmp56:
	;DEBUG_VALUE: inspectSharedCache:nullMapByte <- 0
	.loc	1 79 8 is_stmt 1                ; dyld_inspector/AppDelegate.m:79:8
	strh	wzr, [sp, #30]
Ltmp57:
	;DEBUG_VALUE: inspectSharedCache:taggedPtrByte <- 0
	;DEBUG_VALUE: inspectSharedCache:ptrByte <- 0
	.loc	1 81 8                          ; dyld_inspector/AppDelegate.m:81:8
	strb	wzr, [sp, #29]
Ltmp58:
	;DEBUG_VALUE: addr <- $x22
	.loc	1 82 5                          ; dyld_inspector/AppDelegate.m:82:5
	cmp	x26, x22
	b.ls	LBB2_24
Ltmp59:
; %bb.11:
	;DEBUG_VALUE: addr <- $x22
	;DEBUG_VALUE: inspectSharedCache:end <- [DW_OP_constu 16384, DW_OP_minus, DW_OP_stack_value] $x19
	;DEBUG_VALUE: inspectSharedCache:ptrByte <- 0
	;DEBUG_VALUE: inspectSharedCache:taggedPtrByte <- 0
	;DEBUG_VALUE: inspectSharedCache:nullMapByte <- 0
	.loc	1 0 5 is_stmt 0                 ; dyld_inspector/AppDelegate.m:0:5
	mov	x27, #0
Lloh6:
	adrp	x8, _OBJC_SELECTOR_REFERENCES_.5@PAGE
Lloh7:
	ldr	x23, [x8, _OBJC_SELECTOR_REFERENCES_.5@PAGEOFF]
	sub	x8, x19, x22
	sub	x8, x8, #4, lsl #12             ; =16384
	lsr	x28, x8, #20
	.loc	1 82 5                          ; dyld_inspector/AppDelegate.m:82:5
	lsr	x24, x22, #3
	mov	w19, #1
Ltmp60:
LBB2_12:                                ; =>This Inner Loop Header: Depth=1
	;DEBUG_VALUE: addr <- undef
	;DEBUG_VALUE: val <- 1
	.loc	1 85 13 is_stmt 1               ; dyld_inspector/AppDelegate.m:85:13
	add	x25, x22, x27
	mov	x0, x25
	bl	_isReadable
Ltmp61:
	.loc	1 85 13 is_stmt 0               ; dyld_inspector/AppDelegate.m:85:13
	cbz	w0, LBB2_19
Ltmp62:
; %bb.13:                               ;   in Loop: Header=BB2_12 Depth=1
	;DEBUG_VALUE: val <- 1
	.loc	1 86 19 is_stmt 1               ; dyld_inspector/AppDelegate.m:86:19
	ldr	x8, [x25]
Ltmp63:
	;DEBUG_VALUE: val <- $x8
	.loc	1 89 13                         ; dyld_inspector/AppDelegate.m:89:13
	cbz	x8, LBB2_18
Ltmp64:
; %bb.14:                               ;   in Loop: Header=BB2_12 Depth=1
	;DEBUG_VALUE: val <- $x8
	.loc	1 95 13                         ; dyld_inspector/AppDelegate.m:95:13
	tbz	x8, #63, LBB2_16
Ltmp65:
; %bb.15:                               ;   in Loop: Header=BB2_12 Depth=1
	;DEBUG_VALUE: val <- $x8
	.loc	1 96 24                         ; dyld_inspector/AppDelegate.m:96:24
	mvn	w9, w24
	and	w9, w9, #0x7
Ltmp66:
	;DEBUG_VALUE: shift <- [DW_OP_constu 3, DW_OP_shr, DW_OP_LLVM_convert 64 7, DW_OP_LLVM_convert 32 7, DW_OP_constu 7, DW_OP_and, DW_OP_constu 7, DW_OP_xor, DW_OP_stack_value] undef
	.loc	1 97 33                         ; dyld_inspector/AppDelegate.m:97:33
	lsl	w9, w19, w9
	.loc	1 97 27 is_stmt 0               ; dyld_inspector/AppDelegate.m:97:27
	ldrb	w10, [sp, #30]
Ltmp67:
	;DEBUG_VALUE: inspectSharedCache:taggedPtrByte <- $w10
	orr	w9, w10, w9
Ltmp68:
	;DEBUG_VALUE: inspectSharedCache:taggedPtrByte <- $w9
	strb	w9, [sp, #30]
Ltmp69:
LBB2_16:                                ;   in Loop: Header=BB2_12 Depth=1
	;DEBUG_VALUE: val <- $x8
	.loc	1 100 26 is_stmt 1              ; dyld_inspector/AppDelegate.m:100:26
	cmp	x8, x22
	ccmp	x8, x26, #2, hs
	b.hs	LBB2_19
Ltmp70:
; %bb.17:                               ;   in Loop: Header=BB2_12 Depth=1
	;DEBUG_VALUE: val <- $x8
	.loc	1 101 24                        ; dyld_inspector/AppDelegate.m:101:24
	mvn	w8, w24
Ltmp71:
	and	w8, w8, #0x7
Ltmp72:
	;DEBUG_VALUE: shift <- [DW_OP_constu 3, DW_OP_shr, DW_OP_LLVM_convert 64 7, DW_OP_LLVM_convert 32 7, DW_OP_constu 7, DW_OP_and, DW_OP_constu 7, DW_OP_xor, DW_OP_stack_value] undef
	.loc	1 102 27                        ; dyld_inspector/AppDelegate.m:102:27
	lsl	w8, w19, w8
	.loc	1 102 21 is_stmt 0              ; dyld_inspector/AppDelegate.m:102:21
	ldrb	w9, [sp, #29]
Ltmp73:
	;DEBUG_VALUE: inspectSharedCache:ptrByte <- $w9
	orr	w8, w9, w8
Ltmp74:
	;DEBUG_VALUE: inspectSharedCache:ptrByte <- $w8
	strb	w8, [sp, #29]
	b	LBB2_19
Ltmp75:
LBB2_18:                                ;   in Loop: Header=BB2_12 Depth=1
	;DEBUG_VALUE: val <- $x8
	.loc	1 90 24 is_stmt 1               ; dyld_inspector/AppDelegate.m:90:24
	mvn	w8, w24
Ltmp76:
	and	w8, w8, #0x7
Ltmp77:
	;DEBUG_VALUE: shift <- [DW_OP_constu 3, DW_OP_shr, DW_OP_LLVM_convert 64 7, DW_OP_LLVM_convert 32 7, DW_OP_constu 7, DW_OP_and, DW_OP_constu 7, DW_OP_xor, DW_OP_stack_value] undef
	.loc	1 91 31                         ; dyld_inspector/AppDelegate.m:91:31
	lsl	w8, w19, w8
	.loc	1 91 25 is_stmt 0               ; dyld_inspector/AppDelegate.m:91:25
	ldrb	w9, [sp, #31]
Ltmp78:
	;DEBUG_VALUE: inspectSharedCache:nullMapByte <- $w9
	orr	w8, w9, w8
Ltmp79:
	;DEBUG_VALUE: inspectSharedCache:nullMapByte <- $w8
	strb	w8, [sp, #31]
Ltmp80:
LBB2_19:                                ;   in Loop: Header=BB2_12 Depth=1
	.loc	1 105 18 is_stmt 1              ; dyld_inspector/AppDelegate.m:105:18
	mvn	w8, w25
	tst	x8, #0x38
Ltmp81:
	.loc	1 105 13 is_stmt 0              ; dyld_inspector/AppDelegate.m:105:13
	b.ne	LBB2_21
; %bb.20:                               ;   in Loop: Header=BB2_12 Depth=1
Ltmp82:
	;DEBUG_VALUE: inspectSharedCache:nullMapByte <- [DW_OP_plus_uconst 31, DW_OP_deref] $sp
	.loc	1 106 13 is_stmt 1              ; dyld_inspector/AppDelegate.m:106:13
	add	x2, sp, #31                     ; =31
	mov	x0, x20
	mov	x1, x23
	mov	w3, #1
	bl	_objc_msgSend
Ltmp83:
	;DEBUG_VALUE: inspectSharedCache:nullMapByte <- 0
	.loc	1 107 25                        ; dyld_inspector/AppDelegate.m:107:25
	strb	wzr, [sp, #31]
Ltmp84:
	;DEBUG_VALUE: inspectSharedCache:taggedPtrByte <- [DW_OP_plus_uconst 30, DW_OP_deref] $sp
	.loc	1 108 13                        ; dyld_inspector/AppDelegate.m:108:13
	add	x2, sp, #30                     ; =30
	ldr	x0, [sp, #16]                   ; 8-byte Folded Reload
	mov	x1, x23
	mov	w3, #1
	bl	_objc_msgSend
Ltmp85:
	;DEBUG_VALUE: inspectSharedCache:taggedPtrByte <- 0
	.loc	1 109 27                        ; dyld_inspector/AppDelegate.m:109:27
	strb	wzr, [sp, #30]
Ltmp86:
	;DEBUG_VALUE: inspectSharedCache:ptrByte <- [DW_OP_plus_uconst 29, DW_OP_deref] $sp
	.loc	1 110 13                        ; dyld_inspector/AppDelegate.m:110:13
	add	x2, sp, #29                     ; =29
	mov	x0, x21
	mov	x1, x23
	mov	w3, #1
	bl	_objc_msgSend
Ltmp87:
	;DEBUG_VALUE: inspectSharedCache:ptrByte <- 0
	.loc	1 111 21                        ; dyld_inspector/AppDelegate.m:111:21
	strb	wzr, [sp, #29]
Ltmp88:
LBB2_21:                                ;   in Loop: Header=BB2_12 Depth=1
	.loc	1 114 28                        ; dyld_inspector/AppDelegate.m:114:28
	tst	x27, #0xffff8
Ltmp89:
	.loc	1 114 13 is_stmt 0              ; dyld_inspector/AppDelegate.m:114:13
	b.ne	LBB2_23
; %bb.22:                               ;   in Loop: Header=BB2_12 Depth=1
Ltmp90:
	.loc	1 115 48 is_stmt 1              ; dyld_inspector/AppDelegate.m:115:48
	lsr	x8, x27, #20
	.loc	1 115 13 is_stmt 0              ; dyld_inspector/AppDelegate.m:115:13
	stp	x8, x28, [sp]
Lloh8:
	adrp	x0, l_.str.6@PAGE
Lloh9:
	add	x0, x0, l_.str.6@PAGEOFF
	bl	_printf
Ltmp91:
LBB2_23:                                ;   in Loop: Header=BB2_12 Depth=1
	;DEBUG_VALUE: addr <- [DW_OP_plus_uconst 8, DW_OP_stack_value] undef
	.loc	1 82 33 is_stmt 1               ; dyld_inspector/AppDelegate.m:82:33
	add	x24, x24, #1                    ; =1
	add	x27, x27, #8                    ; =8
	add	x8, x22, x27
Ltmp92:
	.loc	1 82 5 is_stmt 0                ; dyld_inspector/AppDelegate.m:82:5
	cmp	x8, x26
	b.lo	LBB2_12
Ltmp93:
LBB2_24:
	.loc	1 119 22 is_stmt 1              ; dyld_inspector/AppDelegate.m:119:22
	mov	w0, #9
	mov	w1, #1
	mov	w2, #1
	bl	_NSSearchPathForDirectoriesInDomains
Ltmp94:
	;DEBUG_VALUE: inspectSharedCache:paths <- $x0
	.loc	1 0 22 is_stmt 0                ; dyld_inspector/AppDelegate.m:0:22
	; InlineAsm Start
	mov	x29, x29	; marker for objc_retainAutoreleaseReturnValue
	; InlineAsm End
	.loc	1 119 14                        ; dyld_inspector/AppDelegate.m:119:14
	bl	_objc_retainAutoreleasedReturnValue
Ltmp95:
	mov	x22, x0
	.loc	1 120 36 is_stmt 1              ; dyld_inspector/AppDelegate.m:120:36
Lloh10:
	adrp	x8, _OBJC_SELECTOR_REFERENCES_.8@PAGE
Lloh11:
	ldr	x1, [x8, _OBJC_SELECTOR_REFERENCES_.8@PAGEOFF]
	mov	x2, #0
	bl	_objc_msgSend
Ltmp96:
	;DEBUG_VALUE: inspectSharedCache:documentsDirectory <- $x0
	.loc	1 0 36 is_stmt 0                ; dyld_inspector/AppDelegate.m:0:36
	; InlineAsm Start
	mov	x29, x29	; marker for objc_retainAutoreleaseReturnValue
	; InlineAsm End
	.loc	1 120 15                        ; dyld_inspector/AppDelegate.m:120:15
	bl	_objc_retainAutoreleasedReturnValue
Ltmp97:
	mov	x23, x0
	.loc	1 121 25 is_stmt 1              ; dyld_inspector/AppDelegate.m:121:25
Lloh12:
	adrp	x8, _OBJC_SELECTOR_REFERENCES_.11@PAGE
Lloh13:
	ldr	x24, [x8, _OBJC_SELECTOR_REFERENCES_.11@PAGEOFF]
Lloh14:
	adrp	x2, l__unnamed_cfstring_@PAGE
Lloh15:
	add	x2, x2, l__unnamed_cfstring_@PAGEOFF
	mov	x1, x24
	bl	_objc_msgSend
Ltmp98:
	;DEBUG_VALUE: inspectSharedCache:appFile <- $x0
	.loc	1 0 25 is_stmt 0                ; dyld_inspector/AppDelegate.m:0:25
	; InlineAsm Start
	mov	x29, x29	; marker for objc_retainAutoreleaseReturnValue
	; InlineAsm End
	.loc	1 121 15                        ; dyld_inspector/AppDelegate.m:121:15
	bl	_objc_retainAutoreleasedReturnValue
Ltmp99:
	mov	x25, x0
	.loc	1 122 5 is_stmt 1               ; dyld_inspector/AppDelegate.m:122:5
Lloh16:
	adrp	x8, _OBJC_SELECTOR_REFERENCES_.13@PAGE
Lloh17:
	ldr	x26, [x8, _OBJC_SELECTOR_REFERENCES_.13@PAGEOFF]
	mov	x0, x20
	mov	x1, x26
	mov	x2, x25
	mov	w3, #1
	bl	_objc_msgSend
Ltmp100:
	.loc	1 123 15                        ; dyld_inspector/AppDelegate.m:123:15
Lloh18:
	adrp	x2, l__unnamed_cfstring_.16@PAGE
Lloh19:
	add	x2, x2, l__unnamed_cfstring_.16@PAGEOFF
	mov	x0, x23
	mov	x1, x24
	bl	_objc_msgSend
Ltmp101:
	;DEBUG_VALUE: inspectSharedCache:appFile <- $x0
	.loc	1 0 15 is_stmt 0                ; dyld_inspector/AppDelegate.m:0:15
	; InlineAsm Start
	mov	x29, x29	; marker for objc_retainAutoreleaseReturnValue
	; InlineAsm End
	.loc	1 123 13                        ; dyld_inspector/AppDelegate.m:123:13
	bl	_objc_retainAutoreleasedReturnValue
Ltmp102:
	mov	x27, x0
	mov	x0, x25
	bl	_objc_release
Ltmp103:
	.loc	1 0 13                          ; dyld_inspector/AppDelegate.m:0:13
	ldr	x19, [sp, #16]                  ; 8-byte Folded Reload
	.loc	1 124 5 is_stmt 1               ; dyld_inspector/AppDelegate.m:124:5
	mov	x0, x19
	mov	x1, x26
	mov	x2, x27
	mov	w3, #1
	bl	_objc_msgSend
Ltmp104:
	.loc	1 125 15                        ; dyld_inspector/AppDelegate.m:125:15
Lloh20:
	adrp	x2, l__unnamed_cfstring_.19@PAGE
Lloh21:
	add	x2, x2, l__unnamed_cfstring_.19@PAGEOFF
	mov	x0, x23
	mov	x1, x24
	bl	_objc_msgSend
Ltmp105:
	;DEBUG_VALUE: inspectSharedCache:appFile <- $x0
	.loc	1 0 15 is_stmt 0                ; dyld_inspector/AppDelegate.m:0:15
	; InlineAsm Start
	mov	x29, x29	; marker for objc_retainAutoreleaseReturnValue
	; InlineAsm End
	.loc	1 125 13                        ; dyld_inspector/AppDelegate.m:125:13
	bl	_objc_retainAutoreleasedReturnValue
Ltmp106:
	mov	x24, x0
	mov	x0, x27
	bl	_objc_release
Ltmp107:
	.loc	1 126 5 is_stmt 1               ; dyld_inspector/AppDelegate.m:126:5
	mov	x0, x21
	mov	x1, x26
	mov	x2, x24
	mov	w3, #1
	bl	_objc_msgSend
Ltmp108:
	.loc	1 127 5                         ; dyld_inspector/AppDelegate.m:127:5
Lloh22:
	adrp	x0, l_.str.20@PAGE
Lloh23:
	add	x0, x0, l_.str.20@PAGEOFF
	bl	_puts
Ltmp109:
	.loc	1 128 1                         ; dyld_inspector/AppDelegate.m:128:1
	mov	x0, x24
	bl	_objc_release
Ltmp110:
	mov	x0, x23
	bl	_objc_release
Ltmp111:
	mov	x0, x22
	bl	_objc_release
Ltmp112:
	mov	x0, x21
	bl	_objc_release
Ltmp113:
	mov	x0, x19
	bl	_objc_release
Ltmp114:
	mov	x0, x20
	bl	_objc_release
Ltmp115:
	ldp	x29, x30, [sp, #112]            ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #96]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #80]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #64]             ; 16-byte Folded Reload
	ldp	x26, x25, [sp, #48]             ; 16-byte Folded Reload
	ldp	x28, x27, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #128                    ; =128
	retab
Ltmp116:
	.loh AdrpAdd	Lloh4, Lloh5
	.loh AdrpAdd	Lloh2, Lloh3
	.loh AdrpLdr	Lloh0, Lloh1
	.loh AdrpLdr	Lloh6, Lloh7
	.loh AdrpAdd	Lloh8, Lloh9
	.loh AdrpAdd	Lloh22, Lloh23
	.loh AdrpAdd	Lloh20, Lloh21
	.loh AdrpAdd	Lloh18, Lloh19
	.loh AdrpLdr	Lloh16, Lloh17
	.loh AdrpAdd	Lloh14, Lloh15
	.loh AdrpLdr	Lloh12, Lloh13
	.loh AdrpLdr	Lloh10, Lloh11
Lfunc_end2:
	.cfi_endproc
	.file	4 "/Applications/Xcode-beta.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS15.0.sdk/System/Library/Frameworks/Foundation.framework/Headers" "NSPathUtilities.h"
	.file	5 "/Applications/Xcode-beta.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS15.0.sdk/usr/include" "stdio.h"
                                        ; -- End function
	.p2align	2                               ; -- Begin function -[AppDelegate application:didFinishLaunchingWithOptions:]
"-[AppDelegate application:didFinishLaunchingWithOptions:]": ; @"\01-[AppDelegate application:didFinishLaunchingWithOptions:]"
Lfunc_begin3:
	.loc	1 130 0                         ; dyld_inspector/AppDelegate.m:130:0
	.cfi_startproc
; %bb.0:
	;DEBUG_VALUE: -[AppDelegate application:didFinishLaunchingWithOptions:]:self <- $x0
	;DEBUG_VALUE: -[AppDelegate application:didFinishLaunchingWithOptions:]:_cmd <- $x1
	;DEBUG_VALUE: -[AppDelegate application:didFinishLaunchingWithOptions:]:application <- $x2
	;DEBUG_VALUE: -[AppDelegate application:didFinishLaunchingWithOptions:]:launchOptions <- $x3
	pacibsp
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	mov	x29, sp
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
Ltmp117:
	.loc	1 133 5 prologue_end            ; dyld_inspector/AppDelegate.m:133:5
	bl	_inspectSharedCache
Ltmp118:
	;DEBUG_VALUE: -[AppDelegate application:didFinishLaunchingWithOptions:]:launchOptions <- [DW_OP_LLVM_entry_value 1] $x3
	;DEBUG_VALUE: -[AppDelegate application:didFinishLaunchingWithOptions:]:application <- [DW_OP_LLVM_entry_value 1] $x2
	;DEBUG_VALUE: -[AppDelegate application:didFinishLaunchingWithOptions:]:_cmd <- [DW_OP_LLVM_entry_value 1] $x1
	;DEBUG_VALUE: -[AppDelegate application:didFinishLaunchingWithOptions:]:self <- [DW_OP_LLVM_entry_value 1] $x0
	.loc	1 136 1                         ; dyld_inspector/AppDelegate.m:136:1
	mov	w0, #1
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	retab
Ltmp119:
Lfunc_end3:
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function -[AppDelegate applicationWillResignActive:]
"-[AppDelegate applicationWillResignActive:]": ; @"\01-[AppDelegate applicationWillResignActive:]"
Lfunc_begin4:
	.loc	1 139 0                         ; dyld_inspector/AppDelegate.m:139:0
	.cfi_startproc
; %bb.0:
	;DEBUG_VALUE: -[AppDelegate applicationWillResignActive:]:self <- $x0
	;DEBUG_VALUE: -[AppDelegate applicationWillResignActive:]:_cmd <- $x1
	;DEBUG_VALUE: -[AppDelegate applicationWillResignActive:]:application <- $x2
	.loc	1 142 1 prologue_end            ; dyld_inspector/AppDelegate.m:142:1
	ret
Ltmp120:
Lfunc_end4:
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function -[AppDelegate applicationDidEnterBackground:]
"-[AppDelegate applicationDidEnterBackground:]": ; @"\01-[AppDelegate applicationDidEnterBackground:]"
Lfunc_begin5:
	.loc	1 145 0                         ; dyld_inspector/AppDelegate.m:145:0
	.cfi_startproc
; %bb.0:
	;DEBUG_VALUE: -[AppDelegate applicationDidEnterBackground:]:self <- $x0
	;DEBUG_VALUE: -[AppDelegate applicationDidEnterBackground:]:_cmd <- $x1
	;DEBUG_VALUE: -[AppDelegate applicationDidEnterBackground:]:application <- $x2
	.loc	1 148 1 prologue_end            ; dyld_inspector/AppDelegate.m:148:1
	ret
Ltmp121:
Lfunc_end5:
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function -[AppDelegate applicationWillEnterForeground:]
"-[AppDelegate applicationWillEnterForeground:]": ; @"\01-[AppDelegate applicationWillEnterForeground:]"
Lfunc_begin6:
	.loc	1 151 0                         ; dyld_inspector/AppDelegate.m:151:0
	.cfi_startproc
; %bb.0:
	;DEBUG_VALUE: -[AppDelegate applicationWillEnterForeground:]:self <- $x0
	;DEBUG_VALUE: -[AppDelegate applicationWillEnterForeground:]:_cmd <- $x1
	;DEBUG_VALUE: -[AppDelegate applicationWillEnterForeground:]:application <- $x2
	.loc	1 153 1 prologue_end            ; dyld_inspector/AppDelegate.m:153:1
	ret
Ltmp122:
Lfunc_end6:
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function -[AppDelegate applicationDidBecomeActive:]
"-[AppDelegate applicationDidBecomeActive:]": ; @"\01-[AppDelegate applicationDidBecomeActive:]"
Lfunc_begin7:
	.loc	1 156 0                         ; dyld_inspector/AppDelegate.m:156:0
	.cfi_startproc
; %bb.0:
	;DEBUG_VALUE: -[AppDelegate applicationDidBecomeActive:]:self <- $x0
	;DEBUG_VALUE: -[AppDelegate applicationDidBecomeActive:]:_cmd <- $x1
	;DEBUG_VALUE: -[AppDelegate applicationDidBecomeActive:]:application <- $x2
	.loc	1 158 1 prologue_end            ; dyld_inspector/AppDelegate.m:158:1
	ret
Ltmp123:
Lfunc_end7:
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function -[AppDelegate applicationWillTerminate:]
"-[AppDelegate applicationWillTerminate:]": ; @"\01-[AppDelegate applicationWillTerminate:]"
Lfunc_begin8:
	.loc	1 161 0                         ; dyld_inspector/AppDelegate.m:161:0
	.cfi_startproc
; %bb.0:
	;DEBUG_VALUE: -[AppDelegate applicationWillTerminate:]:self <- $x0
	;DEBUG_VALUE: -[AppDelegate applicationWillTerminate:]:_cmd <- $x1
	;DEBUG_VALUE: -[AppDelegate applicationWillTerminate:]:application <- $x2
	.loc	1 163 1 prologue_end            ; dyld_inspector/AppDelegate.m:163:1
	ret
Ltmp124:
Lfunc_end8:
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function -[AppDelegate window]
"-[AppDelegate window]":                ; @"\01-[AppDelegate window]"
Lfunc_begin9:
	.loc	2 5 0                           ; dyld_inspector/AppDelegate.h:5:0
	.cfi_startproc
; %bb.0:
	;DEBUG_VALUE: -[AppDelegate window]:self <- $x0
	;DEBUG_VALUE: -[AppDelegate window]:self <- $x0
	;DEBUG_VALUE: -[AppDelegate window]:_cmd <- $x1
	.loc	2 5 41 prologue_end             ; dyld_inspector/AppDelegate.h:5:41
Lloh24:
	adrp	x8, _OBJC_IVAR_$_AppDelegate._window@PAGE
Lloh25:
	ldrsw	x8, [x8, _OBJC_IVAR_$_AppDelegate._window@PAGEOFF]
	ldr	x0, [x0, x8]
Ltmp125:
	;DEBUG_VALUE: -[AppDelegate window]:self <- [DW_OP_LLVM_entry_value 1] $x0
	ret
Ltmp126:
	.loh AdrpLdr	Lloh24, Lloh25
Lfunc_end9:
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function -[AppDelegate setWindow:]
"-[AppDelegate setWindow:]":            ; @"\01-[AppDelegate setWindow:]"
Lfunc_begin10:
	.loc	2 5 0                           ; dyld_inspector/AppDelegate.h:5:0
	.cfi_startproc
; %bb.0:
	;DEBUG_VALUE: -[AppDelegate setWindow:]:self <- $x0
	;DEBUG_VALUE: -[AppDelegate setWindow:]:_cmd <- $x1
	;DEBUG_VALUE: -[AppDelegate setWindow:]:window <- $x2
	mov	x1, x2
Ltmp127:
	;DEBUG_VALUE: -[AppDelegate setWindow:]:_cmd <- [DW_OP_LLVM_entry_value 1] $x1
	;DEBUG_VALUE: -[AppDelegate setWindow:]:window <- $x1
	;DEBUG_VALUE: -[AppDelegate setWindow:]:self <- $x0
	.loc	2 0 0 prologue_end              ; dyld_inspector/AppDelegate.h:0:0
Lloh26:
	adrp	x8, _OBJC_IVAR_$_AppDelegate._window@PAGE
Lloh27:
	ldrsw	x8, [x8, _OBJC_IVAR_$_AppDelegate._window@PAGEOFF]
	add	x0, x0, x8
Ltmp128:
	;DEBUG_VALUE: -[AppDelegate setWindow:]:self <- [DW_OP_LLVM_entry_value 1] $x0
	;DEBUG_VALUE: -[AppDelegate setWindow:]:window <- $x1
	b	_objc_storeStrong
Ltmp129:
	.loh AdrpLdr	Lloh26, Lloh27
Lfunc_end10:
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function -[AppDelegate .cxx_destruct]
"-[AppDelegate .cxx_destruct]":         ; @"\01-[AppDelegate .cxx_destruct]"
Lfunc_begin11:
	.loc	1 12 0                          ; dyld_inspector/AppDelegate.m:12:0
	.cfi_startproc
; %bb.0:
	;DEBUG_VALUE: -[AppDelegate .cxx_destruct]:self <- $x0
	;DEBUG_VALUE: -[AppDelegate .cxx_destruct]:self <- $x0
	;DEBUG_VALUE: -[AppDelegate .cxx_destruct]:_cmd <- $x1
	.loc	1 12 17 prologue_end            ; dyld_inspector/AppDelegate.m:12:17
Lloh28:
	adrp	x8, _OBJC_IVAR_$_AppDelegate._window@PAGE
Lloh29:
	ldrsw	x8, [x8, _OBJC_IVAR_$_AppDelegate._window@PAGEOFF]
	add	x0, x0, x8
Ltmp130:
	;DEBUG_VALUE: -[AppDelegate .cxx_destruct]:self <- [DW_OP_LLVM_entry_value 1] $x0
	mov	x1, #0
Ltmp131:
	;DEBUG_VALUE: -[AppDelegate .cxx_destruct]:_cmd <- [DW_OP_LLVM_entry_value 1] $x1
	b	_objc_storeStrong
Ltmp132:
	.loh AdrpLdr	Lloh28, Lloh29
Lfunc_end11:
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function isReadable.cold.1
_isReadable.cold.1:                     ; @isReadable.cold.1
Lfunc_begin12:
	.loc	1 0 0                           ; dyld_inspector/AppDelegate.m:0:0
	.cfi_startproc
; %bb.0:
	pacibsp
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	mov	x29, sp
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
Ltmp133:
	.loc	1 17 9 prologue_end             ; dyld_inspector/AppDelegate.m:17:9
Lloh30:
	adrp	x0, l_.str@PAGE
Lloh31:
	add	x0, x0, l_.str@PAGEOFF
	bl	_perror
	bl	_OUTLINED_FUNCTION_0
Ltmp134:
	.loh AdrpAdd	Lloh30, Lloh31
Lfunc_end12:
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function isWritable.cold.1
_isWritable.cold.1:                     ; @isWritable.cold.1
Lfunc_begin13:
	.loc	1 0 0                           ; dyld_inspector/AppDelegate.m:0:0
	.cfi_startproc
; %bb.0:
	pacibsp
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	mov	x29, sp
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
Ltmp135:
	.loc	1 42 9 prologue_end             ; dyld_inspector/AppDelegate.m:42:9
Lloh32:
	adrp	x0, l_.str.1@PAGE
Lloh33:
	add	x0, x0, l_.str.1@PAGEOFF
	bl	_perror
	bl	_OUTLINED_FUNCTION_0
Ltmp136:
	.loh AdrpAdd	Lloh32, Lloh33
Lfunc_end13:
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function isWritable.cold.2
_isWritable.cold.2:                     ; @isWritable.cold.2
Lfunc_begin14:
	.loc	1 0 0                           ; dyld_inspector/AppDelegate.m:0:0
	.cfi_startproc
; %bb.0:
	pacibsp
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	mov	x29, sp
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
Ltmp137:
	.loc	1 36 9 prologue_end             ; dyld_inspector/AppDelegate.m:36:9
Lloh34:
	adrp	x0, l_.str@PAGE
Lloh35:
	add	x0, x0, l_.str@PAGEOFF
	bl	_perror
	bl	_OUTLINED_FUNCTION_0
Ltmp138:
	.loh AdrpAdd	Lloh34, Lloh35
Lfunc_end14:
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function OUTLINED_FUNCTION_0
_OUTLINED_FUNCTION_0:                   ; @OUTLINED_FUNCTION_0 Thunk
Lfunc_begin15:
	.cfi_startproc
; %bb.0:
	mov	w0, #-1
	eor	x16, x30, x30, lsl #1
	tbz	x16, #62, Ltmp139
	brk	#0xc471
Ltmp139:
	b	_exit
Lfunc_end15:
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__cstring,cstring_literals
l_.str:                                 ; @.str
	.asciz	"pipe"

l_.str.1:                               ; @.str.1
	.asciz	"write"

	.section	__DATA,__objc_classrefs,regular,no_dead_strip
	.p2align	3                               ; @"OBJC_CLASSLIST_REFERENCES_$_"
_OBJC_CLASSLIST_REFERENCES_$_:
	.quad	_OBJC_CLASS_$_NSMutableData

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_:                  ; @OBJC_METH_VAR_NAME_
	.asciz	"data"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3                               ; @OBJC_SELECTOR_REFERENCES_
_OBJC_SELECTOR_REFERENCES_:
	.quad	l_OBJC_METH_VAR_NAME_

	.section	__TEXT,__cstring,cstring_literals
l_.str.2:                               ; @.str.2
	.asciz	"[+] shared cache is mapped between 0x%lx and 0x%lx\n"

l_.str.3:                               ; @.str.3
	.asciz	"[+] writable region starts at 0x%lx, 0x%lx bytes from the start\n"

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.4:                ; @OBJC_METH_VAR_NAME_.4
	.asciz	"appendBytes:length:"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3                               ; @OBJC_SELECTOR_REFERENCES_.5
_OBJC_SELECTOR_REFERENCES_.5:
	.quad	l_OBJC_METH_VAR_NAME_.4

	.section	__TEXT,__cstring,cstring_literals
l_.str.6:                               ; @.str.6
	.asciz	"%lu/%lu\n"

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.7:                ; @OBJC_METH_VAR_NAME_.7
	.asciz	"objectAtIndex:"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3                               ; @OBJC_SELECTOR_REFERENCES_.8
_OBJC_SELECTOR_REFERENCES_.8:
	.quad	l_OBJC_METH_VAR_NAME_.7

	.section	__TEXT,__cstring,cstring_literals
l_.str.9:                               ; @.str.9
	.asciz	"shared_cache_nullmap.bin"

	.section	__DATA,__cfstring
	.p2align	3                               ; @_unnamed_cfstring_
l__unnamed_cfstring_:
	.quad	___CFConstantStringClassReference@AUTH(da,27361,addr)
	.long	1992                            ; 0x7c8
	.space	4
	.quad	l_.str.9
	.quad	24                              ; 0x18

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.10:               ; @OBJC_METH_VAR_NAME_.10
	.asciz	"stringByAppendingPathComponent:"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3                               ; @OBJC_SELECTOR_REFERENCES_.11
_OBJC_SELECTOR_REFERENCES_.11:
	.quad	l_OBJC_METH_VAR_NAME_.10

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.12:               ; @OBJC_METH_VAR_NAME_.12
	.asciz	"writeToFile:atomically:"

	.section	__DATA,__objc_selrefs,literal_pointers,no_dead_strip
	.p2align	3                               ; @OBJC_SELECTOR_REFERENCES_.13
_OBJC_SELECTOR_REFERENCES_.13:
	.quad	l_OBJC_METH_VAR_NAME_.12

	.section	__TEXT,__cstring,cstring_literals
l_.str.15:                              ; @.str.15
	.asciz	"shared_cache_tpmap.bin"

	.section	__DATA,__cfstring
	.p2align	3                               ; @_unnamed_cfstring_.16
l__unnamed_cfstring_.16:
	.quad	___CFConstantStringClassReference@AUTH(da,27361,addr)
	.long	1992                            ; 0x7c8
	.space	4
	.quad	l_.str.15
	.quad	22                              ; 0x16

	.section	__TEXT,__cstring,cstring_literals
l_.str.18:                              ; @.str.18
	.asciz	"shared_cache_ptrmap.bin"

	.section	__DATA,__cfstring
	.p2align	3                               ; @_unnamed_cfstring_.19
l__unnamed_cfstring_.19:
	.quad	___CFConstantStringClassReference@AUTH(da,27361,addr)
	.long	1992                            ; 0x7c8
	.space	4
	.quad	l_.str.18
	.quad	23                              ; 0x17

	.section	__TEXT,__cstring,cstring_literals
l_.str.20:                              ; @.str.20
	.asciz	"Done. Download the shared_cache profiles via Finder now"

	.private_extern	_OBJC_IVAR_$_AppDelegate._window ; @"OBJC_IVAR_$_AppDelegate._window"
	.section	__DATA,__objc_ivar
	.globl	_OBJC_IVAR_$_AppDelegate._window
	.p2align	2
_OBJC_IVAR_$_AppDelegate._window:
	.long	8                               ; 0x8

	.section	__TEXT,__objc_classname,cstring_literals
l_OBJC_CLASS_NAME_:                     ; @OBJC_CLASS_NAME_
	.asciz	"AppDelegate"

l_OBJC_CLASS_NAME_.21:                  ; @OBJC_CLASS_NAME_.21
	.asciz	"UIApplicationDelegate"

l_OBJC_CLASS_NAME_.22:                  ; @OBJC_CLASS_NAME_.22
	.asciz	"NSObject"

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.23:               ; @OBJC_METH_VAR_NAME_.23
	.asciz	"isEqual:"

	.section	__TEXT,__objc_methtype,cstring_literals
l_OBJC_METH_VAR_TYPE_:                  ; @OBJC_METH_VAR_TYPE_
	.asciz	"B24@0:8@16"

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.24:               ; @OBJC_METH_VAR_NAME_.24
	.asciz	"class"

	.section	__TEXT,__objc_methtype,cstring_literals
l_OBJC_METH_VAR_TYPE_.25:               ; @OBJC_METH_VAR_TYPE_.25
	.asciz	"#16@0:8"

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.26:               ; @OBJC_METH_VAR_NAME_.26
	.asciz	"self"

	.section	__TEXT,__objc_methtype,cstring_literals
l_OBJC_METH_VAR_TYPE_.27:               ; @OBJC_METH_VAR_TYPE_.27
	.asciz	"@16@0:8"

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.28:               ; @OBJC_METH_VAR_NAME_.28
	.asciz	"performSelector:"

	.section	__TEXT,__objc_methtype,cstring_literals
l_OBJC_METH_VAR_TYPE_.29:               ; @OBJC_METH_VAR_TYPE_.29
	.asciz	"@24@0:8:16"

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.30:               ; @OBJC_METH_VAR_NAME_.30
	.asciz	"performSelector:withObject:"

	.section	__TEXT,__objc_methtype,cstring_literals
l_OBJC_METH_VAR_TYPE_.31:               ; @OBJC_METH_VAR_TYPE_.31
	.asciz	"@32@0:8:16@24"

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.32:               ; @OBJC_METH_VAR_NAME_.32
	.asciz	"performSelector:withObject:withObject:"

	.section	__TEXT,__objc_methtype,cstring_literals
l_OBJC_METH_VAR_TYPE_.33:               ; @OBJC_METH_VAR_TYPE_.33
	.asciz	"@40@0:8:16@24@32"

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.34:               ; @OBJC_METH_VAR_NAME_.34
	.asciz	"isProxy"

	.section	__TEXT,__objc_methtype,cstring_literals
l_OBJC_METH_VAR_TYPE_.35:               ; @OBJC_METH_VAR_TYPE_.35
	.asciz	"B16@0:8"

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.36:               ; @OBJC_METH_VAR_NAME_.36
	.asciz	"isKindOfClass:"

	.section	__TEXT,__objc_methtype,cstring_literals
l_OBJC_METH_VAR_TYPE_.37:               ; @OBJC_METH_VAR_TYPE_.37
	.asciz	"B24@0:8#16"

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.38:               ; @OBJC_METH_VAR_NAME_.38
	.asciz	"isMemberOfClass:"

l_OBJC_METH_VAR_NAME_.39:               ; @OBJC_METH_VAR_NAME_.39
	.asciz	"conformsToProtocol:"

l_OBJC_METH_VAR_NAME_.40:               ; @OBJC_METH_VAR_NAME_.40
	.asciz	"respondsToSelector:"

	.section	__TEXT,__objc_methtype,cstring_literals
l_OBJC_METH_VAR_TYPE_.41:               ; @OBJC_METH_VAR_TYPE_.41
	.asciz	"B24@0:8:16"

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.42:               ; @OBJC_METH_VAR_NAME_.42
	.asciz	"retain"

l_OBJC_METH_VAR_NAME_.43:               ; @OBJC_METH_VAR_NAME_.43
	.asciz	"release"

	.section	__TEXT,__objc_methtype,cstring_literals
l_OBJC_METH_VAR_TYPE_.44:               ; @OBJC_METH_VAR_TYPE_.44
	.asciz	"Vv16@0:8"

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.45:               ; @OBJC_METH_VAR_NAME_.45
	.asciz	"autorelease"

l_OBJC_METH_VAR_NAME_.46:               ; @OBJC_METH_VAR_NAME_.46
	.asciz	"retainCount"

	.section	__TEXT,__objc_methtype,cstring_literals
l_OBJC_METH_VAR_TYPE_.47:               ; @OBJC_METH_VAR_TYPE_.47
	.asciz	"Q16@0:8"

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.48:               ; @OBJC_METH_VAR_NAME_.48
	.asciz	"zone"

	.section	__TEXT,__objc_methtype,cstring_literals
l_OBJC_METH_VAR_TYPE_.49:               ; @OBJC_METH_VAR_TYPE_.49
	.asciz	"^{_NSZone=}16@0:8"

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.50:               ; @OBJC_METH_VAR_NAME_.50
	.asciz	"hash"

l_OBJC_METH_VAR_NAME_.51:               ; @OBJC_METH_VAR_NAME_.51
	.asciz	"superclass"

l_OBJC_METH_VAR_NAME_.52:               ; @OBJC_METH_VAR_NAME_.52
	.asciz	"description"

	.section	__DATA,__objc_const
	.p2align	3                               ; @"_OBJC_$_PROTOCOL_INSTANCE_METHODS_NSObject"
__OBJC_$_PROTOCOL_INSTANCE_METHODS_NSObject:
	.long	24                              ; 0x18
	.long	19                              ; 0x13
	.quad	l_OBJC_METH_VAR_NAME_.23
	.quad	l_OBJC_METH_VAR_TYPE_
	.quad	0
	.quad	l_OBJC_METH_VAR_NAME_.24
	.quad	l_OBJC_METH_VAR_TYPE_.25
	.quad	0
	.quad	l_OBJC_METH_VAR_NAME_.26
	.quad	l_OBJC_METH_VAR_TYPE_.27
	.quad	0
	.quad	l_OBJC_METH_VAR_NAME_.28
	.quad	l_OBJC_METH_VAR_TYPE_.29
	.quad	0
	.quad	l_OBJC_METH_VAR_NAME_.30
	.quad	l_OBJC_METH_VAR_TYPE_.31
	.quad	0
	.quad	l_OBJC_METH_VAR_NAME_.32
	.quad	l_OBJC_METH_VAR_TYPE_.33
	.quad	0
	.quad	l_OBJC_METH_VAR_NAME_.34
	.quad	l_OBJC_METH_VAR_TYPE_.35
	.quad	0
	.quad	l_OBJC_METH_VAR_NAME_.36
	.quad	l_OBJC_METH_VAR_TYPE_.37
	.quad	0
	.quad	l_OBJC_METH_VAR_NAME_.38
	.quad	l_OBJC_METH_VAR_TYPE_.37
	.quad	0
	.quad	l_OBJC_METH_VAR_NAME_.39
	.quad	l_OBJC_METH_VAR_TYPE_
	.quad	0
	.quad	l_OBJC_METH_VAR_NAME_.40
	.quad	l_OBJC_METH_VAR_TYPE_.41
	.quad	0
	.quad	l_OBJC_METH_VAR_NAME_.42
	.quad	l_OBJC_METH_VAR_TYPE_.27
	.quad	0
	.quad	l_OBJC_METH_VAR_NAME_.43
	.quad	l_OBJC_METH_VAR_TYPE_.44
	.quad	0
	.quad	l_OBJC_METH_VAR_NAME_.45
	.quad	l_OBJC_METH_VAR_TYPE_.27
	.quad	0
	.quad	l_OBJC_METH_VAR_NAME_.46
	.quad	l_OBJC_METH_VAR_TYPE_.47
	.quad	0
	.quad	l_OBJC_METH_VAR_NAME_.48
	.quad	l_OBJC_METH_VAR_TYPE_.49
	.quad	0
	.quad	l_OBJC_METH_VAR_NAME_.50
	.quad	l_OBJC_METH_VAR_TYPE_.47
	.quad	0
	.quad	l_OBJC_METH_VAR_NAME_.51
	.quad	l_OBJC_METH_VAR_TYPE_.25
	.quad	0
	.quad	l_OBJC_METH_VAR_NAME_.52
	.quad	l_OBJC_METH_VAR_TYPE_.27
	.quad	0

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.53:               ; @OBJC_METH_VAR_NAME_.53
	.asciz	"debugDescription"

	.section	__DATA,__objc_const
	.p2align	3                               ; @"_OBJC_$_PROTOCOL_INSTANCE_METHODS_OPT_NSObject"
__OBJC_$_PROTOCOL_INSTANCE_METHODS_OPT_NSObject:
	.long	24                              ; 0x18
	.long	1                               ; 0x1
	.quad	l_OBJC_METH_VAR_NAME_.53
	.quad	l_OBJC_METH_VAR_TYPE_.27
	.quad	0

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_PROP_NAME_ATTR_:                 ; @OBJC_PROP_NAME_ATTR_
	.asciz	"hash"

l_OBJC_PROP_NAME_ATTR_.54:              ; @OBJC_PROP_NAME_ATTR_.54
	.asciz	"TQ,R"

l_OBJC_PROP_NAME_ATTR_.55:              ; @OBJC_PROP_NAME_ATTR_.55
	.asciz	"superclass"

l_OBJC_PROP_NAME_ATTR_.56:              ; @OBJC_PROP_NAME_ATTR_.56
	.asciz	"T#,R"

l_OBJC_PROP_NAME_ATTR_.57:              ; @OBJC_PROP_NAME_ATTR_.57
	.asciz	"description"

l_OBJC_PROP_NAME_ATTR_.58:              ; @OBJC_PROP_NAME_ATTR_.58
	.asciz	"T@\"NSString\",R,C"

l_OBJC_PROP_NAME_ATTR_.59:              ; @OBJC_PROP_NAME_ATTR_.59
	.asciz	"debugDescription"

	.section	__DATA,__objc_const
	.p2align	3                               ; @"_OBJC_$_PROP_LIST_NSObject"
__OBJC_$_PROP_LIST_NSObject:
	.long	16                              ; 0x10
	.long	4                               ; 0x4
	.quad	l_OBJC_PROP_NAME_ATTR_
	.quad	l_OBJC_PROP_NAME_ATTR_.54
	.quad	l_OBJC_PROP_NAME_ATTR_.55
	.quad	l_OBJC_PROP_NAME_ATTR_.56
	.quad	l_OBJC_PROP_NAME_ATTR_.57
	.quad	l_OBJC_PROP_NAME_ATTR_.58
	.quad	l_OBJC_PROP_NAME_ATTR_.59
	.quad	l_OBJC_PROP_NAME_ATTR_.58

	.section	__TEXT,__objc_methtype,cstring_literals
l_OBJC_METH_VAR_TYPE_.60:               ; @OBJC_METH_VAR_TYPE_.60
	.asciz	"B24@0:8@\"Protocol\"16"

l_OBJC_METH_VAR_TYPE_.61:               ; @OBJC_METH_VAR_TYPE_.61
	.asciz	"@\"NSString\"16@0:8"

	.section	__DATA,__objc_const
	.p2align	3                               ; @"_OBJC_$_PROTOCOL_METHOD_TYPES_NSObject"
__OBJC_$_PROTOCOL_METHOD_TYPES_NSObject:
	.quad	l_OBJC_METH_VAR_TYPE_
	.quad	l_OBJC_METH_VAR_TYPE_.25
	.quad	l_OBJC_METH_VAR_TYPE_.27
	.quad	l_OBJC_METH_VAR_TYPE_.29
	.quad	l_OBJC_METH_VAR_TYPE_.31
	.quad	l_OBJC_METH_VAR_TYPE_.33
	.quad	l_OBJC_METH_VAR_TYPE_.35
	.quad	l_OBJC_METH_VAR_TYPE_.37
	.quad	l_OBJC_METH_VAR_TYPE_.37
	.quad	l_OBJC_METH_VAR_TYPE_.60
	.quad	l_OBJC_METH_VAR_TYPE_.41
	.quad	l_OBJC_METH_VAR_TYPE_.27
	.quad	l_OBJC_METH_VAR_TYPE_.44
	.quad	l_OBJC_METH_VAR_TYPE_.27
	.quad	l_OBJC_METH_VAR_TYPE_.47
	.quad	l_OBJC_METH_VAR_TYPE_.49
	.quad	l_OBJC_METH_VAR_TYPE_.47
	.quad	l_OBJC_METH_VAR_TYPE_.25
	.quad	l_OBJC_METH_VAR_TYPE_.61
	.quad	l_OBJC_METH_VAR_TYPE_.61

	.private_extern	__OBJC_PROTOCOL_$_NSObject ; @"_OBJC_PROTOCOL_$_NSObject"
	.section	__DATA,__data
	.globl	__OBJC_PROTOCOL_$_NSObject
	.weak_definition	__OBJC_PROTOCOL_$_NSObject
	.p2align	3
__OBJC_PROTOCOL_$_NSObject:
	.quad	0
	.quad	l_OBJC_CLASS_NAME_.22
	.quad	0
	.quad	__OBJC_$_PROTOCOL_INSTANCE_METHODS_NSObject
	.quad	0
	.quad	__OBJC_$_PROTOCOL_INSTANCE_METHODS_OPT_NSObject
	.quad	0
	.quad	__OBJC_$_PROP_LIST_NSObject
	.long	96                              ; 0x60
	.long	0                               ; 0x0
	.quad	__OBJC_$_PROTOCOL_METHOD_TYPES_NSObject
	.quad	0
	.quad	0

	.private_extern	__OBJC_LABEL_PROTOCOL_$_NSObject ; @"_OBJC_LABEL_PROTOCOL_$_NSObject"
	.section	__DATA,__objc_protolist,coalesced,no_dead_strip
	.globl	__OBJC_LABEL_PROTOCOL_$_NSObject
	.weak_definition	__OBJC_LABEL_PROTOCOL_$_NSObject
	.p2align	3
__OBJC_LABEL_PROTOCOL_$_NSObject:
	.quad	__OBJC_PROTOCOL_$_NSObject

	.section	__DATA,__objc_const
	.p2align	3                               ; @"_OBJC_$_PROTOCOL_REFS_UIApplicationDelegate"
__OBJC_$_PROTOCOL_REFS_UIApplicationDelegate:
	.quad	1                               ; 0x1
	.quad	__OBJC_PROTOCOL_$_NSObject
	.quad	0

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.62:               ; @OBJC_METH_VAR_NAME_.62
	.asciz	"applicationDidFinishLaunching:"

	.section	__TEXT,__objc_methtype,cstring_literals
l_OBJC_METH_VAR_TYPE_.63:               ; @OBJC_METH_VAR_TYPE_.63
	.asciz	"v24@0:8@16"

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.64:               ; @OBJC_METH_VAR_NAME_.64
	.asciz	"application:willFinishLaunchingWithOptions:"

	.section	__TEXT,__objc_methtype,cstring_literals
l_OBJC_METH_VAR_TYPE_.65:               ; @OBJC_METH_VAR_TYPE_.65
	.asciz	"B32@0:8@16@24"

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.66:               ; @OBJC_METH_VAR_NAME_.66
	.asciz	"application:didFinishLaunchingWithOptions:"

l_OBJC_METH_VAR_NAME_.67:               ; @OBJC_METH_VAR_NAME_.67
	.asciz	"applicationDidBecomeActive:"

l_OBJC_METH_VAR_NAME_.68:               ; @OBJC_METH_VAR_NAME_.68
	.asciz	"applicationWillResignActive:"

l_OBJC_METH_VAR_NAME_.69:               ; @OBJC_METH_VAR_NAME_.69
	.asciz	"application:handleOpenURL:"

l_OBJC_METH_VAR_NAME_.70:               ; @OBJC_METH_VAR_NAME_.70
	.asciz	"application:openURL:sourceApplication:annotation:"

	.section	__TEXT,__objc_methtype,cstring_literals
l_OBJC_METH_VAR_TYPE_.71:               ; @OBJC_METH_VAR_TYPE_.71
	.asciz	"B48@0:8@16@24@32@40"

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.72:               ; @OBJC_METH_VAR_NAME_.72
	.asciz	"application:openURL:options:"

	.section	__TEXT,__objc_methtype,cstring_literals
l_OBJC_METH_VAR_TYPE_.73:               ; @OBJC_METH_VAR_TYPE_.73
	.asciz	"B40@0:8@16@24@32"

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.74:               ; @OBJC_METH_VAR_NAME_.74
	.asciz	"applicationDidReceiveMemoryWarning:"

l_OBJC_METH_VAR_NAME_.75:               ; @OBJC_METH_VAR_NAME_.75
	.asciz	"applicationWillTerminate:"

l_OBJC_METH_VAR_NAME_.76:               ; @OBJC_METH_VAR_NAME_.76
	.asciz	"applicationSignificantTimeChange:"

l_OBJC_METH_VAR_NAME_.77:               ; @OBJC_METH_VAR_NAME_.77
	.asciz	"application:willChangeStatusBarOrientation:duration:"

	.section	__TEXT,__objc_methtype,cstring_literals
l_OBJC_METH_VAR_TYPE_.78:               ; @OBJC_METH_VAR_TYPE_.78
	.asciz	"v40@0:8@16q24d32"

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.79:               ; @OBJC_METH_VAR_NAME_.79
	.asciz	"application:didChangeStatusBarOrientation:"

	.section	__TEXT,__objc_methtype,cstring_literals
l_OBJC_METH_VAR_TYPE_.80:               ; @OBJC_METH_VAR_TYPE_.80
	.asciz	"v32@0:8@16q24"

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.81:               ; @OBJC_METH_VAR_NAME_.81
	.asciz	"application:willChangeStatusBarFrame:"

	.section	__TEXT,__objc_methtype,cstring_literals
l_OBJC_METH_VAR_TYPE_.82:               ; @OBJC_METH_VAR_TYPE_.82
	.asciz	"v56@0:8@16{CGRect={CGPoint=dd}{CGSize=dd}}24"

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.83:               ; @OBJC_METH_VAR_NAME_.83
	.asciz	"application:didChangeStatusBarFrame:"

l_OBJC_METH_VAR_NAME_.84:               ; @OBJC_METH_VAR_NAME_.84
	.asciz	"application:didRegisterUserNotificationSettings:"

	.section	__TEXT,__objc_methtype,cstring_literals
l_OBJC_METH_VAR_TYPE_.85:               ; @OBJC_METH_VAR_TYPE_.85
	.asciz	"v32@0:8@16@24"

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.86:               ; @OBJC_METH_VAR_NAME_.86
	.asciz	"application:didRegisterForRemoteNotificationsWithDeviceToken:"

l_OBJC_METH_VAR_NAME_.87:               ; @OBJC_METH_VAR_NAME_.87
	.asciz	"application:didFailToRegisterForRemoteNotificationsWithError:"

l_OBJC_METH_VAR_NAME_.88:               ; @OBJC_METH_VAR_NAME_.88
	.asciz	"application:didReceiveRemoteNotification:"

l_OBJC_METH_VAR_NAME_.89:               ; @OBJC_METH_VAR_NAME_.89
	.asciz	"application:didReceiveLocalNotification:"

l_OBJC_METH_VAR_NAME_.90:               ; @OBJC_METH_VAR_NAME_.90
	.asciz	"application:handleActionWithIdentifier:forLocalNotification:completionHandler:"

	.section	__TEXT,__objc_methtype,cstring_literals
l_OBJC_METH_VAR_TYPE_.91:               ; @OBJC_METH_VAR_TYPE_.91
	.asciz	"v48@0:8@16@24@32@?40"

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.92:               ; @OBJC_METH_VAR_NAME_.92
	.asciz	"application:handleActionWithIdentifier:forRemoteNotification:withResponseInfo:completionHandler:"

	.section	__TEXT,__objc_methtype,cstring_literals
l_OBJC_METH_VAR_TYPE_.93:               ; @OBJC_METH_VAR_TYPE_.93
	.asciz	"v56@0:8@16@24@32@40@?48"

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.94:               ; @OBJC_METH_VAR_NAME_.94
	.asciz	"application:handleActionWithIdentifier:forRemoteNotification:completionHandler:"

l_OBJC_METH_VAR_NAME_.95:               ; @OBJC_METH_VAR_NAME_.95
	.asciz	"application:handleActionWithIdentifier:forLocalNotification:withResponseInfo:completionHandler:"

l_OBJC_METH_VAR_NAME_.96:               ; @OBJC_METH_VAR_NAME_.96
	.asciz	"application:didReceiveRemoteNotification:fetchCompletionHandler:"

	.section	__TEXT,__objc_methtype,cstring_literals
l_OBJC_METH_VAR_TYPE_.97:               ; @OBJC_METH_VAR_TYPE_.97
	.asciz	"v40@0:8@16@24@?32"

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.98:               ; @OBJC_METH_VAR_NAME_.98
	.asciz	"application:performFetchWithCompletionHandler:"

	.section	__TEXT,__objc_methtype,cstring_literals
l_OBJC_METH_VAR_TYPE_.99:               ; @OBJC_METH_VAR_TYPE_.99
	.asciz	"v32@0:8@16@?24"

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.100:              ; @OBJC_METH_VAR_NAME_.100
	.asciz	"application:performActionForShortcutItem:completionHandler:"

l_OBJC_METH_VAR_NAME_.101:              ; @OBJC_METH_VAR_NAME_.101
	.asciz	"application:handleEventsForBackgroundURLSession:completionHandler:"

l_OBJC_METH_VAR_NAME_.102:              ; @OBJC_METH_VAR_NAME_.102
	.asciz	"application:handleWatchKitExtensionRequest:reply:"

l_OBJC_METH_VAR_NAME_.103:              ; @OBJC_METH_VAR_NAME_.103
	.asciz	"applicationShouldRequestHealthAuthorization:"

l_OBJC_METH_VAR_NAME_.104:              ; @OBJC_METH_VAR_NAME_.104
	.asciz	"application:handlerForIntent:"

	.section	__TEXT,__objc_methtype,cstring_literals
l_OBJC_METH_VAR_TYPE_.105:              ; @OBJC_METH_VAR_TYPE_.105
	.asciz	"@32@0:8@16@24"

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.106:              ; @OBJC_METH_VAR_NAME_.106
	.asciz	"application:handleIntent:completionHandler:"

l_OBJC_METH_VAR_NAME_.107:              ; @OBJC_METH_VAR_NAME_.107
	.asciz	"applicationDidEnterBackground:"

l_OBJC_METH_VAR_NAME_.108:              ; @OBJC_METH_VAR_NAME_.108
	.asciz	"applicationWillEnterForeground:"

l_OBJC_METH_VAR_NAME_.109:              ; @OBJC_METH_VAR_NAME_.109
	.asciz	"applicationProtectedDataWillBecomeUnavailable:"

l_OBJC_METH_VAR_NAME_.110:              ; @OBJC_METH_VAR_NAME_.110
	.asciz	"applicationProtectedDataDidBecomeAvailable:"

l_OBJC_METH_VAR_NAME_.111:              ; @OBJC_METH_VAR_NAME_.111
	.asciz	"application:supportedInterfaceOrientationsForWindow:"

	.section	__TEXT,__objc_methtype,cstring_literals
l_OBJC_METH_VAR_TYPE_.112:              ; @OBJC_METH_VAR_TYPE_.112
	.asciz	"Q32@0:8@16@24"

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.113:              ; @OBJC_METH_VAR_NAME_.113
	.asciz	"application:shouldAllowExtensionPointIdentifier:"

l_OBJC_METH_VAR_NAME_.114:              ; @OBJC_METH_VAR_NAME_.114
	.asciz	"application:viewControllerWithRestorationIdentifierPath:coder:"

	.section	__TEXT,__objc_methtype,cstring_literals
l_OBJC_METH_VAR_TYPE_.115:              ; @OBJC_METH_VAR_TYPE_.115
	.asciz	"@40@0:8@16@24@32"

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.116:              ; @OBJC_METH_VAR_NAME_.116
	.asciz	"application:shouldSaveSecureApplicationState:"

l_OBJC_METH_VAR_NAME_.117:              ; @OBJC_METH_VAR_NAME_.117
	.asciz	"application:shouldRestoreSecureApplicationState:"

l_OBJC_METH_VAR_NAME_.118:              ; @OBJC_METH_VAR_NAME_.118
	.asciz	"application:willEncodeRestorableStateWithCoder:"

l_OBJC_METH_VAR_NAME_.119:              ; @OBJC_METH_VAR_NAME_.119
	.asciz	"application:didDecodeRestorableStateWithCoder:"

l_OBJC_METH_VAR_NAME_.120:              ; @OBJC_METH_VAR_NAME_.120
	.asciz	"application:shouldSaveApplicationState:"

l_OBJC_METH_VAR_NAME_.121:              ; @OBJC_METH_VAR_NAME_.121
	.asciz	"application:shouldRestoreApplicationState:"

l_OBJC_METH_VAR_NAME_.122:              ; @OBJC_METH_VAR_NAME_.122
	.asciz	"application:willContinueUserActivityWithType:"

l_OBJC_METH_VAR_NAME_.123:              ; @OBJC_METH_VAR_NAME_.123
	.asciz	"application:continueUserActivity:restorationHandler:"

	.section	__TEXT,__objc_methtype,cstring_literals
l_OBJC_METH_VAR_TYPE_.124:              ; @OBJC_METH_VAR_TYPE_.124
	.asciz	"B40@0:8@16@24@?32"

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.125:              ; @OBJC_METH_VAR_NAME_.125
	.asciz	"application:didFailToContinueUserActivityWithType:error:"

	.section	__TEXT,__objc_methtype,cstring_literals
l_OBJC_METH_VAR_TYPE_.126:              ; @OBJC_METH_VAR_TYPE_.126
	.asciz	"v40@0:8@16@24@32"

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.127:              ; @OBJC_METH_VAR_NAME_.127
	.asciz	"application:didUpdateUserActivity:"

l_OBJC_METH_VAR_NAME_.128:              ; @OBJC_METH_VAR_NAME_.128
	.asciz	"application:userDidAcceptCloudKitShareWithMetadata:"

l_OBJC_METH_VAR_NAME_.129:              ; @OBJC_METH_VAR_NAME_.129
	.asciz	"application:configurationForConnectingSceneSession:options:"

l_OBJC_METH_VAR_NAME_.130:              ; @OBJC_METH_VAR_NAME_.130
	.asciz	"application:didDiscardSceneSessions:"

l_OBJC_METH_VAR_NAME_.131:              ; @OBJC_METH_VAR_NAME_.131
	.asciz	"applicationShouldAutomaticallyLocalizeKeyCommands:"

l_OBJC_METH_VAR_NAME_.132:              ; @OBJC_METH_VAR_NAME_.132
	.asciz	"window"

l_OBJC_METH_VAR_NAME_.133:              ; @OBJC_METH_VAR_NAME_.133
	.asciz	"setWindow:"

	.section	__DATA,__objc_const
	.p2align	3                               ; @"_OBJC_$_PROTOCOL_INSTANCE_METHODS_OPT_UIApplicationDelegate"
__OBJC_$_PROTOCOL_INSTANCE_METHODS_OPT_UIApplicationDelegate:
	.long	24                              ; 0x18
	.long	55                              ; 0x37
	.quad	l_OBJC_METH_VAR_NAME_.62
	.quad	l_OBJC_METH_VAR_TYPE_.63
	.quad	0
	.quad	l_OBJC_METH_VAR_NAME_.64
	.quad	l_OBJC_METH_VAR_TYPE_.65
	.quad	0
	.quad	l_OBJC_METH_VAR_NAME_.66
	.quad	l_OBJC_METH_VAR_TYPE_.65
	.quad	0
	.quad	l_OBJC_METH_VAR_NAME_.67
	.quad	l_OBJC_METH_VAR_TYPE_.63
	.quad	0
	.quad	l_OBJC_METH_VAR_NAME_.68
	.quad	l_OBJC_METH_VAR_TYPE_.63
	.quad	0
	.quad	l_OBJC_METH_VAR_NAME_.69
	.quad	l_OBJC_METH_VAR_TYPE_.65
	.quad	0
	.quad	l_OBJC_METH_VAR_NAME_.70
	.quad	l_OBJC_METH_VAR_TYPE_.71
	.quad	0
	.quad	l_OBJC_METH_VAR_NAME_.72
	.quad	l_OBJC_METH_VAR_TYPE_.73
	.quad	0
	.quad	l_OBJC_METH_VAR_NAME_.74
	.quad	l_OBJC_METH_VAR_TYPE_.63
	.quad	0
	.quad	l_OBJC_METH_VAR_NAME_.75
	.quad	l_OBJC_METH_VAR_TYPE_.63
	.quad	0
	.quad	l_OBJC_METH_VAR_NAME_.76
	.quad	l_OBJC_METH_VAR_TYPE_.63
	.quad	0
	.quad	l_OBJC_METH_VAR_NAME_.77
	.quad	l_OBJC_METH_VAR_TYPE_.78
	.quad	0
	.quad	l_OBJC_METH_VAR_NAME_.79
	.quad	l_OBJC_METH_VAR_TYPE_.80
	.quad	0
	.quad	l_OBJC_METH_VAR_NAME_.81
	.quad	l_OBJC_METH_VAR_TYPE_.82
	.quad	0
	.quad	l_OBJC_METH_VAR_NAME_.83
	.quad	l_OBJC_METH_VAR_TYPE_.82
	.quad	0
	.quad	l_OBJC_METH_VAR_NAME_.84
	.quad	l_OBJC_METH_VAR_TYPE_.85
	.quad	0
	.quad	l_OBJC_METH_VAR_NAME_.86
	.quad	l_OBJC_METH_VAR_TYPE_.85
	.quad	0
	.quad	l_OBJC_METH_VAR_NAME_.87
	.quad	l_OBJC_METH_VAR_TYPE_.85
	.quad	0
	.quad	l_OBJC_METH_VAR_NAME_.88
	.quad	l_OBJC_METH_VAR_TYPE_.85
	.quad	0
	.quad	l_OBJC_METH_VAR_NAME_.89
	.quad	l_OBJC_METH_VAR_TYPE_.85
	.quad	0
	.quad	l_OBJC_METH_VAR_NAME_.90
	.quad	l_OBJC_METH_VAR_TYPE_.91
	.quad	0
	.quad	l_OBJC_METH_VAR_NAME_.92
	.quad	l_OBJC_METH_VAR_TYPE_.93
	.quad	0
	.quad	l_OBJC_METH_VAR_NAME_.94
	.quad	l_OBJC_METH_VAR_TYPE_.91
	.quad	0
	.quad	l_OBJC_METH_VAR_NAME_.95
	.quad	l_OBJC_METH_VAR_TYPE_.93
	.quad	0
	.quad	l_OBJC_METH_VAR_NAME_.96
	.quad	l_OBJC_METH_VAR_TYPE_.97
	.quad	0
	.quad	l_OBJC_METH_VAR_NAME_.98
	.quad	l_OBJC_METH_VAR_TYPE_.99
	.quad	0
	.quad	l_OBJC_METH_VAR_NAME_.100
	.quad	l_OBJC_METH_VAR_TYPE_.97
	.quad	0
	.quad	l_OBJC_METH_VAR_NAME_.101
	.quad	l_OBJC_METH_VAR_TYPE_.97
	.quad	0
	.quad	l_OBJC_METH_VAR_NAME_.102
	.quad	l_OBJC_METH_VAR_TYPE_.97
	.quad	0
	.quad	l_OBJC_METH_VAR_NAME_.103
	.quad	l_OBJC_METH_VAR_TYPE_.63
	.quad	0
	.quad	l_OBJC_METH_VAR_NAME_.104
	.quad	l_OBJC_METH_VAR_TYPE_.105
	.quad	0
	.quad	l_OBJC_METH_VAR_NAME_.106
	.quad	l_OBJC_METH_VAR_TYPE_.97
	.quad	0
	.quad	l_OBJC_METH_VAR_NAME_.107
	.quad	l_OBJC_METH_VAR_TYPE_.63
	.quad	0
	.quad	l_OBJC_METH_VAR_NAME_.108
	.quad	l_OBJC_METH_VAR_TYPE_.63
	.quad	0
	.quad	l_OBJC_METH_VAR_NAME_.109
	.quad	l_OBJC_METH_VAR_TYPE_.63
	.quad	0
	.quad	l_OBJC_METH_VAR_NAME_.110
	.quad	l_OBJC_METH_VAR_TYPE_.63
	.quad	0
	.quad	l_OBJC_METH_VAR_NAME_.111
	.quad	l_OBJC_METH_VAR_TYPE_.112
	.quad	0
	.quad	l_OBJC_METH_VAR_NAME_.113
	.quad	l_OBJC_METH_VAR_TYPE_.65
	.quad	0
	.quad	l_OBJC_METH_VAR_NAME_.114
	.quad	l_OBJC_METH_VAR_TYPE_.115
	.quad	0
	.quad	l_OBJC_METH_VAR_NAME_.116
	.quad	l_OBJC_METH_VAR_TYPE_.65
	.quad	0
	.quad	l_OBJC_METH_VAR_NAME_.117
	.quad	l_OBJC_METH_VAR_TYPE_.65
	.quad	0
	.quad	l_OBJC_METH_VAR_NAME_.118
	.quad	l_OBJC_METH_VAR_TYPE_.85
	.quad	0
	.quad	l_OBJC_METH_VAR_NAME_.119
	.quad	l_OBJC_METH_VAR_TYPE_.85
	.quad	0
	.quad	l_OBJC_METH_VAR_NAME_.120
	.quad	l_OBJC_METH_VAR_TYPE_.65
	.quad	0
	.quad	l_OBJC_METH_VAR_NAME_.121
	.quad	l_OBJC_METH_VAR_TYPE_.65
	.quad	0
	.quad	l_OBJC_METH_VAR_NAME_.122
	.quad	l_OBJC_METH_VAR_TYPE_.65
	.quad	0
	.quad	l_OBJC_METH_VAR_NAME_.123
	.quad	l_OBJC_METH_VAR_TYPE_.124
	.quad	0
	.quad	l_OBJC_METH_VAR_NAME_.125
	.quad	l_OBJC_METH_VAR_TYPE_.126
	.quad	0
	.quad	l_OBJC_METH_VAR_NAME_.127
	.quad	l_OBJC_METH_VAR_TYPE_.85
	.quad	0
	.quad	l_OBJC_METH_VAR_NAME_.128
	.quad	l_OBJC_METH_VAR_TYPE_.85
	.quad	0
	.quad	l_OBJC_METH_VAR_NAME_.129
	.quad	l_OBJC_METH_VAR_TYPE_.115
	.quad	0
	.quad	l_OBJC_METH_VAR_NAME_.130
	.quad	l_OBJC_METH_VAR_TYPE_.85
	.quad	0
	.quad	l_OBJC_METH_VAR_NAME_.131
	.quad	l_OBJC_METH_VAR_TYPE_
	.quad	0
	.quad	l_OBJC_METH_VAR_NAME_.132
	.quad	l_OBJC_METH_VAR_TYPE_.27
	.quad	0
	.quad	l_OBJC_METH_VAR_NAME_.133
	.quad	l_OBJC_METH_VAR_TYPE_.63
	.quad	0

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_PROP_NAME_ATTR_.134:             ; @OBJC_PROP_NAME_ATTR_.134
	.asciz	"window"

l_OBJC_PROP_NAME_ATTR_.135:             ; @OBJC_PROP_NAME_ATTR_.135
	.asciz	"T@\"UIWindow\",&,N"

	.section	__DATA,__objc_const
	.p2align	3                               ; @"_OBJC_$_PROP_LIST_UIApplicationDelegate"
__OBJC_$_PROP_LIST_UIApplicationDelegate:
	.long	16                              ; 0x10
	.long	1                               ; 0x1
	.quad	l_OBJC_PROP_NAME_ATTR_.134
	.quad	l_OBJC_PROP_NAME_ATTR_.135

	.section	__TEXT,__objc_methtype,cstring_literals
l_OBJC_METH_VAR_TYPE_.136:              ; @OBJC_METH_VAR_TYPE_.136
	.asciz	"v24@0:8@\"UIApplication\"16"

l_OBJC_METH_VAR_TYPE_.137:              ; @OBJC_METH_VAR_TYPE_.137
	.asciz	"B32@0:8@\"UIApplication\"16@\"NSDictionary\"24"

l_OBJC_METH_VAR_TYPE_.138:              ; @OBJC_METH_VAR_TYPE_.138
	.asciz	"B32@0:8@\"UIApplication\"16@\"NSURL\"24"

l_OBJC_METH_VAR_TYPE_.139:              ; @OBJC_METH_VAR_TYPE_.139
	.asciz	"B48@0:8@\"UIApplication\"16@\"NSURL\"24@\"NSString\"32@40"

l_OBJC_METH_VAR_TYPE_.140:              ; @OBJC_METH_VAR_TYPE_.140
	.asciz	"B40@0:8@\"UIApplication\"16@\"NSURL\"24@\"NSDictionary\"32"

l_OBJC_METH_VAR_TYPE_.141:              ; @OBJC_METH_VAR_TYPE_.141
	.asciz	"v40@0:8@\"UIApplication\"16q24d32"

l_OBJC_METH_VAR_TYPE_.142:              ; @OBJC_METH_VAR_TYPE_.142
	.asciz	"v32@0:8@\"UIApplication\"16q24"

l_OBJC_METH_VAR_TYPE_.143:              ; @OBJC_METH_VAR_TYPE_.143
	.asciz	"v56@0:8@\"UIApplication\"16{CGRect={CGPoint=dd}{CGSize=dd}}24"

l_OBJC_METH_VAR_TYPE_.144:              ; @OBJC_METH_VAR_TYPE_.144
	.asciz	"v32@0:8@\"UIApplication\"16@\"UIUserNotificationSettings\"24"

l_OBJC_METH_VAR_TYPE_.145:              ; @OBJC_METH_VAR_TYPE_.145
	.asciz	"v32@0:8@\"UIApplication\"16@\"NSData\"24"

l_OBJC_METH_VAR_TYPE_.146:              ; @OBJC_METH_VAR_TYPE_.146
	.asciz	"v32@0:8@\"UIApplication\"16@\"NSError\"24"

l_OBJC_METH_VAR_TYPE_.147:              ; @OBJC_METH_VAR_TYPE_.147
	.asciz	"v32@0:8@\"UIApplication\"16@\"NSDictionary\"24"

l_OBJC_METH_VAR_TYPE_.148:              ; @OBJC_METH_VAR_TYPE_.148
	.asciz	"v32@0:8@\"UIApplication\"16@\"UILocalNotification\"24"

l_OBJC_METH_VAR_TYPE_.149:              ; @OBJC_METH_VAR_TYPE_.149
	.asciz	"v48@0:8@\"UIApplication\"16@\"NSString\"24@\"UILocalNotification\"32@?<v@?>40"

l_OBJC_METH_VAR_TYPE_.150:              ; @OBJC_METH_VAR_TYPE_.150
	.asciz	"v56@0:8@\"UIApplication\"16@\"NSString\"24@\"NSDictionary\"32@\"NSDictionary\"40@?<v@?>48"

l_OBJC_METH_VAR_TYPE_.151:              ; @OBJC_METH_VAR_TYPE_.151
	.asciz	"v48@0:8@\"UIApplication\"16@\"NSString\"24@\"NSDictionary\"32@?<v@?>40"

l_OBJC_METH_VAR_TYPE_.152:              ; @OBJC_METH_VAR_TYPE_.152
	.asciz	"v56@0:8@\"UIApplication\"16@\"NSString\"24@\"UILocalNotification\"32@\"NSDictionary\"40@?<v@?>48"

l_OBJC_METH_VAR_TYPE_.153:              ; @OBJC_METH_VAR_TYPE_.153
	.asciz	"v40@0:8@\"UIApplication\"16@\"NSDictionary\"24@?<v@?Q>32"

l_OBJC_METH_VAR_TYPE_.154:              ; @OBJC_METH_VAR_TYPE_.154
	.asciz	"v32@0:8@\"UIApplication\"16@?<v@?Q>24"

l_OBJC_METH_VAR_TYPE_.155:              ; @OBJC_METH_VAR_TYPE_.155
	.asciz	"v40@0:8@\"UIApplication\"16@\"UIApplicationShortcutItem\"24@?<v@?B>32"

l_OBJC_METH_VAR_TYPE_.156:              ; @OBJC_METH_VAR_TYPE_.156
	.asciz	"v40@0:8@\"UIApplication\"16@\"NSString\"24@?<v@?>32"

l_OBJC_METH_VAR_TYPE_.157:              ; @OBJC_METH_VAR_TYPE_.157
	.asciz	"v40@0:8@\"UIApplication\"16@\"NSDictionary\"24@?<v@?@\"NSDictionary\">32"

l_OBJC_METH_VAR_TYPE_.158:              ; @OBJC_METH_VAR_TYPE_.158
	.asciz	"@32@0:8@\"UIApplication\"16@\"INIntent\"24"

l_OBJC_METH_VAR_TYPE_.159:              ; @OBJC_METH_VAR_TYPE_.159
	.asciz	"v40@0:8@\"UIApplication\"16@\"INIntent\"24@?<v@?@\"INIntentResponse\">32"

l_OBJC_METH_VAR_TYPE_.160:              ; @OBJC_METH_VAR_TYPE_.160
	.asciz	"Q32@0:8@\"UIApplication\"16@\"UIWindow\"24"

l_OBJC_METH_VAR_TYPE_.161:              ; @OBJC_METH_VAR_TYPE_.161
	.asciz	"B32@0:8@\"UIApplication\"16@\"NSString\"24"

l_OBJC_METH_VAR_TYPE_.162:              ; @OBJC_METH_VAR_TYPE_.162
	.asciz	"@\"UIViewController\"40@0:8@\"UIApplication\"16@\"NSArray\"24@\"NSCoder\"32"

l_OBJC_METH_VAR_TYPE_.163:              ; @OBJC_METH_VAR_TYPE_.163
	.asciz	"B32@0:8@\"UIApplication\"16@\"NSCoder\"24"

l_OBJC_METH_VAR_TYPE_.164:              ; @OBJC_METH_VAR_TYPE_.164
	.asciz	"v32@0:8@\"UIApplication\"16@\"NSCoder\"24"

l_OBJC_METH_VAR_TYPE_.165:              ; @OBJC_METH_VAR_TYPE_.165
	.asciz	"B40@0:8@\"UIApplication\"16@\"NSUserActivity\"24@?<v@?@\"NSArray\">32"

l_OBJC_METH_VAR_TYPE_.166:              ; @OBJC_METH_VAR_TYPE_.166
	.asciz	"v40@0:8@\"UIApplication\"16@\"NSString\"24@\"NSError\"32"

l_OBJC_METH_VAR_TYPE_.167:              ; @OBJC_METH_VAR_TYPE_.167
	.asciz	"v32@0:8@\"UIApplication\"16@\"NSUserActivity\"24"

l_OBJC_METH_VAR_TYPE_.168:              ; @OBJC_METH_VAR_TYPE_.168
	.asciz	"v32@0:8@\"UIApplication\"16@\"CKShareMetadata\"24"

l_OBJC_METH_VAR_TYPE_.169:              ; @OBJC_METH_VAR_TYPE_.169
	.asciz	"@\"UISceneConfiguration\"40@0:8@\"UIApplication\"16@\"UISceneSession\"24@\"UISceneConnectionOptions\"32"

l_OBJC_METH_VAR_TYPE_.170:              ; @OBJC_METH_VAR_TYPE_.170
	.asciz	"v32@0:8@\"UIApplication\"16@\"NSSet\"24"

l_OBJC_METH_VAR_TYPE_.171:              ; @OBJC_METH_VAR_TYPE_.171
	.asciz	"B24@0:8@\"UIApplication\"16"

l_OBJC_METH_VAR_TYPE_.172:              ; @OBJC_METH_VAR_TYPE_.172
	.asciz	"@\"UIWindow\"16@0:8"

l_OBJC_METH_VAR_TYPE_.173:              ; @OBJC_METH_VAR_TYPE_.173
	.asciz	"v24@0:8@\"UIWindow\"16"

	.section	__DATA,__objc_const
	.p2align	3                               ; @"_OBJC_$_PROTOCOL_METHOD_TYPES_UIApplicationDelegate"
__OBJC_$_PROTOCOL_METHOD_TYPES_UIApplicationDelegate:
	.quad	l_OBJC_METH_VAR_TYPE_.136
	.quad	l_OBJC_METH_VAR_TYPE_.137
	.quad	l_OBJC_METH_VAR_TYPE_.137
	.quad	l_OBJC_METH_VAR_TYPE_.136
	.quad	l_OBJC_METH_VAR_TYPE_.136
	.quad	l_OBJC_METH_VAR_TYPE_.138
	.quad	l_OBJC_METH_VAR_TYPE_.139
	.quad	l_OBJC_METH_VAR_TYPE_.140
	.quad	l_OBJC_METH_VAR_TYPE_.136
	.quad	l_OBJC_METH_VAR_TYPE_.136
	.quad	l_OBJC_METH_VAR_TYPE_.136
	.quad	l_OBJC_METH_VAR_TYPE_.141
	.quad	l_OBJC_METH_VAR_TYPE_.142
	.quad	l_OBJC_METH_VAR_TYPE_.143
	.quad	l_OBJC_METH_VAR_TYPE_.143
	.quad	l_OBJC_METH_VAR_TYPE_.144
	.quad	l_OBJC_METH_VAR_TYPE_.145
	.quad	l_OBJC_METH_VAR_TYPE_.146
	.quad	l_OBJC_METH_VAR_TYPE_.147
	.quad	l_OBJC_METH_VAR_TYPE_.148
	.quad	l_OBJC_METH_VAR_TYPE_.149
	.quad	l_OBJC_METH_VAR_TYPE_.150
	.quad	l_OBJC_METH_VAR_TYPE_.151
	.quad	l_OBJC_METH_VAR_TYPE_.152
	.quad	l_OBJC_METH_VAR_TYPE_.153
	.quad	l_OBJC_METH_VAR_TYPE_.154
	.quad	l_OBJC_METH_VAR_TYPE_.155
	.quad	l_OBJC_METH_VAR_TYPE_.156
	.quad	l_OBJC_METH_VAR_TYPE_.157
	.quad	l_OBJC_METH_VAR_TYPE_.136
	.quad	l_OBJC_METH_VAR_TYPE_.158
	.quad	l_OBJC_METH_VAR_TYPE_.159
	.quad	l_OBJC_METH_VAR_TYPE_.136
	.quad	l_OBJC_METH_VAR_TYPE_.136
	.quad	l_OBJC_METH_VAR_TYPE_.136
	.quad	l_OBJC_METH_VAR_TYPE_.136
	.quad	l_OBJC_METH_VAR_TYPE_.160
	.quad	l_OBJC_METH_VAR_TYPE_.161
	.quad	l_OBJC_METH_VAR_TYPE_.162
	.quad	l_OBJC_METH_VAR_TYPE_.163
	.quad	l_OBJC_METH_VAR_TYPE_.163
	.quad	l_OBJC_METH_VAR_TYPE_.164
	.quad	l_OBJC_METH_VAR_TYPE_.164
	.quad	l_OBJC_METH_VAR_TYPE_.163
	.quad	l_OBJC_METH_VAR_TYPE_.163
	.quad	l_OBJC_METH_VAR_TYPE_.161
	.quad	l_OBJC_METH_VAR_TYPE_.165
	.quad	l_OBJC_METH_VAR_TYPE_.166
	.quad	l_OBJC_METH_VAR_TYPE_.167
	.quad	l_OBJC_METH_VAR_TYPE_.168
	.quad	l_OBJC_METH_VAR_TYPE_.169
	.quad	l_OBJC_METH_VAR_TYPE_.170
	.quad	l_OBJC_METH_VAR_TYPE_.171
	.quad	l_OBJC_METH_VAR_TYPE_.172
	.quad	l_OBJC_METH_VAR_TYPE_.173

	.private_extern	__OBJC_PROTOCOL_$_UIApplicationDelegate ; @"_OBJC_PROTOCOL_$_UIApplicationDelegate"
	.section	__DATA,__data
	.globl	__OBJC_PROTOCOL_$_UIApplicationDelegate
	.weak_definition	__OBJC_PROTOCOL_$_UIApplicationDelegate
	.p2align	3
__OBJC_PROTOCOL_$_UIApplicationDelegate:
	.quad	0
	.quad	l_OBJC_CLASS_NAME_.21
	.quad	__OBJC_$_PROTOCOL_REFS_UIApplicationDelegate
	.quad	0
	.quad	0
	.quad	__OBJC_$_PROTOCOL_INSTANCE_METHODS_OPT_UIApplicationDelegate
	.quad	0
	.quad	__OBJC_$_PROP_LIST_UIApplicationDelegate
	.long	96                              ; 0x60
	.long	0                               ; 0x0
	.quad	__OBJC_$_PROTOCOL_METHOD_TYPES_UIApplicationDelegate
	.quad	0
	.quad	0

	.private_extern	__OBJC_LABEL_PROTOCOL_$_UIApplicationDelegate ; @"_OBJC_LABEL_PROTOCOL_$_UIApplicationDelegate"
	.section	__DATA,__objc_protolist,coalesced,no_dead_strip
	.globl	__OBJC_LABEL_PROTOCOL_$_UIApplicationDelegate
	.weak_definition	__OBJC_LABEL_PROTOCOL_$_UIApplicationDelegate
	.p2align	3
__OBJC_LABEL_PROTOCOL_$_UIApplicationDelegate:
	.quad	__OBJC_PROTOCOL_$_UIApplicationDelegate

	.section	__DATA,__objc_const
	.p2align	3                               ; @"_OBJC_CLASS_PROTOCOLS_$_AppDelegate"
__OBJC_CLASS_PROTOCOLS_$_AppDelegate:
	.quad	1                               ; 0x1
	.quad	__OBJC_PROTOCOL_$_UIApplicationDelegate
	.quad	0

	.p2align	3                               ; @"_OBJC_METACLASS_RO_$_AppDelegate"
__OBJC_METACLASS_RO_$_AppDelegate:
	.long	405                             ; 0x195
	.long	40                              ; 0x28
	.long	40                              ; 0x28
	.space	4
	.quad	0
	.quad	l_OBJC_CLASS_NAME_
	.quad	0
	.quad	__OBJC_CLASS_PROTOCOLS_$_AppDelegate
	.quad	0
	.quad	0
	.quad	0

	.private_extern	_OBJC_METACLASS_$_AppDelegate ; @"OBJC_METACLASS_$_AppDelegate"
	.section	__DATA,__objc_data
	.globl	_OBJC_METACLASS_$_AppDelegate
	.p2align	3
_OBJC_METACLASS_$_AppDelegate:
	.quad	_OBJC_METACLASS_$_NSObject@AUTH(da,27361,addr)
	.quad	_OBJC_METACLASS_$_UIResponder@AUTH(da,46507,addr)
	.quad	__objc_empty_cache
	.quad	0
	.quad	__OBJC_METACLASS_RO_$_AppDelegate

	.section	__TEXT,__objc_classname,cstring_literals
l_OBJC_CLASS_NAME_.174:                 ; @OBJC_CLASS_NAME_.174
	.asciz	"\001"

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.175:              ; @OBJC_METH_VAR_NAME_.175
	.asciz	".cxx_destruct"

	.section	__TEXT,__objc_methtype,cstring_literals
l_OBJC_METH_VAR_TYPE_.176:              ; @OBJC_METH_VAR_TYPE_.176
	.asciz	"v16@0:8"

	.section	__DATA,__objc_const
	.p2align	3                               ; @"_OBJC_$_INSTANCE_METHODS_AppDelegate"
__OBJC_$_INSTANCE_METHODS_AppDelegate:
	.long	24                              ; 0x18
	.long	9                               ; 0x9
	.quad	l_OBJC_METH_VAR_NAME_.66
	.quad	l_OBJC_METH_VAR_TYPE_.65
	.quad	"-[AppDelegate application:didFinishLaunchingWithOptions:]"@AUTH(ia,0,addr)
	.quad	l_OBJC_METH_VAR_NAME_.68
	.quad	l_OBJC_METH_VAR_TYPE_.63
	.quad	"-[AppDelegate applicationWillResignActive:]"@AUTH(ia,0,addr)
	.quad	l_OBJC_METH_VAR_NAME_.107
	.quad	l_OBJC_METH_VAR_TYPE_.63
	.quad	"-[AppDelegate applicationDidEnterBackground:]"@AUTH(ia,0,addr)
	.quad	l_OBJC_METH_VAR_NAME_.108
	.quad	l_OBJC_METH_VAR_TYPE_.63
	.quad	"-[AppDelegate applicationWillEnterForeground:]"@AUTH(ia,0,addr)
	.quad	l_OBJC_METH_VAR_NAME_.67
	.quad	l_OBJC_METH_VAR_TYPE_.63
	.quad	"-[AppDelegate applicationDidBecomeActive:]"@AUTH(ia,0,addr)
	.quad	l_OBJC_METH_VAR_NAME_.75
	.quad	l_OBJC_METH_VAR_TYPE_.63
	.quad	"-[AppDelegate applicationWillTerminate:]"@AUTH(ia,0,addr)
	.quad	l_OBJC_METH_VAR_NAME_.132
	.quad	l_OBJC_METH_VAR_TYPE_.27
	.quad	"-[AppDelegate window]"@AUTH(ia,0,addr)
	.quad	l_OBJC_METH_VAR_NAME_.133
	.quad	l_OBJC_METH_VAR_TYPE_.63
	.quad	"-[AppDelegate setWindow:]"@AUTH(ia,0,addr)
	.quad	l_OBJC_METH_VAR_NAME_.175
	.quad	l_OBJC_METH_VAR_TYPE_.176
	.quad	"-[AppDelegate .cxx_destruct]"@AUTH(ia,0,addr)

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_METH_VAR_NAME_.177:              ; @OBJC_METH_VAR_NAME_.177
	.asciz	"_window"

	.section	__TEXT,__objc_methtype,cstring_literals
l_OBJC_METH_VAR_TYPE_.178:              ; @OBJC_METH_VAR_TYPE_.178
	.asciz	"@\"UIWindow\""

	.section	__DATA,__objc_const
	.p2align	3                               ; @"_OBJC_$_INSTANCE_VARIABLES_AppDelegate"
__OBJC_$_INSTANCE_VARIABLES_AppDelegate:
	.long	32                              ; 0x20
	.long	1                               ; 0x1
	.quad	_OBJC_IVAR_$_AppDelegate._window
	.quad	l_OBJC_METH_VAR_NAME_.177
	.quad	l_OBJC_METH_VAR_TYPE_.178
	.long	3                               ; 0x3
	.long	8                               ; 0x8

	.section	__TEXT,__objc_methname,cstring_literals
l_OBJC_PROP_NAME_ATTR_.179:             ; @OBJC_PROP_NAME_ATTR_.179
	.asciz	"T@\"UIWindow\",&,N,V_window"

	.section	__DATA,__objc_const
	.p2align	3                               ; @"_OBJC_$_PROP_LIST_AppDelegate"
__OBJC_$_PROP_LIST_AppDelegate:
	.long	16                              ; 0x10
	.long	5                               ; 0x5
	.quad	l_OBJC_PROP_NAME_ATTR_.134
	.quad	l_OBJC_PROP_NAME_ATTR_.179
	.quad	l_OBJC_PROP_NAME_ATTR_
	.quad	l_OBJC_PROP_NAME_ATTR_.54
	.quad	l_OBJC_PROP_NAME_ATTR_.55
	.quad	l_OBJC_PROP_NAME_ATTR_.56
	.quad	l_OBJC_PROP_NAME_ATTR_.57
	.quad	l_OBJC_PROP_NAME_ATTR_.58
	.quad	l_OBJC_PROP_NAME_ATTR_.59
	.quad	l_OBJC_PROP_NAME_ATTR_.58

	.p2align	3                               ; @"_OBJC_CLASS_RO_$_AppDelegate"
__OBJC_CLASS_RO_$_AppDelegate:
	.long	404                             ; 0x194
	.long	8                               ; 0x8
	.long	16                              ; 0x10
	.space	4
	.quad	l_OBJC_CLASS_NAME_.174
	.quad	l_OBJC_CLASS_NAME_
	.quad	__OBJC_$_INSTANCE_METHODS_AppDelegate@AUTH(da,49936,addr)
	.quad	__OBJC_CLASS_PROTOCOLS_$_AppDelegate
	.quad	__OBJC_$_INSTANCE_VARIABLES_AppDelegate
	.quad	0
	.quad	__OBJC_$_PROP_LIST_AppDelegate

	.private_extern	_OBJC_CLASS_$_AppDelegate ; @"OBJC_CLASS_$_AppDelegate"
	.section	__DATA,__objc_data
	.globl	_OBJC_CLASS_$_AppDelegate
	.p2align	3
_OBJC_CLASS_$_AppDelegate:
	.quad	_OBJC_METACLASS_$_AppDelegate@AUTH(da,27361,addr)
	.quad	_OBJC_CLASS_$_UIResponder@AUTH(da,46507,addr)
	.quad	__objc_empty_cache
	.quad	0
	.quad	__OBJC_CLASS_RO_$_AppDelegate

	.section	__DATA,__objc_classlist,regular,no_dead_strip
	.p2align	3                               ; @"OBJC_LABEL_CLASS_$"
l_OBJC_LABEL_CLASS_$:
	.quad	_OBJC_CLASS_$_AppDelegate

	.section	__LLVM,__bitcode
l_llvm.embedded.module:                 ; @llvm.embedded.module
	.byte	0

	.section	__LLVM,__cmdline
l_llvm.cmdline:                         ; @llvm.cmdline
	.asciz	"-cc1\000-triple\000arm64e-apple-ios12.0.0\000-S\000-disable-free\000-disable-llvm-verifier\000-discard-value-names\000-main-file-name\000AppDelegate.m\000-mrelocation-model\000pic\000-pic-level\0002\000-mframe-pointer=non-leaf\000-fno-strict-return\000-fno-rounding-math\000-munwind-tables\000-target-sdk-version=15.0\000-fvisibility-inlines-hidden-static-local-var\000-fptrauth-abi-version=0\000-fptrauth-returns\000-fptrauth-intrinsics\000-fptrauth-calls\000-fptrauth-indirect-gotos\000-fptrauth-auth-traps\000-fptrauth-objc-isa-mode=sign-and-strip\000-target-cpu\000apple-a12\000-target-feature\000+v8.3a\000-target-feature\000+fp-armv8\000-target-feature\000+neon\000-target-feature\000+crc\000-target-feature\000+crypto\000-target-feature\000+fullfp16\000-target-feature\000+ras\000-target-feature\000+lse\000-target-feature\000+rdm\000-target-feature\000+rcpc\000-target-feature\000+zcm\000-target-feature\000+zcz\000-target-feature\000+sha2\000-target-feature\000+aes\000-target-abi\000darwinpcs\000-fallow-half-arguments-and-returns\000-dwarf-ext-refs\000-fmodule-format=obj\000-debug-info-kind=standalone\000-dwarf-version=4\000-debugger-tuning=lldb\000-target-linker-version\000705\000-resource-dir\000/Applications/Xcode-beta.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/13.0.0\000-dependency-file\000/Users/xss/Library/Developer/Xcode/DerivedData/dyld_inspector-aiyokovxbbbfxhhczwfbbzptsyqb/Build/Intermediates.noindex/dyld_inspector.build/Release-iphoneos/dyld_inspector.build/Objects-normal/arm64e/AppDelegate.d\000-skip-unused-modulemap-deps\000-MT\000dependencies\000-isysroot\000/Applications/Xcode-beta.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS15.0.sdk\000-iquote\000/Users/xss/Library/Developer/Xcode/DerivedData/dyld_inspector-aiyokovxbbbfxhhczwfbbzptsyqb/Build/Intermediates.noindex/dyld_inspector.build/Release-iphoneos/dyld_inspector.build/dyld_inspector-generated-files.hmap\000-iquote\000/Users/xss/Library/Developer/Xcode/DerivedData/dyld_inspector-aiyokovxbbbfxhhczwfbbzptsyqb/Build/Intermediates.noindex/dyld_inspector.build/Release-iphoneos/dyld_inspector.build/dyld_inspector-project-headers.hmap\000-D\000NS_BLOCK_ASSERTIONS=1\000-D\000OBJC_OLD_DISPATCH_PROTOTYPES=0\000-I\000/Users/xss/Library/Developer/Xcode/DerivedData/dyld_inspector-aiyokovxbbbfxhhczwfbbzptsyqb/Build/Intermediates.noindex/dyld_inspector.build/Release-iphoneos/dyld_inspector.build/dyld_inspector-own-target-headers.hmap\000-I\000/Users/xss/Library/Developer/Xcode/DerivedData/dyld_inspector-aiyokovxbbbfxhhczwfbbzptsyqb/Build/Intermediates.noindex/dyld_inspector.build/Release-iphoneos/dyld_inspector.build/dyld_inspector-all-target-headers.hmap\000-I\000/Users/xss/Library/Developer/Xcode/DerivedData/dyld_inspector-aiyokovxbbbfxhhczwfbbzptsyqb/Build/Products/Release-iphoneos/include\000-I\000/Users/xss/Library/Developer/Xcode/DerivedData/dyld_inspector-aiyokovxbbbfxhhczwfbbzptsyqb/Build/Intermediates.noindex/dyld_inspector.build/Release-iphoneos/dyld_inspector.build/DerivedSources-normal/arm64e\000-I\000/Users/xss/Library/Developer/Xcode/DerivedData/dyld_inspector-aiyokovxbbbfxhhczwfbbzptsyqb/Build/Intermediates.noindex/dyld_inspector.build/Release-iphoneos/dyld_inspector.build/DerivedSources/arm64e\000-I\000/Users/xss/Library/Developer/Xcode/DerivedData/dyld_inspector-aiyokovxbbbfxhhczwfbbzptsyqb/Build/Intermediates.noindex/dyld_inspector.build/Release-iphoneos/dyld_inspector.build/DerivedSources\000-F/Users/xss/Library/Developer/Xcode/DerivedData/dyld_inspector-aiyokovxbbbfxhhczwfbbzptsyqb/Build/Products/Release-iphoneos\000-internal-isystem\000/Applications/Xcode-beta.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS15.0.sdk/usr/local/include\000-internal-isystem\000/Applications/Xcode-beta.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/13.0.0/include\000-internal-externc-isystem\000/Applications/Xcode-beta.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS15.0.sdk/usr/include\000-internal-externc-isystem\000/Applications/Xcode-beta.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include\000-Os\000-std=gnu11\000-fdebug-compilation-dir\000dyld_inspector\000-ferror-limit\00019\000-fmacro-backtrace-limit\0000\000-fvisibility\000hidden\000-stack-protector\0001\000-mdarwin-stkchk-strong-link\000-fblocks\000-fencode-extended-block-signature\000-fregister-global-dtors-with-atexit\000-fgnuc-version=4.2.1\000-fmodules\000-fimplicit-module-maps\000-fmodules-cache-path=/Users/xss/Library/Developer/Xcode/DerivedData/ModuleCache.noindex\000-fmodules-prune-interval=86400\000-fmodules-prune-after=345600\000-fbuild-session-timestamp=1626296565727630038\000-fmodules-validate-once-per-build-session\000-fmodules-validate-system-headers\000-fobjc-runtime=ios-12.0.0\000-fobjc-arc\000-fobjc-weak\000-fobjc-exceptions\000-fexceptions\000-fpascal-strings\000-fmax-type-align=16\000-fdiagnostics-show-note-include-stack\000-vectorize-loops\000-vectorize-slp\000-serialize-diagnostic-file\000/Users/xss/Library/Developer/Xcode/DerivedData/dyld_inspector-aiyokovxbbbfxhhczwfbbzptsyqb/Build/Intermediates.noindex/dyld_inspector.build/Release-iphoneos/dyld_inspector.build/Objects-normal/arm64e/AppDelegate.dia\000-clang-vendor-feature=+nullptrToBoolConversion\000-clang-vendor-feature=+messageToSelfInClassMethodIdReturnType\000-clang-vendor-feature=+disableInferNewAvailabilityFromInit\000-clang-vendor-feature=+disableNeonImmediateRangeCheck\000-clang-vendor-feature=+disableNonDependentMemberExprInCurrentInstantiation\000-fno-odr-hash-protocols\000-clang-vendor-feature=+revert09abecef7bbf"

	.no_dead_strip	__OBJC_LABEL_PROTOCOL_$_NSObject
	.no_dead_strip	__OBJC_LABEL_PROTOCOL_$_UIApplicationDelegate
	.no_dead_strip	__OBJC_PROTOCOL_$_NSObject
	.no_dead_strip	__OBJC_PROTOCOL_$_UIApplicationDelegate
	.linker_option "-framework", "UIKit"
	.linker_option "-framework", "FileProvider"
	.linker_option "-framework", "UserNotifications"
	.linker_option "-framework", "CoreText"
	.linker_option "-framework", "QuartzCore"
	.linker_option "-framework", "CoreImage"
	.linker_option "-framework", "ImageIO"
	.linker_option "-framework", "CoreVideo"
	.linker_option "-framework", "OpenGLES"
	.linker_option "-framework", "Metal"
	.linker_option "-framework", "IOSurface"
	.linker_option "-framework", "CoreGraphics"
	.linker_option "-framework", "Foundation"
	.linker_option "-framework", "CFNetwork"
	.linker_option "-framework", "Security"
	.linker_option "-framework", "CoreFoundation"
	.section	__DATA,__objc_imageinfo,regular,no_dead_strip
L_OBJC_IMAGE_INFO:
	.long	0
	.long	64

	.file	6 "/Applications/Xcode-beta.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS15.0.sdk/usr/include/objc" "objc.h"
	.file	7 "/Applications/Xcode-beta.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS15.0.sdk/usr/include/arm" "_types.h"
	.file	8 "/Applications/Xcode-beta.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS15.0.sdk/usr/include/sys/_types" "_ssize_t.h"
	.file	9 "dyld_inspector" "dyld_inspector/dyld_inspector/AppDelegate.m"
	.section	__DWARF,__debug_loc,regular,debug
Lsection_debug_loc:
Ldebug_loc0:
.set Lset0, Lfunc_begin0-Lfunc_begin0
	.quad	Lset0
.set Lset1, Ltmp0-Lfunc_begin0
	.quad	Lset1
	.short	1                               ; Loc expr size
	.byte	80                              ; DW_OP_reg0
.set Lset2, Ltmp0-Lfunc_begin0
	.quad	Lset2
.set Lset3, Ltmp5-Lfunc_begin0
	.quad	Lset3
	.short	1                               ; Loc expr size
	.byte	99                              ; DW_OP_reg19
.set Lset4, Ltmp10-Lfunc_begin0
	.quad	Lset4
.set Lset5, Lfunc_end0-Lfunc_begin0
	.quad	Lset5
	.short	1                               ; Loc expr size
	.byte	99                              ; DW_OP_reg19
	.quad	0
	.quad	0
Ldebug_loc1:
.set Lset6, Ltmp0-Lfunc_begin0
	.quad	Lset6
.set Lset7, Ltmp1-Lfunc_begin0
	.quad	Lset7
	.short	2                               ; Loc expr size
	.byte	48                              ; DW_OP_lit0
	.byte	159                             ; DW_OP_stack_value
.set Lset8, Ltmp1-Lfunc_begin0
	.quad	Lset8
.set Lset9, Ltmp9-Lfunc_begin0
	.quad	Lset9
	.short	2                               ; Loc expr size
	.byte	143                             ; DW_OP_breg31
	.byte	8                               ; 8
.set Lset10, Ltmp10-Lfunc_begin0
	.quad	Lset10
.set Lset11, Lfunc_end0-Lfunc_begin0
	.quad	Lset11
	.short	2                               ; Loc expr size
	.byte	143                             ; DW_OP_breg31
	.byte	8                               ; 8
	.quad	0
	.quad	0
Ldebug_loc2:
.set Lset12, Ltmp5-Lfunc_begin0
	.quad	Lset12
.set Lset13, Ltmp8-Lfunc_begin0
	.quad	Lset13
	.short	1                               ; Loc expr size
	.byte	99                              ; DW_OP_reg19
	.quad	0
	.quad	0
Ldebug_loc3:
.set Lset14, Lfunc_begin1-Lfunc_begin0
	.quad	Lset14
.set Lset15, Ltmp12-Lfunc_begin0
	.quad	Lset15
	.short	1                               ; Loc expr size
	.byte	80                              ; DW_OP_reg0
.set Lset16, Ltmp12-Lfunc_begin0
	.quad	Lset16
.set Lset17, Ltmp24-Lfunc_begin0
	.quad	Lset17
	.short	1                               ; Loc expr size
	.byte	99                              ; DW_OP_reg19
.set Lset18, Ltmp24-Lfunc_begin0
	.quad	Lset18
.set Lset19, Ltmp27-Lfunc_begin0
	.quad	Lset19
	.short	4                               ; Loc expr size
	.byte	163                             ; DW_OP_entry_value
	.byte	1                               ; 1
	.byte	80                              ; DW_OP_reg0
	.byte	159                             ; DW_OP_stack_value
.set Lset20, Ltmp28-Lfunc_begin0
	.quad	Lset20
.set Lset21, Lfunc_end1-Lfunc_begin0
	.quad	Lset21
	.short	1                               ; Loc expr size
	.byte	99                              ; DW_OP_reg19
	.quad	0
	.quad	0
Ldebug_loc4:
.set Lset22, Ltmp18-Lfunc_begin0
	.quad	Lset22
.set Lset23, Ltmp19-Lfunc_begin0
	.quad	Lset23
	.short	1                               ; Loc expr size
	.byte	88                              ; DW_OP_reg8
.set Lset24, Ltmp19-Lfunc_begin0
	.quad	Lset24
.set Lset25, Ltmp27-Lfunc_begin0
	.quad	Lset25
	.short	2                               ; Loc expr size
	.byte	143                             ; DW_OP_breg31
	.byte	4                               ; 4
.set Lset26, Ltmp29-Lfunc_begin0
	.quad	Lset26
.set Lset27, Lfunc_end1-Lfunc_begin0
	.quad	Lset27
	.short	2                               ; Loc expr size
	.byte	143                             ; DW_OP_breg31
	.byte	4                               ; 4
	.quad	0
	.quad	0
Ldebug_loc5:
.set Lset28, Ltmp20-Lfunc_begin0
	.quad	Lset28
.set Lset29, Ltmp22-Lfunc_begin0
	.quad	Lset29
	.short	1                               ; Loc expr size
	.byte	80                              ; DW_OP_reg0
.set Lset30, Ltmp24-Lfunc_begin0
	.quad	Lset30
.set Lset31, Ltmp27-Lfunc_begin0
	.quad	Lset31
	.short	1                               ; Loc expr size
	.byte	99                              ; DW_OP_reg19
.set Lset32, Ltmp29-Lfunc_begin0
	.quad	Lset32
.set Lset33, Ltmp30-Lfunc_begin0
	.quad	Lset33
	.short	1                               ; Loc expr size
	.byte	80                              ; DW_OP_reg0
	.quad	0
	.quad	0
Ldebug_loc6:
.set Lset34, Ltmp31-Lfunc_begin0
	.quad	Lset34
.set Lset35, Ltmp37-Lfunc_begin0
	.quad	Lset35
	.short	7                               ; Loc expr size
	.byte	16                              ; DW_OP_constu
	.byte	128                             ; 10737418240
	.byte	128                             ; 
	.byte	128                             ; 
	.byte	128                             ; 
	.byte	40                              ; 
	.byte	159                             ; DW_OP_stack_value
.set Lset36, Ltmp38-Lfunc_begin0
	.quad	Lset36
.set Lset37, Ltmp60-Lfunc_begin0
	.quad	Lset37
	.short	5                               ; Loc expr size
	.byte	131                             ; DW_OP_breg19
	.byte	128                             ; -16384
	.byte	128                             ; 
	.byte	127                             ; 
	.byte	159                             ; DW_OP_stack_value
	.quad	0
	.quad	0
Ldebug_loc7:
.set Lset38, Ltmp31-Lfunc_begin0
	.quad	Lset38
.set Lset39, Ltmp32-Lfunc_begin0
	.quad	Lset39
	.short	7                               ; Loc expr size
	.byte	16                              ; DW_OP_constu
	.byte	128                             ; 6442450944
	.byte	128                             ; 
	.byte	128                             ; 
	.byte	128                             ; 
	.byte	24                              ; 
	.byte	159                             ; DW_OP_stack_value
.set Lset40, Ltmp32-Lfunc_begin0
	.quad	Lset40
.set Lset41, Ltmp33-Lfunc_begin0
	.quad	Lset41
	.short	5                               ; Loc expr size
	.byte	134                             ; DW_OP_breg22
	.byte	128                             ; 16384
	.byte	128                             ; 
	.byte	1                               ; 
	.byte	159                             ; DW_OP_stack_value
.set Lset42, Ltmp35-Lfunc_begin0
	.quad	Lset42
.set Lset43, Ltmp37-Lfunc_begin0
	.quad	Lset43
	.short	5                               ; Loc expr size
	.byte	134                             ; DW_OP_breg22
	.byte	128                             ; 32768
	.byte	128                             ; 
	.byte	2                               ; 
	.byte	159                             ; DW_OP_stack_value
	.quad	0
	.quad	0
Ldebug_loc8:
.set Lset44, Ltmp43-Lfunc_begin0
	.quad	Lset44
.set Lset45, Ltmp47-Lfunc_begin0
	.quad	Lset45
	.short	1                               ; Loc expr size
	.byte	103                             ; DW_OP_reg23
	.quad	0
	.quad	0
Ldebug_loc9:
.set Lset46, Ltmp49-Lfunc_begin0
	.quad	Lset46
.set Lset47, Ltmp50-Lfunc_begin0
	.quad	Lset47
	.short	1                               ; Loc expr size
	.byte	80                              ; DW_OP_reg0
	.quad	0
	.quad	0
Ldebug_loc10:
.set Lset48, Ltmp51-Lfunc_begin0
	.quad	Lset48
.set Lset49, Ltmp52-Lfunc_begin0
	.quad	Lset49
	.short	1                               ; Loc expr size
	.byte	80                              ; DW_OP_reg0
	.quad	0
	.quad	0
Ldebug_loc11:
.set Lset50, Ltmp53-Lfunc_begin0
	.quad	Lset50
.set Lset51, Ltmp54-Lfunc_begin0
	.quad	Lset51
	.short	1                               ; Loc expr size
	.byte	80                              ; DW_OP_reg0
	.quad	0
	.quad	0
Ldebug_loc12:
.set Lset52, Ltmp56-Lfunc_begin0
	.quad	Lset52
.set Lset53, Ltmp60-Lfunc_begin0
	.quad	Lset53
	.short	2                               ; Loc expr size
	.byte	48                              ; DW_OP_lit0
	.byte	159                             ; DW_OP_stack_value
.set Lset54, Ltmp78-Lfunc_begin0
	.quad	Lset54
.set Lset55, Ltmp79-Lfunc_begin0
	.quad	Lset55
	.short	1                               ; Loc expr size
	.byte	89                              ; DW_OP_reg9
.set Lset56, Ltmp79-Lfunc_begin0
	.quad	Lset56
.set Lset57, Ltmp80-Lfunc_begin0
	.quad	Lset57
	.short	1                               ; Loc expr size
	.byte	88                              ; DW_OP_reg8
.set Lset58, Ltmp82-Lfunc_begin0
	.quad	Lset58
.set Lset59, Ltmp83-Lfunc_begin0
	.quad	Lset59
	.short	2                               ; Loc expr size
	.byte	143                             ; DW_OP_breg31
	.byte	31                              ; 31
.set Lset60, Ltmp83-Lfunc_begin0
	.quad	Lset60
.set Lset61, Ltmp88-Lfunc_begin0
	.quad	Lset61
	.short	2                               ; Loc expr size
	.byte	48                              ; DW_OP_lit0
	.byte	159                             ; DW_OP_stack_value
	.quad	0
	.quad	0
Ldebug_loc13:
.set Lset62, Ltmp57-Lfunc_begin0
	.quad	Lset62
.set Lset63, Ltmp60-Lfunc_begin0
	.quad	Lset63
	.short	2                               ; Loc expr size
	.byte	48                              ; DW_OP_lit0
	.byte	159                             ; DW_OP_stack_value
.set Lset64, Ltmp67-Lfunc_begin0
	.quad	Lset64
.set Lset65, Ltmp68-Lfunc_begin0
	.quad	Lset65
	.short	1                               ; Loc expr size
	.byte	90                              ; DW_OP_reg10
.set Lset66, Ltmp68-Lfunc_begin0
	.quad	Lset66
.set Lset67, Ltmp69-Lfunc_begin0
	.quad	Lset67
	.short	1                               ; Loc expr size
	.byte	89                              ; DW_OP_reg9
.set Lset68, Ltmp84-Lfunc_begin0
	.quad	Lset68
.set Lset69, Ltmp85-Lfunc_begin0
	.quad	Lset69
	.short	2                               ; Loc expr size
	.byte	143                             ; DW_OP_breg31
	.byte	30                              ; 30
.set Lset70, Ltmp85-Lfunc_begin0
	.quad	Lset70
.set Lset71, Ltmp88-Lfunc_begin0
	.quad	Lset71
	.short	2                               ; Loc expr size
	.byte	48                              ; DW_OP_lit0
	.byte	159                             ; DW_OP_stack_value
	.quad	0
	.quad	0
Ldebug_loc14:
.set Lset72, Ltmp57-Lfunc_begin0
	.quad	Lset72
.set Lset73, Ltmp60-Lfunc_begin0
	.quad	Lset73
	.short	2                               ; Loc expr size
	.byte	48                              ; DW_OP_lit0
	.byte	159                             ; DW_OP_stack_value
.set Lset74, Ltmp73-Lfunc_begin0
	.quad	Lset74
.set Lset75, Ltmp74-Lfunc_begin0
	.quad	Lset75
	.short	1                               ; Loc expr size
	.byte	89                              ; DW_OP_reg9
.set Lset76, Ltmp74-Lfunc_begin0
	.quad	Lset76
.set Lset77, Ltmp75-Lfunc_begin0
	.quad	Lset77
	.short	1                               ; Loc expr size
	.byte	88                              ; DW_OP_reg8
.set Lset78, Ltmp86-Lfunc_begin0
	.quad	Lset78
.set Lset79, Ltmp87-Lfunc_begin0
	.quad	Lset79
	.short	2                               ; Loc expr size
	.byte	143                             ; DW_OP_breg31
	.byte	29                              ; 29
.set Lset80, Ltmp87-Lfunc_begin0
	.quad	Lset80
.set Lset81, Ltmp88-Lfunc_begin0
	.quad	Lset81
	.short	2                               ; Loc expr size
	.byte	48                              ; DW_OP_lit0
	.byte	159                             ; DW_OP_stack_value
	.quad	0
	.quad	0
Ldebug_loc15:
.set Lset82, Ltmp58-Lfunc_begin0
	.quad	Lset82
.set Lset83, Ltmp60-Lfunc_begin0
	.quad	Lset83
	.short	1                               ; Loc expr size
	.byte	102                             ; DW_OP_reg22
	.quad	0
	.quad	0
Ldebug_loc16:
.set Lset84, Ltmp60-Lfunc_begin0
	.quad	Lset84
.set Lset85, Ltmp63-Lfunc_begin0
	.quad	Lset85
	.short	2                               ; Loc expr size
	.byte	49                              ; DW_OP_lit1
	.byte	159                             ; DW_OP_stack_value
.set Lset86, Ltmp63-Lfunc_begin0
	.quad	Lset86
.set Lset87, Ltmp71-Lfunc_begin0
	.quad	Lset87
	.short	1                               ; Loc expr size
	.byte	88                              ; DW_OP_reg8
.set Lset88, Ltmp75-Lfunc_begin0
	.quad	Lset88
.set Lset89, Ltmp76-Lfunc_begin0
	.quad	Lset89
	.short	1                               ; Loc expr size
	.byte	88                              ; DW_OP_reg8
	.quad	0
	.quad	0
Ldebug_loc17:
.set Lset90, Ltmp94-Lfunc_begin0
	.quad	Lset90
.set Lset91, Ltmp95-Lfunc_begin0
	.quad	Lset91
	.short	1                               ; Loc expr size
	.byte	80                              ; DW_OP_reg0
	.quad	0
	.quad	0
Ldebug_loc18:
.set Lset92, Ltmp96-Lfunc_begin0
	.quad	Lset92
.set Lset93, Ltmp97-Lfunc_begin0
	.quad	Lset93
	.short	1                               ; Loc expr size
	.byte	80                              ; DW_OP_reg0
	.quad	0
	.quad	0
Ldebug_loc19:
.set Lset94, Ltmp98-Lfunc_begin0
	.quad	Lset94
.set Lset95, Ltmp99-Lfunc_begin0
	.quad	Lset95
	.short	1                               ; Loc expr size
	.byte	80                              ; DW_OP_reg0
.set Lset96, Ltmp101-Lfunc_begin0
	.quad	Lset96
.set Lset97, Ltmp102-Lfunc_begin0
	.quad	Lset97
	.short	1                               ; Loc expr size
	.byte	80                              ; DW_OP_reg0
.set Lset98, Ltmp105-Lfunc_begin0
	.quad	Lset98
.set Lset99, Ltmp106-Lfunc_begin0
	.quad	Lset99
	.short	1                               ; Loc expr size
	.byte	80                              ; DW_OP_reg0
	.quad	0
	.quad	0
Ldebug_loc20:
.set Lset100, Lfunc_begin3-Lfunc_begin0
	.quad	Lset100
.set Lset101, Ltmp118-Lfunc_begin0
	.quad	Lset101
	.short	1                               ; Loc expr size
	.byte	80                              ; DW_OP_reg0
.set Lset102, Ltmp118-Lfunc_begin0
	.quad	Lset102
.set Lset103, Lfunc_end3-Lfunc_begin0
	.quad	Lset103
	.short	4                               ; Loc expr size
	.byte	163                             ; DW_OP_entry_value
	.byte	1                               ; 1
	.byte	80                              ; DW_OP_reg0
	.byte	159                             ; DW_OP_stack_value
	.quad	0
	.quad	0
Ldebug_loc21:
.set Lset104, Lfunc_begin3-Lfunc_begin0
	.quad	Lset104
.set Lset105, Ltmp118-Lfunc_begin0
	.quad	Lset105
	.short	1                               ; Loc expr size
	.byte	81                              ; DW_OP_reg1
.set Lset106, Ltmp118-Lfunc_begin0
	.quad	Lset106
.set Lset107, Lfunc_end3-Lfunc_begin0
	.quad	Lset107
	.short	4                               ; Loc expr size
	.byte	163                             ; DW_OP_entry_value
	.byte	1                               ; 1
	.byte	81                              ; DW_OP_reg1
	.byte	159                             ; DW_OP_stack_value
	.quad	0
	.quad	0
Ldebug_loc22:
.set Lset108, Lfunc_begin3-Lfunc_begin0
	.quad	Lset108
.set Lset109, Ltmp118-Lfunc_begin0
	.quad	Lset109
	.short	1                               ; Loc expr size
	.byte	82                              ; DW_OP_reg2
.set Lset110, Ltmp118-Lfunc_begin0
	.quad	Lset110
.set Lset111, Lfunc_end3-Lfunc_begin0
	.quad	Lset111
	.short	4                               ; Loc expr size
	.byte	163                             ; DW_OP_entry_value
	.byte	1                               ; 1
	.byte	82                              ; DW_OP_reg2
	.byte	159                             ; DW_OP_stack_value
	.quad	0
	.quad	0
Ldebug_loc23:
.set Lset112, Lfunc_begin3-Lfunc_begin0
	.quad	Lset112
.set Lset113, Ltmp118-Lfunc_begin0
	.quad	Lset113
	.short	1                               ; Loc expr size
	.byte	83                              ; DW_OP_reg3
.set Lset114, Ltmp118-Lfunc_begin0
	.quad	Lset114
.set Lset115, Lfunc_end3-Lfunc_begin0
	.quad	Lset115
	.short	4                               ; Loc expr size
	.byte	163                             ; DW_OP_entry_value
	.byte	1                               ; 1
	.byte	83                              ; DW_OP_reg3
	.byte	159                             ; DW_OP_stack_value
	.quad	0
	.quad	0
Ldebug_loc24:
.set Lset116, Lfunc_begin9-Lfunc_begin0
	.quad	Lset116
.set Lset117, Ltmp125-Lfunc_begin0
	.quad	Lset117
	.short	1                               ; Loc expr size
	.byte	80                              ; DW_OP_reg0
.set Lset118, Ltmp125-Lfunc_begin0
	.quad	Lset118
.set Lset119, Lfunc_end9-Lfunc_begin0
	.quad	Lset119
	.short	4                               ; Loc expr size
	.byte	163                             ; DW_OP_entry_value
	.byte	1                               ; 1
	.byte	80                              ; DW_OP_reg0
	.byte	159                             ; DW_OP_stack_value
	.quad	0
	.quad	0
Ldebug_loc25:
.set Lset120, Lfunc_begin10-Lfunc_begin0
	.quad	Lset120
.set Lset121, Ltmp128-Lfunc_begin0
	.quad	Lset121
	.short	1                               ; Loc expr size
	.byte	80                              ; DW_OP_reg0
.set Lset122, Ltmp128-Lfunc_begin0
	.quad	Lset122
.set Lset123, Lfunc_end10-Lfunc_begin0
	.quad	Lset123
	.short	4                               ; Loc expr size
	.byte	163                             ; DW_OP_entry_value
	.byte	1                               ; 1
	.byte	80                              ; DW_OP_reg0
	.byte	159                             ; DW_OP_stack_value
	.quad	0
	.quad	0
Ldebug_loc26:
.set Lset124, Lfunc_begin10-Lfunc_begin0
	.quad	Lset124
.set Lset125, Ltmp127-Lfunc_begin0
	.quad	Lset125
	.short	1                               ; Loc expr size
	.byte	81                              ; DW_OP_reg1
.set Lset126, Ltmp127-Lfunc_begin0
	.quad	Lset126
.set Lset127, Lfunc_end10-Lfunc_begin0
	.quad	Lset127
	.short	4                               ; Loc expr size
	.byte	163                             ; DW_OP_entry_value
	.byte	1                               ; 1
	.byte	81                              ; DW_OP_reg1
	.byte	159                             ; DW_OP_stack_value
	.quad	0
	.quad	0
Ldebug_loc27:
.set Lset128, Lfunc_begin10-Lfunc_begin0
	.quad	Lset128
.set Lset129, Ltmp127-Lfunc_begin0
	.quad	Lset129
	.short	1                               ; Loc expr size
	.byte	82                              ; DW_OP_reg2
.set Lset130, Ltmp127-Lfunc_begin0
	.quad	Lset130
.set Lset131, Ltmp129-Lfunc_begin0
	.quad	Lset131
	.short	1                               ; Loc expr size
	.byte	81                              ; DW_OP_reg1
	.quad	0
	.quad	0
Ldebug_loc28:
.set Lset132, Lfunc_begin11-Lfunc_begin0
	.quad	Lset132
.set Lset133, Ltmp130-Lfunc_begin0
	.quad	Lset133
	.short	1                               ; Loc expr size
	.byte	80                              ; DW_OP_reg0
.set Lset134, Ltmp130-Lfunc_begin0
	.quad	Lset134
.set Lset135, Lfunc_end11-Lfunc_begin0
	.quad	Lset135
	.short	4                               ; Loc expr size
	.byte	163                             ; DW_OP_entry_value
	.byte	1                               ; 1
	.byte	80                              ; DW_OP_reg0
	.byte	159                             ; DW_OP_stack_value
	.quad	0
	.quad	0
Ldebug_loc29:
.set Lset136, Lfunc_begin11-Lfunc_begin0
	.quad	Lset136
.set Lset137, Ltmp131-Lfunc_begin0
	.quad	Lset137
	.short	1                               ; Loc expr size
	.byte	81                              ; DW_OP_reg1
.set Lset138, Ltmp131-Lfunc_begin0
	.quad	Lset138
.set Lset139, Lfunc_end11-Lfunc_begin0
	.quad	Lset139
	.short	4                               ; Loc expr size
	.byte	163                             ; DW_OP_entry_value
	.byte	1                               ; 1
	.byte	81                              ; DW_OP_reg1
	.byte	159                             ; DW_OP_stack_value
	.quad	0
	.quad	0
	.section	__DWARF,__debug_abbrev,regular,debug
Lsection_abbrev:
	.byte	1                               ; Abbreviation Code
	.byte	17                              ; DW_TAG_compile_unit
	.byte	1                               ; DW_CHILDREN_yes
	.byte	37                              ; DW_AT_producer
	.byte	14                              ; DW_FORM_strp
	.byte	19                              ; DW_AT_language
	.byte	5                               ; DW_FORM_data2
	.byte	3                               ; DW_AT_name
	.byte	14                              ; DW_FORM_strp
	.ascii	"\202|"                         ; DW_AT_LLVM_sysroot
	.byte	14                              ; DW_FORM_strp
	.ascii	"\357\177"                      ; DW_AT_APPLE_sdk
	.byte	14                              ; DW_FORM_strp
	.byte	16                              ; DW_AT_stmt_list
	.byte	23                              ; DW_FORM_sec_offset
	.byte	27                              ; DW_AT_comp_dir
	.byte	14                              ; DW_FORM_strp
	.ascii	"\341\177"                      ; DW_AT_APPLE_optimized
	.byte	25                              ; DW_FORM_flag_present
	.ascii	"\345\177"                      ; DW_AT_APPLE_major_runtime_vers
	.byte	11                              ; DW_FORM_data1
	.byte	17                              ; DW_AT_low_pc
	.byte	1                               ; DW_FORM_addr
	.byte	18                              ; DW_AT_high_pc
	.byte	6                               ; DW_FORM_data4
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	2                               ; Abbreviation Code
	.byte	15                              ; DW_TAG_pointer_type
	.byte	0                               ; DW_CHILDREN_no
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	3                               ; Abbreviation Code
	.byte	15                              ; DW_TAG_pointer_type
	.byte	0                               ; DW_CHILDREN_no
	.byte	73                              ; DW_AT_type
	.byte	19                              ; DW_FORM_ref4
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	4                               ; Abbreviation Code
	.byte	36                              ; DW_TAG_base_type
	.byte	0                               ; DW_CHILDREN_no
	.byte	3                               ; DW_AT_name
	.byte	14                              ; DW_FORM_strp
	.byte	62                              ; DW_AT_encoding
	.byte	11                              ; DW_FORM_data1
	.byte	11                              ; DW_AT_byte_size
	.byte	11                              ; DW_FORM_data1
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	5                               ; Abbreviation Code
	.byte	22                              ; DW_TAG_typedef
	.byte	0                               ; DW_CHILDREN_no
	.byte	73                              ; DW_AT_type
	.byte	19                              ; DW_FORM_ref4
	.byte	3                               ; DW_AT_name
	.byte	14                              ; DW_FORM_strp
	.byte	58                              ; DW_AT_decl_file
	.byte	11                              ; DW_FORM_data1
	.byte	59                              ; DW_AT_decl_line
	.byte	11                              ; DW_FORM_data1
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	6                               ; Abbreviation Code
	.byte	19                              ; DW_TAG_structure_type
	.byte	1                               ; DW_CHILDREN_yes
	.ascii	"\354\177"                      ; DW_AT_APPLE_objc_complete_type
	.byte	25                              ; DW_FORM_flag_present
	.byte	3                               ; DW_AT_name
	.byte	14                              ; DW_FORM_strp
	.byte	11                              ; DW_AT_byte_size
	.byte	11                              ; DW_FORM_data1
	.byte	58                              ; DW_AT_decl_file
	.byte	11                              ; DW_FORM_data1
	.byte	59                              ; DW_AT_decl_line
	.byte	11                              ; DW_FORM_data1
	.ascii	"\346\177"                      ; DW_AT_APPLE_runtime_class
	.byte	11                              ; DW_FORM_data1
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	7                               ; Abbreviation Code
	.byte	28                              ; DW_TAG_inheritance
	.byte	0                               ; DW_CHILDREN_no
	.byte	73                              ; DW_AT_type
	.byte	19                              ; DW_FORM_ref4
	.byte	56                              ; DW_AT_data_member_location
	.byte	11                              ; DW_FORM_data1
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	8                               ; Abbreviation Code
	.ascii	"\200\204\001"                  ; DW_TAG_APPLE_property
	.byte	0                               ; DW_CHILDREN_no
	.ascii	"\350\177"                      ; DW_AT_APPLE_property_name
	.byte	14                              ; DW_FORM_strp
	.byte	73                              ; DW_AT_type
	.byte	19                              ; DW_FORM_ref4
	.byte	58                              ; DW_AT_decl_file
	.byte	11                              ; DW_FORM_data1
	.byte	59                              ; DW_AT_decl_line
	.byte	11                              ; DW_FORM_data1
	.ascii	"\353\177"                      ; DW_AT_APPLE_property_attribute
	.byte	5                               ; DW_FORM_data2
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	9                               ; Abbreviation Code
	.byte	13                              ; DW_TAG_member
	.byte	0                               ; DW_CHILDREN_no
	.byte	3                               ; DW_AT_name
	.byte	14                              ; DW_FORM_strp
	.byte	73                              ; DW_AT_type
	.byte	19                              ; DW_FORM_ref4
	.byte	58                              ; DW_AT_decl_file
	.byte	11                              ; DW_FORM_data1
	.byte	59                              ; DW_AT_decl_line
	.byte	11                              ; DW_FORM_data1
	.byte	56                              ; DW_AT_data_member_location
	.byte	11                              ; DW_FORM_data1
	.byte	50                              ; DW_AT_accessibility
	.byte	11                              ; DW_FORM_data1
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	10                              ; Abbreviation Code
	.byte	30                              ; DW_TAG_module
	.byte	1                               ; DW_CHILDREN_yes
	.byte	3                               ; DW_AT_name
	.byte	14                              ; DW_FORM_strp
	.ascii	"\201|"                         ; DW_AT_LLVM_config_macros
	.byte	14                              ; DW_FORM_strp
	.ascii	"\200|"                         ; DW_AT_LLVM_include_path
	.byte	14                              ; DW_FORM_strp
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	11                              ; Abbreviation Code
	.byte	30                              ; DW_TAG_module
	.byte	1                               ; DW_CHILDREN_yes
	.byte	3                               ; DW_AT_name
	.byte	14                              ; DW_FORM_strp
	.ascii	"\201|"                         ; DW_AT_LLVM_config_macros
	.byte	14                              ; DW_FORM_strp
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	12                              ; Abbreviation Code
	.byte	19                              ; DW_TAG_structure_type
	.byte	0                               ; DW_CHILDREN_no
	.byte	3                               ; DW_AT_name
	.byte	14                              ; DW_FORM_strp
	.byte	60                              ; DW_AT_declaration
	.byte	25                              ; DW_FORM_flag_present
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	13                              ; Abbreviation Code
	.byte	8                               ; DW_TAG_imported_declaration
	.byte	0                               ; DW_CHILDREN_no
	.byte	58                              ; DW_AT_decl_file
	.byte	11                              ; DW_FORM_data1
	.byte	59                              ; DW_AT_decl_line
	.byte	11                              ; DW_FORM_data1
	.byte	24                              ; DW_AT_import
	.byte	19                              ; DW_FORM_ref4
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	14                              ; Abbreviation Code
	.byte	46                              ; DW_TAG_subprogram
	.byte	1                               ; DW_CHILDREN_yes
	.byte	17                              ; DW_AT_low_pc
	.byte	1                               ; DW_FORM_addr
	.byte	18                              ; DW_AT_high_pc
	.byte	6                               ; DW_FORM_data4
	.byte	64                              ; DW_AT_frame_base
	.byte	24                              ; DW_FORM_exprloc
	.byte	122                             ; DW_AT_call_all_calls
	.byte	25                              ; DW_FORM_flag_present
	.byte	3                               ; DW_AT_name
	.byte	14                              ; DW_FORM_strp
	.byte	58                              ; DW_AT_decl_file
	.byte	11                              ; DW_FORM_data1
	.byte	59                              ; DW_AT_decl_line
	.byte	11                              ; DW_FORM_data1
	.byte	39                              ; DW_AT_prototyped
	.byte	25                              ; DW_FORM_flag_present
	.byte	73                              ; DW_AT_type
	.byte	19                              ; DW_FORM_ref4
	.byte	63                              ; DW_AT_external
	.byte	25                              ; DW_FORM_flag_present
	.ascii	"\341\177"                      ; DW_AT_APPLE_optimized
	.byte	25                              ; DW_FORM_flag_present
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	15                              ; Abbreviation Code
	.byte	5                               ; DW_TAG_formal_parameter
	.byte	0                               ; DW_CHILDREN_no
	.byte	2                               ; DW_AT_location
	.byte	23                              ; DW_FORM_sec_offset
	.byte	3                               ; DW_AT_name
	.byte	14                              ; DW_FORM_strp
	.byte	58                              ; DW_AT_decl_file
	.byte	11                              ; DW_FORM_data1
	.byte	59                              ; DW_AT_decl_line
	.byte	11                              ; DW_FORM_data1
	.byte	73                              ; DW_AT_type
	.byte	19                              ; DW_FORM_ref4
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	16                              ; Abbreviation Code
	.byte	52                              ; DW_TAG_variable
	.byte	0                               ; DW_CHILDREN_no
	.byte	2                               ; DW_AT_location
	.byte	23                              ; DW_FORM_sec_offset
	.byte	3                               ; DW_AT_name
	.byte	14                              ; DW_FORM_strp
	.byte	58                              ; DW_AT_decl_file
	.byte	11                              ; DW_FORM_data1
	.byte	59                              ; DW_AT_decl_line
	.byte	11                              ; DW_FORM_data1
	.byte	73                              ; DW_AT_type
	.byte	19                              ; DW_FORM_ref4
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	17                              ; Abbreviation Code
	.byte	72                              ; DW_TAG_call_site
	.byte	1                               ; DW_CHILDREN_yes
	.byte	127                             ; DW_AT_call_origin
	.byte	19                              ; DW_FORM_ref4
	.byte	125                             ; DW_AT_call_return_pc
	.byte	1                               ; DW_FORM_addr
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	18                              ; Abbreviation Code
	.byte	73                              ; DW_TAG_call_site_parameter
	.byte	0                               ; DW_CHILDREN_no
	.byte	2                               ; DW_AT_location
	.byte	24                              ; DW_FORM_exprloc
	.byte	126                             ; DW_AT_call_value
	.byte	24                              ; DW_FORM_exprloc
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	19                              ; Abbreviation Code
	.byte	72                              ; DW_TAG_call_site
	.byte	0                               ; DW_CHILDREN_no
	.byte	127                             ; DW_AT_call_origin
	.byte	19                              ; DW_FORM_ref4
	.byte	125                             ; DW_AT_call_return_pc
	.byte	1                               ; DW_FORM_addr
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	20                              ; Abbreviation Code
	.byte	46                              ; DW_TAG_subprogram
	.byte	1                               ; DW_CHILDREN_yes
	.byte	3                               ; DW_AT_name
	.byte	14                              ; DW_FORM_strp
	.byte	58                              ; DW_AT_decl_file
	.byte	11                              ; DW_FORM_data1
	.byte	59                              ; DW_AT_decl_line
	.byte	5                               ; DW_FORM_data2
	.byte	39                              ; DW_AT_prototyped
	.byte	25                              ; DW_FORM_flag_present
	.byte	73                              ; DW_AT_type
	.byte	19                              ; DW_FORM_ref4
	.byte	60                              ; DW_AT_declaration
	.byte	25                              ; DW_FORM_flag_present
	.byte	63                              ; DW_AT_external
	.byte	25                              ; DW_FORM_flag_present
	.ascii	"\341\177"                      ; DW_AT_APPLE_optimized
	.byte	25                              ; DW_FORM_flag_present
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	21                              ; Abbreviation Code
	.byte	5                               ; DW_TAG_formal_parameter
	.byte	0                               ; DW_CHILDREN_no
	.byte	73                              ; DW_AT_type
	.byte	19                              ; DW_FORM_ref4
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	22                              ; Abbreviation Code
	.byte	46                              ; DW_TAG_subprogram
	.byte	1                               ; DW_CHILDREN_yes
	.byte	110                             ; DW_AT_linkage_name
	.byte	14                              ; DW_FORM_strp
	.byte	3                               ; DW_AT_name
	.byte	14                              ; DW_FORM_strp
	.byte	58                              ; DW_AT_decl_file
	.byte	11                              ; DW_FORM_data1
	.byte	59                              ; DW_AT_decl_line
	.byte	5                               ; DW_FORM_data2
	.byte	39                              ; DW_AT_prototyped
	.byte	25                              ; DW_FORM_flag_present
	.byte	73                              ; DW_AT_type
	.byte	19                              ; DW_FORM_ref4
	.byte	60                              ; DW_AT_declaration
	.byte	25                              ; DW_FORM_flag_present
	.byte	63                              ; DW_AT_external
	.byte	25                              ; DW_FORM_flag_present
	.ascii	"\341\177"                      ; DW_AT_APPLE_optimized
	.byte	25                              ; DW_FORM_flag_present
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	23                              ; Abbreviation Code
	.byte	38                              ; DW_TAG_const_type
	.byte	0                               ; DW_CHILDREN_no
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	24                              ; Abbreviation Code
	.byte	46                              ; DW_TAG_subprogram
	.byte	0                               ; DW_CHILDREN_no
	.byte	17                              ; DW_AT_low_pc
	.byte	1                               ; DW_FORM_addr
	.byte	18                              ; DW_AT_high_pc
	.byte	6                               ; DW_FORM_data4
	.byte	64                              ; DW_AT_frame_base
	.byte	24                              ; DW_FORM_exprloc
	.byte	110                             ; DW_AT_linkage_name
	.byte	14                              ; DW_FORM_strp
	.byte	3                               ; DW_AT_name
	.byte	14                              ; DW_FORM_strp
	.ascii	"\341\177"                      ; DW_AT_APPLE_optimized
	.byte	25                              ; DW_FORM_flag_present
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	25                              ; Abbreviation Code
	.byte	52                              ; DW_TAG_variable
	.byte	0                               ; DW_CHILDREN_no
	.byte	2                               ; DW_AT_location
	.byte	24                              ; DW_FORM_exprloc
	.byte	3                               ; DW_AT_name
	.byte	14                              ; DW_FORM_strp
	.byte	58                              ; DW_AT_decl_file
	.byte	11                              ; DW_FORM_data1
	.byte	59                              ; DW_AT_decl_line
	.byte	11                              ; DW_FORM_data1
	.byte	73                              ; DW_AT_type
	.byte	19                              ; DW_FORM_ref4
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	26                              ; Abbreviation Code
	.byte	46                              ; DW_TAG_subprogram
	.byte	1                               ; DW_CHILDREN_yes
	.byte	17                              ; DW_AT_low_pc
	.byte	1                               ; DW_FORM_addr
	.byte	18                              ; DW_AT_high_pc
	.byte	6                               ; DW_FORM_data4
	.byte	64                              ; DW_AT_frame_base
	.byte	24                              ; DW_FORM_exprloc
	.byte	122                             ; DW_AT_call_all_calls
	.byte	25                              ; DW_FORM_flag_present
	.byte	3                               ; DW_AT_name
	.byte	14                              ; DW_FORM_strp
	.byte	58                              ; DW_AT_decl_file
	.byte	11                              ; DW_FORM_data1
	.byte	59                              ; DW_AT_decl_line
	.byte	11                              ; DW_FORM_data1
	.byte	63                              ; DW_AT_external
	.byte	25                              ; DW_FORM_flag_present
	.ascii	"\341\177"                      ; DW_AT_APPLE_optimized
	.byte	25                              ; DW_FORM_flag_present
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	27                              ; Abbreviation Code
	.byte	11                              ; DW_TAG_lexical_block
	.byte	1                               ; DW_CHILDREN_yes
	.byte	17                              ; DW_AT_low_pc
	.byte	1                               ; DW_FORM_addr
	.byte	18                              ; DW_AT_high_pc
	.byte	6                               ; DW_FORM_data4
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	28                              ; Abbreviation Code
	.byte	52                              ; DW_TAG_variable
	.byte	0                               ; DW_CHILDREN_no
	.byte	3                               ; DW_AT_name
	.byte	14                              ; DW_FORM_strp
	.byte	58                              ; DW_AT_decl_file
	.byte	11                              ; DW_FORM_data1
	.byte	59                              ; DW_AT_decl_line
	.byte	11                              ; DW_FORM_data1
	.byte	73                              ; DW_AT_type
	.byte	19                              ; DW_FORM_ref4
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	29                              ; Abbreviation Code
	.byte	46                              ; DW_TAG_subprogram
	.byte	1                               ; DW_CHILDREN_yes
	.byte	3                               ; DW_AT_name
	.byte	14                              ; DW_FORM_strp
	.byte	58                              ; DW_AT_decl_file
	.byte	11                              ; DW_FORM_data1
	.byte	59                              ; DW_AT_decl_line
	.byte	11                              ; DW_FORM_data1
	.byte	39                              ; DW_AT_prototyped
	.byte	25                              ; DW_FORM_flag_present
	.byte	73                              ; DW_AT_type
	.byte	19                              ; DW_FORM_ref4
	.byte	60                              ; DW_AT_declaration
	.byte	25                              ; DW_FORM_flag_present
	.byte	63                              ; DW_AT_external
	.byte	25                              ; DW_FORM_flag_present
	.ascii	"\341\177"                      ; DW_AT_APPLE_optimized
	.byte	25                              ; DW_FORM_flag_present
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	30                              ; Abbreviation Code
	.byte	4                               ; DW_TAG_enumeration_type
	.byte	0                               ; DW_CHILDREN_no
	.byte	3                               ; DW_AT_name
	.byte	14                              ; DW_FORM_strp
	.byte	11                              ; DW_AT_byte_size
	.byte	11                              ; DW_FORM_data1
	.byte	60                              ; DW_AT_declaration
	.byte	25                              ; DW_FORM_flag_present
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	31                              ; Abbreviation Code
	.byte	38                              ; DW_TAG_const_type
	.byte	0                               ; DW_CHILDREN_no
	.byte	73                              ; DW_AT_type
	.byte	19                              ; DW_FORM_ref4
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	32                              ; Abbreviation Code
	.byte	46                              ; DW_TAG_subprogram
	.byte	1                               ; DW_CHILDREN_yes
	.byte	17                              ; DW_AT_low_pc
	.byte	1                               ; DW_FORM_addr
	.byte	18                              ; DW_AT_high_pc
	.byte	6                               ; DW_FORM_data4
	.byte	64                              ; DW_AT_frame_base
	.byte	24                              ; DW_FORM_exprloc
	.byte	100                             ; DW_AT_object_pointer
	.byte	19                              ; DW_FORM_ref4
	.byte	122                             ; DW_AT_call_all_calls
	.byte	25                              ; DW_FORM_flag_present
	.byte	3                               ; DW_AT_name
	.byte	14                              ; DW_FORM_strp
	.byte	58                              ; DW_AT_decl_file
	.byte	11                              ; DW_FORM_data1
	.byte	59                              ; DW_AT_decl_line
	.byte	11                              ; DW_FORM_data1
	.byte	39                              ; DW_AT_prototyped
	.byte	25                              ; DW_FORM_flag_present
	.byte	73                              ; DW_AT_type
	.byte	19                              ; DW_FORM_ref4
	.ascii	"\341\177"                      ; DW_AT_APPLE_optimized
	.byte	25                              ; DW_FORM_flag_present
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	33                              ; Abbreviation Code
	.byte	5                               ; DW_TAG_formal_parameter
	.byte	0                               ; DW_CHILDREN_no
	.byte	2                               ; DW_AT_location
	.byte	23                              ; DW_FORM_sec_offset
	.byte	3                               ; DW_AT_name
	.byte	14                              ; DW_FORM_strp
	.byte	73                              ; DW_AT_type
	.byte	19                              ; DW_FORM_ref4
	.byte	52                              ; DW_AT_artificial
	.byte	25                              ; DW_FORM_flag_present
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	34                              ; Abbreviation Code
	.byte	46                              ; DW_TAG_subprogram
	.byte	1                               ; DW_CHILDREN_yes
	.byte	17                              ; DW_AT_low_pc
	.byte	1                               ; DW_FORM_addr
	.byte	18                              ; DW_AT_high_pc
	.byte	6                               ; DW_FORM_data4
	.ascii	"\347\177"                      ; DW_AT_APPLE_omit_frame_ptr
	.byte	25                              ; DW_FORM_flag_present
	.byte	64                              ; DW_AT_frame_base
	.byte	24                              ; DW_FORM_exprloc
	.byte	100                             ; DW_AT_object_pointer
	.byte	19                              ; DW_FORM_ref4
	.byte	122                             ; DW_AT_call_all_calls
	.byte	25                              ; DW_FORM_flag_present
	.byte	3                               ; DW_AT_name
	.byte	14                              ; DW_FORM_strp
	.byte	58                              ; DW_AT_decl_file
	.byte	11                              ; DW_FORM_data1
	.byte	59                              ; DW_AT_decl_line
	.byte	11                              ; DW_FORM_data1
	.byte	39                              ; DW_AT_prototyped
	.byte	25                              ; DW_FORM_flag_present
	.ascii	"\341\177"                      ; DW_AT_APPLE_optimized
	.byte	25                              ; DW_FORM_flag_present
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	35                              ; Abbreviation Code
	.byte	5                               ; DW_TAG_formal_parameter
	.byte	0                               ; DW_CHILDREN_no
	.byte	2                               ; DW_AT_location
	.byte	24                              ; DW_FORM_exprloc
	.byte	3                               ; DW_AT_name
	.byte	14                              ; DW_FORM_strp
	.byte	73                              ; DW_AT_type
	.byte	19                              ; DW_FORM_ref4
	.byte	52                              ; DW_AT_artificial
	.byte	25                              ; DW_FORM_flag_present
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	36                              ; Abbreviation Code
	.byte	5                               ; DW_TAG_formal_parameter
	.byte	0                               ; DW_CHILDREN_no
	.byte	2                               ; DW_AT_location
	.byte	24                              ; DW_FORM_exprloc
	.byte	3                               ; DW_AT_name
	.byte	14                              ; DW_FORM_strp
	.byte	58                              ; DW_AT_decl_file
	.byte	11                              ; DW_FORM_data1
	.byte	59                              ; DW_AT_decl_line
	.byte	11                              ; DW_FORM_data1
	.byte	73                              ; DW_AT_type
	.byte	19                              ; DW_FORM_ref4
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	37                              ; Abbreviation Code
	.byte	46                              ; DW_TAG_subprogram
	.byte	1                               ; DW_CHILDREN_yes
	.byte	17                              ; DW_AT_low_pc
	.byte	1                               ; DW_FORM_addr
	.byte	18                              ; DW_AT_high_pc
	.byte	6                               ; DW_FORM_data4
	.ascii	"\347\177"                      ; DW_AT_APPLE_omit_frame_ptr
	.byte	25                              ; DW_FORM_flag_present
	.byte	64                              ; DW_AT_frame_base
	.byte	24                              ; DW_FORM_exprloc
	.byte	100                             ; DW_AT_object_pointer
	.byte	19                              ; DW_FORM_ref4
	.byte	122                             ; DW_AT_call_all_calls
	.byte	25                              ; DW_FORM_flag_present
	.byte	3                               ; DW_AT_name
	.byte	14                              ; DW_FORM_strp
	.byte	58                              ; DW_AT_decl_file
	.byte	11                              ; DW_FORM_data1
	.byte	59                              ; DW_AT_decl_line
	.byte	11                              ; DW_FORM_data1
	.byte	39                              ; DW_AT_prototyped
	.byte	25                              ; DW_FORM_flag_present
	.byte	73                              ; DW_AT_type
	.byte	19                              ; DW_FORM_ref4
	.byte	52                              ; DW_AT_artificial
	.byte	25                              ; DW_FORM_flag_present
	.ascii	"\341\177"                      ; DW_AT_APPLE_optimized
	.byte	25                              ; DW_FORM_flag_present
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	38                              ; Abbreviation Code
	.byte	46                              ; DW_TAG_subprogram
	.byte	1                               ; DW_CHILDREN_yes
	.byte	17                              ; DW_AT_low_pc
	.byte	1                               ; DW_FORM_addr
	.byte	18                              ; DW_AT_high_pc
	.byte	6                               ; DW_FORM_data4
	.ascii	"\347\177"                      ; DW_AT_APPLE_omit_frame_ptr
	.byte	25                              ; DW_FORM_flag_present
	.byte	64                              ; DW_AT_frame_base
	.byte	24                              ; DW_FORM_exprloc
	.byte	100                             ; DW_AT_object_pointer
	.byte	19                              ; DW_FORM_ref4
	.byte	122                             ; DW_AT_call_all_calls
	.byte	25                              ; DW_FORM_flag_present
	.byte	3                               ; DW_AT_name
	.byte	14                              ; DW_FORM_strp
	.byte	58                              ; DW_AT_decl_file
	.byte	11                              ; DW_FORM_data1
	.byte	59                              ; DW_AT_decl_line
	.byte	11                              ; DW_FORM_data1
	.byte	39                              ; DW_AT_prototyped
	.byte	25                              ; DW_FORM_flag_present
	.byte	52                              ; DW_AT_artificial
	.byte	25                              ; DW_FORM_flag_present
	.ascii	"\341\177"                      ; DW_AT_APPLE_optimized
	.byte	25                              ; DW_FORM_flag_present
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	39                              ; Abbreviation Code
	.byte	5                               ; DW_TAG_formal_parameter
	.byte	0                               ; DW_CHILDREN_no
	.byte	2                               ; DW_AT_location
	.byte	23                              ; DW_FORM_sec_offset
	.byte	3                               ; DW_AT_name
	.byte	14                              ; DW_FORM_strp
	.byte	73                              ; DW_AT_type
	.byte	19                              ; DW_FORM_ref4
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	40                              ; Abbreviation Code
	.byte	46                              ; DW_TAG_subprogram
	.byte	0                               ; DW_CHILDREN_no
	.byte	17                              ; DW_AT_low_pc
	.byte	1                               ; DW_FORM_addr
	.byte	18                              ; DW_AT_high_pc
	.byte	6                               ; DW_FORM_data4
	.ascii	"\347\177"                      ; DW_AT_APPLE_omit_frame_ptr
	.byte	25                              ; DW_FORM_flag_present
	.byte	64                              ; DW_AT_frame_base
	.byte	24                              ; DW_FORM_exprloc
	.byte	110                             ; DW_AT_linkage_name
	.byte	14                              ; DW_FORM_strp
	.byte	3                               ; DW_AT_name
	.byte	14                              ; DW_FORM_strp
	.byte	52                              ; DW_AT_artificial
	.byte	25                              ; DW_FORM_flag_present
	.byte	63                              ; DW_AT_external
	.byte	25                              ; DW_FORM_flag_present
	.ascii	"\341\177"                      ; DW_AT_APPLE_optimized
	.byte	25                              ; DW_FORM_flag_present
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	41                              ; Abbreviation Code
	.byte	1                               ; DW_TAG_array_type
	.byte	1                               ; DW_CHILDREN_yes
	.byte	73                              ; DW_AT_type
	.byte	19                              ; DW_FORM_ref4
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	42                              ; Abbreviation Code
	.byte	33                              ; DW_TAG_subrange_type
	.byte	0                               ; DW_CHILDREN_no
	.byte	73                              ; DW_AT_type
	.byte	19                              ; DW_FORM_ref4
	.byte	55                              ; DW_AT_count
	.byte	11                              ; DW_FORM_data1
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	43                              ; Abbreviation Code
	.byte	36                              ; DW_TAG_base_type
	.byte	0                               ; DW_CHILDREN_no
	.byte	3                               ; DW_AT_name
	.byte	14                              ; DW_FORM_strp
	.byte	11                              ; DW_AT_byte_size
	.byte	11                              ; DW_FORM_data1
	.byte	62                              ; DW_AT_encoding
	.byte	11                              ; DW_FORM_data1
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	44                              ; Abbreviation Code
	.byte	17                              ; DW_TAG_compile_unit
	.byte	0                               ; DW_CHILDREN_no
	.byte	37                              ; DW_AT_producer
	.byte	14                              ; DW_FORM_strp
	.byte	19                              ; DW_AT_language
	.byte	5                               ; DW_FORM_data2
	.byte	3                               ; DW_AT_name
	.byte	14                              ; DW_FORM_strp
	.byte	16                              ; DW_AT_stmt_list
	.byte	23                              ; DW_FORM_sec_offset
	.byte	27                              ; DW_AT_comp_dir
	.byte	14                              ; DW_FORM_strp
	.ascii	"\261B"                         ; DW_AT_GNU_dwo_id
	.byte	7                               ; DW_FORM_data8
	.ascii	"\260B"                         ; DW_AT_GNU_dwo_name
	.byte	14                              ; DW_FORM_strp
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	0                               ; EOM(3)
	.section	__DWARF,__debug_info,regular,debug
Lsection_info:
Lcu_begin0:
.set Lset140, Ldebug_info_end0-Ldebug_info_start0 ; Length of Unit
	.long	Lset140
Ldebug_info_start0:
	.short	4                               ; DWARF version number
.set Lset141, Lsection_abbrev-Lsection_abbrev ; Offset Into Abbrev. Section
	.long	Lset141
	.byte	8                               ; Address Size (in bytes)
	.byte	1                               ; Abbrev [1] 0xb:0x8b0 DW_TAG_compile_unit
	.long	0                               ; DW_AT_producer
	.short	16                              ; DW_AT_language
	.long	47                              ; DW_AT_name
	.long	116                             ; DW_AT_LLVM_sysroot
	.long	224                             ; DW_AT_APPLE_sdk
.set Lset142, Lline_table_start0-Lsection_line ; DW_AT_stmt_list
	.long	Lset142
	.long	241                             ; DW_AT_comp_dir
                                        ; DW_AT_APPLE_optimized
	.byte	2                               ; DW_AT_APPLE_major_runtime_vers
	.quad	Lfunc_begin0                    ; DW_AT_low_pc
.set Lset143, Lfunc_end15-Lfunc_begin0  ; DW_AT_high_pc
	.long	Lset143
	.byte	2                               ; Abbrev [2] 0x33:0x1 DW_TAG_pointer_type
	.byte	3                               ; Abbrev [3] 0x34:0x5 DW_TAG_pointer_type
	.long	57                              ; DW_AT_type
	.byte	4                               ; Abbrev [4] 0x39:0x7 DW_TAG_base_type
	.long	281                             ; DW_AT_name
	.byte	5                               ; DW_AT_encoding
	.byte	4                               ; DW_AT_byte_size
	.byte	3                               ; Abbrev [3] 0x40:0x5 DW_TAG_pointer_type
	.long	69                              ; DW_AT_type
	.byte	5                               ; Abbrev [5] 0x45:0xb DW_TAG_typedef
	.long	80                              ; DW_AT_type
	.long	285                             ; DW_AT_name
	.byte	1                               ; DW_AT_decl_file
	.byte	3                               ; DW_AT_decl_line
	.byte	4                               ; Abbrev [4] 0x50:0x7 DW_TAG_base_type
	.long	289                             ; DW_AT_name
	.byte	7                               ; DW_AT_encoding
	.byte	8                               ; DW_AT_byte_size
	.byte	6                               ; Abbrev [6] 0x57:0x2a DW_TAG_structure_type
                                        ; DW_AT_APPLE_objc_complete_type
	.long	307                             ; DW_AT_name
	.byte	16                              ; DW_AT_byte_size
	.byte	2                               ; DW_AT_decl_file
	.byte	3                               ; DW_AT_decl_line
	.byte	16                              ; DW_AT_APPLE_runtime_class
	.byte	7                               ; Abbrev [7] 0x60:0x6 DW_TAG_inheritance
	.long	151                             ; DW_AT_type
	.byte	0                               ; DW_AT_data_member_location
	.byte	8                               ; Abbrev [8] 0x66:0xd DW_TAG_APPLE_property
	.long	548                             ; DW_AT_APPLE_property_name
	.long	188                             ; DW_AT_type
	.byte	2                               ; DW_AT_decl_file
	.byte	5                               ; DW_AT_decl_line
	.short	1096                            ; DW_AT_APPLE_property_attribute
	.byte	9                               ; Abbrev [9] 0x73:0xd DW_TAG_member
	.long	564                             ; DW_AT_name
	.long	188                             ; DW_AT_type
	.byte	2                               ; DW_AT_decl_file
	.byte	5                               ; DW_AT_decl_line
	.byte	0                               ; DW_AT_data_member_location
	.byte	3                               ; DW_AT_accessibility
                                        ; DW_ACCESS_private
	.byte	0                               ; End Of Children Mark
	.byte	10                              ; Abbrev [10] 0x81:0x3b DW_TAG_module
	.long	319                             ; DW_AT_name
	.long	325                             ; DW_AT_LLVM_config_macros
	.long	386                             ; DW_AT_LLVM_include_path
	.byte	11                              ; Abbrev [11] 0x8e:0xf DW_TAG_module
	.long	536                             ; DW_AT_name
	.long	325                             ; DW_AT_LLVM_config_macros
	.byte	12                              ; Abbrev [12] 0x97:0x5 DW_TAG_structure_type
	.long	536                             ; DW_AT_name
                                        ; DW_AT_declaration
	.byte	0                               ; End Of Children Mark
	.byte	11                              ; Abbrev [11] 0x9d:0xf DW_TAG_module
	.long	555                             ; DW_AT_name
	.long	325                             ; DW_AT_LLVM_config_macros
	.byte	12                              ; Abbrev [12] 0xa6:0x5 DW_TAG_structure_type
	.long	555                             ; DW_AT_name
                                        ; DW_AT_declaration
	.byte	0                               ; End Of Children Mark
	.byte	11                              ; Abbrev [11] 0xac:0xf DW_TAG_module
	.long	2211                            ; DW_AT_name
	.long	325                             ; DW_AT_LLVM_config_macros
	.byte	12                              ; Abbrev [12] 0xb5:0x5 DW_TAG_structure_type
	.long	2211                            ; DW_AT_name
                                        ; DW_AT_declaration
	.byte	0                               ; End Of Children Mark
	.byte	0                               ; End Of Children Mark
	.byte	3                               ; Abbrev [3] 0xbc:0x5 DW_TAG_pointer_type
	.long	166                             ; DW_AT_type
	.byte	13                              ; Abbrev [13] 0xc1:0x7 DW_TAG_imported_declaration
	.byte	2                               ; DW_AT_decl_file
	.byte	1                               ; DW_AT_decl_line
	.long	129                             ; DW_AT_import
	.byte	14                              ; Abbrev [14] 0xc8:0x9b DW_TAG_subprogram
	.quad	Lfunc_begin0                    ; DW_AT_low_pc
.set Lset144, Lfunc_end0-Lfunc_begin0   ; DW_AT_high_pc
	.long	Lset144
	.byte	1                               ; DW_AT_frame_base
	.byte	109
                                        ; DW_AT_call_all_calls
	.long	572                             ; DW_AT_name
	.byte	1                               ; DW_AT_decl_file
	.byte	14                              ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.long	57                              ; DW_AT_type
                                        ; DW_AT_external
                                        ; DW_AT_APPLE_optimized
	.byte	15                              ; Abbrev [15] 0xe1:0xf DW_TAG_formal_parameter
.set Lset145, Ldebug_loc0-Lsection_debug_loc ; DW_AT_location
	.long	Lset145
	.long	1762                            ; DW_AT_name
	.byte	1                               ; DW_AT_decl_file
	.byte	14                              ; DW_AT_decl_line
	.long	69                              ; DW_AT_type
	.byte	16                              ; Abbrev [16] 0xf0:0xf DW_TAG_variable
.set Lset146, Ldebug_loc1-Lsection_debug_loc ; DW_AT_location
	.long	Lset146
	.long	1767                            ; DW_AT_name
	.byte	1                               ; DW_AT_decl_file
	.byte	15                              ; DW_AT_decl_line
	.long	2030                            ; DW_AT_type
	.byte	16                              ; Abbrev [16] 0xff:0xf DW_TAG_variable
.set Lset147, Ldebug_loc2-Lsection_debug_loc ; DW_AT_location
	.long	Lset147
	.long	1792                            ; DW_AT_name
	.byte	1                               ; DW_AT_decl_file
	.byte	20                              ; DW_AT_decl_line
	.long	2110                            ; DW_AT_type
	.byte	17                              ; Abbrev [17] 0x10e:0x14 DW_TAG_call_site
	.long	355                             ; DW_AT_call_origin
	.quad	Ltmp2                           ; DW_AT_call_return_pc
	.byte	18                              ; Abbrev [18] 0x11b:0x6 DW_TAG_call_site_parameter
	.byte	1                               ; DW_AT_location
	.byte	80
	.byte	2                               ; DW_AT_call_value
	.byte	143
	.byte	8
	.byte	0                               ; End Of Children Mark
	.byte	17                              ; Abbrev [17] 0x122:0x19 DW_TAG_call_site
	.long	373                             ; DW_AT_call_origin
	.quad	Ltmp4                           ; DW_AT_call_return_pc
	.byte	18                              ; Abbrev [18] 0x12f:0x5 DW_TAG_call_site_parameter
	.byte	1                               ; DW_AT_location
	.byte	82
	.byte	1                               ; DW_AT_call_value
	.byte	56
	.byte	18                              ; Abbrev [18] 0x134:0x6 DW_TAG_call_site_parameter
	.byte	1                               ; DW_AT_location
	.byte	81
	.byte	2                               ; DW_AT_call_value
	.byte	131
	.byte	0
	.byte	0                               ; End Of Children Mark
	.byte	19                              ; Abbrev [19] 0x13b:0xd DW_TAG_call_site
	.long	418                             ; DW_AT_call_origin
	.quad	Ltmp6                           ; DW_AT_call_return_pc
	.byte	19                              ; Abbrev [19] 0x148:0xd DW_TAG_call_site
	.long	418                             ; DW_AT_call_origin
	.quad	Ltmp7                           ; DW_AT_call_return_pc
	.byte	19                              ; Abbrev [19] 0x155:0xd DW_TAG_call_site
	.long	440                             ; DW_AT_call_origin
	.quad	Ltmp11                          ; DW_AT_call_return_pc
	.byte	0                               ; End Of Children Mark
	.byte	20                              ; Abbrev [20] 0x163:0x12 DW_TAG_subprogram
	.long	583                             ; DW_AT_name
	.byte	3                               ; DW_AT_decl_file
	.short	470                             ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.long	57                              ; DW_AT_type
                                        ; DW_AT_declaration
                                        ; DW_AT_external
                                        ; DW_AT_APPLE_optimized
	.byte	21                              ; Abbrev [21] 0x16f:0x5 DW_TAG_formal_parameter
	.long	52                              ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	22                              ; Abbrev [22] 0x175:0x20 DW_TAG_subprogram
	.long	588                             ; DW_AT_linkage_name
	.long	595                             ; DW_AT_name
	.byte	3                               ; DW_AT_decl_file
	.short	496                             ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.long	405                             ; DW_AT_type
                                        ; DW_AT_declaration
                                        ; DW_AT_external
                                        ; DW_AT_APPLE_optimized
	.byte	21                              ; Abbrev [21] 0x185:0x5 DW_TAG_formal_parameter
	.long	57                              ; DW_AT_type
	.byte	21                              ; Abbrev [21] 0x18a:0x5 DW_TAG_formal_parameter
	.long	412                             ; DW_AT_type
	.byte	21                              ; Abbrev [21] 0x18f:0x5 DW_TAG_formal_parameter
	.long	80                              ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	4                               ; Abbrev [4] 0x195:0x7 DW_TAG_base_type
	.long	601                             ; DW_AT_name
	.byte	5                               ; DW_AT_encoding
	.byte	8                               ; DW_AT_byte_size
	.byte	3                               ; Abbrev [3] 0x19c:0x5 DW_TAG_pointer_type
	.long	417                             ; DW_AT_type
	.byte	23                              ; Abbrev [23] 0x1a1:0x1 DW_TAG_const_type
	.byte	22                              ; Abbrev [22] 0x1a2:0x16 DW_TAG_subprogram
	.long	610                             ; DW_AT_linkage_name
	.long	617                             ; DW_AT_name
	.byte	3                               ; DW_AT_decl_file
	.short	437                             ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.long	57                              ; DW_AT_type
                                        ; DW_AT_declaration
                                        ; DW_AT_external
                                        ; DW_AT_APPLE_optimized
	.byte	21                              ; Abbrev [21] 0x1b2:0x5 DW_TAG_formal_parameter
	.long	57                              ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	24                              ; Abbrev [24] 0x1b8:0x17 DW_TAG_subprogram
	.quad	Lfunc_begin12                   ; DW_AT_low_pc
.set Lset148, Lfunc_end12-Lfunc_begin12 ; DW_AT_high_pc
	.long	Lset148
	.byte	1                               ; DW_AT_frame_base
	.byte	109
	.long	1521                            ; DW_AT_linkage_name
	.long	1521                            ; DW_AT_name
                                        ; DW_AT_APPLE_optimized
	.byte	14                              ; Abbrev [14] 0x1cf:0xe4 DW_TAG_subprogram
	.quad	Lfunc_begin1                    ; DW_AT_low_pc
.set Lset149, Lfunc_end1-Lfunc_begin1   ; DW_AT_high_pc
	.long	Lset149
	.byte	1                               ; DW_AT_frame_base
	.byte	109
                                        ; DW_AT_call_all_calls
	.long	623                             ; DW_AT_name
	.byte	1                               ; DW_AT_decl_file
	.byte	27                              ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.long	57                              ; DW_AT_type
                                        ; DW_AT_external
                                        ; DW_AT_APPLE_optimized
	.byte	15                              ; Abbrev [15] 0x1e8:0xf DW_TAG_formal_parameter
.set Lset150, Ldebug_loc3-Lsection_debug_loc ; DW_AT_location
	.long	Lset150
	.long	1762                            ; DW_AT_name
	.byte	1                               ; DW_AT_decl_file
	.byte	27                              ; DW_AT_decl_line
	.long	69                              ; DW_AT_type
	.byte	25                              ; Abbrev [25] 0x1f7:0xe DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	143
	.byte	8
	.long	1767                            ; DW_AT_name
	.byte	1                               ; DW_AT_decl_file
	.byte	34                              ; DW_AT_decl_line
	.long	2030                            ; DW_AT_type
	.byte	16                              ; Abbrev [16] 0x205:0xf DW_TAG_variable
.set Lset151, Ldebug_loc4-Lsection_debug_loc ; DW_AT_location
	.long	Lset151
	.long	1988                            ; DW_AT_name
	.byte	1                               ; DW_AT_decl_file
	.byte	39                              ; DW_AT_decl_line
	.long	57                              ; DW_AT_type
	.byte	16                              ; Abbrev [16] 0x214:0xf DW_TAG_variable
.set Lset152, Ldebug_loc5-Lsection_debug_loc ; DW_AT_location
	.long	Lset152
	.long	1792                            ; DW_AT_name
	.byte	1                               ; DW_AT_decl_file
	.byte	40                              ; DW_AT_decl_line
	.long	2110                            ; DW_AT_type
	.byte	17                              ; Abbrev [17] 0x223:0x15 DW_TAG_call_site
	.long	200                             ; DW_AT_call_origin
	.quad	Ltmp13                          ; DW_AT_call_return_pc
	.byte	18                              ; Abbrev [18] 0x230:0x7 DW_TAG_call_site_parameter
	.byte	1                               ; DW_AT_location
	.byte	80
	.byte	3                               ; DW_AT_call_value
	.byte	163
	.byte	1
	.byte	80
	.byte	0                               ; End Of Children Mark
	.byte	17                              ; Abbrev [17] 0x238:0x14 DW_TAG_call_site
	.long	355                             ; DW_AT_call_origin
	.quad	Ltmp16                          ; DW_AT_call_return_pc
	.byte	18                              ; Abbrev [18] 0x245:0x6 DW_TAG_call_site_parameter
	.byte	1                               ; DW_AT_location
	.byte	80
	.byte	2                               ; DW_AT_call_value
	.byte	143
	.byte	8
	.byte	0                               ; End Of Children Mark
	.byte	17                              ; Abbrev [17] 0x24c:0x19 DW_TAG_call_site
	.long	373                             ; DW_AT_call_origin
	.quad	Ltmp20                          ; DW_AT_call_return_pc
	.byte	18                              ; Abbrev [18] 0x259:0x5 DW_TAG_call_site_parameter
	.byte	1                               ; DW_AT_location
	.byte	82
	.byte	1                               ; DW_AT_call_value
	.byte	52
	.byte	18                              ; Abbrev [18] 0x25e:0x6 DW_TAG_call_site_parameter
	.byte	1                               ; DW_AT_location
	.byte	81
	.byte	2                               ; DW_AT_call_value
	.byte	143
	.byte	4
	.byte	0                               ; End Of Children Mark
	.byte	17                              ; Abbrev [17] 0x265:0x19 DW_TAG_call_site
	.long	691                             ; DW_AT_call_origin
	.quad	Ltmp23                          ; DW_AT_call_return_pc
	.byte	18                              ; Abbrev [18] 0x272:0x5 DW_TAG_call_site_parameter
	.byte	1                               ; DW_AT_location
	.byte	82
	.byte	1                               ; DW_AT_call_value
	.byte	52
	.byte	18                              ; Abbrev [18] 0x277:0x6 DW_TAG_call_site_parameter
	.byte	1                               ; DW_AT_location
	.byte	81
	.byte	2                               ; DW_AT_call_value
	.byte	131
	.byte	0
	.byte	0                               ; End Of Children Mark
	.byte	19                              ; Abbrev [19] 0x27e:0xd DW_TAG_call_site
	.long	418                             ; DW_AT_call_origin
	.quad	Ltmp25                          ; DW_AT_call_return_pc
	.byte	19                              ; Abbrev [19] 0x28b:0xd DW_TAG_call_site
	.long	418                             ; DW_AT_call_origin
	.quad	Ltmp26                          ; DW_AT_call_return_pc
	.byte	19                              ; Abbrev [19] 0x298:0xd DW_TAG_call_site
	.long	723                             ; DW_AT_call_origin
	.quad	Ltmp29                          ; DW_AT_call_return_pc
	.byte	19                              ; Abbrev [19] 0x2a5:0xd DW_TAG_call_site
	.long	746                             ; DW_AT_call_origin
	.quad	Ltmp30                          ; DW_AT_call_return_pc
	.byte	0                               ; End Of Children Mark
	.byte	22                              ; Abbrev [22] 0x2b3:0x20 DW_TAG_subprogram
	.long	634                             ; DW_AT_linkage_name
	.long	640                             ; DW_AT_name
	.byte	3                               ; DW_AT_decl_file
	.short	472                             ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.long	405                             ; DW_AT_type
                                        ; DW_AT_declaration
                                        ; DW_AT_external
                                        ; DW_AT_APPLE_optimized
	.byte	21                              ; Abbrev [21] 0x2c3:0x5 DW_TAG_formal_parameter
	.long	57                              ; DW_AT_type
	.byte	21                              ; Abbrev [21] 0x2c8:0x5 DW_TAG_formal_parameter
	.long	51                              ; DW_AT_type
	.byte	21                              ; Abbrev [21] 0x2cd:0x5 DW_TAG_formal_parameter
	.long	80                              ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	24                              ; Abbrev [24] 0x2d3:0x17 DW_TAG_subprogram
	.quad	Lfunc_begin14                   ; DW_AT_low_pc
.set Lset153, Lfunc_end14-Lfunc_begin14 ; DW_AT_high_pc
	.long	Lset153
	.byte	1                               ; DW_AT_frame_base
	.byte	109
	.long	1557                            ; DW_AT_linkage_name
	.long	1557                            ; DW_AT_name
                                        ; DW_AT_APPLE_optimized
	.byte	24                              ; Abbrev [24] 0x2ea:0x17 DW_TAG_subprogram
	.quad	Lfunc_begin13                   ; DW_AT_low_pc
.set Lset154, Lfunc_end13-Lfunc_begin13 ; DW_AT_high_pc
	.long	Lset154
	.byte	1                               ; DW_AT_frame_base
	.byte	109
	.long	1539                            ; DW_AT_linkage_name
	.long	1539                            ; DW_AT_name
                                        ; DW_AT_APPLE_optimized
	.byte	26                              ; Abbrev [26] 0x301:0x1cb DW_TAG_subprogram
	.quad	Lfunc_begin2                    ; DW_AT_low_pc
.set Lset155, Lfunc_end2-Lfunc_begin2   ; DW_AT_high_pc
	.long	Lset155
	.byte	1                               ; DW_AT_frame_base
	.byte	109
                                        ; DW_AT_call_all_calls
	.long	645                             ; DW_AT_name
	.byte	1                               ; DW_AT_decl_file
	.byte	52                              ; DW_AT_decl_line
                                        ; DW_AT_external
                                        ; DW_AT_APPLE_optimized
	.byte	16                              ; Abbrev [16] 0x316:0xf DW_TAG_variable
.set Lset156, Ldebug_loc6-Lsection_debug_loc ; DW_AT_location
	.long	Lset156
	.long	1990                            ; DW_AT_name
	.byte	1                               ; DW_AT_decl_file
	.byte	54                              ; DW_AT_decl_line
	.long	69                              ; DW_AT_type
	.byte	16                              ; Abbrev [16] 0x325:0xf DW_TAG_variable
.set Lset157, Ldebug_loc7-Lsection_debug_loc ; DW_AT_location
	.long	Lset157
	.long	1994                            ; DW_AT_name
	.byte	1                               ; DW_AT_decl_file
	.byte	53                              ; DW_AT_decl_line
	.long	69                              ; DW_AT_type
	.byte	16                              ; Abbrev [16] 0x334:0xf DW_TAG_variable
.set Lset158, Ldebug_loc8-Lsection_debug_loc ; DW_AT_location
	.long	Lset158
	.long	2000                            ; DW_AT_name
	.byte	1                               ; DW_AT_decl_file
	.byte	66                              ; DW_AT_decl_line
	.long	69                              ; DW_AT_type
	.byte	16                              ; Abbrev [16] 0x343:0xf DW_TAG_variable
.set Lset159, Ldebug_loc9-Lsection_debug_loc ; DW_AT_location
	.long	Lset159
	.long	2015                            ; DW_AT_name
	.byte	1                               ; DW_AT_decl_file
	.byte	72                              ; DW_AT_decl_line
	.long	2165                            ; DW_AT_type
	.byte	16                              ; Abbrev [16] 0x352:0xf DW_TAG_variable
.set Lset160, Ldebug_loc10-Lsection_debug_loc ; DW_AT_location
	.long	Lset160
	.long	2044                            ; DW_AT_name
	.byte	1                               ; DW_AT_decl_file
	.byte	73                              ; DW_AT_decl_line
	.long	2165                            ; DW_AT_type
	.byte	16                              ; Abbrev [16] 0x361:0xf DW_TAG_variable
.set Lset161, Ldebug_loc11-Lsection_debug_loc ; DW_AT_location
	.long	Lset161
	.long	2057                            ; DW_AT_name
	.byte	1                               ; DW_AT_decl_file
	.byte	74                              ; DW_AT_decl_line
	.long	2165                            ; DW_AT_type
	.byte	16                              ; Abbrev [16] 0x370:0xf DW_TAG_variable
.set Lset162, Ldebug_loc12-Lsection_debug_loc ; DW_AT_location
	.long	Lset162
	.long	2068                            ; DW_AT_name
	.byte	1                               ; DW_AT_decl_file
	.byte	79                              ; DW_AT_decl_line
	.long	2170                            ; DW_AT_type
	.byte	16                              ; Abbrev [16] 0x37f:0xf DW_TAG_variable
.set Lset163, Ldebug_loc13-Lsection_debug_loc ; DW_AT_location
	.long	Lset163
	.long	2097                            ; DW_AT_name
	.byte	1                               ; DW_AT_decl_file
	.byte	80                              ; DW_AT_decl_line
	.long	2170                            ; DW_AT_type
	.byte	16                              ; Abbrev [16] 0x38e:0xf DW_TAG_variable
.set Lset164, Ldebug_loc14-Lsection_debug_loc ; DW_AT_location
	.long	Lset164
	.long	2111                            ; DW_AT_name
	.byte	1                               ; DW_AT_decl_file
	.byte	81                              ; DW_AT_decl_line
	.long	2170                            ; DW_AT_type
	.byte	16                              ; Abbrev [16] 0x39d:0xf DW_TAG_variable
.set Lset165, Ldebug_loc17-Lsection_debug_loc ; DW_AT_location
	.long	Lset165
	.long	2129                            ; DW_AT_name
	.byte	1                               ; DW_AT_decl_file
	.byte	119                             ; DW_AT_decl_line
	.long	1255                            ; DW_AT_type
	.byte	16                              ; Abbrev [16] 0x3ac:0xf DW_TAG_variable
.set Lset166, Ldebug_loc18-Lsection_debug_loc ; DW_AT_location
	.long	Lset166
	.long	2135                            ; DW_AT_name
	.byte	1                               ; DW_AT_decl_file
	.byte	120                             ; DW_AT_decl_line
	.long	2188                            ; DW_AT_type
	.byte	16                              ; Abbrev [16] 0x3bb:0xf DW_TAG_variable
.set Lset167, Ldebug_loc19-Lsection_debug_loc ; DW_AT_location
	.long	Lset167
	.long	2163                            ; DW_AT_name
	.byte	1                               ; DW_AT_decl_file
	.byte	121                             ; DW_AT_decl_line
	.long	2188                            ; DW_AT_type
	.byte	27                              ; Abbrev [27] 0x3ca:0x85 DW_TAG_lexical_block
	.quad	Ltmp58                          ; DW_AT_low_pc
.set Lset168, Ltmp93-Ltmp58             ; DW_AT_high_pc
	.long	Lset168
	.byte	16                              ; Abbrev [16] 0x3d7:0xf DW_TAG_variable
.set Lset169, Ldebug_loc15-Lsection_debug_loc ; DW_AT_location
	.long	Lset169
	.long	1762                            ; DW_AT_name
	.byte	1                               ; DW_AT_decl_file
	.byte	82                              ; DW_AT_decl_line
	.long	69                              ; DW_AT_type
	.byte	27                              ; Abbrev [27] 0x3e6:0x68 DW_TAG_lexical_block
	.quad	Ltmp60                          ; DW_AT_low_pc
.set Lset170, Ltmp91-Ltmp60             ; DW_AT_high_pc
	.long	Lset170
	.byte	16                              ; Abbrev [16] 0x3f3:0xf DW_TAG_variable
.set Lset171, Ldebug_loc16-Lsection_debug_loc ; DW_AT_location
	.long	Lset171
	.long	2119                            ; DW_AT_name
	.byte	1                               ; DW_AT_decl_file
	.byte	83                              ; DW_AT_decl_line
	.long	69                              ; DW_AT_type
	.byte	27                              ; Abbrev [27] 0x402:0x19 DW_TAG_lexical_block
	.quad	Ltmp65                          ; DW_AT_low_pc
.set Lset172, Ltmp69-Ltmp65             ; DW_AT_high_pc
	.long	Lset172
	.byte	28                              ; Abbrev [28] 0x40f:0xb DW_TAG_variable
	.long	2123                            ; DW_AT_name
	.byte	1                               ; DW_AT_decl_file
	.byte	96                              ; DW_AT_decl_line
	.long	2170                            ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	27                              ; Abbrev [27] 0x41b:0x19 DW_TAG_lexical_block
	.quad	Ltmp70                          ; DW_AT_low_pc
.set Lset173, Ltmp75-Ltmp70             ; DW_AT_high_pc
	.long	Lset173
	.byte	28                              ; Abbrev [28] 0x428:0xb DW_TAG_variable
	.long	2123                            ; DW_AT_name
	.byte	1                               ; DW_AT_decl_file
	.byte	101                             ; DW_AT_decl_line
	.long	2170                            ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	27                              ; Abbrev [27] 0x434:0x19 DW_TAG_lexical_block
	.quad	Ltmp75                          ; DW_AT_low_pc
.set Lset174, Ltmp80-Ltmp75             ; DW_AT_high_pc
	.long	Lset174
	.byte	28                              ; Abbrev [28] 0x441:0xb DW_TAG_variable
	.long	2123                            ; DW_AT_name
	.byte	1                               ; DW_AT_decl_file
	.byte	90                              ; DW_AT_decl_line
	.long	2170                            ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	0                               ; End Of Children Mark
	.byte	0                               ; End Of Children Mark
	.byte	17                              ; Abbrev [17] 0x44f:0x14 DW_TAG_call_site
	.long	200                             ; DW_AT_call_origin
	.quad	Ltmp34                          ; DW_AT_call_return_pc
	.byte	18                              ; Abbrev [18] 0x45c:0x6 DW_TAG_call_site_parameter
	.byte	1                               ; DW_AT_location
	.byte	80
	.byte	2                               ; DW_AT_call_value
	.byte	134
	.byte	0
	.byte	0                               ; End Of Children Mark
	.byte	17                              ; Abbrev [17] 0x463:0x16 DW_TAG_call_site
	.long	200                             ; DW_AT_call_origin
	.quad	Ltmp41                          ; DW_AT_call_return_pc
	.byte	18                              ; Abbrev [18] 0x470:0x8 DW_TAG_call_site_parameter
	.byte	1                               ; DW_AT_location
	.byte	80
	.byte	4                               ; DW_AT_call_value
	.byte	131
	.ascii	"\200\200~"
	.byte	0                               ; End Of Children Mark
	.byte	17                              ; Abbrev [17] 0x479:0x14 DW_TAG_call_site
	.long	463                             ; DW_AT_call_origin
	.quad	Ltmp44                          ; DW_AT_call_return_pc
	.byte	18                              ; Abbrev [18] 0x486:0x6 DW_TAG_call_site_parameter
	.byte	1                               ; DW_AT_location
	.byte	80
	.byte	2                               ; DW_AT_call_value
	.byte	135
	.byte	0
	.byte	0                               ; End Of Children Mark
	.byte	17                              ; Abbrev [17] 0x48d:0x14 DW_TAG_call_site
	.long	200                             ; DW_AT_call_origin
	.quad	Ltmp61                          ; DW_AT_call_return_pc
	.byte	18                              ; Abbrev [18] 0x49a:0x6 DW_TAG_call_site_parameter
	.byte	1                               ; DW_AT_location
	.byte	80
	.byte	2                               ; DW_AT_call_value
	.byte	137
	.byte	0
	.byte	0                               ; End Of Children Mark
	.byte	17                              ; Abbrev [17] 0x4a1:0x1d DW_TAG_call_site
	.long	1228                            ; DW_AT_call_origin
	.quad	Ltmp94                          ; DW_AT_call_return_pc
	.byte	18                              ; Abbrev [18] 0x4ae:0x5 DW_TAG_call_site_parameter
	.byte	1                               ; DW_AT_location
	.byte	82
	.byte	1                               ; DW_AT_call_value
	.byte	49
	.byte	18                              ; Abbrev [18] 0x4b3:0x5 DW_TAG_call_site_parameter
	.byte	1                               ; DW_AT_location
	.byte	81
	.byte	1                               ; DW_AT_call_value
	.byte	49
	.byte	18                              ; Abbrev [18] 0x4b8:0x5 DW_TAG_call_site_parameter
	.byte	1                               ; DW_AT_location
	.byte	80
	.byte	1                               ; DW_AT_call_value
	.byte	57
	.byte	0                               ; End Of Children Mark
	.byte	19                              ; Abbrev [19] 0x4be:0xd DW_TAG_call_site
	.long	1363                            ; DW_AT_call_origin
	.quad	Ltmp109                         ; DW_AT_call_return_pc
	.byte	0                               ; End Of Children Mark
	.byte	29                              ; Abbrev [29] 0x4cc:0x1b DW_TAG_subprogram
	.long	664                             ; DW_AT_name
	.byte	4                               ; DW_AT_decl_file
	.byte	96                              ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.long	1255                            ; DW_AT_type
                                        ; DW_AT_declaration
                                        ; DW_AT_external
                                        ; DW_AT_APPLE_optimized
	.byte	21                              ; Abbrev [21] 0x4d7:0x5 DW_TAG_formal_parameter
	.long	1297                            ; DW_AT_type
	.byte	21                              ; Abbrev [21] 0x4dc:0x5 DW_TAG_formal_parameter
	.long	1303                            ; DW_AT_type
	.byte	21                              ; Abbrev [21] 0x4e1:0x5 DW_TAG_formal_parameter
	.long	1356                            ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	3                               ; Abbrev [3] 0x4e7:0x5 DW_TAG_pointer_type
	.long	1282                            ; DW_AT_type
	.byte	10                              ; Abbrev [10] 0x4ec:0x60 DW_TAG_module
	.long	700                             ; DW_AT_name
	.long	325                             ; DW_AT_LLVM_config_macros
	.long	711                             ; DW_AT_LLVM_include_path
	.byte	11                              ; Abbrev [11] 0x4f9:0xf DW_TAG_module
	.long	866                             ; DW_AT_name
	.long	325                             ; DW_AT_LLVM_config_macros
	.byte	12                              ; Abbrev [12] 0x502:0x5 DW_TAG_structure_type
	.long	866                             ; DW_AT_name
                                        ; DW_AT_declaration
	.byte	0                               ; End Of Children Mark
	.byte	11                              ; Abbrev [11] 0x508:0x16 DW_TAG_module
	.long	874                             ; DW_AT_name
	.long	325                             ; DW_AT_LLVM_config_macros
	.byte	30                              ; Abbrev [30] 0x511:0x6 DW_TAG_enumeration_type
	.long	890                             ; DW_AT_name
	.byte	8                               ; DW_AT_byte_size
                                        ; DW_AT_declaration
	.byte	30                              ; Abbrev [30] 0x517:0x6 DW_TAG_enumeration_type
	.long	912                             ; DW_AT_name
	.byte	8                               ; DW_AT_byte_size
                                        ; DW_AT_declaration
	.byte	0                               ; End Of Children Mark
	.byte	11                              ; Abbrev [11] 0x51e:0xf DW_TAG_module
	.long	2023                            ; DW_AT_name
	.long	325                             ; DW_AT_LLVM_config_macros
	.byte	12                              ; Abbrev [12] 0x527:0x5 DW_TAG_structure_type
	.long	2030                            ; DW_AT_name
                                        ; DW_AT_declaration
	.byte	0                               ; End Of Children Mark
	.byte	11                              ; Abbrev [11] 0x52d:0xf DW_TAG_module
	.long	2154                            ; DW_AT_name
	.long	325                             ; DW_AT_LLVM_config_macros
	.byte	12                              ; Abbrev [12] 0x536:0x5 DW_TAG_structure_type
	.long	2154                            ; DW_AT_name
                                        ; DW_AT_declaration
	.byte	0                               ; End Of Children Mark
	.byte	11                              ; Abbrev [11] 0x53c:0xf DW_TAG_module
	.long	2239                            ; DW_AT_name
	.long	325                             ; DW_AT_LLVM_config_macros
	.byte	12                              ; Abbrev [12] 0x545:0x5 DW_TAG_structure_type
	.long	2239                            ; DW_AT_name
                                        ; DW_AT_declaration
	.byte	0                               ; End Of Children Mark
	.byte	0                               ; End Of Children Mark
	.byte	4                               ; Abbrev [4] 0x54c:0x7 DW_TAG_base_type
	.long	935                             ; DW_AT_name
	.byte	2                               ; DW_AT_encoding
	.byte	1                               ; DW_AT_byte_size
	.byte	29                              ; Abbrev [29] 0x553:0x11 DW_TAG_subprogram
	.long	941                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	173                             ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.long	57                              ; DW_AT_type
                                        ; DW_AT_declaration
                                        ; DW_AT_external
                                        ; DW_AT_APPLE_optimized
	.byte	21                              ; Abbrev [21] 0x55e:0x5 DW_TAG_formal_parameter
	.long	1380                            ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	3                               ; Abbrev [3] 0x564:0x5 DW_TAG_pointer_type
	.long	1385                            ; DW_AT_type
	.byte	31                              ; Abbrev [31] 0x569:0x5 DW_TAG_const_type
	.long	1390                            ; DW_AT_type
	.byte	4                               ; Abbrev [4] 0x56e:0x7 DW_TAG_base_type
	.long	946                             ; DW_AT_name
	.byte	6                               ; DW_AT_encoding
	.byte	1                               ; DW_AT_byte_size
	.byte	32                              ; Abbrev [32] 0x575:0x63 DW_TAG_subprogram
	.quad	Lfunc_begin3                    ; DW_AT_low_pc
.set Lset175, Lfunc_end3-Lfunc_begin3   ; DW_AT_high_pc
	.long	Lset175
	.byte	1                               ; DW_AT_frame_base
	.byte	109
	.long	1426                            ; DW_AT_object_pointer
                                        ; DW_AT_call_all_calls
	.long	951                             ; DW_AT_name
	.byte	1                               ; DW_AT_decl_file
	.byte	130                             ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.long	2017                            ; DW_AT_type
                                        ; DW_AT_APPLE_optimized
	.byte	33                              ; Abbrev [33] 0x592:0xd DW_TAG_formal_parameter
.set Lset176, Ldebug_loc20-Lsection_debug_loc ; DW_AT_location
	.long	Lset176
	.long	2171                            ; DW_AT_name
	.long	2193                            ; DW_AT_type
                                        ; DW_AT_artificial
	.byte	33                              ; Abbrev [33] 0x59f:0xd DW_TAG_formal_parameter
.set Lset177, Ldebug_loc21-Lsection_debug_loc ; DW_AT_location
	.long	Lset177
	.long	2176                            ; DW_AT_name
	.long	2203                            ; DW_AT_type
                                        ; DW_AT_artificial
	.byte	15                              ; Abbrev [15] 0x5ac:0xf DW_TAG_formal_parameter
.set Lset178, Ldebug_loc22-Lsection_debug_loc ; DW_AT_location
	.long	Lset178
	.long	2199                            ; DW_AT_name
	.byte	1                               ; DW_AT_decl_file
	.byte	130                             ; DW_AT_decl_line
	.long	2224                            ; DW_AT_type
	.byte	15                              ; Abbrev [15] 0x5bb:0xf DW_TAG_formal_parameter
.set Lset179, Ldebug_loc23-Lsection_debug_loc ; DW_AT_location
	.long	Lset179
	.long	2225                            ; DW_AT_name
	.byte	1                               ; DW_AT_decl_file
	.byte	130                             ; DW_AT_decl_line
	.long	2229                            ; DW_AT_type
	.byte	19                              ; Abbrev [19] 0x5ca:0xd DW_TAG_call_site
	.long	769                             ; DW_AT_call_origin
	.quad	Ltmp118                         ; DW_AT_call_return_pc
	.byte	0                               ; End Of Children Mark
	.byte	34                              ; Abbrev [34] 0x5d8:0x3d DW_TAG_subprogram
	.quad	Lfunc_begin4                    ; DW_AT_low_pc
.set Lset180, Lfunc_end4-Lfunc_begin4   ; DW_AT_high_pc
	.long	Lset180
                                        ; DW_AT_APPLE_omit_frame_ptr
	.byte	1                               ; DW_AT_frame_base
	.byte	111
	.long	1521                            ; DW_AT_object_pointer
                                        ; DW_AT_call_all_calls
	.long	1052                            ; DW_AT_name
	.byte	1                               ; DW_AT_decl_file
	.byte	139                             ; DW_AT_decl_line
                                        ; DW_AT_prototyped
                                        ; DW_AT_APPLE_optimized
	.byte	35                              ; Abbrev [35] 0x5f1:0xb DW_TAG_formal_parameter
	.byte	1                               ; DW_AT_location
	.byte	80
	.long	2171                            ; DW_AT_name
	.long	2193                            ; DW_AT_type
                                        ; DW_AT_artificial
	.byte	35                              ; Abbrev [35] 0x5fc:0xb DW_TAG_formal_parameter
	.byte	1                               ; DW_AT_location
	.byte	81
	.long	2176                            ; DW_AT_name
	.long	2203                            ; DW_AT_type
                                        ; DW_AT_artificial
	.byte	36                              ; Abbrev [36] 0x607:0xd DW_TAG_formal_parameter
	.byte	1                               ; DW_AT_location
	.byte	82
	.long	2199                            ; DW_AT_name
	.byte	1                               ; DW_AT_decl_file
	.byte	139                             ; DW_AT_decl_line
	.long	2224                            ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	34                              ; Abbrev [34] 0x615:0x3d DW_TAG_subprogram
	.quad	Lfunc_begin5                    ; DW_AT_low_pc
.set Lset181, Lfunc_end5-Lfunc_begin5   ; DW_AT_high_pc
	.long	Lset181
                                        ; DW_AT_APPLE_omit_frame_ptr
	.byte	1                               ; DW_AT_frame_base
	.byte	111
	.long	1582                            ; DW_AT_object_pointer
                                        ; DW_AT_call_all_calls
	.long	1125                            ; DW_AT_name
	.byte	1                               ; DW_AT_decl_file
	.byte	145                             ; DW_AT_decl_line
                                        ; DW_AT_prototyped
                                        ; DW_AT_APPLE_optimized
	.byte	35                              ; Abbrev [35] 0x62e:0xb DW_TAG_formal_parameter
	.byte	1                               ; DW_AT_location
	.byte	80
	.long	2171                            ; DW_AT_name
	.long	2193                            ; DW_AT_type
                                        ; DW_AT_artificial
	.byte	35                              ; Abbrev [35] 0x639:0xb DW_TAG_formal_parameter
	.byte	1                               ; DW_AT_location
	.byte	81
	.long	2176                            ; DW_AT_name
	.long	2203                            ; DW_AT_type
                                        ; DW_AT_artificial
	.byte	36                              ; Abbrev [36] 0x644:0xd DW_TAG_formal_parameter
	.byte	1                               ; DW_AT_location
	.byte	82
	.long	2199                            ; DW_AT_name
	.byte	1                               ; DW_AT_decl_file
	.byte	145                             ; DW_AT_decl_line
	.long	2224                            ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	34                              ; Abbrev [34] 0x652:0x3d DW_TAG_subprogram
	.quad	Lfunc_begin6                    ; DW_AT_low_pc
.set Lset182, Lfunc_end6-Lfunc_begin6   ; DW_AT_high_pc
	.long	Lset182
                                        ; DW_AT_APPLE_omit_frame_ptr
	.byte	1                               ; DW_AT_frame_base
	.byte	111
	.long	1643                            ; DW_AT_object_pointer
                                        ; DW_AT_call_all_calls
	.long	1202                            ; DW_AT_name
	.byte	1                               ; DW_AT_decl_file
	.byte	151                             ; DW_AT_decl_line
                                        ; DW_AT_prototyped
                                        ; DW_AT_APPLE_optimized
	.byte	35                              ; Abbrev [35] 0x66b:0xb DW_TAG_formal_parameter
	.byte	1                               ; DW_AT_location
	.byte	80
	.long	2171                            ; DW_AT_name
	.long	2193                            ; DW_AT_type
                                        ; DW_AT_artificial
	.byte	35                              ; Abbrev [35] 0x676:0xb DW_TAG_formal_parameter
	.byte	1                               ; DW_AT_location
	.byte	81
	.long	2176                            ; DW_AT_name
	.long	2203                            ; DW_AT_type
                                        ; DW_AT_artificial
	.byte	36                              ; Abbrev [36] 0x681:0xd DW_TAG_formal_parameter
	.byte	1                               ; DW_AT_location
	.byte	82
	.long	2199                            ; DW_AT_name
	.byte	1                               ; DW_AT_decl_file
	.byte	151                             ; DW_AT_decl_line
	.long	2224                            ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	34                              ; Abbrev [34] 0x68f:0x3d DW_TAG_subprogram
	.quad	Lfunc_begin7                    ; DW_AT_low_pc
.set Lset183, Lfunc_end7-Lfunc_begin7   ; DW_AT_high_pc
	.long	Lset183
                                        ; DW_AT_APPLE_omit_frame_ptr
	.byte	1                               ; DW_AT_frame_base
	.byte	111
	.long	1704                            ; DW_AT_object_pointer
                                        ; DW_AT_call_all_calls
	.long	1281                            ; DW_AT_name
	.byte	1                               ; DW_AT_decl_file
	.byte	156                             ; DW_AT_decl_line
                                        ; DW_AT_prototyped
                                        ; DW_AT_APPLE_optimized
	.byte	35                              ; Abbrev [35] 0x6a8:0xb DW_TAG_formal_parameter
	.byte	1                               ; DW_AT_location
	.byte	80
	.long	2171                            ; DW_AT_name
	.long	2193                            ; DW_AT_type
                                        ; DW_AT_artificial
	.byte	35                              ; Abbrev [35] 0x6b3:0xb DW_TAG_formal_parameter
	.byte	1                               ; DW_AT_location
	.byte	81
	.long	2176                            ; DW_AT_name
	.long	2203                            ; DW_AT_type
                                        ; DW_AT_artificial
	.byte	36                              ; Abbrev [36] 0x6be:0xd DW_TAG_formal_parameter
	.byte	1                               ; DW_AT_location
	.byte	82
	.long	2199                            ; DW_AT_name
	.byte	1                               ; DW_AT_decl_file
	.byte	156                             ; DW_AT_decl_line
	.long	2224                            ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	34                              ; Abbrev [34] 0x6cc:0x3d DW_TAG_subprogram
	.quad	Lfunc_begin8                    ; DW_AT_low_pc
.set Lset184, Lfunc_end8-Lfunc_begin8   ; DW_AT_high_pc
	.long	Lset184
                                        ; DW_AT_APPLE_omit_frame_ptr
	.byte	1                               ; DW_AT_frame_base
	.byte	111
	.long	1765                            ; DW_AT_object_pointer
                                        ; DW_AT_call_all_calls
	.long	1352                            ; DW_AT_name
	.byte	1                               ; DW_AT_decl_file
	.byte	161                             ; DW_AT_decl_line
                                        ; DW_AT_prototyped
                                        ; DW_AT_APPLE_optimized
	.byte	35                              ; Abbrev [35] 0x6e5:0xb DW_TAG_formal_parameter
	.byte	1                               ; DW_AT_location
	.byte	80
	.long	2171                            ; DW_AT_name
	.long	2193                            ; DW_AT_type
                                        ; DW_AT_artificial
	.byte	35                              ; Abbrev [35] 0x6f0:0xb DW_TAG_formal_parameter
	.byte	1                               ; DW_AT_location
	.byte	81
	.long	2176                            ; DW_AT_name
	.long	2203                            ; DW_AT_type
                                        ; DW_AT_artificial
	.byte	36                              ; Abbrev [36] 0x6fb:0xd DW_TAG_formal_parameter
	.byte	1                               ; DW_AT_location
	.byte	82
	.long	2199                            ; DW_AT_name
	.byte	1                               ; DW_AT_decl_file
	.byte	161                             ; DW_AT_decl_line
	.long	2224                            ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	37                              ; Abbrev [37] 0x709:0x36 DW_TAG_subprogram
	.quad	Lfunc_begin9                    ; DW_AT_low_pc
.set Lset185, Lfunc_end9-Lfunc_begin9   ; DW_AT_high_pc
	.long	Lset185
                                        ; DW_AT_APPLE_omit_frame_ptr
	.byte	1                               ; DW_AT_frame_base
	.byte	111
	.long	1830                            ; DW_AT_object_pointer
                                        ; DW_AT_call_all_calls
	.long	1419                            ; DW_AT_name
	.byte	2                               ; DW_AT_decl_file
	.byte	5                               ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.long	188                             ; DW_AT_type
                                        ; DW_AT_artificial
                                        ; DW_AT_APPLE_optimized
	.byte	33                              ; Abbrev [33] 0x726:0xd DW_TAG_formal_parameter
.set Lset186, Ldebug_loc24-Lsection_debug_loc ; DW_AT_location
	.long	Lset186
	.long	2171                            ; DW_AT_name
	.long	2193                            ; DW_AT_type
                                        ; DW_AT_artificial
	.byte	35                              ; Abbrev [35] 0x733:0xb DW_TAG_formal_parameter
	.byte	1                               ; DW_AT_location
	.byte	81
	.long	2176                            ; DW_AT_name
	.long	2203                            ; DW_AT_type
                                        ; DW_AT_artificial
	.byte	0                               ; End Of Children Mark
	.byte	38                              ; Abbrev [38] 0x73f:0x41 DW_TAG_subprogram
	.quad	Lfunc_begin10                   ; DW_AT_low_pc
.set Lset187, Lfunc_end10-Lfunc_begin10 ; DW_AT_high_pc
	.long	Lset187
                                        ; DW_AT_APPLE_omit_frame_ptr
	.byte	1                               ; DW_AT_frame_base
	.byte	111
	.long	1880                            ; DW_AT_object_pointer
                                        ; DW_AT_call_all_calls
	.long	1441                            ; DW_AT_name
	.byte	2                               ; DW_AT_decl_file
	.byte	5                               ; DW_AT_decl_line
                                        ; DW_AT_prototyped
                                        ; DW_AT_artificial
                                        ; DW_AT_APPLE_optimized
	.byte	33                              ; Abbrev [33] 0x758:0xd DW_TAG_formal_parameter
.set Lset188, Ldebug_loc25-Lsection_debug_loc ; DW_AT_location
	.long	Lset188
	.long	2171                            ; DW_AT_name
	.long	2193                            ; DW_AT_type
                                        ; DW_AT_artificial
	.byte	33                              ; Abbrev [33] 0x765:0xd DW_TAG_formal_parameter
.set Lset189, Ldebug_loc26-Lsection_debug_loc ; DW_AT_location
	.long	Lset189
	.long	2176                            ; DW_AT_name
	.long	2203                            ; DW_AT_type
                                        ; DW_AT_artificial
	.byte	39                              ; Abbrev [39] 0x772:0xd DW_TAG_formal_parameter
.set Lset190, Ldebug_loc27-Lsection_debug_loc ; DW_AT_location
	.long	Lset190
	.long	548                             ; DW_AT_name
	.long	188                             ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	38                              ; Abbrev [38] 0x780:0x34 DW_TAG_subprogram
	.quad	Lfunc_begin11                   ; DW_AT_low_pc
.set Lset191, Lfunc_end11-Lfunc_begin11 ; DW_AT_high_pc
	.long	Lset191
                                        ; DW_AT_APPLE_omit_frame_ptr
	.byte	1                               ; DW_AT_frame_base
	.byte	111
	.long	1945                            ; DW_AT_object_pointer
                                        ; DW_AT_call_all_calls
	.long	1478                            ; DW_AT_name
	.byte	1                               ; DW_AT_decl_file
	.byte	12                              ; DW_AT_decl_line
                                        ; DW_AT_prototyped
                                        ; DW_AT_artificial
                                        ; DW_AT_APPLE_optimized
	.byte	33                              ; Abbrev [33] 0x799:0xd DW_TAG_formal_parameter
.set Lset192, Ldebug_loc28-Lsection_debug_loc ; DW_AT_location
	.long	Lset192
	.long	2171                            ; DW_AT_name
	.long	2193                            ; DW_AT_type
                                        ; DW_AT_artificial
	.byte	33                              ; Abbrev [33] 0x7a6:0xd DW_TAG_formal_parameter
.set Lset193, Ldebug_loc29-Lsection_debug_loc ; DW_AT_location
	.long	Lset193
	.long	2176                            ; DW_AT_name
	.long	2203                            ; DW_AT_type
                                        ; DW_AT_artificial
	.byte	0                               ; End Of Children Mark
	.byte	40                              ; Abbrev [40] 0x7b4:0x17 DW_TAG_subprogram
	.quad	Lfunc_begin15                   ; DW_AT_low_pc
.set Lset194, Lfunc_end15-Lfunc_begin15 ; DW_AT_high_pc
	.long	Lset194
                                        ; DW_AT_APPLE_omit_frame_ptr
	.byte	1                               ; DW_AT_frame_base
	.byte	109
	.long	1595                            ; DW_AT_linkage_name
	.long	1575                            ; DW_AT_name
                                        ; DW_AT_artificial
                                        ; DW_AT_external
                                        ; DW_AT_APPLE_optimized
	.byte	10                              ; Abbrev [10] 0x7cb:0x23 DW_TAG_module
	.long	1616                            ; DW_AT_name
	.long	325                             ; DW_AT_LLVM_config_macros
	.long	1627                            ; DW_AT_LLVM_include_path
	.byte	11                              ; Abbrev [11] 0x7d8:0x15 DW_TAG_module
	.long	1752                            ; DW_AT_name
	.long	325                             ; DW_AT_LLVM_config_macros
	.byte	5                               ; Abbrev [5] 0x7e1:0xb DW_TAG_typedef
	.long	1356                            ; DW_AT_type
	.long	1757                            ; DW_AT_name
	.byte	6                               ; DW_AT_decl_file
	.byte	78                              ; DW_AT_decl_line
	.byte	0                               ; End Of Children Mark
	.byte	0                               ; End Of Children Mark
	.byte	41                              ; Abbrev [41] 0x7ee:0xc DW_TAG_array_type
	.long	57                              ; DW_AT_type
	.byte	42                              ; Abbrev [42] 0x7f3:0x6 DW_TAG_subrange_type
	.long	2042                            ; DW_AT_type
	.byte	2                               ; DW_AT_count
	.byte	0                               ; End Of Children Mark
	.byte	43                              ; Abbrev [43] 0x7fa:0x7 DW_TAG_base_type
	.long	1772                            ; DW_AT_name
	.byte	8                               ; DW_AT_byte_size
	.byte	7                               ; DW_AT_encoding
	.byte	10                              ; Abbrev [10] 0x801:0x74 DW_TAG_module
	.long	1796                            ; DW_AT_name
	.long	325                             ; DW_AT_LLVM_config_macros
	.long	1803                            ; DW_AT_LLVM_include_path
	.byte	10                              ; Abbrev [10] 0x80e:0x3f DW_TAG_module
	.long	1923                            ; DW_AT_name
	.long	325                             ; DW_AT_LLVM_config_macros
	.long	1803                            ; DW_AT_LLVM_include_path
	.byte	10                              ; Abbrev [10] 0x81b:0x31 DW_TAG_module
	.long	1929                            ; DW_AT_name
	.long	325                             ; DW_AT_LLVM_config_macros
	.long	1803                            ; DW_AT_LLVM_include_path
	.byte	10                              ; Abbrev [10] 0x828:0x23 DW_TAG_module
	.long	1933                            ; DW_AT_name
	.long	325                             ; DW_AT_LLVM_config_macros
	.long	1803                            ; DW_AT_LLVM_include_path
	.byte	11                              ; Abbrev [11] 0x835:0x15 DW_TAG_module
	.long	1939                            ; DW_AT_name
	.long	325                             ; DW_AT_LLVM_config_macros
	.byte	5                               ; Abbrev [5] 0x83e:0xb DW_TAG_typedef
	.long	2151                            ; DW_AT_type
	.long	1948                            ; DW_AT_name
	.byte	8                               ; DW_AT_decl_file
	.byte	31                              ; DW_AT_decl_line
	.byte	0                               ; End Of Children Mark
	.byte	0                               ; End Of Children Mark
	.byte	0                               ; End Of Children Mark
	.byte	0                               ; End Of Children Mark
	.byte	10                              ; Abbrev [10] 0x84d:0x27 DW_TAG_module
	.long	1956                            ; DW_AT_name
	.long	325                             ; DW_AT_LLVM_config_macros
	.long	1803                            ; DW_AT_LLVM_include_path
	.byte	10                              ; Abbrev [10] 0x85a:0x19 DW_TAG_module
	.long	1964                            ; DW_AT_name
	.long	325                             ; DW_AT_LLVM_config_macros
	.long	1803                            ; DW_AT_LLVM_include_path
	.byte	5                               ; Abbrev [5] 0x867:0xb DW_TAG_typedef
	.long	405                             ; DW_AT_type
	.long	1971                            ; DW_AT_name
	.byte	7                               ; DW_AT_decl_file
	.byte	97                              ; DW_AT_decl_line
	.byte	0                               ; End Of Children Mark
	.byte	0                               ; End Of Children Mark
	.byte	0                               ; End Of Children Mark
	.byte	3                               ; Abbrev [3] 0x875:0x5 DW_TAG_pointer_type
	.long	1319                            ; DW_AT_type
	.byte	5                               ; Abbrev [5] 0x87a:0xb DW_TAG_typedef
	.long	2181                            ; DW_AT_type
	.long	2080                            ; DW_AT_name
	.byte	1                               ; DW_AT_decl_file
	.byte	4                               ; DW_AT_decl_line
	.byte	4                               ; Abbrev [4] 0x885:0x7 DW_TAG_base_type
	.long	2083                            ; DW_AT_name
	.byte	8                               ; DW_AT_encoding
	.byte	1                               ; DW_AT_byte_size
	.byte	3                               ; Abbrev [3] 0x88c:0x5 DW_TAG_pointer_type
	.long	1334                            ; DW_AT_type
	.byte	31                              ; Abbrev [31] 0x891:0x5 DW_TAG_const_type
	.long	2198                            ; DW_AT_type
	.byte	3                               ; Abbrev [3] 0x896:0x5 DW_TAG_pointer_type
	.long	87                              ; DW_AT_type
	.byte	5                               ; Abbrev [5] 0x89b:0xb DW_TAG_typedef
	.long	2214                            ; DW_AT_type
	.long	2181                            ; DW_AT_name
	.byte	9                               ; DW_AT_decl_file
	.byte	128                             ; DW_AT_decl_line
	.byte	3                               ; Abbrev [3] 0x8a6:0x5 DW_TAG_pointer_type
	.long	2219                            ; DW_AT_type
	.byte	12                              ; Abbrev [12] 0x8ab:0x5 DW_TAG_structure_type
	.long	2185                            ; DW_AT_name
                                        ; DW_AT_declaration
	.byte	3                               ; Abbrev [3] 0x8b0:0x5 DW_TAG_pointer_type
	.long	181                             ; DW_AT_type
	.byte	3                               ; Abbrev [3] 0x8b5:0x5 DW_TAG_pointer_type
	.long	1349                            ; DW_AT_type
	.byte	0                               ; End Of Children Mark
Ldebug_info_end0:
Lcu_begin1:
.set Lset195, Ldebug_info_end1-Ldebug_info_start1 ; Length of Unit
	.long	Lset195
Ldebug_info_start1:
	.short	4                               ; DWARF version number
.set Lset196, Lsection_abbrev-Lsection_abbrev ; Offset Into Abbrev. Section
	.long	Lset196
	.byte	8                               ; Address Size (in bytes)
	.byte	44                              ; Abbrev [44] 0xb:0x1f DW_TAG_compile_unit
	.long	0                               ; DW_AT_producer
	.short	16                              ; DW_AT_language
	.long	319                             ; DW_AT_name
.set Lset197, Lline_table_start0-Lsection_line ; DW_AT_stmt_list
	.long	Lset197
	.long	241                             ; DW_AT_comp_dir
	.quad	-5836889099752621976            ; DW_AT_GNU_dwo_id
	.long	2252                            ; DW_AT_GNU_dwo_name
Ldebug_info_end1:
Lcu_begin2:
.set Lset198, Ldebug_info_end2-Ldebug_info_start2 ; Length of Unit
	.long	Lset198
Ldebug_info_start2:
	.short	4                               ; DWARF version number
.set Lset199, Lsection_abbrev-Lsection_abbrev ; Offset Into Abbrev. Section
	.long	Lset199
	.byte	8                               ; Address Size (in bytes)
	.byte	44                              ; Abbrev [44] 0xb:0x1f DW_TAG_compile_unit
	.long	0                               ; DW_AT_producer
	.short	16                              ; DW_AT_language
	.long	1796                            ; DW_AT_name
.set Lset200, Lline_table_start0-Lsection_line ; DW_AT_stmt_list
	.long	Lset200
	.long	241                             ; DW_AT_comp_dir
	.quad	-1597493309797131722            ; DW_AT_GNU_dwo_id
	.long	2355                            ; DW_AT_GNU_dwo_name
Ldebug_info_end2:
Lcu_begin3:
.set Lset201, Ldebug_info_end3-Ldebug_info_start3 ; Length of Unit
	.long	Lset201
Ldebug_info_start3:
	.short	4                               ; DWARF version number
.set Lset202, Lsection_abbrev-Lsection_abbrev ; Offset Into Abbrev. Section
	.long	Lset202
	.byte	8                               ; Address Size (in bytes)
	.byte	44                              ; Abbrev [44] 0xb:0x1f DW_TAG_compile_unit
	.long	0                               ; DW_AT_producer
	.short	16                              ; DW_AT_language
	.long	700                             ; DW_AT_name
.set Lset203, Lline_table_start0-Lsection_line ; DW_AT_stmt_list
	.long	Lset203
	.long	241                             ; DW_AT_comp_dir
	.quad	-7665677669957030275            ; DW_AT_GNU_dwo_id
	.long	2460                            ; DW_AT_GNU_dwo_name
Ldebug_info_end3:
Lcu_begin4:
.set Lset204, Ldebug_info_end4-Ldebug_info_start4 ; Length of Unit
	.long	Lset204
Ldebug_info_start4:
	.short	4                               ; DWARF version number
.set Lset205, Lsection_abbrev-Lsection_abbrev ; Offset Into Abbrev. Section
	.long	Lset205
	.byte	8                               ; Address Size (in bytes)
	.byte	44                              ; Abbrev [44] 0xb:0x1f DW_TAG_compile_unit
	.long	0                               ; DW_AT_producer
	.short	16                              ; DW_AT_language
	.long	1616                            ; DW_AT_name
.set Lset206, Lline_table_start0-Lsection_line ; DW_AT_stmt_list
	.long	Lset206
	.long	241                             ; DW_AT_comp_dir
	.quad	1136974410939626032             ; DW_AT_GNU_dwo_id
	.long	2568                            ; DW_AT_GNU_dwo_name
Ldebug_info_end4:
	.section	__DWARF,__debug_str,regular,debug
Linfo_string:
	.asciz	"Apple clang version 13.0.0 (clang-1300.0.18.6)" ; string offset=0
	.asciz	"dyld_inspector/dyld_inspector/AppDelegate.m" ; string offset=47
	.asciz	"/Applications/Xcode-beta.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS15.0.sdk" ; string offset=116
	.asciz	"iPhoneOS15.0.sdk"              ; string offset=224
	.asciz	"dyld_inspector" ; string offset=241
	.asciz	"int"                           ; string offset=281
	.asciz	"u64"                           ; string offset=285
	.asciz	"long unsigned int"             ; string offset=289
	.asciz	"AppDelegate"                   ; string offset=307
	.asciz	"UIKit"                         ; string offset=319
	.asciz	"\"-DNS_BLOCK_ASSERTIONS=1\" \"-DOBJC_OLD_DISPATCH_PROTOTYPES=0\"" ; string offset=325
	.asciz	"/Applications/Xcode-beta.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS15.0.sdk/System/Library/Frameworks/UIKit.framework" ; string offset=386
	.asciz	"UIResponder"                   ; string offset=536
	.asciz	"window"                        ; string offset=548
	.asciz	"UIWindow"                      ; string offset=555
	.asciz	"_window"                       ; string offset=564
	.asciz	"isReadable"                    ; string offset=572
	.asciz	"pipe"                          ; string offset=583
	.asciz	"_write"                        ; string offset=588
	.asciz	"write"                         ; string offset=595
	.asciz	"long int"                      ; string offset=601
	.asciz	"_close"                        ; string offset=610
	.asciz	"close"                         ; string offset=617
	.asciz	"isWritable"                    ; string offset=623
	.asciz	"_read"                         ; string offset=634
	.asciz	"read"                          ; string offset=640
	.asciz	"inspectSharedCache"            ; string offset=645
	.asciz	"NSSearchPathForDirectoriesInDomains" ; string offset=664
	.asciz	"Foundation"                    ; string offset=700
	.asciz	"/Applications/Xcode-beta.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS15.0.sdk/System/Library/Frameworks/Foundation.framework" ; string offset=711
	.asciz	"NSArray"                       ; string offset=866
	.asciz	"NSPathUtilities"               ; string offset=874
	.asciz	"NSSearchPathDirectory"         ; string offset=890
	.asciz	"NSSearchPathDomainMask"        ; string offset=912
	.asciz	"_Bool"                         ; string offset=935
	.asciz	"puts"                          ; string offset=941
	.asciz	"char"                          ; string offset=946
	.asciz	"-[AppDelegate application:didFinishLaunchingWithOptions:]" ; string offset=951
	.asciz	"application:didFinishLaunchingWithOptions:" ; string offset=1009
	.asciz	"-[AppDelegate applicationWillResignActive:]" ; string offset=1052
	.asciz	"applicationWillResignActive:"  ; string offset=1096
	.asciz	"-[AppDelegate applicationDidEnterBackground:]" ; string offset=1125
	.asciz	"applicationDidEnterBackground:" ; string offset=1171
	.asciz	"-[AppDelegate applicationWillEnterForeground:]" ; string offset=1202
	.asciz	"applicationWillEnterForeground:" ; string offset=1249
	.asciz	"-[AppDelegate applicationDidBecomeActive:]" ; string offset=1281
	.asciz	"applicationDidBecomeActive:"   ; string offset=1324
	.asciz	"-[AppDelegate applicationWillTerminate:]" ; string offset=1352
	.asciz	"applicationWillTerminate:"     ; string offset=1393
	.asciz	"-[AppDelegate window]"         ; string offset=1419
	.asciz	"-[AppDelegate setWindow:]"     ; string offset=1441
	.asciz	"setWindow:"                    ; string offset=1467
	.asciz	"-[AppDelegate .cxx_destruct]"  ; string offset=1478
	.asciz	".cxx_destruct"                 ; string offset=1507
	.asciz	"isReadable.cold.1"             ; string offset=1521
	.asciz	"isWritable.cold.1"             ; string offset=1539
	.asciz	"isWritable.cold.2"             ; string offset=1557
	.asciz	"OUTLINED_FUNCTION_0"           ; string offset=1575
	.asciz	"_OUTLINED_FUNCTION_0"          ; string offset=1595
	.asciz	"ObjectiveC"                    ; string offset=1616
	.asciz	"/Applications/Xcode-beta.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS15.0.sdk/usr/include/objc" ; string offset=1627
	.asciz	"objc"                          ; string offset=1752
	.asciz	"BOOL"                          ; string offset=1757
	.asciz	"addr"                          ; string offset=1762
	.asciz	"pfds"                          ; string offset=1767
	.asciz	"__ARRAY_SIZE_TYPE__"           ; string offset=1772
	.asciz	"ret"                           ; string offset=1792
	.asciz	"Darwin"                        ; string offset=1796
	.asciz	"/Applications/Xcode-beta.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS15.0.sdk/usr/include" ; string offset=1803
	.asciz	"POSIX"                         ; string offset=1923
	.asciz	"sys"                           ; string offset=1929
	.asciz	"types"                         ; string offset=1933
	.asciz	"_ssize_t"                      ; string offset=1939
	.asciz	"ssize_t"                       ; string offset=1948
	.asciz	"machine"                       ; string offset=1956
	.asciz	"_types"                        ; string offset=1964
	.asciz	"__darwin_ssize_t"              ; string offset=1971
	.asciz	"v"                             ; string offset=1988
	.asciz	"end"                           ; string offset=1990
	.asciz	"start"                         ; string offset=1994
	.asciz	"writable_start"                ; string offset=2000
	.asciz	"zeroMap"                       ; string offset=2015
	.asciz	"NSData"                        ; string offset=2023
	.asciz	"NSMutableData"                 ; string offset=2030
	.asciz	"taggetPtrMap"                  ; string offset=2044
	.asciz	"pointerMap"                    ; string offset=2057
	.asciz	"nullMapByte"                   ; string offset=2068
	.asciz	"u8"                            ; string offset=2080
	.asciz	"unsigned char"                 ; string offset=2083
	.asciz	"taggedPtrByte"                 ; string offset=2097
	.asciz	"ptrByte"                       ; string offset=2111
	.asciz	"val"                           ; string offset=2119
	.asciz	"shift"                         ; string offset=2123
	.asciz	"paths"                         ; string offset=2129
	.asciz	"documentsDirectory"            ; string offset=2135
	.asciz	"NSString"                      ; string offset=2154
	.asciz	"appFile"                       ; string offset=2163
	.asciz	"self"                          ; string offset=2171
	.asciz	"_cmd"                          ; string offset=2176
	.asciz	"SEL"                           ; string offset=2181
	.asciz	"objc_selector"                 ; string offset=2185
	.asciz	"application"                   ; string offset=2199
	.asciz	"UIApplication"                 ; string offset=2211
	.asciz	"launchOptions"                 ; string offset=2225
	.asciz	"NSDictionary"                  ; string offset=2239
	.asciz	"/Users/xss/Library/Developer/Xcode/DerivedData/ModuleCache.noindex/I8FNLJ07N6BH/UIKit-OSM5NRTS4BZR.pcm" ; string offset=2252
	.asciz	"/Users/xss/Library/Developer/Xcode/DerivedData/ModuleCache.noindex/I8FNLJ07N6BH/Darwin-1GH2Y1GXC3QXG.pcm" ; string offset=2355
	.asciz	"/Users/xss/Library/Developer/Xcode/DerivedData/ModuleCache.noindex/I8FNLJ07N6BH/Foundation-29B9L6YRR52B.pcm" ; string offset=2460
	.asciz	"/Users/xss/Library/Developer/Xcode/DerivedData/ModuleCache.noindex/I8FNLJ07N6BH/ObjectiveC-1Y6PZ5BBJ5WMO.pcm" ; string offset=2568
	.section	__DWARF,__apple_names,regular,debug
Lnames_begin:
	.long	1212240712                      ; Header Magic
	.short	1                               ; Header Version
	.short	0                               ; Header Hash Function
	.long	13                              ; Header Bucket Count
	.long	26                              ; Header Hash Count
	.long	12                              ; Header Data Length
	.long	0                               ; HeaderData Die Offset Base
	.long	1                               ; HeaderData Atom Count
	.short	1                               ; DW_ATOM_die_offset
	.short	6                               ; DW_FORM_data4
	.long	0                               ; Bucket 0
	.long	2                               ; Bucket 1
	.long	3                               ; Bucket 2
	.long	6                               ; Bucket 3
	.long	8                               ; Bucket 4
	.long	9                               ; Bucket 5
	.long	11                              ; Bucket 6
	.long	14                              ; Bucket 7
	.long	16                              ; Bucket 8
	.long	19                              ; Bucket 9
	.long	20                              ; Bucket 10
	.long	-1                              ; Bucket 11
	.long	24                              ; Bucket 12
	.long	-2117961595                     ; Hash in Bucket 0
	.long	-700934659                      ; Hash in Bucket 0
	.long	1080302848                      ; Hash in Bucket 1
	.long	153172112                       ; Hash in Bucket 2
	.long	658974929                       ; Hash in Bucket 2
	.long	-778392154                      ; Hash in Bucket 2
	.long	-2073608543                     ; Hash in Bucket 3
	.long	-224116704                      ; Hash in Bucket 3
	.long	980971268                       ; Hash in Bucket 4
	.long	184445084                       ; Hash in Bucket 5
	.long	496638836                       ; Hash in Bucket 5
	.long	-2139545931                     ; Hash in Bucket 6
	.long	-1480376316                     ; Hash in Bucket 6
	.long	-35057389                       ; Hash in Bucket 6
	.long	793882915                       ; Hash in Bucket 7
	.long	983051947                       ; Hash in Bucket 7
	.long	1310847299                      ; Hash in Bucket 8
	.long	1854061698                      ; Hash in Bucket 8
	.long	-1055902693                     ; Hash in Bucket 8
	.long	-46509814                       ; Hash in Bucket 9
	.long	622788189                       ; Hash in Bucket 10
	.long	1584888588                      ; Hash in Bucket 10
	.long	-635959505                      ; Hash in Bucket 10
	.long	-46509813                       ; Hash in Bucket 10
	.long	422206004                       ; Hash in Bucket 12
	.long	-881671554                      ; Hash in Bucket 12
.set Lset207, LNames0-Lnames_begin      ; Offset in Bucket 0
	.long	Lset207
.set Lset208, LNames7-Lnames_begin      ; Offset in Bucket 0
	.long	Lset208
.set Lset209, LNames10-Lnames_begin     ; Offset in Bucket 1
	.long	Lset209
.set Lset210, LNames20-Lnames_begin     ; Offset in Bucket 2
	.long	Lset210
.set Lset211, LNames3-Lnames_begin      ; Offset in Bucket 2
	.long	Lset211
.set Lset212, LNames15-Lnames_begin     ; Offset in Bucket 2
	.long	Lset212
.set Lset213, LNames24-Lnames_begin     ; Offset in Bucket 3
	.long	Lset213
.set Lset214, LNames11-Lnames_begin     ; Offset in Bucket 3
	.long	Lset214
.set Lset215, LNames14-Lnames_begin     ; Offset in Bucket 4
	.long	Lset215
.set Lset216, LNames6-Lnames_begin      ; Offset in Bucket 5
	.long	Lset216
.set Lset217, LNames22-Lnames_begin     ; Offset in Bucket 5
	.long	Lset217
.set Lset218, LNames23-Lnames_begin     ; Offset in Bucket 6
	.long	Lset218
.set Lset219, LNames13-Lnames_begin     ; Offset in Bucket 6
	.long	Lset219
.set Lset220, LNames21-Lnames_begin     ; Offset in Bucket 6
	.long	Lset220
.set Lset221, LNames12-Lnames_begin     ; Offset in Bucket 7
	.long	Lset221
.set Lset222, LNames1-Lnames_begin      ; Offset in Bucket 7
	.long	Lset222
.set Lset223, LNames16-Lnames_begin     ; Offset in Bucket 8
	.long	Lset223
.set Lset224, LNames25-Lnames_begin     ; Offset in Bucket 8
	.long	Lset224
.set Lset225, LNames5-Lnames_begin      ; Offset in Bucket 8
	.long	Lset225
.set Lset226, LNames17-Lnames_begin     ; Offset in Bucket 9
	.long	Lset226
.set Lset227, LNames8-Lnames_begin      ; Offset in Bucket 10
	.long	Lset227
.set Lset228, LNames2-Lnames_begin      ; Offset in Bucket 10
	.long	Lset228
.set Lset229, LNames19-Lnames_begin     ; Offset in Bucket 10
	.long	Lset229
.set Lset230, LNames18-Lnames_begin     ; Offset in Bucket 10
	.long	Lset230
.set Lset231, LNames4-Lnames_begin      ; Offset in Bucket 12
	.long	Lset231
.set Lset232, LNames9-Lnames_begin      ; Offset in Bucket 12
	.long	Lset232
LNames0:
	.long	1202                            ; -[AppDelegate applicationWillEnterForeground:]
	.long	1                               ; Num DIEs
	.long	1618
	.long	0
LNames7:
	.long	1575                            ; OUTLINED_FUNCTION_0
	.long	1                               ; Num DIEs
	.long	1972
	.long	0
LNames10:
	.long	1521                            ; isReadable.cold.1
	.long	1                               ; Num DIEs
	.long	440
	.long	0
LNames20:
	.long	1052                            ; -[AppDelegate applicationWillResignActive:]
	.long	1                               ; Num DIEs
	.long	1496
	.long	0
LNames3:
	.long	572                             ; isReadable
	.long	1                               ; Num DIEs
	.long	200
	.long	0
LNames15:
	.long	645                             ; inspectSharedCache
	.long	1                               ; Num DIEs
	.long	769
	.long	0
LNames24:
	.long	951                             ; -[AppDelegate application:didFinishLaunchingWithOptions:]
	.long	1                               ; Num DIEs
	.long	1397
	.long	0
LNames11:
	.long	1009                            ; application:didFinishLaunchingWithOptions:
	.long	1                               ; Num DIEs
	.long	1397
	.long	0
LNames14:
	.long	1249                            ; applicationWillEnterForeground:
	.long	1                               ; Num DIEs
	.long	1618
	.long	0
LNames6:
	.long	1595                            ; _OUTLINED_FUNCTION_0
	.long	1                               ; Num DIEs
	.long	1972
	.long	0
LNames22:
	.long	1478                            ; -[AppDelegate .cxx_destruct]
	.long	1                               ; Num DIEs
	.long	1920
	.long	0
LNames23:
	.long	1352                            ; -[AppDelegate applicationWillTerminate:]
	.long	1                               ; Num DIEs
	.long	1740
	.long	0
LNames13:
	.long	1441                            ; -[AppDelegate setWindow:]
	.long	1                               ; Num DIEs
	.long	1855
	.long	0
LNames21:
	.long	1507                            ; .cxx_destruct
	.long	1                               ; Num DIEs
	.long	1920
	.long	0
LNames12:
	.long	1467                            ; setWindow:
	.long	1                               ; Num DIEs
	.long	1855
	.long	0
LNames1:
	.long	1324                            ; applicationDidBecomeActive:
	.long	1                               ; Num DIEs
	.long	1679
	.long	0
LNames16:
	.long	1125                            ; -[AppDelegate applicationDidEnterBackground:]
	.long	1                               ; Num DIEs
	.long	1557
	.long	0
LNames25:
	.long	1171                            ; applicationDidEnterBackground:
	.long	1                               ; Num DIEs
	.long	1557
	.long	0
LNames5:
	.long	623                             ; isWritable
	.long	1                               ; Num DIEs
	.long	463
	.long	0
LNames17:
	.long	1539                            ; isWritable.cold.1
	.long	1                               ; Num DIEs
	.long	746
	.long	0
LNames8:
	.long	548                             ; window
	.long	1                               ; Num DIEs
	.long	1801
	.long	0
LNames2:
	.long	1281                            ; -[AppDelegate applicationDidBecomeActive:]
	.long	1                               ; Num DIEs
	.long	1679
	.long	0
LNames19:
	.long	1096                            ; applicationWillResignActive:
	.long	1                               ; Num DIEs
	.long	1496
	.long	0
LNames18:
	.long	1557                            ; isWritable.cold.2
	.long	1                               ; Num DIEs
	.long	723
	.long	0
LNames4:
	.long	1393                            ; applicationWillTerminate:
	.long	1                               ; Num DIEs
	.long	1740
	.long	0
LNames9:
	.long	1419                            ; -[AppDelegate window]
	.long	1                               ; Num DIEs
	.long	1801
	.long	0
	.section	__DWARF,__apple_objc,regular,debug
Lobjc_begin:
	.long	1212240712                      ; Header Magic
	.short	1                               ; Header Version
	.short	0                               ; Header Hash Function
	.long	1                               ; Header Bucket Count
	.long	1                               ; Header Hash Count
	.long	12                              ; Header Data Length
	.long	0                               ; HeaderData Die Offset Base
	.long	1                               ; HeaderData Atom Count
	.short	1                               ; DW_ATOM_die_offset
	.short	6                               ; DW_FORM_data4
	.long	0                               ; Bucket 0
	.long	-1501153791                     ; Hash in Bucket 0
.set Lset233, LObjC0-Lobjc_begin        ; Offset in Bucket 0
	.long	Lset233
LObjC0:
	.long	307                             ; AppDelegate
	.long	9                               ; Num DIEs
	.long	1397
	.long	1496
	.long	1557
	.long	1618
	.long	1679
	.long	1740
	.long	1801
	.long	1855
	.long	1920
	.long	0
	.section	__DWARF,__apple_namespac,regular,debug
Lnamespac_begin:
	.long	1212240712                      ; Header Magic
	.short	1                               ; Header Version
	.short	0                               ; Header Hash Function
	.long	1                               ; Header Bucket Count
	.long	0                               ; Header Hash Count
	.long	12                              ; Header Data Length
	.long	0                               ; HeaderData Die Offset Base
	.long	1                               ; HeaderData Atom Count
	.short	1                               ; DW_ATOM_die_offset
	.short	6                               ; DW_FORM_data4
	.long	-1                              ; Bucket 0
	.section	__DWARF,__apple_types,regular,debug
Ltypes_begin:
	.long	1212240712                      ; Header Magic
	.short	1                               ; Header Version
	.short	0                               ; Header Hash Function
	.long	14                              ; Header Bucket Count
	.long	14                              ; Header Hash Count
	.long	20                              ; Header Data Length
	.long	0                               ; HeaderData Die Offset Base
	.long	3                               ; HeaderData Atom Count
	.short	1                               ; DW_ATOM_die_offset
	.short	6                               ; DW_FORM_data4
	.short	3                               ; DW_ATOM_die_tag
	.short	5                               ; DW_FORM_data2
	.short	4                               ; DW_ATOM_type_flags
	.short	11                              ; DW_FORM_data1
	.long	0                               ; Bucket 0
	.long	1                               ; Bucket 1
	.long	-1                              ; Bucket 2
	.long	-1                              ; Bucket 3
	.long	2                               ; Bucket 4
	.long	4                               ; Bucket 5
	.long	5                               ; Bucket 6
	.long	7                               ; Bucket 7
	.long	8                               ; Bucket 8
	.long	-1                              ; Bucket 9
	.long	9                               ; Bucket 10
	.long	-1                              ; Bucket 11
	.long	-1                              ; Bucket 12
	.long	11                              ; Bucket 13
	.long	249311216                       ; Hash in Bucket 0
	.long	-594775205                      ; Hash in Bucket 1
	.long	-1407527450                     ; Hash in Bucket 4
	.long	-366049208                      ; Hash in Bucket 4
	.long	2090147939                      ; Hash in Bucket 5
	.long	-1880351968                     ; Hash in Bucket 6
	.long	-104093792                      ; Hash in Bucket 6
	.long	-1501153791                     ; Hash in Bucket 7
	.long	193506244                       ; Hash in Bucket 8
	.long	5863826                         ; Hash in Bucket 10
	.long	193495088                       ; Hash in Bucket 10
	.long	193469737                       ; Hash in Bucket 13
	.long	2088934161                      ; Hash in Bucket 13
	.long	-80380739                       ; Hash in Bucket 13
.set Lset234, Ltypes4-Ltypes_begin      ; Offset in Bucket 0
	.long	Lset234
.set Lset235, Ltypes8-Ltypes_begin      ; Offset in Bucket 1
	.long	Lset235
.set Lset236, Ltypes0-Ltypes_begin      ; Offset in Bucket 4
	.long	Lset236
.set Lset237, Ltypes1-Ltypes_begin      ; Offset in Bucket 4
	.long	Lset237
.set Lset238, Ltypes12-Ltypes_begin     ; Offset in Bucket 5
	.long	Lset238
.set Lset239, Ltypes3-Ltypes_begin      ; Offset in Bucket 6
	.long	Lset239
.set Lset240, Ltypes10-Ltypes_begin     ; Offset in Bucket 6
	.long	Lset240
.set Lset241, Ltypes11-Ltypes_begin     ; Offset in Bucket 7
	.long	Lset241
.set Lset242, Ltypes13-Ltypes_begin     ; Offset in Bucket 8
	.long	Lset242
.set Lset243, Ltypes6-Ltypes_begin      ; Offset in Bucket 10
	.long	Lset243
.set Lset244, Ltypes5-Ltypes_begin      ; Offset in Bucket 10
	.long	Lset244
.set Lset245, Ltypes2-Ltypes_begin      ; Offset in Bucket 13
	.long	Lset245
.set Lset246, Ltypes7-Ltypes_begin      ; Offset in Bucket 13
	.long	Lset246
.set Lset247, Ltypes9-Ltypes_begin      ; Offset in Bucket 13
	.long	Lset247
Ltypes4:
	.long	935                             ; _Bool
	.long	1                               ; Num DIEs
	.long	1356
	.short	36
	.byte	0
	.long	0
Ltypes8:
	.long	1772                            ; __ARRAY_SIZE_TYPE__
	.long	1                               ; Num DIEs
	.long	2042
	.short	36
	.byte	0
	.long	0
Ltypes0:
	.long	1948                            ; ssize_t
	.long	1                               ; Num DIEs
	.long	2110
	.short	22
	.byte	0
	.long	0
Ltypes1:
	.long	1971                            ; __darwin_ssize_t
	.long	1                               ; Num DIEs
	.long	2151
	.short	22
	.byte	0
	.long	0
Ltypes12:
	.long	946                             ; char
	.long	1                               ; Num DIEs
	.long	1390
	.short	36
	.byte	0
	.long	0
Ltypes3:
	.long	601                             ; long int
	.long	1                               ; Num DIEs
	.long	405
	.short	36
	.byte	0
	.long	0
Ltypes10:
	.long	2083                            ; unsigned char
	.long	1                               ; Num DIEs
	.long	2181
	.short	36
	.byte	0
	.long	0
Ltypes11:
	.long	307                             ; AppDelegate
	.long	1                               ; Num DIEs
	.long	87
	.short	19
	.byte	0
	.long	0
Ltypes13:
	.long	285                             ; u64
	.long	1                               ; Num DIEs
	.long	69
	.short	22
	.byte	0
	.long	0
Ltypes6:
	.long	2080                            ; u8
	.long	1                               ; Num DIEs
	.long	2170
	.short	22
	.byte	0
	.long	0
Ltypes5:
	.long	281                             ; int
	.long	1                               ; Num DIEs
	.long	57
	.short	36
	.byte	0
	.long	0
Ltypes2:
	.long	2181                            ; SEL
	.long	1                               ; Num DIEs
	.long	2203
	.short	22
	.byte	0
	.long	0
Ltypes7:
	.long	1757                            ; BOOL
	.long	1                               ; Num DIEs
	.long	2017
	.short	22
	.byte	0
	.long	0
Ltypes9:
	.long	289                             ; long unsigned int
	.long	1                               ; Num DIEs
	.long	80
	.short	36
	.byte	0
	.long	0
.subsections_via_symbols
	.section	__DWARF,__debug_line,regular,debug
Lsection_line:
Lline_table_start0:
