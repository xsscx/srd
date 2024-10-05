#import <mach-o/utils.h>
#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    if (argc < 2) {
        printf("Usage: %s <Mach-O file path>\n", argv[0]);
        return 1;
    }
    
    int result = macho_best_slice(argv[1], 
    ^(const struct mach_header* _Nonnull slice, uint64_t sliceFileOffset, size_t sliceSize) {
        const char *archName = macho_arch_name_for_mach_header(slice);
        if (archName == NULL) {
            printf("Unable to determine architecture name.\n");
            return;
        }
        
        printf("Best architecture\n");
        printf(" Name: %s\n", archName);
        printf(" Size: %zu (%#zx)\n", sliceSize, sliceSize);
        printf(" Offset: %llu (%#llx)\n", sliceFileOffset, sliceFileOffset);
    });
    
    if(0 != result) {
        printf("ERROR: macho_best_slice failed with %d/%#x\n", result, result);
    }
    
    return 0;
}

