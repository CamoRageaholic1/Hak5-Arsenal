#!/bin/bash
# Network Reconnaissance - Fast network discovery
# Author: David Osisek
# FOR AUTHORIZED TESTING ONLY

LED ATTACK

OUTPUT="/root/loot/recon-$(date +%Y%m%d-%H%M%S).txt"
mkdir -p /root/loot

echo "[+] Shark Jack - Network Recon" > $OUTPUT
echo "Date: $(date)" >> $OUTPUT
echo "" >> $OUTPUT

# Get network info
echo "=== NETWORK INFO ===" >> $OUTPUT
ifconfig eth0 >> $OUTPUT
echo "" >> $OUTPUT

# Get subnet
SUBNET=$(ip -4 addr show eth0 | grep -oP '(?<=inet\s)[\d.]+/\d+' | head -1)

echo "=== ARP SCAN ===" >> $OUTPUT
arp-scan --localnet >> $OUTPUT
echo "" >> $OUTPUT

echo "=== NMAP SCAN ===" >> $OUTPUT
nmap -sn $SUBNET >> $OUTPUT
echo "" >> $OUTPUT

echo "=== TOP PORTS ===" >> $OUTPUT
nmap -sV --top-ports 100 $SUBNET >> $OUTPUT

LED FINISH
echo "[+] Complete: $OUTPUT"
