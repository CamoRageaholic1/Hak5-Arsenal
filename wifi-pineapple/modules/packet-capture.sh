#!/bin/bash
# 802.11 Packet Capture
# Author: David Osisek
# FOR AUTHORIZED TESTING ONLY

OUTPUT="/root/loot/wifi-capture-$(date +%Y%m%d-%H%M%S).cap"

echo "[+] 802.11 Packet Capture"
echo "[*] Output: $OUTPUT"
echo "[*] Enter channel (or 0 for all):"
read CHANNEL

mkdir -p /root/loot

if [ "$CHANNEL" = "0" ]; then
    echo "[*] Capturing on all channels (hopping)..."
    airodump-ng -w $OUTPUT --output-format pcap wlan1mon
else
    echo "[*] Capturing on channel $CHANNEL..."
    airodump-ng --channel $CHANNEL -w $OUTPUT --output-format pcap wlan1mon
fi

echo "[+] Capture saved to: $OUTPUT"
