#!/bin/sh
echo "================================="
echo "SRD Cryptex Log Collector Start"
echo "================================="
echo "umount com.example.cryptex"
cryptexctl uninstall com.example.cryptex
date > srd-cryptex-logcollector.log 2>&1
sysctl -a | grep kern.version >> srd-cryptex-logcollector.log 2>&1
sysctl -a | grep kern.osversion >> srd-cryptex-logcollector.log 2>&1
sysctl -a | grep kern.iossupportversion >> srd-cryptex-logcollector.log 2>&1
sysctl -a | grep kern.osproductversion >> srd-cryptex-logcollector.log 2>&1
sysctl -a | grep kern.osproductversioncompat >> srd-cryptex-logcollector.log 2>&1
xcrun  --show-sdk-path  >> srd-cryptex-logcollector.log 2>&1
cryptexctl device list >> srd-cryptex-logcollector.log 2>&1
clang -v >> srd-cryptex-logcollector.log 2>&1
cryptexctl version >> srd-cryptex-logcollector.log 2>&1
sysctl -a | grep brand >> srd-cryptex-logcollector.log 2>&1
csrutil status >> srd-cryptex-logcollector.log 2>&1
echo "Install cryptex to SRD"
cryptexctl -v9 -d9 -ldt  install --variant=research --persist --print-info ./com.example.cryptex.cxbd.signed >> srd-cryptex-logcollector.log 2>&1
echo "====================================="
echo "Check for cryptex install on SRD"
cryptexctl list 2>&1
echo "====================================="
echo "SRD Cryptex logcollector output"
echo "====================================="
cat srd-cryptex-logcollector.log
echo "Check for cryptex install on SRD"
cryptexctl list
echo "SRD Cryptex Log Collector Stop"
