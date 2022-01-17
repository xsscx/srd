#!/bin/sh
echo "SRD Cryptex Troubleshooter Log Collector Start"
echo "Rotate Log"
mv srd-cryptex-troubleshooter.log srd-cryptex-troubleshooter.log.bak
echo "umount com.example.cryptex"
cryptexctl uninstall com.example.cryptex
date > srd-cryptex-troubleshooter.log 2>&1
uname -a >> srd-cryptex-troubleshooter.log 2>&1
cryptexctl version >> srd-cryptex-troubleshooter.log 2>&1
sysctl -a | grep brand >> srd-cryptex-troubleshooter.log 2>&1
csrutil status >> srd-cryptex-troubleshooter.log 2>&1
cryptexctl -v2 -d2  install --variant=research --persist --print-info ./com.example.cryptex.cxbd.signed >> srd-cryptex-troubleshooter.log 2>&1
echo "Check for cryptex install"
cryptexctl list 2>&1
clang -v >> srd-cryptex-troubleshooter.log 2>&1
# sudo sysdiagnose
echo "SRD Cryptex Troubleshooter Logs"
cat srd-cryptex-troubleshooter.log
echo "SRD Cryptex Troubleshooter Log Collector End"
