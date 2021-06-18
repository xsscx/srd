#include <errno.h>
#include <stdbool.h>
#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <string.h>
#include <os/log.h>

int main(int argc, char *argv[]) {
	char *path = NULL;
	char *cryptex_root = getenv("CRYPTEX_MOUNT_PATH");
    os_log_t log = os_log_create("com.example.cryptex", "cryptex-run");

	if (argc < 2) {
        os_log_error(log,"Usage: %s command args ...\n", argv[0]);
		fprintf(stderr, "Usage: %s command args ...\n", argv[0]);
		exit(1);
	}
    if (cryptex_root == NULL) {
        os_log_error(log,"CRYPTEX_MOUNT_PATH not in environment.\n");
        fprintf(stderr, "CRYPTEX_MOUNT_PATH not in environment.\n");
        exit(1);
    }
	char **binary = ++argv;
	char **args = binary;
    errno_t error = 0;
	asprintf(&path, "%s/usr/bin:%s/bin:%s",
		cryptex_root, cryptex_root, getenv("PATH"));
	if (path) {
		setenv("PATH", path, true);
        os_log_info(log, "Launching '%s' with PATH '%s'", *binary, path);
		execvP(*binary, path, args);
        error = errno;
	}
    os_log_error(log,"Failed to execute \"%s\" : '%s'\n", *binary, strerror(error));
    fprintf(stderr, "Failed to execute \"%s\" : '%s'\n", *binary, strerror(error));
    return 1;
}
