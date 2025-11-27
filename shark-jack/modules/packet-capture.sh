#!/bin/bash
# Packet Capture - Targeted traffic capture
# Author: David Osisek
# FOR AUTHORIZED TESTING ONLY

LED ATTACK

OUTPUT="/root/loot/capture-$(date +%Y%m%d-%H%M%S).pcap"
mkdir -p /root/loot

echo "[+] Shark Jack - Packet Capture"
echo "[*] Output: $OUTPUT"

# Capture HTTP, FTP, Telnet (clear text protocols)
FILTER="tcp port 80 or tcp port 21 or tcp port 23"

echo "[*] Capturing for 5 minutes..."
timeout 300 tcpdump -i eth0 -w $OUTPUT "$FILTER"

LED FINISH
echo "[+] Capture complete: $OUTPUT"
