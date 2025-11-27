# Hak5 Arsenal

![Security](https://img.shields.io/badge/Security-Research-red?style=for-the-badge&logo=security&logoColor=white)
![Hak5](https://img.shields.io/badge/Hak5-Arsenal-blue?style=for-the-badge&logo=hackthebox&logoColor=white)
![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)
![Devices](https://img.shields.io/badge/Devices-6-orange?style=for-the-badge)

**Comprehensive collection of payloads, scripts, and tools for Hak5 penetration testing devices.**

**Author:** David Osisek (CamoZeroDay)  
**Purpose:** Authorized penetration testing and security education  
**Devices:** KeyCroc | Rubber Ducky | LAN Turtle | WiFi Pineapple | Plunder Bug | Shark Jack

---

## ⚠️ CRITICAL LEGAL WARNING

### READ BEFORE ACCESSING ANY FILES

**ALL content in this repository is for AUTHORIZED PENETRATION TESTING ONLY.**

### Federal Laws (United States):
- **Computer Fraud and Abuse Act (CFAA)** - 18 U.S.C. § 1030
- **Electronic Communications Privacy Act (ECPA)** - 18 U.S.C. § 2510-2523  
- **Wiretap Act** - 18 U.S.C. § 2511

### ⚠️ State and Local Laws:
**CHECK YOUR JURISDICTION** - State laws vary significantly. You MUST research and comply with your state's computer crime, data protection, and privacy laws.

### Consequences of Unauthorized Use:
- Federal imprisonment (up to 10 years)
- Fines up to $250,000
- Civil liability
- Professional license revocation
- Permanent criminal record

### Required Before Use:
- ✅ Written authorization from system owner
- ✅ Clearly defined scope
- ✅ Documented test plan
- ✅ Legal agreements in place

**📖 [FULL LEGAL DISCLAIMER →](LEGAL_DISCLAIMER.md)**

---

## 🎯 Repository Overview

### Supported Devices

| Device | Category | Payloads/Modules | Tools | Status |
|--------|----------|------------------|-------|--------|
| **KeyCroc** | USB Keystroke Injection | 2 | 1 | ✅ Active |
| **Rubber Ducky** | USB Keystroke Injection | 5 | 1 | ✅ Active |
| **LAN Turtle** | Network Implant | 4 | 2 | ✅ Active |
| **WiFi Pineapple** | Wireless Auditing | 6 | 2 | ✅ Active |
| **Plunder Bug** | USB Data Exfiltration | 4 | 2 | ✅ Active |
| **Shark Jack** | Portable Network Attack | 5 | 2 | ✅ Active |

### Total Arsenal
- **📦 26 Payloads/Modules** across 6 devices
- **🛠️ 10 Analysis Tools** for automation
- **📚 30+ Documentation Files**
- **🛡️ Complete Defensive Guides** for each device

---

## 🔧 Device-Specific Guides

### [KeyCroc](keycroc/README.md) 🐊
**USB keystroke injection and data exfiltration**

**Use Cases:** Credential harvesting, system enumeration, data exfiltration, post-exploitation

**[View KeyCroc Payloads →](keycroc/)**

---

### [Rubber Ducky](rubber-ducky/README.md) 🦆
**USB keystroke injection with DuckyScript**

**Use Cases:** Quick reconnaissance, reverse shells, privilege escalation, persistence

**[View Rubber Ducky Payloads →](rubber-ducky/)**

---

### [LAN Turtle](lan-turtle/README.md) 🐢
**Covert network access and man-in-the-middle**

**Use Cases:** Network reconnaissance, traffic analysis, persistent access, MITM attacks

**[View LAN Turtle Modules →](lan-turtle/)**

---

### [WiFi Pineapple](wifi-pineapple/README.md) 🍍
**Wireless network auditing and rogue access point**

**Use Cases:** Wireless security auditing, evil twin attacks, credential harvesting, WPA2 auditing

**[View WiFi Pineapple Modules →](wifi-pineapple/)**

---

### [Plunder Bug](plunder-bug/README.md) 🐞
**Covert USB data exfiltration and file harvesting**

**Use Cases:** Document collection, credential harvesting, media collection, database exfiltration

**[View Plunder Bug Modules →](plunder-bug/)**

---

### [Shark Jack](shark-jack/README.md) 🦈
**Portable network attack and reconnaissance**

**Use Cases:** Quick network audits, packet capture, credential sniffing, SMB enumeration

**[View Shark Jack Modules →](shark-jack/)**

---

## 🎓 Educational Purpose

### For Red Teams (Offense)
- **Learn:** Attack techniques across multiple vectors
- **Practice:** Real-world penetration testing
- **Understand:** Device capabilities and limitations
- **Develop:** Custom payloads and modules

### For Blue Teams (Defense)
- **Understand:** Attacker methodologies
- **Detect:** Suspicious USB, network, and wireless activity
- **Implement:** Multi-layered defenses
- **Test:** Security controls effectiveness

### MITRE ATT&CK Coverage

**Tactics Demonstrated:**
- TA0001 - Initial Access
- TA0002 - Execution
- TA0003 - Persistence
- TA0004 - Privilege Escalation
- TA0005 - Defense Evasion
- TA0006 - Credential Access
- TA0007 - Discovery
- TA0008 - Lateral Movement
- TA0009 - Collection
- TA0010 - Exfiltration
- TA0011 - Command and Control

---

## 🛡️ Defensive Strategies

### Quick Defense Checklist

**Physical Security:**
- [ ] Lock workstations when unattended
- [ ] Disable unused USB ports
- [ ] Implement clean desk policy
- [ ] Cable locks for devices
- [ ] Network equipment in secure locations
- [ ] Monitor for rogue access points

**USB Security:**
- [ ] USB device whitelisting
- [ ] Block unauthorized HID devices
- [ ] Endpoint protection with USB monitoring
- [ ] Alert on new device connections
- [ ] Disable AutoRun/AutoPlay

**Network Security:**
- [ ] Network segmentation
- [ ] Anomaly detection
- [ ] Baseline network behavior
- [ ] Monitor for rogue devices
- [ ] MAC address authentication
- [ ] 802.1X authentication

**Wireless Security:**
- [ ] WPA3 encryption
- [ ] Protected Management Frames (PMF)
- [ ] WIDS/WIPS deployment
- [ ] Regular wireless surveys
- [ ] Disable WPS
- [ ] Strong pre-shared keys (20+ characters)

**Monitoring:**
- [ ] SIEM with device correlation
- [ ] USB device logging
- [ ] Network traffic analysis
- [ ] PowerShell/command logging
- [ ] Behavioral analytics
- [ ] Wireless IDS (Kismet, WIDS)

---

## 📊 Complete Payload Overview

### USB Attack Devices

**KeyCroc:**
- System Reconnaissance (Windows)
- Credential Exfiltration (Windows)

**Rubber Ducky:**
- System Recon (Windows)
- Reverse Shell (Windows)
- Credential Harvester (Windows)
- Quick Recon (Linux)
- Persistence (Linux)

**Plunder Bug:**
- Document Harvester
- Credentials & Keys
- Media Collector
- Database Exfiltrator

### Network Attack Devices

**LAN Turtle:**
- Persistent Access
- Network Reconnaissance
- DNS Spoofing
- Packet Capture

**Shark Jack:**
- Network Reconnaissance
- Packet Capture
- SMB Enumeration
- Responder Attack
- SSH Brute Force

### Wireless Attack Device

**WiFi Pineapple:**
- Evil Portal
- PineAP
- Deauthentication
- Recon Scanner
- Handshake Capture
- Packet Capture

---

## 🚀 Quick Start

### Installation

```bash
# Clone repository
git clone https://github.com/CamoRageaholic1/Hak5-Arsenal.git
cd Hak5-Arsenal

# Install Python tools dependencies
pip install -r requirements.txt
```

### Device Setup Examples

**USB Devices (KeyCroc, Rubber Ducky, Plunder Bug):**
```bash
# KeyCroc
scp keycroc/payloads/system-recon.croc root@172.16.64.1:/root/payloads/

# Rubber Ducky
python rubber-ducky/tools/payload-encoder.py payload.txt

# Plunder Bug
# Copy modules to MicroSD card
cp plunder-bug/modules/*.sh /mnt/plunderbug/
```

**Network Devices (LAN Turtle, Shark Jack):**
```bash
# LAN Turtle
scp lan-turtle/modules/network-recon.sh root@172.16.84.1:/turtle/modules/

# Shark Jack
ssh root@172.16.24.1
cp /root/payloads/network-recon.sh /root/payload.sh
```

**Wireless Device (WiFi Pineapple):**
```bash
# Web interface
http://172.16.42.1:1471

# SSH
scp wifi-pineapple/modules/evil-portal.sh root@172.16.42.1:/pineapple/modules/
```

---

## 🔍 Detection Methods

### USB Device Detection
- Event ID 6416 - New device recognized
- Event ID 20001/20003 - USB connect/disconnect
- Rapid file access patterns
- Unknown HID devices
- Bulk file reads

### Network Anomaly Detection
- Unknown MAC addresses
- Network scanning activity
- LLMNR/NBT-NS poisoning
- Rogue DHCP responses
- SSH brute force attempts
- Unusual authentication patterns

### Wireless Attack Detection
- Duplicate SSIDs with different BSSIDs
- Deauthentication storms
- Rogue access points
- Evil twin detection
- Certificate warnings
- Unexpected captive portals

---

## 🛠️ Analysis Tools

### Cross-Device Analyzers
- **Unified Loot Analyzer** - Parse all device outputs
- **Payload Converter** - Convert between formats
- **WiFi Analyzer** - PCAP analysis
- **Plunder Analyzer** - File categorization
- **Shark Jack Analyzer** - Network data processing
- **Hash Cracker** - Credential recovery
- **Traffic Analyzer** - Network forensics
- **Handshake Cracker** - WPA2 cracking
- **File Classifier** - Data organization
- **Loot Analyzers** - Device-specific parsing

---

## 📈 Statistics

- **Devices Supported:** 6
- **Total Payloads/Modules:** 26
- **Analysis Tools:** 10
- **Documentation Pages:** 30+
- **Lines of Code:** 15,000+
- **MITRE Techniques:** 50+
- **Detection Methods:** 40+

---

## 🤝 Contributing

### We Welcome Contributions!

**Contribution Types:**
- New payloads/modules
- Detection improvements
- Analysis tools
- Documentation
- Defensive strategies

**Guidelines:**
1. Fork repository
2. Create feature branch
3. Follow existing structure
4. Include legal disclaimers
5. Document defensive countermeasures
6. Provide detection methods
7. Test thoroughly
8. Submit pull request

**All contributions must:**
- Include legal disclaimers
- Be educational in nature
- Follow ethical guidelines
- Document blue team defenses

---

## 📚 Resources

### Training
- **SANS SEC560:** Network Penetration Testing
- **SANS SEC504:** Hacker Tools and Techniques
- **SANS SEC617:** Wireless Penetration Testing
- **SANS FOR508:** Advanced Incident Response
- **Offensive Security PEN-200:** PWK/OSCP
- **Offensive Security PEN-210:** OSWP
- **eLearnSecurity eCPPT**

### Communities
- **Hak5 Forums:** https://forums.hak5.org
- **Reddit /r/hak5**
- **Discord:** Hak5 Community

### Documentation
- **Hak5 Docs:** https://docs.hak5.org
- **DuckyScript:** https://docs.hak5.org/duckyscript
- **KeyCroc Wiki:** https://github.com/hak5/keycroc-payloads
- **LAN Turtle Wiki:** https://github.com/hak5/lanturtle-modules
- **WiFi Pineapple Wiki:** https://github.com/hak5/wifipineapple-modules
- **Shark Jack Wiki:** https://github.com/hak5/sharkjack-payloads

---

## 📄 License

MIT License - See [LICENSE](LICENSE)

**Copyright © 2025 David Osisek**

---

## 📧 Contact

**Author:** David Osisek (CamoZeroDay)  
**GitHub:** [@CamoRageaholic1](https://github.com/CamoRageaholic1)  
**LinkedIn:** [linkedin.com/in/davidosisek](https://linkedin.com/in/davidosisek)

**For questions about:**
- Payload usage → Read device-specific docs
- Legal concerns → Consult attorney
- Defensive strategies → See device-specific guides
- Contributions → Submit pull request

---

## ⚠️ Final Warning

**UNAUTHORIZED ACCESS IS A FEDERAL CRIME**

- These tools are for **AUTHORIZED TESTING ONLY**
- Violations result in **CRIMINAL PROSECUTION**
- You are **SOLELY RESPONSIBLE** for your actions
- **CHECK LOCAL LAWS** before use
- **FCC regulations** apply to wireless devices

**If there is ANY doubt about authorization, DO NOT PROCEED.**

---

**🔒 Use Responsibly. Test Ethically. Defend Proactively. 🔒**

*Last Updated: November 2025*
