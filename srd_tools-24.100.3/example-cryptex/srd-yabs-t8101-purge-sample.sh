#!/bin/sh
echo "SRD yet another build script srd-yabs.... "  
echo "targets the t8101 bugs making purge the most speculative path..., but helpful on X86_64 too.... "
echo "Starting the default DMG Install for the ./example-cryptex build ...."
sudo purge
cryptexctl uninstall com.example.cryptex
sudo purge
rm -rf *.cxbd
sudo purge
rm -rf *.signed
sudo purge
cryptexctl ${CRYPTEXCTL_FLAGS} create --research --replace ${CRYPTEXCTL_CREATE_FLAGS} --identifier=com.example.cryptex --version=1.3.3.7 --variant=research basic.dmg
sudo purge
cryptexctl ${CRYPTEXCTL_PERSONALIZE_FLAGS} personalize --replace  --variant=research com.example.cryptex.cxbd
sudo purge
cryptexctl install --variant=research --persist com.example.cryptex.cxbd.signed
sudo purge
cryptexctl list
sudo purge
echo "finished the example DMG install, moving to ASAN DMG...."
sudo purge
sleep 1
cryptexctl uninstall com.example.cryptex
sleep 1
sudo purge
sleep 1
rm -rf *.cxbd
sleep 1
sudo purge
sleep 1
rm -rf *.signed
sleep 1
sudo purge
sleep 1
cryptexctl ${CRYPTEXCTL_FLAGS} create --research --replace ${CRYPTEXCTL_CREATE_FLAGS} --identifier=com.example.cryptex --version=1.3.3.7 --variant=research asan.dmg
sleep 1
sudo purge
sleep 1
cryptexctl ${CRYPTEXCTL_PERSONALIZE_FLAGS} personalize --replace  --variant=research com.example.cryptex.cxbd
sudo purge
sleep 1
cryptexctl install --variant=research --persist com.example.cryptex.cxbd.signed
sleep 1
sudo purge
sleep 1
cryptexctl list
sleep 1
sudo purge
echo "finished the ASAN ./example-cryptex DMG, moving to UBSAN DMG...."
sudo purge
sleep 1
cryptexctl uninstall com.example.cryptex
sleep 1
sudo purge
sleep 1
rm -rf *.cxbd
sleep 1
sudo purge
sleep 1
rm -rf *.signed
sleep 1
sudo purge
sleep 1
cryptexctl ${CRYPTEXCTL_FLAGS} create --research --replace ${CRYPTEXCTL_CREATE_FLAGS} --identifier=com.example.cryptex --version=1.3.3.7 --variant=research ubsan.dmg
sleep 1
sudo purge
sleep 1
cryptexctl ${CRYPTEXCTL_PERSONALIZE_FLAGS} personalize --replace  --variant=research com.example.cryptex.cxbd
sudo purge
sleep 1
cryptexctl install --variant=research --persist com.example.cryptex.cxbd.signed
sleep 1
sudo purge
sleep 1
cryptexctl list
sleep 1
sudo purge
echo "All done here ......."
