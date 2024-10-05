	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 11, 0	sdk_version 11, 3
	.ptrauth_abi_version 0
	.file	1 "/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/arm" "_types.h"
	.file	2 "/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys" "_types.h"
	.file	3 "/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_types" "_sigset_t.h"
	.file	4 "/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/_types" "_uint64_t.h"
	.globl	_main                           ; -- Begin function main
	.p2align	2
_main:                                  ; @main
Lfunc_begin0:
	.file	5 "/Users/xss/code" "sprr-srd.c"
	.loc	5 112 0                         ; sprr-srd.c:112:0
	.cfi_startproc
; %bb.0:
	pacibsp
	sub	sp, sp, #128                    ; =128
	stp	x29, x30, [sp, #112]            ; 16-byte Folded Spill
	add	x29, sp, #112                   ; =112
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	mov	x8, #0
                                        ; implicit-def: $x16
                                        ; implicit-def: $x17
Ltmp0:
	.loc	5 0 0 prologue_end              ; sprr-srd.c:0:0
	adrp	x16, _bus_handler@PAGE
	add	x16, x16, _bus_handler@PAGEOFF
	paciza	x16
	str	x16, [sp, #56]                  ; 8-byte Folded Spill
                                        ; implicit-def: $x16
                                        ; implicit-def: $x17
	adrp	x16, _sev_handler@PAGE
	add	x16, x16, _sev_handler@PAGEOFF
	paciza	x16
	stur	wzr, [x29, #-4]
	stur	w0, [x29, #-8]
	stur	x1, [x29, #-16]
	sub	x9, x29, #32                    ; =32
	mov	w10, #-1
	.loc	5 117 5                         ; sprr-srd.c:117:5
	stur	w10, [x29, #-24]
	ldr	x11, [sp, #56]                  ; 8-byte Folded Reload
	.loc	5 118 21                        ; sprr-srd.c:118:21
	stur	x11, [x29, #-32]
	mov	w12, #66
	.loc	5 119 17                        ; sprr-srd.c:119:17
	stur	w12, [x29, #-20]
	mov	w0, #10
	.loc	5 120 5                         ; sprr-srd.c:120:5
	mov	x1, x9
	mov	x13, #0
	mov	x2, x13
	str	x8, [sp, #48]                   ; 8-byte Folded Spill
	str	x16, [sp, #40]                  ; 8-byte Folded Spill
	str	x9, [sp, #32]                   ; 8-byte Folded Spill
	str	w10, [sp, #28]                  ; 4-byte Folded Spill
	str	x13, [sp, #16]                  ; 8-byte Folded Spill
	bl	_sigaction
	ldr	x8, [sp, #40]                   ; 8-byte Folded Reload
	.loc	5 121 21                        ; sprr-srd.c:121:21
	stur	x8, [x29, #-32]
	mov	w10, #11
	.loc	5 122 5                         ; sprr-srd.c:122:5
	mov	x0, x10
	ldr	x1, [sp, #32]                   ; 8-byte Folded Reload
	ldr	x2, [sp, #16]                   ; 8-byte Folded Reload
	bl	_sigaction
	ldr	x8, [sp, #16]                   ; 8-byte Folded Reload
	.loc	5 124 21                        ; sprr-srd.c:124:21
	mov	x0, x8
	mov	x1, #16384
	mov	w2, #7
	mov	w3, #6146
	ldr	w4, [sp, #28]                   ; 4-byte Folded Reload
	ldr	x5, [sp, #48]                   ; 8-byte Folded Reload
	bl	_mmap
	.loc	5 124 15 is_stmt 0              ; sprr-srd.c:124:15
	stur	x0, [x29, #-40]
	mov	x0, #3689348814741910323
	.loc	5 126 5 is_stmt 1               ; sprr-srd.c:126:5
	bl	_write_sprr_perm
	.loc	5 127 5                         ; sprr-srd.c:127:5
	ldur	x8, [x29, #-40]
	mov	w10, #960
	movk	w10, #54879, lsl #16
	.loc	5 127 12 is_stmt 0              ; sprr-srd.c:127:12
	str	w10, [x8]
Ltmp1:
	.loc	5 129 14 is_stmt 1              ; sprr-srd.c:129:14
	stur	wzr, [x29, #-44]
LBB0_1:                                 ; =>This Inner Loop Header: Depth=1
Ltmp2:
	.loc	5 129 21 is_stmt 0              ; sprr-srd.c:129:21
	ldur	w8, [x29, #-44]
Ltmp3:
	.loc	5 129 5                         ; sprr-srd.c:129:5
	cmp	w8, #4                          ; =4
	b.ge	LBB0_4
; %bb.2:                                ;   in Loop: Header=BB0_1 Depth=1
Ltmp4:
	.loc	5 130 19 is_stmt 1              ; sprr-srd.c:130:19
	ldur	x0, [x29, #-40]
	.loc	5 130 38 is_stmt 0              ; sprr-srd.c:130:38
	ldur	w8, [x29, #-44]
	.loc	5 130 24                        ; sprr-srd.c:130:24
	and	w8, w8, #0xff
	str	x0, [sp, #8]                    ; 8-byte Folded Spill
	mov	x0, x8
	bl	_make_sprr_val
	ldr	x9, [sp, #8]                    ; 8-byte Folded Reload
	str	x0, [sp]                        ; 8-byte Folded Spill
	.loc	5 130 9                         ; sprr-srd.c:130:9
	mov	x0, x9
	ldr	x1, [sp]                        ; 8-byte Folded Reload
	bl	_sprr_test
; %bb.3:                                ;   in Loop: Header=BB0_1 Depth=1
	.loc	5 129 28 is_stmt 1              ; sprr-srd.c:129:28
	ldur	w8, [x29, #-44]
	add	w8, w8, #1                      ; =1
	stur	w8, [x29, #-44]
	.loc	5 129 5 is_stmt 0               ; sprr-srd.c:129:5
	b	LBB0_1
Ltmp5:
LBB0_4:
	.loc	5 131 1 is_stmt 1               ; sprr-srd.c:131:1
	ldur	w0, [x29, #-4]
	ldp	x29, x30, [sp, #112]            ; 16-byte Folded Reload
	add	sp, sp, #128                    ; =128
	retab
Ltmp6:
Lfunc_end0:
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function bus_handler
_bus_handler:                           ; @bus_handler
Lfunc_begin1:
	.loc	5 29 0                          ; sprr-srd.c:29:0
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32                     ; =32
	.cfi_def_cfa_offset 32
	str	w0, [sp, #28]
	str	x1, [sp, #16]
	str	x2, [sp, #8]
Ltmp8:
	.loc	5 32 22 prologue_end            ; sprr-srd.c:32:22
	ldr	x8, [sp, #8]
	.loc	5 32 17 is_stmt 0               ; sprr-srd.c:32:17
	str	x8, [sp]
	.loc	5 33 5 is_stmt 1                ; sprr-srd.c:33:5
	ldr	x8, [sp]
	.loc	5 33 9 is_stmt 0                ; sprr-srd.c:33:9
	ldr	x8, [x8, #48]
	mov	x9, #48879
	movk	x9, #57005, lsl #16
	.loc	5 33 34                         ; sprr-srd.c:33:34
	str	x9, [x8, #16]
	.loc	5 34 5 is_stmt 1                ; sprr-srd.c:34:5
	ldr	x8, [sp]
	.loc	5 34 9 is_stmt 0                ; sprr-srd.c:34:9
	ldr	x8, [x8, #48]
	.loc	5 34 39                         ; sprr-srd.c:34:39
	ldr	x9, [x8, #272]
	add	x9, x9, #4                      ; =4
	str	x9, [x8, #272]
	.loc	5 35 1 is_stmt 1                ; sprr-srd.c:35:1
	add	sp, sp, #32                     ; =32
	ret
Ltmp9:
Lfunc_end1:
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function sev_handler
_sev_handler:                           ; @sev_handler
Lfunc_begin2:
	.loc	5 20 0                          ; sprr-srd.c:20:0
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32                     ; =32
	.cfi_def_cfa_offset 32
	str	w0, [sp, #28]
	str	x1, [sp, #16]
	str	x2, [sp, #8]
Ltmp11:
	.loc	5 23 22 prologue_end            ; sprr-srd.c:23:22
	ldr	x8, [sp, #8]
	.loc	5 23 17 is_stmt 0               ; sprr-srd.c:23:17
	str	x8, [sp]
	.loc	5 24 5 is_stmt 1                ; sprr-srd.c:24:5
	ldr	x8, [sp]
	.loc	5 24 9 is_stmt 0                ; sprr-srd.c:24:9
	ldr	x8, [x8, #48]
	mov	x9, #48879
	movk	x9, #57005, lsl #16
	.loc	5 24 34                         ; sprr-srd.c:24:34
	str	x9, [x8, #16]
	.loc	5 25 41 is_stmt 1               ; sprr-srd.c:25:41
	ldr	x8, [sp]
	.loc	5 25 45 is_stmt 0               ; sprr-srd.c:25:45
	ldr	x8, [x8, #48]
	.loc	5 25 63                         ; sprr-srd.c:25:63
	ldr	x8, [x8, #256]
	.loc	5 25 5                          ; sprr-srd.c:25:5
	ldr	x9, [sp]
	.loc	5 25 9                          ; sprr-srd.c:25:9
	ldr	x9, [x9, #48]
	.loc	5 25 39                         ; sprr-srd.c:25:39
	str	x8, [x9, #272]
	.loc	5 26 1 is_stmt 1                ; sprr-srd.c:26:1
	add	sp, sp, #32                     ; =32
	ret
Ltmp12:
Lfunc_end2:
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function write_sprr_perm
_write_sprr_perm:                       ; @write_sprr_perm
Lfunc_begin3:
	.loc	5 38 0                          ; sprr-srd.c:38:0
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16                     ; =16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
Ltmp14:
	.loc	5 40 43 prologue_end            ; sprr-srd.c:40:43
	ldr	x8, [sp, #8]
	.loc	5 39 5                          ; sprr-srd.c:39:5
	; InlineAsm Start
	msr	S3_6_C15_C1_5, x8
	isb

	; InlineAsm End
	.loc	5 42 1                          ; sprr-srd.c:42:1
	add	sp, sp, #16                     ; =16
	ret
Ltmp15:
Lfunc_end3:
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function sprr_test
_sprr_test:                             ; @sprr_test
Lfunc_begin4:
	.loc	5 93 0                          ; sprr-srd.c:93:0
	.cfi_startproc
; %bb.0:
	pacibsp
	sub	sp, sp, #112                    ; =112
	stp	x29, x30, [sp, #96]             ; 16-byte Folded Spill
	add	x29, sp, #96                    ; =96
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	stur	x1, [x29, #-16]
Ltmp16:
	.loc	5 95 9 prologue_end             ; sprr-srd.c:95:9
	bl	_read_sprr_perm
	.loc	5 95 7 is_stmt 0                ; sprr-srd.c:95:7
	stur	x0, [x29, #-24]
	.loc	5 96 21 is_stmt 1               ; sprr-srd.c:96:21
	ldur	x0, [x29, #-16]
	.loc	5 96 5 is_stmt 0                ; sprr-srd.c:96:5
	bl	_write_sprr_perm
	.loc	5 97 9 is_stmt 1                ; sprr-srd.c:97:9
	bl	_read_sprr_perm
	.loc	5 97 7 is_stmt 0                ; sprr-srd.c:97:7
	stur	x0, [x29, #-32]
	.loc	5 99 30 is_stmt 1               ; sprr-srd.c:99:30
	ldur	x8, [x29, #-32]
	.loc	5 99 42 is_stmt 0               ; sprr-srd.c:99:42
	ldur	x0, [x29, #-8]
	stur	x8, [x29, #-40]                 ; 8-byte Folded Spill
	.loc	5 99 33                         ; sprr-srd.c:99:33
	bl	_can_read
	mov	w9, #45
	mov	w10, #114
	tst	w0, #0x1
	csel	w10, w10, w9, ne
	.loc	5 99 70                         ; sprr-srd.c:99:70
	ldur	x0, [x29, #-8]
	stur	w9, [x29, #-44]                 ; 4-byte Folded Spill
	str	w10, [sp, #48]                  ; 4-byte Folded Spill
	.loc	5 99 60                         ; sprr-srd.c:99:60
	bl	_can_write
	mov	w9, #119
	tst	w0, #0x1
	ldur	w10, [x29, #-44]                ; 4-byte Folded Reload
	csel	w9, w9, w10, ne
	.loc	5 100 21 is_stmt 1              ; sprr-srd.c:100:21
	ldur	x0, [x29, #-8]
	str	w9, [sp, #44]                   ; 4-byte Folded Spill
	.loc	5 100 12 is_stmt 0              ; sprr-srd.c:100:12
	bl	_can_exec
	mov	w9, #120
	tst	w0, #0x1
	ldur	w10, [x29, #-44]                ; 4-byte Folded Reload
	csel	w9, w9, w10, ne
	.loc	5 0 0                           ; sprr-srd.c:0:0
	adrp	x0, l_.str@PAGE
	add	x0, x0, l_.str@PAGEOFF
	.loc	5 99 5 is_stmt 1                ; sprr-srd.c:99:5
	mov	x8, sp
	ldur	x11, [x29, #-40]                ; 8-byte Folded Reload
	str	x11, [x8]
                                        ; implicit-def: $x1
	ldr	w12, [sp, #48]                  ; 4-byte Folded Reload
	mov	x1, x12
	str	x1, [x8, #8]
                                        ; implicit-def: $x1
	ldr	w13, [sp, #44]                  ; 4-byte Folded Reload
	mov	x1, x13
	str	x1, [x8, #16]
                                        ; implicit-def: $x1
	mov	x1, x9
	str	x1, [x8, #24]
	bl	_printf
	.loc	5 101 1                         ; sprr-srd.c:101:1
	ldp	x29, x30, [sp, #96]             ; 16-byte Folded Reload
	add	sp, sp, #112                    ; =112
	retab
Ltmp17:
Lfunc_end4:
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function make_sprr_val
_make_sprr_val:                         ; @make_sprr_val
Lfunc_begin5:
	.loc	5 104 0                         ; sprr-srd.c:104:0
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32                     ; =32
	.cfi_def_cfa_offset 32
	strb	w0, [sp, #31]
Ltmp19:
	.loc	5 105 14 prologue_end           ; sprr-srd.c:105:14
	str	xzr, [sp, #16]
Ltmp20:
	.loc	5 106 14                        ; sprr-srd.c:106:14
	str	wzr, [sp, #12]
LBB5_1:                                 ; =>This Inner Loop Header: Depth=1
Ltmp21:
	.loc	5 106 21 is_stmt 0              ; sprr-srd.c:106:21
	ldr	w8, [sp, #12]
Ltmp22:
	.loc	5 106 5                         ; sprr-srd.c:106:5
	cmp	w8, #16                         ; =16
	b.ge	LBB5_4
; %bb.2:                                ;   in Loop: Header=BB5_1 Depth=1
Ltmp23:
	.loc	5 107 27 is_stmt 1              ; sprr-srd.c:107:27
	ldrb	w8, [sp, #31]
	mov	x9, x8
	.loc	5 107 43 is_stmt 0              ; sprr-srd.c:107:43
	ldr	w8, [sp, #12]
	mov	w10, #4
	.loc	5 107 41                        ; sprr-srd.c:107:41
	mul	w8, w10, w8
	.loc	5 107 35                        ; sprr-srd.c:107:35
	mov	x11, x8
	lsl	x9, x9, x11
	.loc	5 107 13                        ; sprr-srd.c:107:13
	ldr	x11, [sp, #16]
	orr	x9, x11, x9
	str	x9, [sp, #16]
; %bb.3:                                ;   in Loop: Header=BB5_1 Depth=1
	.loc	5 106 29 is_stmt 1              ; sprr-srd.c:106:29
	ldr	w8, [sp, #12]
	add	w8, w8, #1                      ; =1
	str	w8, [sp, #12]
	.loc	5 106 5 is_stmt 0               ; sprr-srd.c:106:5
	b	LBB5_1
Ltmp24:
LBB5_4:
	.loc	5 108 12 is_stmt 1              ; sprr-srd.c:108:12
	ldr	x0, [sp, #16]
	.loc	5 108 5 is_stmt 0               ; sprr-srd.c:108:5
	add	sp, sp, #32                     ; =32
	ret
Ltmp25:
Lfunc_end5:
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function read_sprr_perm
_read_sprr_perm:                        ; @read_sprr_perm
Lfunc_begin6:
	.loc	5 45 0 is_stmt 1                ; sprr-srd.c:45:0
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16                     ; =16
	.cfi_def_cfa_offset 16
Ltmp27:
	.loc	5 47 5 prologue_end             ; sprr-srd.c:47:5
	; InlineAsm Start
	isb
	mrs	x8, S3_6_C15_C1_5

	; InlineAsm End
	str	x8, [sp, #8]
	.loc	5 50 12                         ; sprr-srd.c:50:12
	ldr	x0, [sp, #8]
	.loc	5 50 5 is_stmt 0                ; sprr-srd.c:50:5
	add	sp, sp, #16                     ; =16
	ret
Ltmp28:
Lfunc_end6:
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function can_read
_can_read:                              ; @can_read
Lfunc_begin7:
	.loc	5 54 0 is_stmt 1                ; sprr-srd.c:54:0
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32                     ; =32
	.cfi_def_cfa_offset 32
	str	x0, [sp, #16]
Ltmp30:
	.loc	5 55 14 prologue_end            ; sprr-srd.c:55:14
	str	xzr, [sp, #8]
	.loc	5 60 32                         ; sprr-srd.c:60:32
	ldr	x8, [sp, #16]
	.loc	5 57 5                          ; sprr-srd.c:57:5
	; InlineAsm Start
	ldr	x0, [x8]
	mov	x8, x0

	; InlineAsm End
	str	x8, [sp, #8]
Ltmp31:
	.loc	5 63 9                          ; sprr-srd.c:63:9
	ldr	x8, [sp, #8]
	mov	x9, #48879
	movk	x9, #57005, lsl #16
Ltmp32:
	.loc	5 63 9 is_stmt 0                ; sprr-srd.c:63:9
	subs	x8, x8, x9
	b.ne	LBB7_2
; %bb.1:
	.loc	5 0 9                           ; sprr-srd.c:0:9
	mov	w8, #0
Ltmp33:
	.loc	5 64 9 is_stmt 1                ; sprr-srd.c:64:9
	and	w8, w8, #0x1
	strb	w8, [sp, #31]
	b	LBB7_3
Ltmp34:
LBB7_2:
	.loc	5 0 9 is_stmt 0                 ; sprr-srd.c:0:9
	mov	w8, #1
	.loc	5 65 5 is_stmt 1                ; sprr-srd.c:65:5
	and	w8, w8, #0x1
	strb	w8, [sp, #31]
LBB7_3:
	.loc	5 66 1                          ; sprr-srd.c:66:1
	ldrb	w8, [sp, #31]
	and	w0, w8, #0x1
	add	sp, sp, #32                     ; =32
	ret
Ltmp35:
Lfunc_end7:
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function can_write
_can_write:                             ; @can_write
Lfunc_begin8:
	.loc	5 69 0                          ; sprr-srd.c:69:0
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32                     ; =32
	.cfi_def_cfa_offset 32
	str	x0, [sp, #16]
Ltmp37:
	.loc	5 70 14 prologue_end            ; sprr-srd.c:70:14
	str	xzr, [sp, #8]
	.loc	5 75 32                         ; sprr-srd.c:75:32
	ldr	x8, [sp, #16]
	.loc	5 75 36 is_stmt 0               ; sprr-srd.c:75:36
	add	x8, x8, #8                      ; =8
	.loc	5 72 5 is_stmt 1                ; sprr-srd.c:72:5
	; InlineAsm Start
	str	x0, [x8]
	mov	x8, x0

	; InlineAsm End
	str	x8, [sp, #8]
Ltmp38:
	.loc	5 78 9                          ; sprr-srd.c:78:9
	ldr	x8, [sp, #8]
	mov	x9, #48879
	movk	x9, #57005, lsl #16
Ltmp39:
	.loc	5 78 9 is_stmt 0                ; sprr-srd.c:78:9
	subs	x8, x8, x9
	b.ne	LBB8_2
; %bb.1:
	.loc	5 0 9                           ; sprr-srd.c:0:9
	mov	w8, #0
Ltmp40:
	.loc	5 79 9 is_stmt 1                ; sprr-srd.c:79:9
	and	w8, w8, #0x1
	strb	w8, [sp, #31]
	b	LBB8_3
Ltmp41:
LBB8_2:
	.loc	5 0 9 is_stmt 0                 ; sprr-srd.c:0:9
	mov	w8, #1
	.loc	5 80 5 is_stmt 1                ; sprr-srd.c:80:5
	and	w8, w8, #0x1
	strb	w8, [sp, #31]
LBB8_3:
	.loc	5 81 1                          ; sprr-srd.c:81:1
	ldrb	w8, [sp, #31]
	and	w0, w8, #0x1
	add	sp, sp, #32                     ; =32
	ret
Ltmp42:
Lfunc_end8:
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function can_exec
_can_exec:                              ; @can_exec
Lfunc_begin9:
	.loc	5 84 0                          ; sprr-srd.c:84:0
	.cfi_startproc
; %bb.0:
	pacibsp
	sub	sp, sp, #48                     ; =48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32                    ; =32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #16]
Ltmp43:
	.loc	5 85 37 prologue_end            ; sprr-srd.c:85:37
	ldr	x8, [sp, #16]
	.loc	5 85 16 is_stmt 0               ; sprr-srd.c:85:16
	str	x8, [sp, #8]
	.loc	5 86 20 is_stmt 1               ; sprr-srd.c:86:20
	ldr	x8, [sp, #8]
	mov	x9, #0
	mov	x0, x9
	blraaz	x8
	.loc	5 86 14 is_stmt 0               ; sprr-srd.c:86:14
	str	x0, [sp]
Ltmp44:
	.loc	5 87 9 is_stmt 1                ; sprr-srd.c:87:9
	ldr	x8, [sp]
	mov	x9, #48879
	movk	x9, #57005, lsl #16
Ltmp45:
	.loc	5 87 9 is_stmt 0                ; sprr-srd.c:87:9
	subs	x8, x8, x9
	b.ne	LBB9_2
; %bb.1:
	.loc	5 0 9                           ; sprr-srd.c:0:9
	mov	w8, #0
Ltmp46:
	.loc	5 88 9 is_stmt 1                ; sprr-srd.c:88:9
	and	w8, w8, #0x1
	sturb	w8, [x29, #-1]
	b	LBB9_3
Ltmp47:
LBB9_2:
	.loc	5 0 9 is_stmt 0                 ; sprr-srd.c:0:9
	mov	w8, #1
	.loc	5 89 5 is_stmt 1                ; sprr-srd.c:89:5
	and	w8, w8, #0x1
	sturb	w8, [x29, #-1]
LBB9_3:
	.loc	5 90 1                          ; sprr-srd.c:90:1
	ldurb	w8, [x29, #-1]
	and	w0, w8, #0x1
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48                     ; =48
	retab
Ltmp48:
Lfunc_end9:
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__cstring,cstring_literals
l_.str:                                 ; @.str
	.asciz	"%llx: %c%c%c\n"

	.file	6 "/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys" "signal.h"
	.file	7 "/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_types" "_pid_t.h"
	.file	8 "/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_types" "_uid_t.h"
	.file	9 "/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/_types" "_uint32_t.h"
	.file	10 "/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_types" "_ucontext.h"
	.file	11 "/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/_types" "_sigaltstack.h"
	.file	12 "/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/mach/arm" "_structs.h"
	.file	13 "/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/arm" "_mcontext.h"
	.file	14 "/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/_types" "_uint8_t.h"
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
	.byte	17                              ; DW_AT_low_pc
	.byte	1                               ; DW_FORM_addr
	.byte	18                              ; DW_AT_high_pc
	.byte	6                               ; DW_FORM_data4
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	2                               ; Abbreviation Code
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
	.byte	3                               ; Abbreviation Code
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
	.byte	4                               ; Abbreviation Code
	.byte	15                              ; DW_TAG_pointer_type
	.byte	0                               ; DW_CHILDREN_no
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	5                               ; Abbreviation Code
	.byte	46                              ; DW_TAG_subprogram
	.byte	1                               ; DW_CHILDREN_yes
	.byte	17                              ; DW_AT_low_pc
	.byte	1                               ; DW_FORM_addr
	.byte	18                              ; DW_AT_high_pc
	.byte	6                               ; DW_FORM_data4
	.byte	64                              ; DW_AT_frame_base
	.byte	24                              ; DW_FORM_exprloc
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
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	6                               ; Abbreviation Code
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
	.byte	7                               ; Abbreviation Code
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
	.byte	8                               ; Abbreviation Code
	.byte	11                              ; DW_TAG_lexical_block
	.byte	1                               ; DW_CHILDREN_yes
	.byte	17                              ; DW_AT_low_pc
	.byte	1                               ; DW_FORM_addr
	.byte	18                              ; DW_AT_high_pc
	.byte	6                               ; DW_FORM_data4
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	9                               ; Abbreviation Code
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
	.byte	3                               ; DW_AT_name
	.byte	14                              ; DW_FORM_strp
	.byte	58                              ; DW_AT_decl_file
	.byte	11                              ; DW_FORM_data1
	.byte	59                              ; DW_AT_decl_line
	.byte	11                              ; DW_FORM_data1
	.byte	39                              ; DW_AT_prototyped
	.byte	25                              ; DW_FORM_flag_present
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	10                              ; Abbreviation Code
	.byte	46                              ; DW_TAG_subprogram
	.byte	1                               ; DW_CHILDREN_yes
	.byte	17                              ; DW_AT_low_pc
	.byte	1                               ; DW_FORM_addr
	.byte	18                              ; DW_AT_high_pc
	.byte	6                               ; DW_FORM_data4
	.byte	64                              ; DW_AT_frame_base
	.byte	24                              ; DW_FORM_exprloc
	.byte	3                               ; DW_AT_name
	.byte	14                              ; DW_FORM_strp
	.byte	58                              ; DW_AT_decl_file
	.byte	11                              ; DW_FORM_data1
	.byte	59                              ; DW_AT_decl_line
	.byte	11                              ; DW_FORM_data1
	.byte	39                              ; DW_AT_prototyped
	.byte	25                              ; DW_FORM_flag_present
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	11                              ; Abbreviation Code
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
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	12                              ; Abbreviation Code
	.byte	46                              ; DW_TAG_subprogram
	.byte	1                               ; DW_CHILDREN_yes
	.byte	17                              ; DW_AT_low_pc
	.byte	1                               ; DW_FORM_addr
	.byte	18                              ; DW_AT_high_pc
	.byte	6                               ; DW_FORM_data4
	.byte	64                              ; DW_AT_frame_base
	.byte	24                              ; DW_FORM_exprloc
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
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	13                              ; Abbreviation Code
	.byte	15                              ; DW_TAG_pointer_type
	.byte	0                               ; DW_CHILDREN_no
	.byte	73                              ; DW_AT_type
	.byte	19                              ; DW_FORM_ref4
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	14                              ; Abbreviation Code
	.byte	19                              ; DW_TAG_structure_type
	.byte	1                               ; DW_CHILDREN_yes
	.byte	3                               ; DW_AT_name
	.byte	14                              ; DW_FORM_strp
	.byte	11                              ; DW_AT_byte_size
	.byte	11                              ; DW_FORM_data1
	.byte	58                              ; DW_AT_decl_file
	.byte	11                              ; DW_FORM_data1
	.byte	59                              ; DW_AT_decl_line
	.byte	5                               ; DW_FORM_data2
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	15                              ; Abbreviation Code
	.byte	13                              ; DW_TAG_member
	.byte	0                               ; DW_CHILDREN_no
	.byte	3                               ; DW_AT_name
	.byte	14                              ; DW_FORM_strp
	.byte	73                              ; DW_AT_type
	.byte	19                              ; DW_FORM_ref4
	.byte	58                              ; DW_AT_decl_file
	.byte	11                              ; DW_FORM_data1
	.byte	59                              ; DW_AT_decl_line
	.byte	5                               ; DW_FORM_data2
	.byte	56                              ; DW_AT_data_member_location
	.byte	11                              ; DW_FORM_data1
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	16                              ; Abbreviation Code
	.byte	23                              ; DW_TAG_union_type
	.byte	1                               ; DW_CHILDREN_yes
	.byte	3                               ; DW_AT_name
	.byte	14                              ; DW_FORM_strp
	.byte	11                              ; DW_AT_byte_size
	.byte	11                              ; DW_FORM_data1
	.byte	58                              ; DW_AT_decl_file
	.byte	11                              ; DW_FORM_data1
	.byte	59                              ; DW_AT_decl_line
	.byte	5                               ; DW_FORM_data2
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	17                              ; Abbreviation Code
	.byte	21                              ; DW_TAG_subroutine_type
	.byte	1                               ; DW_CHILDREN_yes
	.byte	39                              ; DW_AT_prototyped
	.byte	25                              ; DW_FORM_flag_present
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	18                              ; Abbreviation Code
	.byte	5                               ; DW_TAG_formal_parameter
	.byte	0                               ; DW_CHILDREN_no
	.byte	73                              ; DW_AT_type
	.byte	19                              ; DW_FORM_ref4
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	19                              ; Abbreviation Code
	.byte	19                              ; DW_TAG_structure_type
	.byte	1                               ; DW_CHILDREN_yes
	.byte	3                               ; DW_AT_name
	.byte	14                              ; DW_FORM_strp
	.byte	11                              ; DW_AT_byte_size
	.byte	11                              ; DW_FORM_data1
	.byte	58                              ; DW_AT_decl_file
	.byte	11                              ; DW_FORM_data1
	.byte	59                              ; DW_AT_decl_line
	.byte	11                              ; DW_FORM_data1
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	20                              ; Abbreviation Code
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
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	21                              ; Abbreviation Code
	.byte	23                              ; DW_TAG_union_type
	.byte	1                               ; DW_CHILDREN_yes
	.byte	3                               ; DW_AT_name
	.byte	14                              ; DW_FORM_strp
	.byte	11                              ; DW_AT_byte_size
	.byte	11                              ; DW_FORM_data1
	.byte	58                              ; DW_AT_decl_file
	.byte	11                              ; DW_FORM_data1
	.byte	59                              ; DW_AT_decl_line
	.byte	11                              ; DW_FORM_data1
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	22                              ; Abbreviation Code
	.byte	1                               ; DW_TAG_array_type
	.byte	1                               ; DW_CHILDREN_yes
	.byte	73                              ; DW_AT_type
	.byte	19                              ; DW_FORM_ref4
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	23                              ; Abbreviation Code
	.byte	33                              ; DW_TAG_subrange_type
	.byte	0                               ; DW_CHILDREN_no
	.byte	73                              ; DW_AT_type
	.byte	19                              ; DW_FORM_ref4
	.byte	55                              ; DW_AT_count
	.byte	11                              ; DW_FORM_data1
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	24                              ; Abbreviation Code
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
	.byte	25                              ; Abbreviation Code
	.byte	19                              ; DW_TAG_structure_type
	.byte	1                               ; DW_CHILDREN_yes
	.byte	3                               ; DW_AT_name
	.byte	14                              ; DW_FORM_strp
	.byte	11                              ; DW_AT_byte_size
	.byte	5                               ; DW_FORM_data2
	.byte	58                              ; DW_AT_decl_file
	.byte	11                              ; DW_FORM_data1
	.byte	59                              ; DW_AT_decl_line
	.byte	11                              ; DW_FORM_data1
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	26                              ; Abbreviation Code
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
	.byte	5                               ; DW_FORM_data2
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	27                              ; Abbreviation Code
	.byte	19                              ; DW_TAG_structure_type
	.byte	1                               ; DW_CHILDREN_yes
	.byte	3                               ; DW_AT_name
	.byte	14                              ; DW_FORM_strp
	.byte	11                              ; DW_AT_byte_size
	.byte	5                               ; DW_FORM_data2
	.byte	58                              ; DW_AT_decl_file
	.byte	11                              ; DW_FORM_data1
	.byte	59                              ; DW_AT_decl_line
	.byte	5                               ; DW_FORM_data2
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	28                              ; Abbreviation Code
	.byte	13                              ; DW_TAG_member
	.byte	0                               ; DW_CHILDREN_no
	.byte	3                               ; DW_AT_name
	.byte	14                              ; DW_FORM_strp
	.byte	73                              ; DW_AT_type
	.byte	19                              ; DW_FORM_ref4
	.byte	58                              ; DW_AT_decl_file
	.byte	11                              ; DW_FORM_data1
	.byte	59                              ; DW_AT_decl_line
	.byte	5                               ; DW_FORM_data2
	.byte	56                              ; DW_AT_data_member_location
	.byte	5                               ; DW_FORM_data2
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	29                              ; Abbreviation Code
	.byte	21                              ; DW_TAG_subroutine_type
	.byte	1                               ; DW_CHILDREN_yes
	.byte	73                              ; DW_AT_type
	.byte	19                              ; DW_FORM_ref4
	.byte	39                              ; DW_AT_prototyped
	.byte	25                              ; DW_FORM_flag_present
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	0                               ; EOM(3)
	.section	__DWARF,__debug_info,regular,debug
Lsection_info:
Lcu_begin0:
.set Lset0, Ldebug_info_end0-Ldebug_info_start0 ; Length of Unit
	.long	Lset0
Ldebug_info_start0:
	.short	4                               ; DWARF version number
.set Lset1, Lsection_abbrev-Lsection_abbrev ; Offset Into Abbrev. Section
	.long	Lset1
	.byte	8                               ; Address Size (in bytes)
	.byte	1                               ; Abbrev [1] 0xb:0x6b6 DW_TAG_compile_unit
	.long	0                               ; DW_AT_producer
	.short	12                              ; DW_AT_language
	.long	48                              ; DW_AT_name
	.long	59                              ; DW_AT_LLVM_sysroot
	.long	154                             ; DW_AT_APPLE_sdk
.set Lset2, Lline_table_start0-Lsection_line ; DW_AT_stmt_list
	.long	Lset2
	.long	165                             ; DW_AT_comp_dir
	.quad	Lfunc_begin0                    ; DW_AT_low_pc
.set Lset3, Lfunc_end9-Lfunc_begin0     ; DW_AT_high_pc
	.long	Lset3
	.byte	2                               ; Abbrev [2] 0x32:0xb DW_TAG_typedef
	.long	61                              ; DW_AT_type
	.long	181                             ; DW_AT_name
	.byte	3                               ; DW_AT_decl_file
	.byte	31                              ; DW_AT_decl_line
	.byte	2                               ; Abbrev [2] 0x3d:0xb DW_TAG_typedef
	.long	72                              ; DW_AT_type
	.long	190                             ; DW_AT_name
	.byte	2                               ; DW_AT_decl_file
	.byte	73                              ; DW_AT_decl_line
	.byte	2                               ; Abbrev [2] 0x48:0xb DW_TAG_typedef
	.long	83                              ; DW_AT_type
	.long	208                             ; DW_AT_name
	.byte	1                               ; DW_AT_decl_file
	.byte	21                              ; DW_AT_decl_line
	.byte	3                               ; Abbrev [3] 0x53:0x7 DW_TAG_base_type
	.long	219                             ; DW_AT_name
	.byte	7                               ; DW_AT_encoding
	.byte	4                               ; DW_AT_byte_size
	.byte	4                               ; Abbrev [4] 0x5a:0x1 DW_TAG_pointer_type
	.byte	2                               ; Abbrev [2] 0x5b:0xb DW_TAG_typedef
	.long	102                             ; DW_AT_type
	.long	232                             ; DW_AT_name
	.byte	4                               ; DW_AT_decl_file
	.byte	31                              ; DW_AT_decl_line
	.byte	3                               ; Abbrev [3] 0x66:0x7 DW_TAG_base_type
	.long	241                             ; DW_AT_name
	.byte	7                               ; DW_AT_encoding
	.byte	8                               ; DW_AT_byte_size
	.byte	5                               ; Abbrev [5] 0x6d:0x6e DW_TAG_subprogram
	.quad	Lfunc_begin0                    ; DW_AT_low_pc
.set Lset4, Lfunc_end0-Lfunc_begin0     ; DW_AT_high_pc
	.long	Lset4
	.byte	1                               ; DW_AT_frame_base
	.byte	109
	.long	264                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	111                             ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.long	787                             ; DW_AT_type
                                        ; DW_AT_external
	.byte	6                               ; Abbrev [6] 0x86:0xe DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	120
	.long	386                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	111                             ; DW_AT_decl_line
	.long	787                             ; DW_AT_type
	.byte	6                               ; Abbrev [6] 0x94:0xe DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	112
	.long	391                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	111                             ; DW_AT_decl_line
	.long	801                             ; DW_AT_type
	.byte	7                               ; Abbrev [7] 0xa2:0xe DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	96
	.long	401                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	116                             ; DW_AT_decl_line
	.long	818                             ; DW_AT_type
	.byte	7                               ; Abbrev [7] 0xb0:0xe DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	88
	.long	690                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	124                             ; DW_AT_decl_line
	.long	1192                            ; DW_AT_type
	.byte	8                               ; Abbrev [8] 0xbe:0x1c DW_TAG_lexical_block
	.quad	Ltmp1                           ; DW_AT_low_pc
.set Lset5, Ltmp5-Ltmp1                 ; DW_AT_high_pc
	.long	Lset5
	.byte	7                               ; Abbrev [7] 0xcb:0xe DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	84
	.long	703                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	129                             ; DW_AT_decl_line
	.long	787                             ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	0                               ; End Of Children Mark
	.byte	9                               ; Abbrev [9] 0xdb:0x4e DW_TAG_subprogram
	.quad	Lfunc_begin1                    ; DW_AT_low_pc
.set Lset6, Lfunc_end1-Lfunc_begin1     ; DW_AT_high_pc
	.long	Lset6
                                        ; DW_AT_APPLE_omit_frame_ptr
	.byte	1                               ; DW_AT_frame_base
	.byte	111
	.long	269                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	28                              ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.byte	6                               ; Abbrev [6] 0xf0:0xe DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	28
	.long	705                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	28                              ; DW_AT_decl_line
	.long	787                             ; DW_AT_type
	.byte	6                               ; Abbrev [6] 0xfe:0xe DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	16
	.long	711                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	28                              ; DW_AT_decl_line
	.long	1208                            ; DW_AT_type
	.byte	6                               ; Abbrev [6] 0x10c:0xe DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	8
	.long	726                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	28                              ; DW_AT_decl_line
	.long	90                              ; DW_AT_type
	.byte	7                               ; Abbrev [7] 0x11a:0xe DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	0
	.long	730                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	32                              ; DW_AT_decl_line
	.long	1224                            ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	9                               ; Abbrev [9] 0x129:0x4e DW_TAG_subprogram
	.quad	Lfunc_begin2                    ; DW_AT_low_pc
.set Lset7, Lfunc_end2-Lfunc_begin2     ; DW_AT_high_pc
	.long	Lset7
                                        ; DW_AT_APPLE_omit_frame_ptr
	.byte	1                               ; DW_AT_frame_base
	.byte	111
	.long	281                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	19                              ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.byte	6                               ; Abbrev [6] 0x13e:0xe DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	28
	.long	705                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	19                              ; DW_AT_decl_line
	.long	787                             ; DW_AT_type
	.byte	6                               ; Abbrev [6] 0x14c:0xe DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	16
	.long	711                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	19                              ; DW_AT_decl_line
	.long	1208                            ; DW_AT_type
	.byte	6                               ; Abbrev [6] 0x15a:0xe DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	8
	.long	726                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	19                              ; DW_AT_decl_line
	.long	90                              ; DW_AT_type
	.byte	7                               ; Abbrev [7] 0x168:0xe DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	0
	.long	730                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	23                              ; DW_AT_decl_line
	.long	1224                            ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	9                               ; Abbrev [9] 0x177:0x24 DW_TAG_subprogram
	.quad	Lfunc_begin3                    ; DW_AT_low_pc
.set Lset8, Lfunc_end3-Lfunc_begin3     ; DW_AT_high_pc
	.long	Lset8
                                        ; DW_AT_APPLE_omit_frame_ptr
	.byte	1                               ; DW_AT_frame_base
	.byte	111
	.long	293                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	37                              ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.byte	6                               ; Abbrev [6] 0x18c:0xe DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	8
	.long	1176                            ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	37                              ; DW_AT_decl_line
	.long	91                              ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	10                              ; Abbrev [10] 0x19b:0x4e DW_TAG_subprogram
	.quad	Lfunc_begin4                    ; DW_AT_low_pc
.set Lset9, Lfunc_end4-Lfunc_begin4     ; DW_AT_high_pc
	.long	Lset9
	.byte	1                               ; DW_AT_frame_base
	.byte	109
	.long	309                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	92                              ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.byte	6                               ; Abbrev [6] 0x1b0:0xe DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	120
	.long	690                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	92                              ; DW_AT_decl_line
	.long	90                              ; DW_AT_type
	.byte	6                               ; Abbrev [6] 0x1be:0xe DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	112
	.long	1176                            ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	92                              ; DW_AT_decl_line
	.long	91                              ; DW_AT_type
	.byte	7                               ; Abbrev [7] 0x1cc:0xe DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	104
	.long	1178                            ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	94                              ; DW_AT_decl_line
	.long	91                              ; DW_AT_type
	.byte	7                               ; Abbrev [7] 0x1da:0xe DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	96
	.long	1180                            ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	94                              ; DW_AT_decl_line
	.long	91                              ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	11                              ; Abbrev [11] 0x1e9:0x52 DW_TAG_subprogram
	.quad	Lfunc_begin5                    ; DW_AT_low_pc
.set Lset10, Lfunc_end5-Lfunc_begin5    ; DW_AT_high_pc
	.long	Lset10
                                        ; DW_AT_APPLE_omit_frame_ptr
	.byte	1                               ; DW_AT_frame_base
	.byte	111
	.long	319                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	103                             ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.long	91                              ; DW_AT_type
	.byte	6                               ; Abbrev [6] 0x202:0xe DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	31
	.long	1182                            ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	103                             ; DW_AT_decl_line
	.long	1694                            ; DW_AT_type
	.byte	7                               ; Abbrev [7] 0x210:0xe DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	16
	.long	1211                            ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	105                             ; DW_AT_decl_line
	.long	91                              ; DW_AT_type
	.byte	8                               ; Abbrev [8] 0x21e:0x1c DW_TAG_lexical_block
	.quad	Ltmp20                          ; DW_AT_low_pc
.set Lset11, Ltmp24-Ltmp20              ; DW_AT_high_pc
	.long	Lset11
	.byte	7                               ; Abbrev [7] 0x22b:0xe DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	12
	.long	703                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	106                             ; DW_AT_decl_line
	.long	787                             ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	0                               ; End Of Children Mark
	.byte	11                              ; Abbrev [11] 0x23b:0x28 DW_TAG_subprogram
	.quad	Lfunc_begin6                    ; DW_AT_low_pc
.set Lset12, Lfunc_end6-Lfunc_begin6    ; DW_AT_high_pc
	.long	Lset12
                                        ; DW_AT_APPLE_omit_frame_ptr
	.byte	1                               ; DW_AT_frame_base
	.byte	111
	.long	333                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	44                              ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.long	91                              ; DW_AT_type
	.byte	7                               ; Abbrev [7] 0x254:0xe DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	8
	.long	1176                            ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	46                              ; DW_AT_decl_line
	.long	91                              ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	11                              ; Abbrev [11] 0x263:0x36 DW_TAG_subprogram
	.quad	Lfunc_begin7                    ; DW_AT_low_pc
.set Lset13, Lfunc_end7-Lfunc_begin7    ; DW_AT_high_pc
	.long	Lset13
                                        ; DW_AT_APPLE_omit_frame_ptr
	.byte	1                               ; DW_AT_frame_base
	.byte	111
	.long	348                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	53                              ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.long	794                             ; DW_AT_type
	.byte	6                               ; Abbrev [6] 0x27c:0xe DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	16
	.long	690                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	53                              ; DW_AT_decl_line
	.long	90                              ; DW_AT_type
	.byte	7                               ; Abbrev [7] 0x28a:0xe DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	8
	.long	1176                            ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	55                              ; DW_AT_decl_line
	.long	91                              ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	11                              ; Abbrev [11] 0x299:0x36 DW_TAG_subprogram
	.quad	Lfunc_begin8                    ; DW_AT_low_pc
.set Lset14, Lfunc_end8-Lfunc_begin8    ; DW_AT_high_pc
	.long	Lset14
                                        ; DW_AT_APPLE_omit_frame_ptr
	.byte	1                               ; DW_AT_frame_base
	.byte	111
	.long	357                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	68                              ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.long	794                             ; DW_AT_type
	.byte	6                               ; Abbrev [6] 0x2b2:0xe DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	16
	.long	690                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	68                              ; DW_AT_decl_line
	.long	90                              ; DW_AT_type
	.byte	7                               ; Abbrev [7] 0x2c0:0xe DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	8
	.long	1176                            ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	70                              ; DW_AT_decl_line
	.long	91                              ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	12                              ; Abbrev [12] 0x2cf:0x44 DW_TAG_subprogram
	.quad	Lfunc_begin9                    ; DW_AT_low_pc
.set Lset15, Lfunc_end9-Lfunc_begin9    ; DW_AT_high_pc
	.long	Lset15
	.byte	1                               ; DW_AT_frame_base
	.byte	109
	.long	367                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	83                              ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.long	794                             ; DW_AT_type
	.byte	6                               ; Abbrev [6] 0x2e8:0xe DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	143
	.byte	16
	.long	690                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	83                              ; DW_AT_decl_line
	.long	90                              ; DW_AT_type
	.byte	7                               ; Abbrev [7] 0x2f6:0xe DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	143
	.byte	8
	.long	1215                            ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	85                              ; DW_AT_decl_line
	.long	1712                            ; DW_AT_type
	.byte	7                               ; Abbrev [7] 0x304:0xe DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	143
	.byte	0
	.long	1211                            ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	86                              ; DW_AT_decl_line
	.long	91                              ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	3                               ; Abbrev [3] 0x313:0x7 DW_TAG_base_type
	.long	376                             ; DW_AT_name
	.byte	5                               ; DW_AT_encoding
	.byte	4                               ; DW_AT_byte_size
	.byte	3                               ; Abbrev [3] 0x31a:0x7 DW_TAG_base_type
	.long	380                             ; DW_AT_name
	.byte	2                               ; DW_AT_encoding
	.byte	1                               ; DW_AT_byte_size
	.byte	13                              ; Abbrev [13] 0x321:0x5 DW_TAG_pointer_type
	.long	806                             ; DW_AT_type
	.byte	13                              ; Abbrev [13] 0x326:0x5 DW_TAG_pointer_type
	.long	811                             ; DW_AT_type
	.byte	3                               ; Abbrev [3] 0x32b:0x7 DW_TAG_base_type
	.long	396                             ; DW_AT_name
	.byte	6                               ; DW_AT_encoding
	.byte	1                               ; DW_AT_byte_size
	.byte	14                              ; Abbrev [14] 0x332:0x31 DW_TAG_structure_type
	.long	404                             ; DW_AT_name
	.byte	16                              ; DW_AT_byte_size
	.byte	6                               ; DW_AT_decl_file
	.short	286                             ; DW_AT_decl_line
	.byte	15                              ; Abbrev [15] 0x33b:0xd DW_TAG_member
	.long	414                             ; DW_AT_name
	.long	867                             ; DW_AT_type
	.byte	6                               ; DW_AT_decl_file
	.short	287                             ; DW_AT_decl_line
	.byte	0                               ; DW_AT_data_member_location
	.byte	15                              ; Abbrev [15] 0x348:0xd DW_TAG_member
	.long	673                             ; DW_AT_name
	.long	50                              ; DW_AT_type
	.byte	6                               ; DW_AT_decl_file
	.short	288                             ; DW_AT_decl_line
	.byte	8                               ; DW_AT_data_member_location
	.byte	15                              ; Abbrev [15] 0x355:0xd DW_TAG_member
	.long	681                             ; DW_AT_name
	.long	787                             ; DW_AT_type
	.byte	6                               ; DW_AT_decl_file
	.short	289                             ; DW_AT_decl_line
	.byte	12                              ; DW_AT_data_member_location
	.byte	0                               ; End Of Children Mark
	.byte	16                              ; Abbrev [16] 0x363:0x24 DW_TAG_union_type
	.long	414                             ; DW_AT_name
	.byte	8                               ; DW_AT_byte_size
	.byte	6                               ; DW_AT_decl_file
	.short	269                             ; DW_AT_decl_line
	.byte	15                              ; Abbrev [15] 0x36c:0xd DW_TAG_member
	.long	428                             ; DW_AT_name
	.long	903                             ; DW_AT_type
	.byte	6                               ; DW_AT_decl_file
	.short	270                             ; DW_AT_decl_line
	.byte	0                               ; DW_AT_data_member_location
	.byte	15                              ; Abbrev [15] 0x379:0xd DW_TAG_member
	.long	441                             ; DW_AT_name
	.long	915                             ; DW_AT_type
	.byte	6                               ; DW_AT_decl_file
	.short	271                             ; DW_AT_decl_line
	.byte	0                               ; DW_AT_data_member_location
	.byte	0                               ; End Of Children Mark
	.byte	13                              ; Abbrev [13] 0x387:0x5 DW_TAG_pointer_type
	.long	908                             ; DW_AT_type
	.byte	17                              ; Abbrev [17] 0x38c:0x7 DW_TAG_subroutine_type
                                        ; DW_AT_prototyped
	.byte	18                              ; Abbrev [18] 0x38d:0x5 DW_TAG_formal_parameter
	.long	787                             ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	13                              ; Abbrev [13] 0x393:0x5 DW_TAG_pointer_type
	.long	920                             ; DW_AT_type
	.byte	17                              ; Abbrev [17] 0x398:0x11 DW_TAG_subroutine_type
                                        ; DW_AT_prototyped
	.byte	18                              ; Abbrev [18] 0x399:0x5 DW_TAG_formal_parameter
	.long	787                             ; DW_AT_type
	.byte	18                              ; Abbrev [18] 0x39e:0x5 DW_TAG_formal_parameter
	.long	937                             ; DW_AT_type
	.byte	18                              ; Abbrev [18] 0x3a3:0x5 DW_TAG_formal_parameter
	.long	90                              ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	13                              ; Abbrev [13] 0x3a9:0x5 DW_TAG_pointer_type
	.long	942                             ; DW_AT_type
	.byte	19                              ; Abbrev [19] 0x3ae:0x81 DW_TAG_structure_type
	.long	456                             ; DW_AT_name
	.byte	104                             ; DW_AT_byte_size
	.byte	6                               ; DW_AT_decl_file
	.byte	177                             ; DW_AT_decl_line
	.byte	20                              ; Abbrev [20] 0x3b6:0xc DW_TAG_member
	.long	466                             ; DW_AT_name
	.long	787                             ; DW_AT_type
	.byte	6                               ; DW_AT_decl_file
	.byte	178                             ; DW_AT_decl_line
	.byte	0                               ; DW_AT_data_member_location
	.byte	20                              ; Abbrev [20] 0x3c2:0xc DW_TAG_member
	.long	475                             ; DW_AT_name
	.long	787                             ; DW_AT_type
	.byte	6                               ; DW_AT_decl_file
	.byte	179                             ; DW_AT_decl_line
	.byte	4                               ; DW_AT_data_member_location
	.byte	20                              ; Abbrev [20] 0x3ce:0xc DW_TAG_member
	.long	484                             ; DW_AT_name
	.long	787                             ; DW_AT_type
	.byte	6                               ; DW_AT_decl_file
	.byte	180                             ; DW_AT_decl_line
	.byte	8                               ; DW_AT_data_member_location
	.byte	20                              ; Abbrev [20] 0x3da:0xc DW_TAG_member
	.long	492                             ; DW_AT_name
	.long	1071                            ; DW_AT_type
	.byte	6                               ; DW_AT_decl_file
	.byte	181                             ; DW_AT_decl_line
	.byte	12                              ; DW_AT_data_member_location
	.byte	20                              ; Abbrev [20] 0x3e6:0xc DW_TAG_member
	.long	530                             ; DW_AT_name
	.long	1104                            ; DW_AT_type
	.byte	6                               ; DW_AT_decl_file
	.byte	182                             ; DW_AT_decl_line
	.byte	16                              ; DW_AT_data_member_location
	.byte	20                              ; Abbrev [20] 0x3f2:0xc DW_TAG_member
	.long	558                             ; DW_AT_name
	.long	787                             ; DW_AT_type
	.byte	6                               ; DW_AT_decl_file
	.byte	183                             ; DW_AT_decl_line
	.byte	20                              ; DW_AT_data_member_location
	.byte	20                              ; Abbrev [20] 0x3fe:0xc DW_TAG_member
	.long	568                             ; DW_AT_name
	.long	90                              ; DW_AT_type
	.byte	6                               ; DW_AT_decl_file
	.byte	184                             ; DW_AT_decl_line
	.byte	24                              ; DW_AT_data_member_location
	.byte	20                              ; Abbrev [20] 0x40a:0xc DW_TAG_member
	.long	576                             ; DW_AT_name
	.long	1126                            ; DW_AT_type
	.byte	6                               ; DW_AT_decl_file
	.byte	185                             ; DW_AT_decl_line
	.byte	32                              ; DW_AT_data_member_location
	.byte	20                              ; Abbrev [20] 0x416:0xc DW_TAG_member
	.long	612                             ; DW_AT_name
	.long	1159                            ; DW_AT_type
	.byte	6                               ; DW_AT_decl_file
	.byte	186                             ; DW_AT_decl_line
	.byte	40                              ; DW_AT_data_member_location
	.byte	20                              ; Abbrev [20] 0x422:0xc DW_TAG_member
	.long	629                             ; DW_AT_name
	.long	1166                            ; DW_AT_type
	.byte	6                               ; DW_AT_decl_file
	.byte	187                             ; DW_AT_decl_line
	.byte	48                              ; DW_AT_data_member_location
	.byte	0                               ; End Of Children Mark
	.byte	2                               ; Abbrev [2] 0x42f:0xb DW_TAG_typedef
	.long	1082                            ; DW_AT_type
	.long	499                             ; DW_AT_name
	.byte	7                               ; DW_AT_decl_file
	.byte	31                              ; DW_AT_decl_line
	.byte	2                               ; Abbrev [2] 0x43a:0xb DW_TAG_typedef
	.long	1093                            ; DW_AT_type
	.long	505                             ; DW_AT_name
	.byte	2                               ; DW_AT_decl_file
	.byte	72                              ; DW_AT_decl_line
	.byte	2                               ; Abbrev [2] 0x445:0xb DW_TAG_typedef
	.long	787                             ; DW_AT_type
	.long	520                             ; DW_AT_name
	.byte	1                               ; DW_AT_decl_file
	.byte	20                              ; DW_AT_decl_line
	.byte	2                               ; Abbrev [2] 0x450:0xb DW_TAG_typedef
	.long	1115                            ; DW_AT_type
	.long	537                             ; DW_AT_name
	.byte	8                               ; DW_AT_decl_file
	.byte	31                              ; DW_AT_decl_line
	.byte	2                               ; Abbrev [2] 0x45b:0xb DW_TAG_typedef
	.long	72                              ; DW_AT_type
	.long	543                             ; DW_AT_name
	.byte	2                               ; DW_AT_decl_file
	.byte	75                              ; DW_AT_decl_line
	.byte	21                              ; Abbrev [21] 0x466:0x21 DW_TAG_union_type
	.long	585                             ; DW_AT_name
	.byte	8                               ; DW_AT_byte_size
	.byte	6                               ; DW_AT_decl_file
	.byte	158                             ; DW_AT_decl_line
	.byte	20                              ; Abbrev [20] 0x46e:0xc DW_TAG_member
	.long	592                             ; DW_AT_name
	.long	787                             ; DW_AT_type
	.byte	6                               ; DW_AT_decl_file
	.byte	160                             ; DW_AT_decl_line
	.byte	0                               ; DW_AT_data_member_location
	.byte	20                              ; Abbrev [20] 0x47a:0xc DW_TAG_member
	.long	602                             ; DW_AT_name
	.long	90                              ; DW_AT_type
	.byte	6                               ; DW_AT_decl_file
	.byte	161                             ; DW_AT_decl_line
	.byte	0                               ; DW_AT_data_member_location
	.byte	0                               ; End Of Children Mark
	.byte	3                               ; Abbrev [3] 0x487:0x7 DW_TAG_base_type
	.long	620                             ; DW_AT_name
	.byte	5                               ; DW_AT_encoding
	.byte	8                               ; DW_AT_byte_size
	.byte	22                              ; Abbrev [22] 0x48e:0xc DW_TAG_array_type
	.long	1178                            ; DW_AT_type
	.byte	23                              ; Abbrev [23] 0x493:0x6 DW_TAG_subrange_type
	.long	1185                            ; DW_AT_type
	.byte	7                               ; DW_AT_count
	.byte	0                               ; End Of Children Mark
	.byte	3                               ; Abbrev [3] 0x49a:0x7 DW_TAG_base_type
	.long	635                             ; DW_AT_name
	.byte	7                               ; DW_AT_encoding
	.byte	8                               ; DW_AT_byte_size
	.byte	24                              ; Abbrev [24] 0x4a1:0x7 DW_TAG_base_type
	.long	653                             ; DW_AT_name
	.byte	8                               ; DW_AT_byte_size
	.byte	7                               ; DW_AT_encoding
	.byte	13                              ; Abbrev [13] 0x4a8:0x5 DW_TAG_pointer_type
	.long	1197                            ; DW_AT_type
	.byte	2                               ; Abbrev [2] 0x4ad:0xb DW_TAG_typedef
	.long	83                              ; DW_AT_type
	.long	694                             ; DW_AT_name
	.byte	9                               ; DW_AT_decl_file
	.byte	31                              ; DW_AT_decl_line
	.byte	13                              ; Abbrev [13] 0x4b8:0x5 DW_TAG_pointer_type
	.long	1213                            ; DW_AT_type
	.byte	2                               ; Abbrev [2] 0x4bd:0xb DW_TAG_typedef
	.long	942                             ; DW_AT_type
	.long	716                             ; DW_AT_name
	.byte	6                               ; DW_AT_decl_file
	.byte	188                             ; DW_AT_decl_line
	.byte	13                              ; Abbrev [13] 0x4c8:0x5 DW_TAG_pointer_type
	.long	1229                            ; DW_AT_type
	.byte	2                               ; Abbrev [2] 0x4cd:0xb DW_TAG_typedef
	.long	1240                            ; DW_AT_type
	.long	733                             ; DW_AT_name
	.byte	10                              ; DW_AT_decl_file
	.byte	57                              ; DW_AT_decl_line
	.byte	25                              ; Abbrev [25] 0x4d8:0x5e DW_TAG_structure_type
	.long	744                             ; DW_AT_name
	.short	880                             ; DW_AT_byte_size
	.byte	10                              ; DW_AT_decl_file
	.byte	43                              ; DW_AT_decl_line
	.byte	20                              ; Abbrev [20] 0x4e1:0xc DW_TAG_member
	.long	762                             ; DW_AT_name
	.long	787                             ; DW_AT_type
	.byte	10                              ; DW_AT_decl_file
	.byte	45                              ; DW_AT_decl_line
	.byte	0                               ; DW_AT_data_member_location
	.byte	20                              ; Abbrev [20] 0x4ed:0xc DW_TAG_member
	.long	773                             ; DW_AT_name
	.long	61                              ; DW_AT_type
	.byte	10                              ; DW_AT_decl_file
	.byte	46                              ; DW_AT_decl_line
	.byte	4                               ; DW_AT_data_member_location
	.byte	20                              ; Abbrev [20] 0x4f9:0xc DW_TAG_member
	.long	784                             ; DW_AT_name
	.long	1334                            ; DW_AT_type
	.byte	10                              ; DW_AT_decl_file
	.byte	47                              ; DW_AT_decl_line
	.byte	8                               ; DW_AT_data_member_location
	.byte	20                              ; Abbrev [20] 0x505:0xc DW_TAG_member
	.long	853                             ; DW_AT_name
	.long	1390                            ; DW_AT_type
	.byte	10                              ; DW_AT_decl_file
	.byte	48                              ; DW_AT_decl_line
	.byte	32                              ; DW_AT_data_member_location
	.byte	20                              ; Abbrev [20] 0x511:0xc DW_TAG_member
	.long	861                             ; DW_AT_name
	.long	1379                            ; DW_AT_type
	.byte	10                              ; DW_AT_decl_file
	.byte	49                              ; DW_AT_decl_line
	.byte	40                              ; DW_AT_data_member_location
	.byte	20                              ; Abbrev [20] 0x51d:0xc DW_TAG_member
	.long	871                             ; DW_AT_name
	.long	1395                            ; DW_AT_type
	.byte	10                              ; DW_AT_decl_file
	.byte	50                              ; DW_AT_decl_line
	.byte	48                              ; DW_AT_data_member_location
	.byte	20                              ; Abbrev [20] 0x529:0xc DW_TAG_member
	.long	1160                            ; DW_AT_name
	.long	1400                            ; DW_AT_type
	.byte	10                              ; DW_AT_decl_file
	.byte	52                              ; DW_AT_decl_line
	.byte	64                              ; DW_AT_data_member_location
	.byte	0                               ; End Of Children Mark
	.byte	19                              ; Abbrev [19] 0x536:0x2d DW_TAG_structure_type
	.long	793                             ; DW_AT_name
	.byte	24                              ; DW_AT_byte_size
	.byte	11                              ; DW_AT_decl_file
	.byte	42                              ; DW_AT_decl_line
	.byte	20                              ; Abbrev [20] 0x53e:0xc DW_TAG_member
	.long	814                             ; DW_AT_name
	.long	90                              ; DW_AT_type
	.byte	11                              ; DW_AT_decl_file
	.byte	44                              ; DW_AT_decl_line
	.byte	0                               ; DW_AT_data_member_location
	.byte	20                              ; Abbrev [20] 0x54a:0xc DW_TAG_member
	.long	820                             ; DW_AT_name
	.long	1379                            ; DW_AT_type
	.byte	11                              ; DW_AT_decl_file
	.byte	45                              ; DW_AT_decl_line
	.byte	8                               ; DW_AT_data_member_location
	.byte	20                              ; Abbrev [20] 0x556:0xc DW_TAG_member
	.long	844                             ; DW_AT_name
	.long	787                             ; DW_AT_type
	.byte	11                              ; DW_AT_decl_file
	.byte	46                              ; DW_AT_decl_line
	.byte	16                              ; DW_AT_data_member_location
	.byte	0                               ; End Of Children Mark
	.byte	2                               ; Abbrev [2] 0x563:0xb DW_TAG_typedef
	.long	1178                            ; DW_AT_type
	.long	828                             ; DW_AT_name
	.byte	1                               ; DW_AT_decl_file
	.byte	68                              ; DW_AT_decl_line
	.byte	13                              ; Abbrev [13] 0x56e:0x5 DW_TAG_pointer_type
	.long	1240                            ; DW_AT_type
	.byte	13                              ; Abbrev [13] 0x573:0x5 DW_TAG_pointer_type
	.long	1400                            ; DW_AT_type
	.byte	25                              ; Abbrev [25] 0x578:0x2f DW_TAG_structure_type
	.long	883                             ; DW_AT_name
	.short	816                             ; DW_AT_byte_size
	.byte	13                              ; DW_AT_decl_file
	.byte	62                              ; DW_AT_decl_line
	.byte	20                              ; Abbrev [20] 0x581:0xc DW_TAG_member
	.long	903                             ; DW_AT_name
	.long	1447                            ; DW_AT_type
	.byte	13                              ; DW_AT_decl_file
	.byte	64                              ; DW_AT_decl_line
	.byte	0                               ; DW_AT_data_member_location
	.byte	20                              ; Abbrev [20] 0x58d:0xc DW_TAG_member
	.long	974                             ; DW_AT_name
	.long	1503                            ; DW_AT_type
	.byte	13                              ; DW_AT_decl_file
	.byte	65                              ; DW_AT_decl_line
	.byte	16                              ; DW_AT_data_member_location
	.byte	26                              ; Abbrev [26] 0x599:0xd DW_TAG_member
	.long	1081                            ; DW_AT_name
	.long	1612                            ; DW_AT_type
	.byte	13                              ; DW_AT_decl_file
	.byte	66                              ; DW_AT_decl_line
	.short	288                             ; DW_AT_data_member_location
	.byte	0                               ; End Of Children Mark
	.byte	19                              ; Abbrev [19] 0x5a7:0x2d DW_TAG_structure_type
	.long	908                             ; DW_AT_name
	.byte	16                              ; DW_AT_byte_size
	.byte	12                              ; DW_AT_decl_file
	.byte	57                              ; DW_AT_decl_line
	.byte	20                              ; Abbrev [20] 0x5af:0xc DW_TAG_member
	.long	939                             ; DW_AT_name
	.long	1492                            ; DW_AT_type
	.byte	12                              ; DW_AT_decl_file
	.byte	59                              ; DW_AT_decl_line
	.byte	0                               ; DW_AT_data_member_location
	.byte	20                              ; Abbrev [20] 0x5bb:0xc DW_TAG_member
	.long	956                             ; DW_AT_name
	.long	72                              ; DW_AT_type
	.byte	12                              ; DW_AT_decl_file
	.byte	60                              ; DW_AT_decl_line
	.byte	8                               ; DW_AT_data_member_location
	.byte	20                              ; Abbrev [20] 0x5c7:0xc DW_TAG_member
	.long	962                             ; DW_AT_name
	.long	72                              ; DW_AT_type
	.byte	12                              ; DW_AT_decl_file
	.byte	61                              ; DW_AT_decl_line
	.byte	12                              ; DW_AT_data_member_location
	.byte	0                               ; End Of Children Mark
	.byte	2                               ; Abbrev [2] 0x5d4:0xb DW_TAG_typedef
	.long	102                             ; DW_AT_type
	.long	945                             ; DW_AT_name
	.byte	1                               ; DW_AT_decl_file
	.byte	23                              ; DW_AT_decl_line
	.byte	25                              ; Abbrev [25] 0x5df:0x61 DW_TAG_structure_type
	.long	979                             ; DW_AT_name
	.short	272                             ; DW_AT_byte_size
	.byte	12                              ; DW_AT_decl_file
	.byte	123                             ; DW_AT_decl_line
	.byte	20                              ; Abbrev [20] 0x5e8:0xc DW_TAG_member
	.long	1007                            ; DW_AT_name
	.long	1600                            ; DW_AT_type
	.byte	12                              ; DW_AT_decl_file
	.byte	125                             ; DW_AT_decl_line
	.byte	0                               ; DW_AT_data_member_location
	.byte	20                              ; Abbrev [20] 0x5f4:0xc DW_TAG_member
	.long	1011                            ; DW_AT_name
	.long	90                              ; DW_AT_type
	.byte	12                              ; DW_AT_decl_file
	.byte	126                             ; DW_AT_decl_line
	.byte	232                             ; DW_AT_data_member_location
	.byte	20                              ; Abbrev [20] 0x600:0xc DW_TAG_member
	.long	1023                            ; DW_AT_name
	.long	90                              ; DW_AT_type
	.byte	12                              ; DW_AT_decl_file
	.byte	127                             ; DW_AT_decl_line
	.byte	240                             ; DW_AT_data_member_location
	.byte	20                              ; Abbrev [20] 0x60c:0xc DW_TAG_member
	.long	1035                            ; DW_AT_name
	.long	90                              ; DW_AT_type
	.byte	12                              ; DW_AT_decl_file
	.byte	128                             ; DW_AT_decl_line
	.byte	248                             ; DW_AT_data_member_location
	.byte	26                              ; Abbrev [26] 0x618:0xd DW_TAG_member
	.long	1047                            ; DW_AT_name
	.long	90                              ; DW_AT_type
	.byte	12                              ; DW_AT_decl_file
	.byte	129                             ; DW_AT_decl_line
	.short	256                             ; DW_AT_data_member_location
	.byte	26                              ; Abbrev [26] 0x625:0xd DW_TAG_member
	.long	1059                            ; DW_AT_name
	.long	72                              ; DW_AT_type
	.byte	12                              ; DW_AT_decl_file
	.byte	130                             ; DW_AT_decl_line
	.short	264                             ; DW_AT_data_member_location
	.byte	26                              ; Abbrev [26] 0x632:0xd DW_TAG_member
	.long	1066                            ; DW_AT_name
	.long	72                              ; DW_AT_type
	.byte	12                              ; DW_AT_decl_file
	.byte	131                             ; DW_AT_decl_line
	.short	268                             ; DW_AT_data_member_location
	.byte	0                               ; End Of Children Mark
	.byte	22                              ; Abbrev [22] 0x640:0xc DW_TAG_array_type
	.long	1492                            ; DW_AT_type
	.byte	23                              ; Abbrev [23] 0x645:0x6 DW_TAG_subrange_type
	.long	1185                            ; DW_AT_type
	.byte	29                              ; DW_AT_count
	.byte	0                               ; End Of Children Mark
	.byte	27                              ; Abbrev [27] 0x64c:0x34 DW_TAG_structure_type
	.long	1086                            ; DW_AT_name
	.short	528                             ; DW_AT_byte_size
	.byte	12                              ; DW_AT_decl_file
	.short	441                             ; DW_AT_decl_line
	.byte	15                              ; Abbrev [15] 0x656:0xd DW_TAG_member
	.long	1112                            ; DW_AT_name
	.long	1664                            ; DW_AT_type
	.byte	12                              ; DW_AT_decl_file
	.short	443                             ; DW_AT_decl_line
	.byte	0                               ; DW_AT_data_member_location
	.byte	28                              ; Abbrev [28] 0x663:0xe DW_TAG_member
	.long	1146                            ; DW_AT_name
	.long	72                              ; DW_AT_type
	.byte	12                              ; DW_AT_decl_file
	.short	444                             ; DW_AT_decl_line
	.short	512                             ; DW_AT_data_member_location
	.byte	28                              ; Abbrev [28] 0x671:0xe DW_TAG_member
	.long	1153                            ; DW_AT_name
	.long	72                              ; DW_AT_type
	.byte	12                              ; DW_AT_decl_file
	.short	445                             ; DW_AT_decl_line
	.short	516                             ; DW_AT_data_member_location
	.byte	0                               ; End Of Children Mark
	.byte	22                              ; Abbrev [22] 0x680:0xc DW_TAG_array_type
	.long	1676                            ; DW_AT_type
	.byte	23                              ; Abbrev [23] 0x685:0x6 DW_TAG_subrange_type
	.long	1185                            ; DW_AT_type
	.byte	32                              ; DW_AT_count
	.byte	0                               ; End Of Children Mark
	.byte	2                               ; Abbrev [2] 0x68c:0xb DW_TAG_typedef
	.long	1687                            ; DW_AT_type
	.long	1116                            ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	32                              ; DW_AT_decl_line
	.byte	3                               ; Abbrev [3] 0x697:0x7 DW_TAG_base_type
	.long	1128                            ; DW_AT_name
	.byte	7                               ; DW_AT_encoding
	.byte	16                              ; DW_AT_byte_size
	.byte	2                               ; Abbrev [2] 0x69e:0xb DW_TAG_typedef
	.long	1705                            ; DW_AT_type
	.long	1189                            ; DW_AT_name
	.byte	14                              ; DW_AT_decl_file
	.byte	31                              ; DW_AT_decl_line
	.byte	3                               ; Abbrev [3] 0x6a9:0x7 DW_TAG_base_type
	.long	1197                            ; DW_AT_name
	.byte	8                               ; DW_AT_encoding
	.byte	1                               ; DW_AT_byte_size
	.byte	13                              ; Abbrev [13] 0x6b0:0x5 DW_TAG_pointer_type
	.long	1717                            ; DW_AT_type
	.byte	29                              ; Abbrev [29] 0x6b5:0xb DW_TAG_subroutine_type
	.long	91                              ; DW_AT_type
                                        ; DW_AT_prototyped
	.byte	18                              ; Abbrev [18] 0x6ba:0x5 DW_TAG_formal_parameter
	.long	91                              ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	0                               ; End Of Children Mark
Ldebug_info_end0:
	.section	__DWARF,__debug_str,regular,debug
Linfo_string:
	.asciz	"Apple clang version 12.0.5 (clang-1205.0.22.11)" ; string offset=0
	.asciz	"sprr-srd.c"                    ; string offset=48
	.asciz	"/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk" ; string offset=59
	.asciz	"MacOSX.sdk"                    ; string offset=154
	.asciz	"/Users/xss/code"               ; string offset=165
	.asciz	"sigset_t"                      ; string offset=181
	.asciz	"__darwin_sigset_t"             ; string offset=190
	.asciz	"__uint32_t"                    ; string offset=208
	.asciz	"unsigned int"                  ; string offset=219
	.asciz	"uint64_t"                      ; string offset=232
	.asciz	"long long unsigned int"        ; string offset=241
	.asciz	"main"                          ; string offset=264
	.asciz	"bus_handler"                   ; string offset=269
	.asciz	"sev_handler"                   ; string offset=281
	.asciz	"write_sprr_perm"               ; string offset=293
	.asciz	"sprr_test"                     ; string offset=309
	.asciz	"make_sprr_val"                 ; string offset=319
	.asciz	"read_sprr_perm"                ; string offset=333
	.asciz	"can_read"                      ; string offset=348
	.asciz	"can_write"                     ; string offset=357
	.asciz	"can_exec"                      ; string offset=367
	.asciz	"int"                           ; string offset=376
	.asciz	"_Bool"                         ; string offset=380
	.asciz	"argc"                          ; string offset=386
	.asciz	"argv"                          ; string offset=391
	.asciz	"char"                          ; string offset=396
	.asciz	"sa"                            ; string offset=401
	.asciz	"sigaction"                     ; string offset=404
	.asciz	"__sigaction_u"                 ; string offset=414
	.asciz	"__sa_handler"                  ; string offset=428
	.asciz	"__sa_sigaction"                ; string offset=441
	.asciz	"__siginfo"                     ; string offset=456
	.asciz	"si_signo"                      ; string offset=466
	.asciz	"si_errno"                      ; string offset=475
	.asciz	"si_code"                       ; string offset=484
	.asciz	"si_pid"                        ; string offset=492
	.asciz	"pid_t"                         ; string offset=499
	.asciz	"__darwin_pid_t"                ; string offset=505
	.asciz	"__int32_t"                     ; string offset=520
	.asciz	"si_uid"                        ; string offset=530
	.asciz	"uid_t"                         ; string offset=537
	.asciz	"__darwin_uid_t"                ; string offset=543
	.asciz	"si_status"                     ; string offset=558
	.asciz	"si_addr"                       ; string offset=568
	.asciz	"si_value"                      ; string offset=576
	.asciz	"sigval"                        ; string offset=585
	.asciz	"sival_int"                     ; string offset=592
	.asciz	"sival_ptr"                     ; string offset=602
	.asciz	"si_band"                       ; string offset=612
	.asciz	"long int"                      ; string offset=620
	.asciz	"__pad"                         ; string offset=629
	.asciz	"long unsigned int"             ; string offset=635
	.asciz	"__ARRAY_SIZE_TYPE__"           ; string offset=653
	.asciz	"sa_mask"                       ; string offset=673
	.asciz	"sa_flags"                      ; string offset=681
	.asciz	"ptr"                           ; string offset=690
	.asciz	"uint32_t"                      ; string offset=694
	.asciz	"i"                             ; string offset=703
	.asciz	"signo"                         ; string offset=705
	.asciz	"info"                          ; string offset=711
	.asciz	"siginfo_t"                     ; string offset=716
	.asciz	"cx_"                           ; string offset=726
	.asciz	"cx"                            ; string offset=730
	.asciz	"ucontext_t"                    ; string offset=733
	.asciz	"__darwin_ucontext"             ; string offset=744
	.asciz	"uc_onstack"                    ; string offset=762
	.asciz	"uc_sigmask"                    ; string offset=773
	.asciz	"uc_stack"                      ; string offset=784
	.asciz	"__darwin_sigaltstack"          ; string offset=793
	.asciz	"ss_sp"                         ; string offset=814
	.asciz	"ss_size"                       ; string offset=820
	.asciz	"__darwin_size_t"               ; string offset=828
	.asciz	"ss_flags"                      ; string offset=844
	.asciz	"uc_link"                       ; string offset=853
	.asciz	"uc_mcsize"                     ; string offset=861
	.asciz	"uc_mcontext"                   ; string offset=871
	.asciz	"__darwin_mcontext64"           ; string offset=883
	.asciz	"__es"                          ; string offset=903
	.asciz	"__darwin_arm_exception_state64" ; string offset=908
	.asciz	"__far"                         ; string offset=939
	.asciz	"__uint64_t"                    ; string offset=945
	.asciz	"__esr"                         ; string offset=956
	.asciz	"__exception"                   ; string offset=962
	.asciz	"__ss"                          ; string offset=974
	.asciz	"__darwin_arm_thread_state64"   ; string offset=979
	.asciz	"__x"                           ; string offset=1007
	.asciz	"__opaque_fp"                   ; string offset=1011
	.asciz	"__opaque_lr"                   ; string offset=1023
	.asciz	"__opaque_sp"                   ; string offset=1035
	.asciz	"__opaque_pc"                   ; string offset=1047
	.asciz	"__cpsr"                        ; string offset=1059
	.asciz	"__opaque_flags"                ; string offset=1066
	.asciz	"__ns"                          ; string offset=1081
	.asciz	"__darwin_arm_neon_state64"     ; string offset=1086
	.asciz	"__v"                           ; string offset=1112
	.asciz	"__uint128_t"                   ; string offset=1116
	.asciz	"unsigned __int128"             ; string offset=1128
	.asciz	"__fpsr"                        ; string offset=1146
	.asciz	"__fpcr"                        ; string offset=1153
	.asciz	"__mcontext_data"               ; string offset=1160
	.asciz	"v"                             ; string offset=1176
	.asciz	"a"                             ; string offset=1178
	.asciz	"b"                             ; string offset=1180
	.asciz	"nibble"                        ; string offset=1182
	.asciz	"uint8_t"                       ; string offset=1189
	.asciz	"unsigned char"                 ; string offset=1197
	.asciz	"res"                           ; string offset=1211
	.asciz	"fun_ptr"                       ; string offset=1215
	.section	__DWARF,__apple_names,regular,debug
Lnames_begin:
	.long	1212240712                      ; Header Magic
	.short	1                               ; Header Version
	.short	0                               ; Header Hash Function
	.long	10                              ; Header Bucket Count
	.long	10                              ; Header Hash Count
	.long	12                              ; Header Data Length
	.long	0                               ; HeaderData Die Offset Base
	.long	1                               ; HeaderData Atom Count
	.short	1                               ; DW_ATOM_die_offset
	.short	6                               ; DW_FORM_data4
	.long	0                               ; Bucket 0
	.long	2                               ; Bucket 1
	.long	3                               ; Bucket 2
	.long	4                               ; Bucket 3
	.long	-1                              ; Bucket 4
	.long	-1                              ; Bucket 5
	.long	6                               ; Bucket 6
	.long	7                               ; Bucket 7
	.long	9                               ; Bucket 8
	.long	-1                              ; Bucket 9
	.long	33327980                        ; Hash in Bucket 0
	.long	-321079206                      ; Hash in Bucket 0
	.long	905971691                       ; Hash in Bucket 1
	.long	193490162                       ; Hash in Bucket 2
	.long	193043803                       ; Hash in Bucket 3
	.long	-81525013                       ; Hash in Bucket 3
	.long	2090499946                      ; Hash in Bucket 6
	.long	2096614177                      ; Hash in Bucket 7
	.long	-994525399                      ; Hash in Bucket 7
	.long	-101657168                      ; Hash in Bucket 8
.set Lset16, LNames4-Lnames_begin       ; Offset in Bucket 0
	.long	Lset16
.set Lset17, LNames5-Lnames_begin       ; Offset in Bucket 0
	.long	Lset17
.set Lset18, LNames6-Lnames_begin       ; Offset in Bucket 1
	.long	Lset18
.set Lset19, LNames9-Lnames_begin       ; Offset in Bucket 2
	.long	Lset19
.set Lset20, LNames0-Lnames_begin       ; Offset in Bucket 3
	.long	Lset20
.set Lset21, LNames3-Lnames_begin       ; Offset in Bucket 3
	.long	Lset21
.set Lset22, LNames2-Lnames_begin       ; Offset in Bucket 6
	.long	Lset22
.set Lset23, LNames8-Lnames_begin       ; Offset in Bucket 7
	.long	Lset23
.set Lset24, LNames1-Lnames_begin       ; Offset in Bucket 7
	.long	Lset24
.set Lset25, LNames7-Lnames_begin       ; Offset in Bucket 8
	.long	Lset25
LNames4:
	.long	269                             ; bus_handler
	.long	1                               ; Num DIEs
	.long	219
	.long	0
LNames5:
	.long	333                             ; read_sprr_perm
	.long	1                               ; Num DIEs
	.long	571
	.long	0
LNames6:
	.long	319                             ; make_sprr_val
	.long	1                               ; Num DIEs
	.long	489
	.long	0
LNames9:
	.long	348                             ; can_read
	.long	1                               ; Num DIEs
	.long	611
	.long	0
LNames0:
	.long	367                             ; can_exec
	.long	1                               ; Num DIEs
	.long	719
	.long	0
LNames3:
	.long	309                             ; sprr_test
	.long	1                               ; Num DIEs
	.long	411
	.long	0
LNames2:
	.long	264                             ; main
	.long	1                               ; Num DIEs
	.long	109
	.long	0
LNames8:
	.long	357                             ; can_write
	.long	1                               ; Num DIEs
	.long	665
	.long	0
LNames1:
	.long	293                             ; write_sprr_perm
	.long	1                               ; Num DIEs
	.long	375
	.long	0
LNames7:
	.long	281                             ; sev_handler
	.long	1                               ; Num DIEs
	.long	297
	.long	0
	.section	__DWARF,__apple_objc,regular,debug
Lobjc_begin:
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
	.long	18                              ; Header Bucket Count
	.long	36                              ; Header Hash Count
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
	.long	3                               ; Bucket 1
	.long	5                               ; Bucket 2
	.long	8                               ; Bucket 3
	.long	10                              ; Bucket 4
	.long	11                              ; Bucket 5
	.long	13                              ; Bucket 6
	.long	15                              ; Bucket 7
	.long	18                              ; Bucket 8
	.long	-1                              ; Bucket 9
	.long	20                              ; Bucket 10
	.long	22                              ; Bucket 11
	.long	26                              ; Bucket 12
	.long	27                              ; Bucket 13
	.long	29                              ; Bucket 14
	.long	30                              ; Bucket 15
	.long	31                              ; Bucket 16
	.long	33                              ; Bucket 17
	.long	89027496                        ; Hash in Bucket 0
	.long	1950534918                      ; Hash in Bucket 0
	.long	-1880351968                     ; Hash in Bucket 0
	.long	466014187                       ; Hash in Bucket 1
	.long	-547304637                      ; Hash in Bucket 1
	.long	193495088                       ; Hash in Bucket 2
	.long	249311216                       ; Hash in Bucket 2
	.long	-2056653344                     ; Hash in Bucket 2
	.long	461127873                       ; Hash in Bucket 3
	.long	580916487                       ; Hash in Bucket 3
	.long	276790522                       ; Hash in Bucket 4
	.long	-1304652851                     ; Hash in Bucket 5
	.long	-594775205                      ; Hash in Bucket 5
	.long	897561888                       ; Hash in Bucket 6
	.long	-627816040                      ; Hash in Bucket 6
	.long	679906663                       ; Hash in Bucket 7
	.long	-282664779                      ; Hash in Bucket 7
	.long	-142298025                      ; Hash in Bucket 7
	.long	290821634                       ; Hash in Bucket 8
	.long	1835292518                      ; Hash in Bucket 8
	.long	789719536                       ; Hash in Bucket 10
	.long	-1263457614                     ; Hash in Bucket 10
	.long	688950281                       ; Hash in Bucket 11
	.long	-2056763333                     ; Hash in Bucket 11
	.long	-1571268449                     ; Hash in Bucket 11
	.long	-80380739                       ; Hash in Bucket 11
	.long	255285318                       ; Hash in Bucket 12
	.long	270860917                       ; Hash in Bucket 13
	.long	-69895251                       ; Hash in Bucket 13
	.long	-104093792                      ; Hash in Bucket 14
	.long	843871857                       ; Hash in Bucket 15
	.long	1771224946                      ; Hash in Bucket 16
	.long	-136368420                      ; Hash in Bucket 16
	.long	290711645                       ; Hash in Bucket 17
	.long	1175294177                      ; Hash in Bucket 17
	.long	2090147939                      ; Hash in Bucket 17
.set Lset26, Ltypes1-Ltypes_begin       ; Offset in Bucket 0
	.long	Lset26
.set Lset27, Ltypes25-Ltypes_begin      ; Offset in Bucket 0
	.long	Lset27
.set Lset28, Ltypes16-Ltypes_begin      ; Offset in Bucket 0
	.long	Lset28
.set Lset29, Ltypes24-Ltypes_begin      ; Offset in Bucket 1
	.long	Lset29
.set Lset30, Ltypes19-Ltypes_begin      ; Offset in Bucket 1
	.long	Lset30
.set Lset31, Ltypes3-Ltypes_begin       ; Offset in Bucket 2
	.long	Lset31
.set Lset32, Ltypes4-Ltypes_begin       ; Offset in Bucket 2
	.long	Lset32
.set Lset33, Ltypes17-Ltypes_begin      ; Offset in Bucket 2
	.long	Lset33
.set Lset34, Ltypes35-Ltypes_begin      ; Offset in Bucket 3
	.long	Lset34
.set Lset35, Ltypes22-Ltypes_begin      ; Offset in Bucket 3
	.long	Lset35
.set Lset36, Ltypes11-Ltypes_begin      ; Offset in Bucket 4
	.long	Lset36
.set Lset37, Ltypes2-Ltypes_begin       ; Offset in Bucket 5
	.long	Lset37
.set Lset38, Ltypes30-Ltypes_begin      ; Offset in Bucket 5
	.long	Lset38
.set Lset39, Ltypes31-Ltypes_begin      ; Offset in Bucket 6
	.long	Lset39
.set Lset40, Ltypes28-Ltypes_begin      ; Offset in Bucket 6
	.long	Lset40
.set Lset41, Ltypes21-Ltypes_begin      ; Offset in Bucket 7
	.long	Lset41
.set Lset42, Ltypes9-Ltypes_begin       ; Offset in Bucket 7
	.long	Lset42
.set Lset43, Ltypes10-Ltypes_begin      ; Offset in Bucket 7
	.long	Lset43
.set Lset44, Ltypes33-Ltypes_begin      ; Offset in Bucket 8
	.long	Lset44
.set Lset45, Ltypes0-Ltypes_begin       ; Offset in Bucket 8
	.long	Lset45
.set Lset46, Ltypes6-Ltypes_begin       ; Offset in Bucket 10
	.long	Lset46
.set Lset47, Ltypes27-Ltypes_begin      ; Offset in Bucket 10
	.long	Lset47
.set Lset48, Ltypes23-Ltypes_begin      ; Offset in Bucket 11
	.long	Lset48
.set Lset49, Ltypes29-Ltypes_begin      ; Offset in Bucket 11
	.long	Lset49
.set Lset50, Ltypes15-Ltypes_begin      ; Offset in Bucket 11
	.long	Lset50
.set Lset51, Ltypes14-Ltypes_begin      ; Offset in Bucket 11
	.long	Lset51
.set Lset52, Ltypes20-Ltypes_begin      ; Offset in Bucket 12
	.long	Lset52
.set Lset53, Ltypes8-Ltypes_begin       ; Offset in Bucket 13
	.long	Lset53
.set Lset54, Ltypes26-Ltypes_begin      ; Offset in Bucket 13
	.long	Lset54
.set Lset55, Ltypes34-Ltypes_begin      ; Offset in Bucket 14
	.long	Lset55
.set Lset56, Ltypes7-Ltypes_begin       ; Offset in Bucket 15
	.long	Lset56
.set Lset57, Ltypes5-Ltypes_begin       ; Offset in Bucket 16
	.long	Lset57
.set Lset58, Ltypes12-Ltypes_begin      ; Offset in Bucket 16
	.long	Lset58
.set Lset59, Ltypes13-Ltypes_begin      ; Offset in Bucket 17
	.long	Lset59
.set Lset60, Ltypes32-Ltypes_begin      ; Offset in Bucket 17
	.long	Lset60
.set Lset61, Ltypes18-Ltypes_begin      ; Offset in Bucket 17
	.long	Lset61
Ltypes1:
	.long	979                             ; __darwin_arm_thread_state64
	.long	1                               ; Num DIEs
	.long	1503
	.short	19
	.byte	0
	.long	0
Ltypes25:
	.long	520                             ; __int32_t
	.long	1                               ; Num DIEs
	.long	1093
	.short	22
	.byte	0
	.long	0
Ltypes16:
	.long	620                             ; long int
	.long	1                               ; Num DIEs
	.long	1159
	.short	36
	.byte	0
	.long	0
Ltypes24:
	.long	585                             ; sigval
	.long	1                               ; Num DIEs
	.long	1126
	.short	23
	.byte	0
	.long	0
Ltypes19:
	.long	883                             ; __darwin_mcontext64
	.long	1                               ; Num DIEs
	.long	1400
	.short	19
	.byte	0
	.long	0
Ltypes3:
	.long	376                             ; int
	.long	1                               ; Num DIEs
	.long	787
	.short	36
	.byte	0
	.long	0
Ltypes4:
	.long	380                             ; _Bool
	.long	1                               ; Num DIEs
	.long	794
	.short	36
	.byte	0
	.long	0
Ltypes17:
	.long	945                             ; __uint64_t
	.long	1                               ; Num DIEs
	.long	1492
	.short	22
	.byte	0
	.long	0
Ltypes35:
	.long	793                             ; __darwin_sigaltstack
	.long	1                               ; Num DIEs
	.long	1334
	.short	19
	.byte	0
	.long	0
Ltypes22:
	.long	716                             ; siginfo_t
	.long	1                               ; Num DIEs
	.long	1213
	.short	22
	.byte	0
	.long	0
Ltypes11:
	.long	537                             ; uid_t
	.long	1                               ; Num DIEs
	.long	1104
	.short	22
	.byte	0
	.long	0
Ltypes2:
	.long	219                             ; unsigned int
	.long	1                               ; Num DIEs
	.long	83
	.short	36
	.byte	0
	.long	0
Ltypes30:
	.long	653                             ; __ARRAY_SIZE_TYPE__
	.long	1                               ; Num DIEs
	.long	1185
	.short	36
	.byte	0
	.long	0
Ltypes31:
	.long	1086                            ; __darwin_arm_neon_state64
	.long	1                               ; Num DIEs
	.long	1612
	.short	19
	.byte	0
	.long	0
Ltypes28:
	.long	414                             ; __sigaction_u
	.long	1                               ; Num DIEs
	.long	867
	.short	23
	.byte	0
	.long	0
Ltypes21:
	.long	181                             ; sigset_t
	.long	1                               ; Num DIEs
	.long	50
	.short	22
	.byte	0
	.long	0
Ltypes9:
	.long	828                             ; __darwin_size_t
	.long	1                               ; Num DIEs
	.long	1379
	.short	22
	.byte	0
	.long	0
Ltypes10:
	.long	505                             ; __darwin_pid_t
	.long	1                               ; Num DIEs
	.long	1082
	.short	22
	.byte	0
	.long	0
Ltypes33:
	.long	232                             ; uint64_t
	.long	1                               ; Num DIEs
	.long	91
	.short	22
	.byte	0
	.long	0
Ltypes0:
	.long	1128                            ; unsigned __int128
	.long	1                               ; Num DIEs
	.long	1687
	.short	36
	.byte	0
	.long	0
Ltypes6:
	.long	1189                            ; uint8_t
	.long	1                               ; Num DIEs
	.long	1694
	.short	22
	.byte	0
	.long	0
Ltypes27:
	.long	733                             ; ucontext_t
	.long	1                               ; Num DIEs
	.long	1229
	.short	22
	.byte	0
	.long	0
Ltypes23:
	.long	190                             ; __darwin_sigset_t
	.long	1                               ; Num DIEs
	.long	61
	.short	22
	.byte	0
	.long	0
Ltypes29:
	.long	208                             ; __uint32_t
	.long	1                               ; Num DIEs
	.long	72
	.short	22
	.byte	0
	.long	0
Ltypes15:
	.long	908                             ; __darwin_arm_exception_state64
	.long	1                               ; Num DIEs
	.long	1447
	.short	19
	.byte	0
	.long	0
Ltypes14:
	.long	635                             ; long unsigned int
	.long	1                               ; Num DIEs
	.long	1178
	.short	36
	.byte	0
	.long	0
Ltypes20:
	.long	404                             ; sigaction
	.long	1                               ; Num DIEs
	.long	818
	.short	19
	.byte	0
	.long	0
Ltypes8:
	.long	499                             ; pid_t
	.long	1                               ; Num DIEs
	.long	1071
	.short	22
	.byte	0
	.long	0
Ltypes26:
	.long	241                             ; long long unsigned int
	.long	1                               ; Num DIEs
	.long	102
	.short	36
	.byte	0
	.long	0
Ltypes34:
	.long	1197                            ; unsigned char
	.long	1                               ; Num DIEs
	.long	1705
	.short	36
	.byte	0
	.long	0
Ltypes7:
	.long	1116                            ; __uint128_t
	.long	1                               ; Num DIEs
	.long	1676
	.short	22
	.byte	0
	.long	0
Ltypes5:
	.long	456                             ; __siginfo
	.long	1                               ; Num DIEs
	.long	942
	.short	19
	.byte	0
	.long	0
Ltypes12:
	.long	543                             ; __darwin_uid_t
	.long	1                               ; Num DIEs
	.long	1115
	.short	22
	.byte	0
	.long	0
Ltypes13:
	.long	694                             ; uint32_t
	.long	1                               ; Num DIEs
	.long	1197
	.short	22
	.byte	0
	.long	0
Ltypes32:
	.long	744                             ; __darwin_ucontext
	.long	1                               ; Num DIEs
	.long	1240
	.short	19
	.byte	0
	.long	0
Ltypes18:
	.long	396                             ; char
	.long	1                               ; Num DIEs
	.long	811
	.short	36
	.byte	0
	.long	0
.subsections_via_symbols
	.section	__DWARF,__debug_line,regular,debug
Lsection_line:
Lline_table_start0:
