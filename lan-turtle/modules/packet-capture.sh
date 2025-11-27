#!/bin/bash
# Packet Capture - Full traffic capture
# Author: David Osisek
# FOR AUTHORIZED TESTING ONLY

OUTPUT="/root/loot/capture-$(date +%Y%m%d-%H%M%S).pcap"
echo "[+] Packet Capture Starting"
echo "[*] Output: $OUTPUT"

mkdir -p /root/loot

# Capture with rotation (50MB per file, 10 files max)
tcpdump -i eth0 -w $OUTPUT -C 50 -W 10 -Z root
