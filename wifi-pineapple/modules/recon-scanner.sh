#!/bin/bash
# Wireless Reconnaissance Scanner
# Author: David Osisek
# FOR AUTHORIZED TESTING ONLY

OUTPUT="/root/loot/wifi-recon-$(date +%Y%m%d-%H%M%S).txt"

echo "[+] Wireless Reconnaissance"
echo "[*] Output: $OUTPUT"

mkdir -p /root/loot

echo "=== WIRELESS RECONNAISSANCE ===" > $OUTPUT
echo "Date: $(date)" >> $OUTPUT
echo "" >> $OUTPUT

# Scan for networks
echo "[*] Scanning for access points..."
echo "=== ACCESS POINTS ===" >> $OUTPUT
iwlist wlan1 scan >> $OUTPUT 2>&1

echo "" >> $OUTPUT

# Show associated clients
echo "[*] Checking for clients..."
echo "=== ASSOCIATED CLIENTS ===" >> $OUTPUT
airodump-ng wlan1mon --output-format csv -w /tmp/scan --write-interval 10 &
PID=$!
sleep 30
kill $PID

if [ -f /tmp/scan-01.csv ]; then
    cat /tmp/scan-01.csv >> $OUTPUT
    rm /tmp/scan-01.csv
fi

echo "" >> $OUTPUT
echo "[+] Scan complete: $OUTPUT"
