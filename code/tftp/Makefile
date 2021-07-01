CC = gcc

all: client server

again: clean client server

client: checksum.o header.o
	$(CC) client.c checksum.o header.o -o client

server: checksum.o header.o
	$(CC) server.c checksum.o header.o -o server

clean:
	rm -f *.o client server
