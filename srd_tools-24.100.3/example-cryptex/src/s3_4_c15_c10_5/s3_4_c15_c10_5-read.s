	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 11, 0	sdk_version 11, 3
	.ptrauth_abi_version 0
	.globl	_write_sprr                     ; -- Begin function write_sprr
	.p2align	2
_write_sprr:                            ; @write_sprr
Lfunc_begin0:
	.file	1 "/Users/xss/example-cryptex/src/test" "s3_4_c15_c10_5-read.c"
	.loc	1 8 0                           ; s3_4_c15_c10_5-read.c:8:0
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16                     ; =16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
Ltmp1:
	.loc	1 10 43 prologue_end            ; s3_4_c15_c10_5-read.c:10:43
	ldr	x8, [sp, #8]
	.loc	1 9 5                           ; s3_4_c15_c10_5-read.c:9:5
	; InlineAsm Start
	msr	S3_4_C15_C10_5, x8
	isb

	; InlineAsm End
	.loc	1 12 1                          ; s3_4_c15_c10_5-read.c:12:1
	add	sp, sp, #16                     ; =16
	ret
Ltmp2:
Lfunc_end0:
	.cfi_endproc
                                        ; -- End function
	.globl	_read_sprr                      ; -- Begin function read_sprr
	.p2align	2
_read_sprr:                             ; @read_sprr
Lfunc_begin1:
	.loc	1 15 0                          ; s3_4_c15_c10_5-read.c:15:0
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16                     ; =16
	.cfi_def_cfa_offset 16
Ltmp4:
	.loc	1 17 5 prologue_end             ; s3_4_c15_c10_5-read.c:17:5
	; InlineAsm Start
	isb
	mrs	x8, S3_4_C15_C10_5

	; InlineAsm End
	str	x8, [sp, #8]
	.loc	1 20 12                         ; s3_4_c15_c10_5-read.c:20:12
	ldr	x0, [sp, #8]
	.loc	1 20 5 is_stmt 0                ; s3_4_c15_c10_5-read.c:20:5
	add	sp, sp, #16                     ; =16
	ret
Ltmp5:
Lfunc_end1:
	.cfi_endproc
                                        ; -- End function
	.globl	_main                           ; -- Begin function main
	.p2align	2
_main:                                  ; @main
Lfunc_begin2:
	.loc	1 25 0 is_stmt 1                ; s3_4_c15_c10_5-read.c:25:0
	.cfi_startproc
; %bb.0:
	pacibsp
	sub	sp, sp, #80                     ; =80
	stp	x29, x30, [sp, #64]             ; 16-byte Folded Spill
	add	x29, sp, #64                    ; =64
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	wzr, [x29, #-4]
	stur	w0, [x29, #-8]
	stur	x1, [x29, #-16]
Ltmp6:
	.loc	1 26 14 prologue_end            ; s3_4_c15_c10_5-read.c:26:14
	stur	wzr, [x29, #-20]
LBB2_1:                                 ; =>This Inner Loop Header: Depth=1
Ltmp7:
	.loc	1 26 21 is_stmt 0               ; s3_4_c15_c10_5-read.c:26:21
	ldur	w8, [x29, #-20]
Ltmp8:
	.loc	1 26 5                          ; s3_4_c15_c10_5-read.c:26:5
	cmp	w8, #64                         ; =64
	b.ge	LBB2_4
; %bb.2:                                ;   in Loop: Header=BB2_1 Depth=1
Ltmp9:
	.loc	1 28 54 is_stmt 1               ; s3_4_c15_c10_5-read.c:28:54
	ldur	w8, [x29, #-20]
                                        ; implicit-def: $x0
	mov	x0, x8
	str	x0, [sp, #32]                   ; 8-byte Folded Spill
	.loc	1 28 57 is_stmt 0               ; s3_4_c15_c10_5-read.c:28:57
	bl	_read_sprr
	.loc	1 0 0                           ; s3_4_c15_c10_5-read.c:0:0
	adrp	x9, l_.str@PAGE
	add	x9, x9, l_.str@PAGEOFF
	str	x0, [sp, #24]                   ; 8-byte Folded Spill
	.loc	1 28 9                          ; s3_4_c15_c10_5-read.c:28:9
	mov	x0, x9
	mov	x9, sp
	ldr	x10, [sp, #32]                  ; 8-byte Folded Reload
	str	x10, [x9]
	ldr	x11, [sp, #24]                  ; 8-byte Folded Reload
	str	x11, [x9, #8]
	bl	_printf
Ltmp10:
; %bb.3:                                ;   in Loop: Header=BB2_1 Depth=1
	.loc	1 26 29 is_stmt 1               ; s3_4_c15_c10_5-read.c:26:29
	ldur	w8, [x29, #-20]
	add	w8, w8, #1                      ; =1
	stur	w8, [x29, #-20]
	.loc	1 26 5 is_stmt 0                ; s3_4_c15_c10_5-read.c:26:5
	b	LBB2_1
Ltmp11:
LBB2_4:
	.loc	1 30 1 is_stmt 1                ; s3_4_c15_c10_5-read.c:30:1
	ldur	w0, [x29, #-4]
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	add	sp, sp, #80                     ; =80
	retab
Ltmp12:
Lfunc_end2:
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__cstring,cstring_literals
l_.str:                                 ; @.str
	.asciz	"s3_4_c15_c10_5 bit %02d: %016llx\n"

	.file	2 "/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/_types" "_uint64_t.h"
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
	.byte	3                               ; Abbreviation Code
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
	.byte	4                               ; Abbreviation Code
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
	.byte	5                               ; Abbreviation Code
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
	.byte	6                               ; Abbreviation Code
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
	.byte	7                               ; Abbreviation Code
	.byte	11                              ; DW_TAG_lexical_block
	.byte	1                               ; DW_CHILDREN_yes
	.byte	17                              ; DW_AT_low_pc
	.byte	1                               ; DW_FORM_addr
	.byte	18                              ; DW_AT_high_pc
	.byte	6                               ; DW_FORM_data4
	.byte	0                               ; EOM(1)
	.byte	0                               ; EOM(2)
	.byte	8                               ; Abbreviation Code
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
	.byte	9                               ; Abbreviation Code
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
	.byte	10                              ; Abbreviation Code
	.byte	15                              ; DW_TAG_pointer_type
	.byte	0                               ; DW_CHILDREN_no
	.byte	73                              ; DW_AT_type
	.byte	19                              ; DW_FORM_ref4
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
	.byte	1                               ; Abbrev [1] 0xb:0xf0 DW_TAG_compile_unit
	.long	0                               ; DW_AT_producer
	.short	12                              ; DW_AT_language
	.long	48                              ; DW_AT_name
	.long	70                              ; DW_AT_LLVM_sysroot
	.long	165                             ; DW_AT_APPLE_sdk
.set Lset2, Lline_table_start0-Lsection_line ; DW_AT_stmt_list
	.long	Lset2
	.long	176                             ; DW_AT_comp_dir
	.quad	Lfunc_begin0                    ; DW_AT_low_pc
.set Lset3, Lfunc_end2-Lfunc_begin0     ; DW_AT_high_pc
	.long	Lset3
	.byte	2                               ; Abbrev [2] 0x32:0x24 DW_TAG_subprogram
	.quad	Lfunc_begin0                    ; DW_AT_low_pc
.set Lset4, Lfunc_end0-Lfunc_begin0     ; DW_AT_high_pc
	.long	Lset4
                                        ; DW_AT_APPLE_omit_frame_ptr
	.byte	1                               ; DW_AT_frame_base
	.byte	111
	.long	212                             ; DW_AT_name
	.byte	1                               ; DW_AT_decl_file
	.byte	7                               ; DW_AT_decl_line
                                        ; DW_AT_prototyped
                                        ; DW_AT_external
	.byte	3                               ; Abbrev [3] 0x47:0xe DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	8
	.long	274                             ; DW_AT_name
	.byte	1                               ; DW_AT_decl_file
	.byte	7                               ; DW_AT_decl_line
	.long	208                             ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	4                               ; Abbrev [4] 0x56:0x28 DW_TAG_subprogram
	.quad	Lfunc_begin1                    ; DW_AT_low_pc
.set Lset5, Lfunc_end1-Lfunc_begin1     ; DW_AT_high_pc
	.long	Lset5
                                        ; DW_AT_APPLE_omit_frame_ptr
	.byte	1                               ; DW_AT_frame_base
	.byte	111
	.long	223                             ; DW_AT_name
	.byte	1                               ; DW_AT_decl_file
	.byte	14                              ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.long	208                             ; DW_AT_type
                                        ; DW_AT_external
	.byte	5                               ; Abbrev [5] 0x6f:0xe DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	8
	.long	274                             ; DW_AT_name
	.byte	1                               ; DW_AT_decl_file
	.byte	16                              ; DW_AT_decl_line
	.long	208                             ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	6                               ; Abbrev [6] 0x7e:0x52 DW_TAG_subprogram
	.quad	Lfunc_begin2                    ; DW_AT_low_pc
.set Lset6, Lfunc_end2-Lfunc_begin2     ; DW_AT_high_pc
	.long	Lset6
	.byte	1                               ; DW_AT_frame_base
	.byte	109
	.long	233                             ; DW_AT_name
	.byte	1                               ; DW_AT_decl_file
	.byte	24                              ; DW_AT_decl_line
                                        ; DW_AT_prototyped
	.long	226                             ; DW_AT_type
                                        ; DW_AT_external
	.byte	3                               ; Abbrev [3] 0x97:0xe DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	120
	.long	276                             ; DW_AT_name
	.byte	1                               ; DW_AT_decl_file
	.byte	24                              ; DW_AT_decl_line
	.long	226                             ; DW_AT_type
	.byte	3                               ; Abbrev [3] 0xa5:0xe DW_TAG_formal_parameter
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	112
	.long	281                             ; DW_AT_name
	.byte	1                               ; DW_AT_decl_file
	.byte	24                              ; DW_AT_decl_line
	.long	233                             ; DW_AT_type
	.byte	7                               ; Abbrev [7] 0xb3:0x1c DW_TAG_lexical_block
	.quad	Ltmp6                           ; DW_AT_low_pc
.set Lset7, Ltmp11-Ltmp6                ; DW_AT_high_pc
	.long	Lset7
	.byte	5                               ; Abbrev [5] 0xc0:0xe DW_TAG_variable
	.byte	2                               ; DW_AT_location
	.byte	145
	.byte	108
	.long	291                             ; DW_AT_name
	.byte	1                               ; DW_AT_decl_file
	.byte	26                              ; DW_AT_decl_line
	.long	226                             ; DW_AT_type
	.byte	0                               ; End Of Children Mark
	.byte	0                               ; End Of Children Mark
	.byte	8                               ; Abbrev [8] 0xd0:0xb DW_TAG_typedef
	.long	219                             ; DW_AT_type
	.long	238                             ; DW_AT_name
	.byte	2                               ; DW_AT_decl_file
	.byte	31                              ; DW_AT_decl_line
	.byte	9                               ; Abbrev [9] 0xdb:0x7 DW_TAG_base_type
	.long	247                             ; DW_AT_name
	.byte	7                               ; DW_AT_encoding
	.byte	8                               ; DW_AT_byte_size
	.byte	9                               ; Abbrev [9] 0xe2:0x7 DW_TAG_base_type
	.long	270                             ; DW_AT_name
	.byte	5                               ; DW_AT_encoding
	.byte	4                               ; DW_AT_byte_size
	.byte	10                              ; Abbrev [10] 0xe9:0x5 DW_TAG_pointer_type
	.long	238                             ; DW_AT_type
	.byte	10                              ; Abbrev [10] 0xee:0x5 DW_TAG_pointer_type
	.long	243                             ; DW_AT_type
	.byte	9                               ; Abbrev [9] 0xf3:0x7 DW_TAG_base_type
	.long	286                             ; DW_AT_name
	.byte	6                               ; DW_AT_encoding
	.byte	1                               ; DW_AT_byte_size
	.byte	0                               ; End Of Children Mark
Ldebug_info_end0:
	.section	__DWARF,__debug_str,regular,debug
Linfo_string:
	.asciz	"Apple clang version 12.0.5 (clang-1205.0.22.11)" ; string offset=0
	.asciz	"s3_4_c15_c10_5-read.c"         ; string offset=48
	.asciz	"/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk" ; string offset=70
	.asciz	"MacOSX.sdk"                    ; string offset=165
	.asciz	"/Users/xss/example-cryptex/src/test" ; string offset=176
	.asciz	"write_sprr"                    ; string offset=212
	.asciz	"read_sprr"                     ; string offset=223
	.asciz	"main"                          ; string offset=233
	.asciz	"uint64_t"                      ; string offset=238
	.asciz	"long long unsigned int"        ; string offset=247
	.asciz	"int"                           ; string offset=270
	.asciz	"v"                             ; string offset=274
	.asciz	"argc"                          ; string offset=276
	.asciz	"argv"                          ; string offset=281
	.asciz	"char"                          ; string offset=286
	.asciz	"i"                             ; string offset=291
	.section	__DWARF,__apple_names,regular,debug
Lnames_begin:
	.long	1212240712                      ; Header Magic
	.short	1                               ; Header Version
	.short	0                               ; Header Hash Function
	.long	3                               ; Header Bucket Count
	.long	3                               ; Header Hash Count
	.long	12                              ; Header Data Length
	.long	0                               ; HeaderData Die Offset Base
	.long	1                               ; HeaderData Atom Count
	.short	1                               ; DW_ATOM_die_offset
	.short	6                               ; DW_FORM_data4
	.long	-1                              ; Bucket 0
	.long	0                               ; Bucket 1
	.long	2                               ; Bucket 2
	.long	579653863                       ; Hash in Bucket 1
	.long	2090499946                      ; Hash in Bucket 1
	.long	-1326015914                     ; Hash in Bucket 2
.set Lset8, LNames1-Lnames_begin        ; Offset in Bucket 1
	.long	Lset8
.set Lset9, LNames2-Lnames_begin        ; Offset in Bucket 1
	.long	Lset9
.set Lset10, LNames0-Lnames_begin       ; Offset in Bucket 2
	.long	Lset10
LNames1:
	.long	223                             ; read_sprr
	.long	1                               ; Num DIEs
	.long	86
	.long	0
LNames2:
	.long	233                             ; main
	.long	1                               ; Num DIEs
	.long	126
	.long	0
LNames0:
	.long	212                             ; write_sprr
	.long	1                               ; Num DIEs
	.long	50
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
	.long	4                               ; Header Bucket Count
	.long	4                               ; Header Hash Count
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
	.long	2                               ; Bucket 2
	.long	3                               ; Bucket 3
	.long	193495088                       ; Hash in Bucket 0
	.long	-69895251                       ; Hash in Bucket 1
	.long	290821634                       ; Hash in Bucket 2
	.long	2090147939                      ; Hash in Bucket 3
.set Lset11, Ltypes1-Ltypes_begin       ; Offset in Bucket 0
	.long	Lset11
.set Lset12, Ltypes0-Ltypes_begin       ; Offset in Bucket 1
	.long	Lset12
.set Lset13, Ltypes2-Ltypes_begin       ; Offset in Bucket 2
	.long	Lset13
.set Lset14, Ltypes3-Ltypes_begin       ; Offset in Bucket 3
	.long	Lset14
Ltypes1:
	.long	270                             ; int
	.long	1                               ; Num DIEs
	.long	226
	.short	36
	.byte	0
	.long	0
Ltypes0:
	.long	247                             ; long long unsigned int
	.long	1                               ; Num DIEs
	.long	219
	.short	36
	.byte	0
	.long	0
Ltypes2:
	.long	238                             ; uint64_t
	.long	1                               ; Num DIEs
	.long	208
	.short	22
	.byte	0
	.long	0
Ltypes3:
	.long	286                             ; char
	.long	1                               ; Num DIEs
	.long	243
	.short	36
	.byte	0
	.long	0
.subsections_via_symbols
	.section	__DWARF,__debug_line,regular,debug
Lsection_line:
Lline_table_start0:
