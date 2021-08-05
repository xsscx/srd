#include <stdio.h>
#include <os/log.h>
#include <unistd.h>

int main() {
    pid_t pid = getpid();
	printf("Hello researcher from pid %d!\n", pid);
    os_log_t log = os_log_create("com.example.cryptex", "hello");
    os_log_info(log, "Hello researcher from pid %d!", pid);
	return 0;
}
