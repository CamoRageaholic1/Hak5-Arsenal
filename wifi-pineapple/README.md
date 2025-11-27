# WiFi Pineapple Arsenal 🍍

![WiFi Pineapple](https://img.shields.io/badge/Device-WiFi_Pineapple-yellow?style=for-the-badge)
![Modules](https://img.shields.io/badge/Modules-6-blue?style=for-the-badge)
![Wireless](https://img.shields.io/badge/Type-Wireless_Auditing-red?style=for-the-badge)

**Wireless network auditing and rogue access point platform**

---

## ⚠️ Legal Warning

**FOR AUTHORIZED PENETRATION TESTING ONLY**

Unauthorized wireless interception violates:
- Computer Fraud and Abuse Act (18 U.S.C. § 1030)
- Wiretap Act (18 U.S.C. § 2511)
- Electronic Communications Privacy Act
- FCC regulations on radio interference
- State computer crime laws

**[Read Full Legal Disclaimer](../LEGAL_DISCLAIMER.md)**

---

## 🎯 Device Overview

### Capabilities
- **Rogue Access Point** - Evil twin attacks
- **Man-in-the-Middle** - Wireless MITM
- **Deauthentication** - Force client disconnection
- **Captive Portal** - Credential harvesting
- **Packet Capture** - Full 802.11 monitoring
- **WPA/WPA2 Attacks** - Handshake capture
- **Client Reconnaissance** - Device fingerprinting
- **Remote Management** - Web-based control panel

### Technical Specs
- **Processor:** MediaTek MT7628 (580 MHz)
- **RAM:** 128MB DDR2
- **Storage:** 16MB Flash + MicroSD
- **Wireless:** Dual radio (2.4GHz + 5GHz)
  - Radio 0: Management interface
  - Radio 1: Attack/monitoring interface
- **Network:** Ethernet, USB tethering
- **OS:** Custom OpenWRT
- **Power:** USB-C or PoE
- **Models:** WiFi Pineapple Mark VII, Nano, Tetra

---

## 📦 Modules

### 1. Evil Portal
**File:** `modules/evil-portal.sh`

**Purpose:** Captive portal phishing for credential harvesting

**Features:**
- Customizable portal pages
- Clone legitimate portals
- Credential logging
- Client tracking
- Session management
- SSL bypass techniques

**Templates:**
- Corporate WiFi login
- Hotel WiFi portal
- Airport WiFi agreement
- Facebook WiFi portal
- Generic authentication

**Detectability:** Medium-High  
**Success Rate:** High (social engineering dependent)

**Use Cases:**
- Red team WiFi assessments
- Security awareness training
- Credential theft demonstration
- User behavior analysis

---

### 2. PineAP
**File:** `modules/pineap.sh`

**Purpose:** Rogue access point with automatic client association

**Features:**
- SSID harvesting from probe requests
- Automatic evil twin creation
- Client steering
- Karma attack
- Beacon response spoofing
- SSID broadcasting

**Configuration:**
```bash
# Enable PineAP
pineap enable

# Start harvesting SSIDs
pineap harvester start

# Enable beacon responses
pineap beacon_responses enable

# Allow client associations
pineap allow_associations enable
```

**Detectability:** Medium  
**Network Impact:** High (broadcasts multiple SSIDs)

**Detection Indicators:**
- Same SSID with different BSSID
- Stronger signal than legitimate AP
- Unexpected SSID appearances
- Multiple SSIDs from single MAC

---

### 3. Deauth Module
**File:** `modules/deauth.sh`

**Purpose:** WiFi deauthentication attacks

**Features:**
- Target specific clients
- Target entire networks
- Continuous deauth floods
- Selective client targeting
- Handshake capture preparation
- Client force-reconnect

**Attack Types:**
- Broadcast deauth (all clients)
- Unicast deauth (specific client)
- Disassociation frames
- Combined attack patterns

**Usage:**
```bash
# Deauth all clients from AP
./deauth.sh --bssid AA:BB:CC:DD:EE:FF --broadcast

# Deauth specific client
./deauth.sh --bssid AA:BB:CC:DD:EE:FF --client 11:22:33:44:55:66

# Continuous deauth
./deauth.sh --bssid AA:BB:CC:DD:EE:FF --continuous
```

**Detectability:** High  
**Legal Risk:** HIGH - FCC violations possible

---

### 4. Reconnaissance Scanner
**File:** `modules/recon-scanner.sh`

**Purpose:** Comprehensive wireless network discovery

**Collected Data:**
- Access points (SSID, BSSID, channel, encryption)
- Connected clients (MAC, signal strength, vendor)
- Network relationships (client-to-AP)
- Signal strengths (RSSI)
- Encryption types (Open, WEP, WPA, WPA2, WPA3)
- Hidden SSIDs
- Vendor identification
- Channel utilization

**Scan Modes:**
- Passive monitoring
- Active probing
- Channel hopping
- Fixed channel analysis

**Output Format:**
```json
{
  "ssid": "CorporateNetwork",
  "bssid": "AA:BB:CC:DD:EE:FF",
  "channel": 6,
  "encryption": "WPA2-PSK",
  "clients": 15,
  "signal": -45,
  "vendor": "Cisco"
}
```

**Execution Time:** Continuous monitoring  
**Detectability:** Low

---

### 5. WPA Handshake Capture
**File:** `modules/handshake-capture.sh`

**Purpose:** Capture WPA/WPA2 4-way handshakes for offline cracking

**Features:**
- Automatic client deauth
- Handshake detection
- Multiple BSSID monitoring
- EAPOL filtering
- CAP file generation
- Hash extraction

**Workflow:**
1. Monitor target network
2. Deauth client (force reconnect)
3. Capture 4-way handshake
4. Save to PCAP file
5. Extract hash for cracking

**Usage:**
```bash
# Capture handshake from specific AP
./handshake-capture.sh --bssid AA:BB:CC:DD:EE:FF

# With automatic deauth
./handshake-capture.sh --bssid AA:BB:CC:DD:EE:FF --deauth

# Monitor multiple networks
./handshake-capture.sh --file targets.txt
```

**Output:** .cap files compatible with hashcat/aircrack-ng

---

### 6. Packet Capture & Analysis
**File:** `modules/packet-capture.sh`

**Purpose:** Full 802.11 packet capture with filtering

**Capture Types:**
- Management frames (beacons, probes, auth)
- Data frames (encrypted/unencrypted)
- Control frames (ACK, RTS/CTS)
- All frames (promiscuous mode)

**Filters:**
- BSSID-specific
- SSID-specific
- Client-specific
- Protocol-specific (HTTP, DNS, etc.)

**Storage:**
- MicroSD auto-rotation
- Remote upload (SCP/FTP)
- Real-time streaming
- Compression support

**Analysis Features:**
- Client behavior patterns
- Network topology mapping
- Probe request analysis
- MAC address correlation

---

## 🛠️ Analysis Tools

### WiFi Capture Analyzer
**File:** `tools/wifi-analyzer.py`

**Purpose:** Analyze captured WiFi packets

**Features:**
- PCAP file parsing
- Client device fingerprinting
- Network relationship mapping
- Probe request analysis
- Encryption weakness identification
- Vendor identification
- Signal strength analysis
- Timeline reconstruction

**Usage:**
```bash
# Analyze capture
python tools/wifi-analyzer.py capture.cap

# Extract credentials
python tools/wifi-analyzer.py -e creds capture.cap

# Generate network map
python tools/wifi-analyzer.py -m map.html capture.cap

# Client profiling
python tools/wifi-analyzer.py --profile clients capture.cap
```

**Output Formats:**
- JSON (machine-readable)
- HTML (visual reports)
- CSV (spreadsheet import)
- Plain text (human-readable)

---

### Handshake Cracker
**File:** `tools/handshake-cracker.sh`

**Purpose:** Offline WPA/WPA2 password cracking

**Methods:**
- Dictionary attack (wordlist)
- Brute force (custom charset)
- Mask attack (pattern-based)
- Hybrid attack (wordlist + rules)

**Tools Integration:**
- hashcat (GPU acceleration)
- aircrack-ng (traditional)
- john (CPU-based)

**Usage:**
```bash
# Dictionary attack
./handshake-cracker.sh -i handshake.cap -w rockyou.txt

# Mask attack (8 digits)
./handshake-cracker.sh -i handshake.cap -m "?d?d?d?d?d?d?d?d"

# GPU-accelerated
./handshake-cracker.sh -i handshake.cap -w wordlist.txt --gpu
```

---

## 🚀 Quick Start

### Prerequisites
- WiFi Pineapple device (Mark VII, Nano, or Tetra)
- MicroSD card (32GB+ recommended)
- WiFi adapter (optional: external antenna)
- Target authorization
- FCC compliance awareness

### Initial Setup

1. **First Boot:**
```bash
# Connect to Pineapple WiFi
SSID: Pineapple_XXXX
Password: pineapplesareyummy

# Access web interface
http://172.16.42.1:1471

# Complete setup wizard
# Change default password
# Configure internet sharing
```

2. **Update Firmware:**
```bash
# Check for updates
opkg update

# Upgrade system
opkg upgrade

# Install dependencies
opkg install aircrack-ng tcpdump
```

3. **Module Installation:**
```bash
# Via Web UI:
# Navigate to Modules → Available Modules
# Install: PineAP, Evil Portal, Recon

# Via SSH:
scp modules/deauth.sh root@172.16.42.1:/pineapple/modules/
```

### Internet Sharing

**USB Tethering (Android/iPhone):**
```bash
# Enable USB tethering on phone
# Pineapple auto-detects and configures
```

**Ethernet:**
```bash
# Connect Ethernet cable
# Configure in web UI: Networking → Ethernet
```

**WiFi Client:**
```bash
# Connect to upstream WiFi
# Web UI: Networking → WiFi Client Mode
```

---

## 🎯 Attack Scenarios

### Scenario 1: Credential Harvesting

**Setup:**
1. Deploy Evil Portal with corporate template
2. Enable PineAP to harvest SSIDs
3. Clone target SSID with stronger signal
4. Wait for client associations

**Execution:**
```bash
# Start PineAP
pineap start

# Load Evil Portal
evil-portal enable --template corporate

# Monitor connections
tail -f /var/log/evil-portal.log
```

**Result:** Users connect and enter credentials

---

### Scenario 2: WPA2 Password Audit

**Setup:**
1. Identify target network
2. Capture handshake
3. Offline cracking

**Execution:**
```bash
# Start handshake capture
./handshake-capture.sh --bssid AA:BB:CC:DD:EE:FF --deauth

# Wait for capture (usually < 60 seconds)

# Offline cracking
./handshake-cracker.sh -i handshake.cap -w wordlist.txt
```

**Result:** Recovered WPA2 password (if weak)

---

### Scenario 3: Network Reconnaissance

**Setup:**
1. Deploy Pineapple in target area
2. Run continuous reconnaissance
3. Build network map

**Execution:**
```bash
# Start continuous scan
./recon-scanner.sh --continuous --output recon.json

# Analyze after collection
python tools/wifi-analyzer.py recon.json --map
```

**Result:** Complete wireless network topology

---

## 🛡️ Defensive Countermeasures

### Prevention

**Network Security:**
- Use WPA3 encryption (rogue AP resistant)
- Implement 802.1X (enterprise authentication)
- Enable Protected Management Frames (PMF)
- Disable WPS
- Use strong pre-shared keys (20+ characters)
- Hidden SSIDs with MAC filtering
- Wired connections for sensitive systems

**Physical Security:**
- Monitor for rogue APs (WIDS/WIPS)
- Regular wireless surveys
- Spectrum analysis
- RF shielding in sensitive areas
- Employee awareness training

**Client Protection:**
- Forget untrusted networks
- Disable auto-connect
- Use VPN on public WiFi
- Certificate pinning (mobile apps)
- HTTPS everywhere

### Detection

**Indicators of Attack:**
- Duplicate SSIDs with different BSSIDs
- Unexpected stronger signal from known AP
- Deauthentication storms
- Unusual captive portals
- Certificate warnings
- Multiple SSIDs from single location

**Monitoring Tools:**
- **WIDS/WIPS:** Cisco Adaptive wIPS, Aruba RFProtect
- **Wireless IDS:** Kismet, Snort-Wireless
- **Spectrum Analyzers:** Wi-Spy, AirMagnet
- **RF Monitoring:** Ekahau, NetAlly AirCheck

**SIEM Correlation:**
```
IF (Duplicate_SSID 
    AND Stronger_Signal 
    AND Client_Deauth)
THEN Alert = CRITICAL - Rogue AP Detected

IF (Captive_Portal 
    AND Certificate_Mismatch)
THEN Alert = HIGH - Evil Portal Suspected
```

### Response

**If Rogue AP Detected:**

1. **DO NOT disconnect clients** - Monitor first
2. **Locate device** - Directional antenna + RF tools
3. **Document evidence:**
   - BSSID, signal strength, location
   - Connected clients
   - PCAP of activity
4. **Physical removal** - Secure device for forensics
5. **Investigate scope:**
   - Compromised credentials
   - Captured traffic
   - Affected users
6. **Remediation:**
   - Force password resets
   - Review authentication logs
   - Enhance monitoring

---

## 📊 MITRE ATT&CK Mapping

| Tactic | Technique | ID |
|--------|-----------|-----|
| **Initial Access** | Exploit Public-Facing Application | T1190 |
| **Credential Access** | Network Sniffing | T1040 |
| **Credential Access** | Brute Force | T1110 |
| **Discovery** | Network Service Scanning | T1046 |
| **Collection** | Man in the Middle | T1557 |
| **Collection** | Data from Network Shared Drive | T1039 |
| **Command and Control** | Proxy | T1090 |
| **Exfiltration** | Automated Exfiltration | T1020 |

---

## 🎓 Educational Resources

### Official Documentation
- **Hak5 Shop:** https://shop.hak5.org/products/wifi-pineapple
- **WiFi Pineapple Wiki:** https://docs.hak5.org/wifi-pineapple
- **Module Repository:** https://github.com/hak5/wifipineapple-modules
- **Forums:** https://forums.hak5.org/forum/92-wifi-pineapple

### Training
- **SANS SEC617:** Wireless Penetration Testing and Ethical Hacking
- **Offensive Security PEN-210:** OSWP (Offensive Security Wireless Professional)
- **eLearnSecurity WiFi Security:** eWPT
- **WiFi Hacking 101:** Udemy/Cybrary courses

### Wireless Security
- **Books:**
  - *Hacking Exposed Wireless* (Johnny Cache)
  - *Wireless Network Security* (Yang Xiao)
  - *WiFi Hacking for Beginners* (Zaid Sabih)
- **Standards:**
  - IEEE 802.11 specifications
  - WPA3 security enhancements
  - 802.1X authentication

### Legal Considerations
- **FCC Regulations:** Part 15 (RF devices)
- **Radio Spectrum Laws:** Interference prohibited
- **Wiretap Act:** Wireless interception
- **State Laws:** Vary by jurisdiction

---

## 🔍 Common Attacks & Defenses

| Attack | Description | Defense |
|--------|-------------|---------|
| **Evil Twin** | Rogue AP mimicking legitimate network | WPA3, 802.1X, WIDS |
| **Karma** | Auto-connect to client probe requests | Disable auto-connect, VPN |
| **Deauth** | Force client disconnect | PMF (802.11w) |
| **WPA2 PSK Crack** | Handshake capture + offline crack | Strong passphrase (20+ chars) |
| **Captive Portal** | Fake login page | Certificate validation, awareness |
| **Packet Sniffing** | Capture wireless traffic | Encryption, VPN, HTTPS |

---

## 📝 Best Practices

### Operational Security
- Test in isolated/controlled environment
- Document all testing activities
- Maintain authorization paperwork
- Use separate attacker infrastructure
- Sanitize captured data
- Follow responsible disclosure

### Legal Compliance
- Written authorization REQUIRED
- Stay within defined scope
- Respect FCC regulations
- Avoid civilian WiFi networks
- Check state/local laws
- Coordinate with legal team

### Technical Tips
- External antennas for better range
- Battery packs for field deployments
- Faraday bags for device transport
- Regular firmware updates
- Backup configurations
- Test modules before deployment

---

## 🔗 Additional Resources

- **[Main Repository](../README.md)**
- **[Legal Disclaimer](../LEGAL_DISCLAIMER.md)**
- **[Defensive Guide](../DEFENSIVE_GUIDE.md)**
- **[KeyCroc Arsenal](../keycroc/README.md)**
- **[Rubber Ducky Arsenal](../rubber-ducky/README.md)**
- **[LAN Turtle Arsenal](../lan-turtle/README.md)**

---

## 📄 License

MIT License - See [LICENSE](../LICENSE)

---

## ⚠️ Final Reminder

**These modules are for AUTHORIZED TESTING ONLY.**

Unauthorized wireless attacks violate:
- **Wiretap Act** (18 U.S.C. § 2511) - Up to 5 years imprisonment
- **FCC Regulations** - Fines up to $10,000 per violation
- **Computer Fraud and Abuse Act** - Up to 10 years imprisonment
- **State computer crime laws** - Vary by jurisdiction

**Additional Risks:**
- Radio frequency interference (FCC violations)
- Interception of communications (wiretapping)
- Service disruption (denial of service)

**Wireless attacks require EXPLICIT authorization.**  
**FCC prohibits intentional interference.**  
**Check all applicable laws before deployment.**

---

**[← Back to Main Arsenal](../README.md)**
