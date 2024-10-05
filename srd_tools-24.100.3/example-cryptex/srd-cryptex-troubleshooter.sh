#!/bin/sh
echo "================================="
echo "SRD Cryptex Log Collector Start"
echo "================================="
echo "umount com.example.cryptex"
cryptexctl uninstall com.example.cryptex
echo "Collecting Info"
date > srd-cryptex-troubleshooter.log 2>&1
sysctl -a | grep kern.version >> srd-cryptex-troubleshooter.log 2>&1
sysctl -a | grep kern.osversion >> srd-cryptex-troubleshooter.log 2>&1
sysctl -a | grep kern.iossupportversion >> srd-cryptex-troubleshooter.log 2>&1
sysctl -a | grep kern.osproductversion >> srd-cryptex-troubleshooter.log 2>&1
sysctl -a | grep kern.osproductversioncompat >> srd-cryptex-troubleshooter.log 2>&1
xcrun  --show-sdk-path  >> srd-cryptex-troubleshooter.log 2>&1
cryptexctl device list >> srd-cryptex-troubleshooter.log 2>&1
clang -v >> srd-cryptex-troubleshooter.log 2>&1
cryptexctl version >> srd-cryptex-troubleshooter.log 2>&1
sysctl -a | grep brand >> srd-cryptex-troubleshooter.log 2>&1
csrutil status >> srd-cryptex-troubleshooter.log 2>&1
echo "starting... \n lldb -- cryptexctl install -p -l  --variant=research --persist com.example.cryptex.cxbd.signed"
echo "\n then type run, example: (lldb) run"
lldb -- cryptexctl install -p -l  --variant=research --persist com.example.cryptex.cxbd.signed
