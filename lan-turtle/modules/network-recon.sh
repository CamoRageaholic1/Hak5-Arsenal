#!/bin/bash
# Title: Network Reconnaissance
# Author: David Osisek (CamoZeroDay)
# Target: LAN Turtle
# Version: 1.0
# Category: Discovery
# 
# ⚠️ FOR AUTHORIZED PENETRATION TESTING ONLY
# Comprehensive network discovery and mapping

# Output configuration
OUTPUT_DIR="/root/loot/network-recon"
TIMESTAMP=$(date +%Y%m%d-%H%M%S)
OUTPUT_FILE="${OUTPUT_DIR}/recon-${TIMESTAMP}.txt"

# Network interface
INTERFACE="eth0"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${GREEN}[+] LAN Turtle - Network Reconnaissance${NC}"
echo -e "${YELLOW}[*] FOR AUTHORIZED TESTING ONLY${NC}"

# Create output directory
mkdir -p "${OUTPUT_DIR}"

# Start reconnaissance
echo "=== NETWORK RECONNAISSANCE REPORT ===" > "${OUTPUT_FILE}"
echo "Started: $(date)" >> "${OUTPUT_FILE}"
echo "" >> "${OUTPUT_FILE}"

# Interface information
echo -e "${YELLOW}[*] Gathering interface information...${NC}"
echo "=== INTERFACE INFORMATION ===" >> "${OUTPUT_FILE}"
ifconfig ${INTERFACE} >> "${OUTPUT_FILE}" 2>&1
echo "" >> "${OUTPUT_FILE}"

# Routing table
echo -e "${YELLOW}[*] Dumping routing table...${NC}"
echo "=== ROUTING TABLE ===" >> "${OUTPUT_FILE}"
route -n >> "${OUTPUT_FILE}"
echo "" >> "${OUTPUT_FILE}"

# ARP cache
echo -e "${YELLOW}[*] Capturing ARP cache...${NC}"
echo "=== ARP CACHE ===" >> "${OUTPUT_FILE}"
arp -a >> "${OUTPUT_FILE}"
echo "" >> "${OUTPUT_FILE}"

# Get network range
NETWORK=$(ip -4 addr show ${INTERFACE} | grep -oP '(?<=inet\s)\d+(\.\d+){3}' | head -1)
SUBNET=$(ip -4 addr show ${INTERFACE} | grep -oP '(?<=inet\s)[\d.]+/\d+' | head -1)

if [ -z "${NETWORK}" ]; then
    echo -e "${RED}[-] Could not determine network${NC}"
    exit 1
fi

echo -e "${GREEN}[+] Network: ${SUBNET}${NC}"

# ARP Scan (if available)
if command -v arp-scan &> /dev/null; then
    echo -e "${YELLOW}[*] Running ARP scan...${NC}"
    echo "=== ARP SCAN ===" >> "${OUTPUT_FILE}"
    arp-scan --localnet --interface=${INTERFACE} >> "${OUTPUT_FILE}" 2>&1
    echo "" >> "${OUTPUT_FILE}"
fi

# Nmap scan
if command -v nmap &> /dev/null; then
    echo -e "${YELLOW}[*] Running Nmap ping sweep...${NC}"
    echo "=== NMAP PING SWEEP ===" >> "${OUTPUT_FILE}"
    nmap -sn ${SUBNET} -oN - >> "${OUTPUT_FILE}" 2>&1
    echo "" >> "${OUTPUT_FILE}"
    
    echo -e "${YELLOW}[*] Running Nmap service scan (top ports)...${NC}"
    echo "=== NMAP SERVICE SCAN ===" >> "${OUTPUT_FILE}"
    nmap -sV -T4 --top-ports 100 ${SUBNET} -oN - >> "${OUTPUT_FILE}" 2>&1
    echo "" >> "${OUTPUT_FILE}"
fi

# DNS information
echo -e "${YELLOW}[*] Gathering DNS information...${NC}"
echo "=== DNS SERVERS ===" >> "${OUTPUT_FILE}"
cat /etc/resolv.conf >> "${OUTPUT_FILE}"
echo "" >> "${OUTPUT_FILE}"

# DHCP information
echo -e "${YELLOW}[*] Checking DHCP...${NC}"
echo "=== DHCP LEASE ===" >> "${OUTPUT_FILE}"
cat /var/dhcp.leases >> "${OUTPUT_FILE}" 2>&1
echo "" >> "${OUTPUT_FILE}"

# NetBIOS scan (if nbtscan available)
if command -v nbtscan &> /dev/null; then
    echo -e "${YELLOW}[*] Running NetBIOS scan...${NC}"
    echo "=== NETBIOS SCAN ===" >> "${OUTPUT_FILE}"
    nbtscan ${SUBNET} >> "${OUTPUT_FILE}" 2>&1
    echo "" >> "${OUTPUT_FILE}"
fi

# Completion
echo "Finished: $(date)" >> "${OUTPUT_FILE}"
echo "" >> "${OUTPUT_FILE}"

echo -e "${GREEN}[+] Reconnaissance complete${NC}"
echo -e "${GREEN}[+] Results saved to: ${OUTPUT_FILE}${NC}"

# Display summary
HOST_COUNT=$(grep -c "Host is up" "${OUTPUT_FILE}" 2>/dev/null || echo "0")
echo -e "${GREEN}[+] Discovered ${HOST_COUNT} active hosts${NC}"
