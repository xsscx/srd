#define INSTR_TO_PATCH_ADDR 0x802a3cc4
#define DISABLE_BYTES       0x20002000 // movs r0, 0x0 x 2
#define ENABLE_BYTES        0x4000f021 // bic r0, r1, 0x80000000
#include <stdio.h>
#include <string.h>
char *str = "2021SRDC";
int main() {
    printf("ptr %p\n", str);

    return 0;
}
