#!/bin/sh
echo "SRD Cryptex Troubleshooter Log Collector Start"
date > srd-cryptex-troubleshooter.log
uname -a >> srd-cryptex-troubleshooter.log
clang -v >> srd-cryptex-troubleshooter.log
cryptexctl version >> srd-cryptex-troubleshooter.log
sysctl -a | grep brand >> srd-cryptex-troubleshooter.log
csrutil status >> srd-cryptex-troubleshooter.log
cryptexctl -v4 -d4  install --variant=research --persist --print-info ./com.example.cryptex.cxbd.signed
# sudo sysdiagnose
cat srd-cryptex-troubleshooter.log
echo "SRD Cryptex Troubleshooter Log Collector End"
