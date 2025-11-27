# Shark Jack Arsenal 🦈

![Shark Jack](https://img.shields.io/badge/Device-Shark_Jack-cyan?style=for-the-badge)
![Modules](https://img.shields.io/badge/Modules-5-blue?style=for-the-badge)
![Network](https://img.shields.io/badge/Type-Network_Attack-red?style=for-the-badge)

**Portable network attack and reconnaissance tool**

---

## ⚠️ Legal Warning

**FOR AUTHORIZED PENETRATION TESTING ONLY**

Unauthorized use violates:
- Computer Fraud and Abuse Act (18 U.S.C. § 1030)
- Wiretap Act (18 U.S.C. § 2511)
- Electronic Communications Privacy Act
- State computer crime laws

**[Read Full Legal Disclaimer](../LEGAL_DISCLAIMER.md)**

---

## 🎯 Device Overview

### Capabilities
- **Portable Network Attacks** - Pocket-sized form factor
- **Rapid Reconnaissance** - Quick network enumeration
- **Automated Payloads** - One-button execution
- **Network Packet Capture** - Traffic analysis
- **Nmap Integration** - Built-in scanning
- **Cloud C2** - Remote management
- **Battery Powered** - 15 minutes runtime
- **Inline Deployment** - Man-in-the-middle positioning

### Technical Specs
- **Processor:** Atheros AR9331 (400 MHz)
- **RAM:** 64MB DDR2
- **Storage:** 8MB Flash
- **Network:** 10/100 Ethernet (RJ45)
- **Battery:** Built-in rechargeable (15 min)
- **USB:** USB-C (charging & data)
- **OS:** Custom Linux (OpenWRT)
- **LED:** RGB status indicator
- **Button:** Mode switching & payload execution

### Operation Modes
- **ARMING MODE** (Blue) - Development & payload deployment
- **ATTACK MODE** (Red) - Payload execution
- **SUCCESS** (Green) - Payload completed
- **FAIL** (Red blink) - Error/failure

---

## 📦 Modules

### 1. Network Reconnaissance
**File:** `modules/network-recon.sh`

**Purpose:** Comprehensive network discovery and enumeration

**Collected Data:**
- DHCP information (IP, gateway, DNS)
- Network topology
- Active hosts (ICMP, ARP)
- Open ports and services
- Device fingerprinting
- SMB shares
- SNMP information
- DNS enumeration

**Scan Types:**
```bash
# Quick scan (top 100 ports)
nmap -T4 --top-ports 100 $SUBNET

# Full scan (all ports)
nmap -T4 -p- $SUBNET

# Service detection
nmap -sV -T4 $SUBNET

# OS detection
nmap -O -T4 $SUBNET
```

**Execution Time:** 2-10 minutes (depends on subnet size)  
**Detectability:** Medium (network scanning)  
**Output:** /root/loot/recon-[timestamp].txt

**LED Sequence:**
- Blue blink - Initializing
- Amber - Scanning
- Green - Complete

---

### 2. Packet Capture
**File:** `modules/packet-capture.sh`

**Purpose:** Capture network traffic for offline analysis

**Features:**
- Inline traffic capture
- Selective filtering (HTTP, FTP, Telnet)
- Automatic upload to C2
- PCAP format output
- Duration-based or size-based capture

**Configuration:**
```bash
# Capture duration (seconds)
DURATION=300  # 5 minutes

# Max file size (MB)
MAX_SIZE=50

# BPF filter
FILTER="tcp port 80 or tcp port 21 or tcp port 23"

# Interface
INTERFACE=eth0
```

**Usage Scenarios:**
- Credential sniffing (insecure protocols)
- Traffic pattern analysis
- Protocol reverse engineering
- Evidence collection

**Execution Time:** User-defined (default 5 minutes)  
**Detectability:** Low (passive capture)  
**Output:** capture-[timestamp].pcap

---

### 3. SMB Enumeration
**File:** `modules/smb-enum.sh`

**Purpose:** Windows SMB/CIFS share discovery and enumeration

**Collected Data:**
- NetBIOS names
- Workgroup/domain information
- Shared folders and permissions
- User enumeration
- Null session vulnerabilities
- SMB version detection

**Tools Used:**
- nbtscan (NetBIOS scanning)
- smbclient (share enumeration)
- enum4linux (comprehensive SMB enum)
- nmap SMB scripts

**Example Output:**
```
[+] Host: 192.168.1.10
    NetBIOS: FILESERVER
    Workgroup: CORPORATE
    
[+] Shares:
    - Public (READ, WRITE)
    - Finance$ (Access Denied)
    - IPC$ (No Access)
    
[+] Users:
    - Administrator
    - jdoe
    - finance-user
```

**Execution Time:** 3-8 minutes  
**Detectability:** Medium-High  
**Risk Level:** Medium

---

### 4. Responder Attack
**File:** `modules/responder-attack.sh`  
**⚠️ Advanced Module**

**Purpose:** LLMNR/NBT-NS poisoning for credential capture

**Attack Flow:**
1. Listen for LLMNR/NBT-NS broadcasts
2. Respond to name resolution requests
3. Present fake SMB/HTTP services
4. Capture NTLMv2 hashes
5. Store for offline cracking

**Captured Credentials:**
- NTLMv2 hashes
- NTLMv1 hashes (if legacy enabled)
- Basic HTTP authentication
- LDAP credentials

**Configuration:**
```bash
# Enabled protocols
SMB=On
HTTP=On
HTTPS=On
LDAP=On

# Challenge response
CHALLENGE="1122334455667788"

# Output directory
OUTPUT=/root/loot/responder/
```

**Execution Time:** Continuous (until stopped)  
**Detectability:** High  
**Legal Risk:** HIGH - Active MITM attack

**Detection:** Network administrators can detect via:
- Multiple responses to broadcast queries
- Unexpected SMB authentication attempts
- IDS/IPS signatures

---

### 5. SSH Brute Force
**File:** `modules/ssh-bruteforce.sh`

**Purpose:** Automated SSH credential testing

**Features:**
- Username and password wordlists
- Rate limiting (avoid lockouts)
- Success logging
- Parallel connections
- Service detection

**Configuration:**
```bash
# Target
TARGET="192.168.1.0/24"

# Wordlists
USER_LIST="/root/wordlists/users.txt"
PASS_LIST="/root/wordlists/passwords.txt"

# Rate limiting
DELAY=5  # seconds between attempts
MAX_THREADS=4

# Common credentials
COMMON_CREDS=(
    "root:root"
    "admin:admin"
    "root:toor"
    "pi:raspberry"
)
```

**Output:**
```
[+] Success: 192.168.1.50:22
    Username: admin
    Password: password123
    
[+] Success: 192.168.1.75:22
    Username: root
    Password: root
```

**Execution Time:** Highly variable (depends on wordlist size)  
**Detectability:** HIGH  
**Risk Level:** HIGH (account lockouts possible)

---

## 🛠️ Analysis Tools

### Loot Analyzer
**File:** `tools/sharkjack-analyzer.py`

**Purpose:** Analyze captured data from Shark Jack

**Features:**
- PCAP analysis
- Credential extraction
- Network topology mapping
- Service identification
- Vulnerability correlation
- Report generation

**Usage:**
```bash
# Analyze reconnaissance data
python tools/sharkjack-analyzer.py recon-20241126.txt

# Extract credentials from PCAP
python tools/sharkjack-analyzer.py -e creds capture.pcap

# Generate network map
python tools/sharkjack-analyzer.py -m map.html recon-*.txt

# Analyze Responder loot
python tools/sharkjack-analyzer.py responder/
```

---

### Hash Cracker
**File:** `tools/hash-cracker.sh`

**Purpose:** Crack NTLMv2 hashes from Responder

**Methods:**
- Dictionary attack
- Brute force
- Mask attack
- Rule-based attack

**Usage:**
```bash
# Dictionary attack with hashcat
./hash-cracker.sh -f ntlmv2.txt -w rockyou.txt

# Brute force (8 chars, lowercase + digits)
./hash-cracker.sh -f ntlmv2.txt -m "?l?l?l?l?d?d?d?d"

# GPU-accelerated
./hash-cracker.sh -f ntlmv2.txt -w wordlist.txt --gpu
```

---

## 🚀 Quick Start

### Prerequisites
- Shark Jack device
- Network authorization
- Payload knowledge
- Secure data storage

### Setup

1. **Charge Device:**
```bash
# Connect via USB-C
# LED indicates charging status
# Full charge: ~60 minutes
```

2. **Enter Arming Mode:**
```bash
# Press and hold button during boot
# LED turns blue
# Device appears as Ethernet adapter

# SSH to device
ssh root@172.16.24.1
Password: hak5shark
```

3. **Deploy Payload:**
```bash
# Copy module to device
scp modules/network-recon.sh root@172.16.24.1:/root/payloads/

# Set as active
ssh root@172.16.24.1
cp /root/payloads/network-recon.sh /root/payload.sh
chmod +x /root/payload.sh
```

4. **Execute Attack:**
   - Disconnect USB
   - Connect Shark Jack to target network
   - Press button to start (LED turns red)
   - Wait for completion (LED turns green)
   - Disconnect and retrieve via SSH

### Cloud C2 Integration

```bash
# Configure C2 connection
C2_URL="https://c2.hak5.org"
DEVICE_ID="your-device-id"
API_KEY="your-api-key"

# Enable auto-upload
AUTO_UPLOAD=true

# Loot syncs automatically to cloud
```

---

## 🛡️ Defensive Countermeasures

### Prevention

**Physical Security:**
- Secure network closets
- Lock unused ports
- Monitor for rogue devices
- 802.1X authentication
- NAC (Network Access Control)
- Port security (MAC binding)

**Network Segmentation:**
- VLAN isolation
- DMZ for sensitive systems
- Firewall rules between segments
- Micro-segmentation

**Protocol Security:**
- Disable LLMNR/NBT-NS
- Use encrypted protocols (SSH, HTTPS, SFTP)
- Disable legacy authentication (NTLMv1)
- Implement SMB signing
- Use strong passwords

### Detection

**Indicators of Attack:**
- Unauthorized device on network
- Network scanning activity
- LLMNR/NBT-NS poisoning
- Unusual authentication attempts
- SSH brute force attempts
- Promiscuous mode interfaces

**Monitoring:**
- IDS/IPS alerts (Snort, Suricata)
- SIEM correlation
- Network traffic baselines
- DHCP snooping logs
- Switch port monitoring

**SIEM Correlation Rules:**
```
IF (Unknown_MAC_Address 
    AND Network_Scan_Detected 
    AND Authentication_Failures > 10)
THEN Alert = CRITICAL - Shark Jack Suspected

IF (LLMNR_Poisoning 
    OR NBT-NS_Poisoning)
THEN Alert = HIGH - Responder Attack
```

### Response

**If Shark Jack Detected:**

1. **Isolate immediately** - Disable switch port
2. **DO NOT unplug** - Preserve forensics
3. **Document:**
   - MAC address
   - Switch port
   - Time detected
   - Network segment
4. **Capture evidence:**
   - PCAP of traffic
   - DHCP logs
   - Switch logs
5. **Physical recovery** - Secure device
6. **Forensic analysis** - Extract payloads and loot
7. **Incident response** - Full IR procedure

---

## 📊 MITRE ATT&CK Mapping

| Tactic | Technique | ID |
|--------|-----------|-----|
| **Initial Access** | Hardware Additions | T1200 |
| **Discovery** | Network Service Scanning | T1046 |
| **Discovery** | Network Sniffing | T1040 |
| **Credential Access** | Network Sniffing | T1040 |
| **Credential Access** | Brute Force | T1110 |
| **Collection** | Man in the Middle | T1557 |
| **Command and Control** | Web Service | T1102 |

---

## 🎓 Educational Resources

### Official Documentation
- **Hak5 Shop:** https://shop.hak5.org/products/shark-jack
- **Shark Jack Docs:** https://docs.hak5.org/shark-jack
- **Payload Repository:** https://github.com/hak5/sharkjack-payloads
- **Forums:** https://forums.hak5.org

### Training
- **SANS SEC560:** Network Penetration Testing
- **SANS FOR572:** Advanced Network Forensics
- **Offensive Security PEN-200:** PWK/OSCP
- **eLearnSecurity eCPPT**

### Network Security
- **Network Security Monitoring** (Richard Bejtlich)
- **Practical Packet Analysis** (Chris Sanders)
- **Applied Network Security Monitoring** (SANS)

---

## 🔗 Additional Resources

- **[Main Repository](../README.md)**
- **[Legal Disclaimer](../LEGAL_DISCLAIMER.md)**
- **[KeyCroc Arsenal](../keycroc/README.md)**
- **[Rubber Ducky Arsenal](../rubber-ducky/README.md)**
- **[LAN Turtle Arsenal](../lan-turtle/README.md)**
- **[WiFi Pineapple Arsenal](../wifi-pineapple/README.md)**
- **[Plunder Bug Arsenal](../plunder-bug/README.md)**

---

## 📄 License

MIT License - See [LICENSE](../LICENSE)

---

## ⚠️ Final Reminder

**These modules are for AUTHORIZED TESTING ONLY.**

Unauthorized network attacks violate:
- Computer Fraud and Abuse Act (18 U.S.C. § 1030)
- Wiretap Act (18 U.S.C. § 2511)
- State computer crime laws

**Consequences:**
- Up to 10 years imprisonment
- $250,000 fines
- Civil liability
- Criminal record

**Network penetration requires EXPLICIT authorization.**  
**Check all applicable laws before deployment.**

---

**[← Back to Main Arsenal](../README.md)**
