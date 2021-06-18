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

#define PORT 7777

int main(int argc, char ** argv) {
    struct sockaddr_in sock;
    int sock_fd = -1;
    os_log_t log = os_log_create("com.apple.example.cryptex", "simple-server");
    os_log_error(log, "Hello! I'm simple-server from the example cryptex!");

    sock.sin_family = AF_INET;
    sock.sin_addr.s_addr = INADDR_ANY;
    sock.sin_port = htons(PORT);

    os_log_error(log, "I'm about to bind to 0.0.0.0:%d", PORT);
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
        pid_t pid;
        struct sockaddr_in client;
        socklen_t client_size = sizeof(client);
        os_log_error(log, "Waiting for a client to connect...");
        int fd = accept(sock_fd, (struct sockaddr*)&client, &client_size);
        os_log_error(log, "A client has connected!");
        pid = getpid();
        os_log_info(log, "Hello! I'm process %d", pid);
        dup2(fd, 0);
        dup2(fd, 1);
        fprintf(stdout, "Hello! I'm process %d\n", pid);
        fprintf(stdout, "The environment variable CRYPTEX_MOUNT_PATH "
                " contains: \"%s\"\n", getenv("CRYPTEX_MOUNT_PATH"));
        fflush(stdout);
        close(fd);
    }
    os_log_error(log, "Shutting down... Goodbye!"); 
    return 0;
}
