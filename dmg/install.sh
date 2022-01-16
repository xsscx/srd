#!/bin/sh
wget https://xss.cx/srd/dmg/srd-universal-cryptex.dmg
cryptexctl ${CRYPTEXCTL_FLAGS} create --research --replace ${CRYPTEXCTL_CREATE_FLAGS} --identifier=com.example.cryptex --version=1.3.3.7 --variant=research srd-universal-cryptex.dmg
cryptexctl  personalize --replace -o /Users/xss/security-research-device-main/example-cryptex --variant=research /Users/xss/security-research-device-main/example-cryptex/com.example.cryptex.cxbd
cryptexctl uninstall com.example.cryptex
cryptexctl install --variant=research --persist com.example.cryptex.cxbd.signed
cryptexctl list
