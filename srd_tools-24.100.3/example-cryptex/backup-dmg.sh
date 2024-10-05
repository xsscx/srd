#!/bin/bash
backup_files="srd-universal-cryptex.dmg"
dest="example-cryptex/dmg-backup"
day=$(date +%A)
hostname=$(hostname -s)
archive_file="$hostname.X86_64.cryptex.$day.tgz"
echo "Backing up $backup_files to $dest/$archive_file"
date
echo
tar czf $dest/$archive_file $backup_files
echo
echo "Backup finished"
date
