#include <time.h>
#include <stdio.h>

int main(){
    clock_t start = clock();
    // Execuatable code
    clock_t stop = clock();
    double elapsed = (double)(stop - start) * 1000.0 / CLOCKS_PER_SEC;
    printf("Time elapsed in ms: %f\n", elapsed);
}
