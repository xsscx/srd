#!/bin/sh
echo "================================="
echo "SRD Cryptex Log Collector Start"
echo "================================="
echo "umount com.example.cryptex"
cryptexctl uninstall com.example.cryptex
echo "Collecting Info"
date > srd-cryptex-troubleshooter.log 2>&1
uname -a >> srd-cryptex-troubleshooter.log 2>&1
clang -v >> srd-cryptex-troubleshooter.log 2>&1
cryptexctl version >> srd-cryptex-troubleshooter.log 2>&1
sysctl -a | grep brand >> srd-cryptex-troubleshooter.log 2>&1
csrutil status >> srd-cryptex-troubleshooter.log 2>&1
echo "Install cryptex to SRD"
cryptexctl -v2 -d2  install --variant=research --persist --print-info ./com.example.cryptex.cxbd.signed >> srd-cryptex-troubleshooter.log 2>&1
echo "====================================="
echo "Check for cryptex install on SRD"
cryptexctl list 2>&1
echo "====================================="
echo "SRD Cryptex Troubleshooter Log Info"
echo "====================================="
cat srd-cryptex-troubleshooter.log
echo "SRD Cryptex Log Collector Stop"
