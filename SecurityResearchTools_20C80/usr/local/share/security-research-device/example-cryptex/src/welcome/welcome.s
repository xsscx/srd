	.section	__TEXT,__text,regular,pure_instructions
	.build_version ios, 14, 0	sdk_version 14, 3
	.ptrauth_abi_version 0
	.globl	_main                           ; -- Begin function main
	.p2align	2
_main:                                  ; @main
	.cfi_startproc
; %bb.0:
	pacibsp
	sub	sp, sp, #32                     ; =32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16                    ; =16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	mov	w8, #0
	stur	wzr, [x29, #-4]
	adrp	x0, l_.str@PAGE
	add	x0, x0, l_.str@PAGEOFF
	str	w8, [sp, #8]                    ; 4-byte Folded Spill
	bl	_printf
	ldr	w8, [sp, #8]                    ; 4-byte Folded Reload
	mov	x0, x8
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32                     ; =32
	retab
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__cstring,cstring_literals
l_.str:                                 ; @.str
	.asciz	"Welcome to the Apple Security Research Device\n"

.subsections_via_symbols
