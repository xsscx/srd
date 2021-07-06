// This is a working file with only readable iphone 11 registers.. the Repo contains a very high Signal to Noise Ratio and this file is meant to provide clarity on what you should expect to READ on the iPhone 11
// Last updated Tuesday 6 June 2021 at 1100 US Eastern by SRD0009 | @h02332
// Target Audience = Anyone
// Target Use = Apple Security Research Device
//
#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>
#define get_reg(id) ({					\
		unsigned long __val;				\
		asm("mrs %0, "#id : "=r" (__val));		\
		printf("%-20s: 0x%016lx\n", #id, __val);	\
	})

int main(void)

{
	
	get_reg(s3_5_c15_c10_1);
	get_reg(s3_6_c15_c1_6);
	

	return 0;
}
