#!/bin/sh
echo "unmounting com.example.cryptex"
cryptexctl uninstall com.example.cryptex
echo "AMFI complains on T8101, X86_64 trustd XNU macOS and doesn't always make clean, aka the clean bug..."
sudo xattr -c * src/* src/*/*
make clean
make all
make install
