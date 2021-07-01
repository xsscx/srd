/*  This is the Example simple-server.c included with SRDI
    Last Modified By: srd0009 
    Last Modified Date: 18 APRIL 2021
    Original Code by Apple Corporation
*/
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
#include <stdio.h>
#include <os/log.h>

#define PORT 7777

int main(int argc, char ** argv, char * envp[]) {
    struct sockaddr_in sock;
    int sock_fd = -1;
    os_log_t log = os_log_create("com.example.cryptex", "simple-server");
    os_log_error(log, "Hello! I'm simple-server from the example cryptex!");


    sock.sin_family = AF_INET;
    sock.sin_addr.s_addr = INADDR_ANY;
    sock.sin_port = htons(PORT);

    os_log_error(log, "Bind to: 0.0.0.0:%d", PORT);
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
        os_log_error(log, "Waiting on Connection.....");
        int fd = accept(sock_fd, (struct sockaddr*)&client, &client_size);
        os_log_error(log, "External Connection...");
        pid = getpid();
        os_log_info(log, "External Connection on process: %d", pid);
        dup2(fd, 0);
        dup2(fd, 1);

        fprintf(stdout, "Send here on Line 52... this is cleartext with PID: %d\n", pid);
        fprintf(stdout, "Reading out of.... CRYPTEX_MOUNT_PATH "
                " contains: \"%s\"\n", getenv("CRYPTEX_MOUNT_PATH"));
        
        fprintf(stdout, "Reading out of.... PATH "
                " contains: \"%s\"\n", getenv("PATH"));
                
        {
    int i;
    for (i = 0; envp[i] != NULL; i++)
        printf("\n%s", envp[i]);
    getchar();
				printf("\n\r");
    // variables to store date and time components
    int hours, minutes, seconds, day, month, year;
 
    // time_t is arithmetic time type
    time_t now;
 
    // Obtain current time
    // time() returns the current time of the system as a time_t value
    time(&now);
 
    // Convert to local time format and print to stdout
    printf("Today is : %s", ctime(&now));
 
    // localtime converts a time_t value to calendar time and
    // returns a pointer to a tm structure with its members
    // filled with the corresponding values
    struct tm *local = localtime(&now);
 
    hours = local->tm_hour;          // get hours since midnight (0-23)
    minutes = local->tm_min;         // get minutes passed after the hour (0-59)
    seconds = local->tm_sec;         // get seconds passed after minute (0-59)
 
    day = local->tm_mday;            // get day of month (1 to 31)
    month = local->tm_mon + 1;       // get month of year (0 to 11)
    year = local->tm_year + 1900;    // get year since 1900
 
    // print local time
    if (hours < 12)    // before midday
        printf("Time is : %02d:%02d:%02d am\n", hours, minutes, seconds);
 
    else    // after midday
        printf("Time is : %02d:%02d:%02d pm\n", hours - 12, minutes, seconds);
 
    // print current date
    printf("Date is : %02d/%02d/%d\n", day, month, year);
 
    return 0;
}

        fflush(stdout);
        close(fd);
    }
    
    os_log_error(log, "Shutting down... Goodbye!"); 
    return 0;
}
