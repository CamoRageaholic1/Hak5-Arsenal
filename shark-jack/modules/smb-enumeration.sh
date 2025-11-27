#!/bin/bash
# SMB Enumeration - Windows share discovery
# Author: David Osisek
# FOR AUTHORIZED TESTING ONLY

LED ATTACK

OUTPUT="/root/loot/smb-enum-$(date +%Y%m%d-%H%M%S).txt"
mkdir -p /root/loot

echo "[+] SMB Enumeration" > $OUTPUT
echo "Date: $(date)" >> $OUTPUT
echo "" >> $OUTPUT

# Get subnet
SUBNET=$(ip -4 addr show eth0 | grep -oP '(?<=inet\s)[\d.]+/\d+' | head -1)

echo "=== SMB HOSTS ===" >> $OUTPUT
nmap -p 445 --open $SUBNET | grep "Nmap scan" >> $OUTPUT
echo "" >> $OUTPUT

echo "=== NETBIOS SCAN ===" >> $OUTPUT
nbtscan $SUBNET >> $OUTPUT
echo "" >> $OUTPUT

# Try enum4linux on first responsive host
FIRST_HOST=$(nmap -p 445 --open $SUBNET | grep "Nmap scan" | head -1 | grep -oP '\d+\.\d+\.\d+\.\d+')

if [ -n "$FIRST_HOST" ]; then
    echo "=== ENUM4LINUX: $FIRST_HOST ===" >> $OUTPUT
    enum4linux $FIRST_HOST >> $OUTPUT
fi

LED FINISH
echo "[+] Complete: $OUTPUT"
