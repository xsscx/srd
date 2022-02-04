### Apple Security Research Device | TFTP Server & Client with Makefile for Cannibalized for the Apple SRD

Example TFTP Client & Server for the Apple Security Research Device ripped from the Internet and cannabalized for the SRD by Hoyt

# README

tftp
This is a simple tftp server/client that can be used to transfer a file. It also displays information as the transfer takes place, showing you the packet sizes being sent, the ACK receiving, etc. Heavily inspired by Beej's guide to network programming.

Both the client and server are set on port 69 by default, but this may not be accessible to you, so you can change the port (and host) if you need to.

The received file is named "recvfile.txt" so you can see what was sent and it won't replace the file (in case you choose to do it in the same folder, which you can. It's pretty full featured and will try to resend failed packets a certain number of times before it gives up.

# Installation
```
make
```
# Usage
```
MAC Host
./server [-p port]
SRD Client
./client [-p port] [-h hostname] -f filename
```

# This was the first Contribution to the SRD Repo!
