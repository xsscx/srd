#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>
#include <unistd.h>
#include <arpa/inet.h>
#include <netinet/in.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <errno.h>
#include <string.h>

#include <os/log.h>

#define PORT 8888

int main(int argc, char ** argv) {
    struct sockaddr_in sock;
    int sock_fd = -1;
    char *path = NULL;
    const char *cryptex_root = getenv("CRYPTEX_MOUNT_PATH");
    os_log_t log = os_log_create("com.apple.example.cryptex", "simple-shell");
    os_log_info(log, "Hello! I'm simple-shell from the example cryptex!");

    if (cryptex_root == NULL) {
        os_log_error(log, "CRYPTEX_MOUNT_PATH not in environment");
        fprintf(stderr, "CRYPTEX_MOUNT_PATH not in environment.\n");
        exit(1);
    }

	asprintf(&path, "%s/usr/local/bin:%s/usr/bin:%s/bin:%s",
		cryptex_root, cryptex_root, cryptex_root, getenv("PATH"));

    sock.sin_family = AF_INET;
    sock.sin_addr.s_addr = INADDR_ANY;
    sock.sin_port = htons(PORT);

    os_log_info(log, "I'm about to bind to 0.0.0.0:%d", PORT);
    sock_fd = socket(AF_INET, SOCK_STREAM, 0);
    if (bind(sock_fd, (struct sockaddr*)&sock, sizeof(sock))) {
        os_log_error(log, "I have failed to bind to 0.0.0.0:%d : %s", PORT, strerror(errno));
        perror("Failed to bind");
        return 1;
    }

    os_log_error(log, "I'm about to listen on fd: %d", sock_fd);
    if (listen(sock_fd, 5)) {
        os_log_error(log, "I could not listen on fd: %d : %s", sock_fd, strerror(errno));
        perror("Failed to listen");
        return 1;
    }

    while (true) {
        char* shell = getenv("SHELL"); 
        pid_t pid;
        pid_t child;
        struct sockaddr_in client;
        socklen_t client_size = sizeof(client);
        os_log_info(log, "Waiting for a client to connect...");
        int fd = accept(sock_fd, (struct sockaddr*)&client, &client_size);
        os_log_info(log, "A client has connected! Forking!");
        child = fork();
        if (child == 0) {
            pid = getpid();
            os_log_info(log, "Hello! I'm process %d.", pid);

            dup2(fd, 0);
            dup2(fd, 1);
            dup2(fd, 2);

            if (shell) {
                os_log_info(log, "Process %d starting '%s' with PATH: '%s'", pid, shell, path);
                setenv("PATH", path, true);
                if (execvP(shell, path, NULL)) {
                    errno_t error = errno;
                    perror("Failed to launch shell");
                    os_log_error(log, "Failed to launch '%s' : '%s'", shell, strerror(error));
                }
            } else {
                os_log_error(log, "SHELL environment variable not set. Nothing to run!");
                fprintf(stderr, "SHELL environment variable not set. Nothing to run!\n");
            }

            fflush(stdout);
            close(fd);
            exit(1);
        }
        close(fd);
    }
    free(path);
    os_log_error(log, "Shutting down... Goodbye!"); 
    return 0;
}
