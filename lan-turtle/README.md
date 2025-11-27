# LAN Turtle Arsenal 🐢

![LAN Turtle](https://img.shields.io/badge/Device-LAN_Turtle-orange?style=for-the-badge)
![Modules](https://img.shields.io/badge/Modules-4-blue?style=for-the-badge)
![Network](https://img.shields.io/badge/Type-Network_Implant-red?style=for-the-badge)

**Covert network access and man-in-the-middle attack platform**

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
- **Network Implant** - Inline man-in-the-middle
- **Remote Access** - SSH reverse tunnel
- **Packet Capture** - Full traffic analysis
- **DNS Spoofing** - Traffic redirection
- **ARP Poisoning** - MITM attacks
- **Network Mapping** - Topology discovery
- **Covert Operations** - Low detectability

### Technical Specs
- **Processor:** Atheros AR9331 (400 MHz)
- **RAM:** 64MB DDR2
- **Storage:** 16MB Flash + MicroSD
- **Network:** 2x Ethernet (10/100 Mbps)
- **OS:** OpenWRT Linux
- **Power:** USB or Ethernet (PoE)
- **Form Factor:** Compact USB adapter size

---

## 📦 Modules

### 1. Persistent Access
**File:** `modules/persistent-access.sh`

**Purpose:** Maintain covert SSH backdoor with reverse tunnel

**Features:**
- Automatic reverse SSH tunnel to attacker
- Survives reboots via cron
- AutoSSH for connection persistence
- Configurable callback intervals
- Low network footprint

**Detectability:** Medium  
**Network Impact:** Low (periodic SSH keepalives)

**Use Cases:**
- Long-term network access
- Post-exploitation persistence
- Remote administration
- Red team operations

---

### 2. Network Reconnaissance
**File:** `modules/network-recon.sh`

**Purpose:** Comprehensive network discovery and mapping

**Collected Data:**
- Active hosts (ARP, ICMP)
- Open ports and services
- Network topology
- DNS servers
- Routing tables
- DHCP configuration
- VLAN information

**Execution Time:** 5-15 minutes (depends on subnet size)  
**Detectability:** Low (passive techniques prioritized)  
**Output:** /root/loot/network-recon-[timestamp].txt

**Tools Used:**
- arp-scan
- nmap
- netdiscover
- tcpdump

---

### 3. DNS Spoofing
**File:** `modules/dns-spoof.sh`  
**⚠️ Advanced Module**

**Purpose:** Redirect DNS queries for targeted domains

**Capabilities:**
- Selective DNS poisoning
- Wildcard domain matching
- Traffic redirection
- Phishing site delivery
- Man-in-the-middle setup

**Detectability:** High (anomalous DNS responses)  
**Network Impact:** High (affects all downstream traffic)

**Defensive Detection:**
- DNS query/response mismatches
- Unexpected IP resolutions
- Certificate warnings (HTTPS)
- Increased DNS queries to LAN Turtle

---

### 4. Packet Capture
**File:** `modules/packet-capture.sh`

**Purpose:** Full network traffic capture and analysis

**Features:**
- Inline packet interception
- Selective capture filters
- Automatic rotation (size-based)
- PCAP output format
- Remote transfer capability

**Storage:** MicroSD card (recommend 32GB+)  
**Detectability:** Low (passive monitoring)  
**Network Impact:** Negligible

**Capture Filters:**
- HTTP traffic
- FTP credentials
- Telnet sessions
- SMTP emails
- Custom protocols

---

## 🛠️ Analysis Tools

### Traffic Analyzer
**File:** `tools/traffic-analyzer.py`

**Purpose:** Analyze captured PCAP files

**Features:**
- Protocol distribution analysis
- Credential extraction (HTTP, FTP, Telnet)
- DNS query analysis
- Top talkers identification
- Suspicious pattern detection
- Timeline reconstruction
- Report generation

**Usage:**
```bash
# Analyze PCAP
python tools/traffic-analyzer.py capture.pcap

# Extract credentials
python tools/traffic-analyzer.py -e creds capture.pcap

# Generate report
python tools/traffic-analyzer.py -r report.html capture.pcap
```

---

### Module Manager
**File:** `tools/module-manager.sh`

**Purpose:** Deploy and manage LAN Turtle modules

**Features:**
- Module installation
- Configuration management
- Status monitoring
- Log collection
- Automatic updates

**Usage:**
```bash
# Install module
./module-manager.sh install persistent-access

# Enable module
./module-manager.sh enable network-recon

# Check status
./module-manager.sh status

# View logs
./module-manager.sh logs dns-spoof
```

---

## 🚀 Quick Start

### Prerequisites
- LAN Turtle device
- MicroSD card (8GB minimum, 32GB recommended)
- SSH client
- Network access authorization
- Target network documentation

### Initial Setup

1. **First Boot Configuration:**
```bash
# Connect via SSH
ssh root@172.16.84.1
Password: sh3llz

# Change default password
passwd

# Update system
opkg update
opkg upgrade
```

2. **Network Configuration:**
```bash
# Configure network interface
vi /etc/config/network

# Set DHCP or static IP
# Match target network subnet

# Restart network
/etc/init.d/network restart
```

3. **Deploy Module:**
```bash
# Copy module to device
scp modules/network-recon.sh root@172.16.84.1:/root/modules/

# Make executable
ssh root@172.16.84.1
chmod +x /root/modules/network-recon.sh

# Execute
./modules/network-recon.sh
```

### Physical Deployment

**Inline Installation:**
```
[Switch/Router] <--> [LAN Turtle] <--> [Target Computer]
```

**Passive Monitoring:**
```
[Network Tap] <--> [LAN Turtle]
       |
       v
[Target Network]
```

---

## 🛡️ Defensive Countermeasures

### Prevention

**Physical Security:**
- Monitor network equipment rooms
- Secure wiring closets
- Implement port security
- Use tamper-evident seals
- Regular visual inspections
- Lock cable runs

**Network Security:**
- 802.1X authentication
- MAC address filtering
- Port-based access control
- Network segmentation
- VLAN isolation
- Encrypted protocols (SSH, HTTPS, VPN)

**Access Control:**
- Disable unused switch ports
- Implement NAC (Network Access Control)
- Monitor for rogue devices
- Baseline network topology

### Detection

**Network Anomalies:**
- Unknown MAC addresses
- Unexpected DHCP requests
- New devices in ARP table
- Anomalous traffic patterns
- DNS query irregularities
- Increased broadcast traffic

**Monitoring Tools:**
- IDS/IPS (Snort, Suricata)
- Network traffic analysis (Wireshark, tcpdump)
- SIEM correlation
- NetFlow analysis
- ARP monitoring
- DHCP snooping logs

**SIEM Correlation Rules:**
```
IF (New_MAC_Address 
    AND Unknown_Vendor 
    AND Unusual_Traffic_Pattern)
THEN Alert = HIGH

IF (DNS_Response_Mismatch 
    OR Certificate_Warning 
    OR Suspicious_Reverse_SSH)
THEN Alert = CRITICAL
```

### Response

**If LAN Turtle Suspected:**

1. **DO NOT disconnect** immediately (forensics)
2. **Isolate network segment** via VLAN
3. **Monitor traffic** to identify scope
4. **Capture packets** for analysis
5. **Document connections** (MAC, IP, sessions)
6. **Physical inspection** of all inline devices
7. **Check for persistence** (other implants)
8. **Initiate incident response**

**Evidence Collection:**
- Switch MAC address tables
- DHCP lease logs
- ARP cache dumps
- Traffic captures (PCAP)
- Device photos and serial numbers
- Timeline of anomalies

---

## 📊 MITRE ATT&CK Mapping

| Tactic | Technique | ID |
|--------|-----------|----|
| **Initial Access** | Hardware Additions | T1200 |
| **Persistence** | External Remote Services | T1133 |
| **Defense Evasion** | Rogue Domain Controller | T1207 |
| **Discovery** | Network Service Scanning | T1046 |
| **Discovery** | Network Sniffing | T1040 |
| **Credential Access** | Network Sniffing | T1040 |
| **Lateral Movement** | Remote Services | T1021 |
| **Collection** | Data from Network Shared Drive | T1039 |
| **Command and Control** | Proxy | T1090 |
| **Exfiltration** | Automated Exfiltration | T1020 |

---

## 🎓 Educational Resources

### Official Documentation
- **Hak5 Shop:** https://shop.hak5.org/products/lan-turtle
- **LAN Turtle Wiki:** https://docs.hak5.org/lan-turtle
- **Module Repository:** https://github.com/hak5/lanturtle-modules

### Training
- **SANS SEC560:** Network Penetration Testing
- **SANS FOR572:** Advanced Network Forensics
- **Offensive Security PEN-210:** OSWP
- **eLearnSecurity eCPTX:** Penetration Testing Extreme

### Network Security
- **Wireshark Network Analysis**
- **Practical Packet Analysis (Chris Sanders)**
- **Network Security Assessment (Chris McNab)**
- **Applied Network Security Monitoring (SANS)**

---

## 🔗 Additional Resources

- **[Main Repository](../README.md)**
- **[Legal Disclaimer](../LEGAL_DISCLAIMER.md)**
- **[Defensive Guide](../DEFENSIVE_GUIDE.md)**
- **[KeyCroc Arsenal](../keycroc/README.md)**
- **[Rubber Ducky Arsenal](../rubber-ducky/README.md)**

---

## 📄 License

MIT License - See [LICENSE](../LICENSE)

---

## ⚠️ Final Reminder

**These modules are for AUTHORIZED TESTING ONLY.**

Unauthorized network interception is a **FEDERAL CRIME** under:
- Wiretap Act (18 U.S.C. § 2511)
- Computer Fraud and Abuse Act (18 U.S.C. § 1030)
- Electronic Communications Privacy Act

**Consequences:**
- Up to 10 years imprisonment
- $250,000 fines
- Civil liability
- Criminal record

**Network attacks require EXPLICIT authorization.**  
**Check local laws before deployment.**

---

**[← Back to Main Arsenal](../README.md)**
