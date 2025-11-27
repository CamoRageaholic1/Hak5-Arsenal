# Hak5 Arsenal

![Security](https://img.shields.io/badge/Security-Research-red?style=for-the-badge&logo=security&logoColor=white)
![Hak5](https://img.shields.io/badge/Hak5-Arsenal-blue?style=for-the-badge&logo=hackthebox&logoColor=white)
![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)
![Devices](https://img.shields.io/badge/Devices-3-orange?style=for-the-badge)

**Comprehensive collection of payloads, scripts, and tools for Hak5 penetration testing devices.**

**Author:** David Osisek (CamoZeroDay)  
**Purpose:** Authorized penetration testing and security education  
**Devices:** KeyCroc | Rubber Ducky | LAN Turtle

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

| Device | Category | Payloads | Tools | Status |
|--------|----------|----------|-------|--------|
| **KeyCroc** | USB Keystroke Injection | 2 | 1 | ✅ Active |
| **Rubber Ducky** | USB Keystroke Injection | 5 | 1 | ✅ Active |
| **LAN Turtle** | Network Implant | 4 | 2 | ✅ Active |

### Total Arsenal
- **📦 11 Payloads** across 3 devices
- **🛠️ 4 Analysis Tools** for automation
- **📚 15+ Documentation Files**
- **🛡️ Complete Defensive Guides** for each device

---

## 📁 Repository Structure

```
Hak5-Arsenal/
├── README.md                      # This file
├── LEGAL_DISCLAIMER.md            # Comprehensive legal framework
├── DEFENSIVE_GUIDE.md             # Multi-device defense strategies
├── LICENSE                        # MIT License
├── .gitignore                     # Protects sensitive data
│
├── keycroc/                       # KeyCroc Payloads
│   ├── README.md                  # Device-specific guide
│   ├── payloads/
│   │   ├── system-recon.croc
│   │   ├── cred-exfil-on-screenlock.croc
│   │   └── DOCUMENTATION.md
│   └── tools/
│       └── loot-analyzer.py
│
├── rubber-ducky/                  # Rubber Ducky Scripts
│   ├── README.md                  # Device-specific guide
│   ├── payloads/
│   │   ├── windows/
│   │   │   ├── system-recon.txt
│   │   │   ├── reverse-shell.txt
│   │   │   └── credential-harvester.txt
│   │   ├── linux/
│   │   │   ├── quick-recon.txt
│   │   │   └── persistence.txt
│   │   └── macos/
│   │       └── system-enum.txt
│   └── tools/
│       └── payload-encoder.py
│
├── lan-turtle/                    # LAN Turtle Modules
│   ├── README.md                  # Device-specific guide
│   ├── modules/
│   │   ├── persistent-access.sh
│   │   ├── network-recon.sh
│   │   ├── dns-spoof.sh
│   │   └── packet-capture.sh
│   └── tools/
│       ├── traffic-analyzer.py
│       └── module-manager.sh
│
└── tools/                         # Shared Tools
    ├── unified-analyzer.py        # Cross-device analysis
    └── payload-converter.py       # Convert between formats
```

---

## 🔧 Device-Specific Guides

### [KeyCroc](keycroc/README.md) 🐊
**USB keystroke injection and data exfiltration**

**Capabilities:**
- Inline keyboard interception
- Keystroke injection
- Mass storage for loot
- Network exfiltration

**Use Cases:**
- Credential harvesting
- System enumeration
- Data exfiltration
- Post-exploitation

**[View KeyCroc Payloads →](keycroc/)**

---

### [Rubber Ducky](rubber-ducky/README.md) 🦆
**USB keystroke injection with DuckyScript**

**Capabilities:**
- HID keyboard emulation
- Cross-platform payloads
- Rapid deployment
- No software installation

**Use Cases:**
- Quick reconnaissance
- Reverse shells
- Privilege escalation
- Persistence mechanisms

**[View Rubber Ducky Payloads →](rubber-ducky/)**

---

### [LAN Turtle](lan-turtle/README.md) 🐢
**Covert network access and man-in-the-middle**

**Capabilities:**
- Network implant
- Remote access
- Packet capture
- DNS/ARP spoofing

**Use Cases:**
- Network reconnaissance
- Traffic analysis
- Persistent access
- MITM attacks

**[View LAN Turtle Modules →](lan-turtle/)**

---

## 🎓 Educational Purpose

### For Red Teams (Offense)
- **Learn:** Attack techniques across multiple vectors
- **Practice:** Real-world penetration testing
- **Understand:** Device capabilities and limitations
- **Develop:** Custom payloads and modules

### For Blue Teams (Defense)
- **Understand:** Attacker methodologies
- **Detect:** Suspicious USB and network activity
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

**USB Security:**
- [ ] USB device whitelisting
- [ ] Block unauthorized HID devices
- [ ] Endpoint protection with USB monitoring
- [ ] Alert on new device connections

**Network Security:**
- [ ] Network segmentation
- [ ] Anomaly detection
- [ ] Baseline network behavior
- [ ] Monitor for rogue devices
- [ ] MAC address authentication

**Monitoring:**
- [ ] SIEM with device correlation
- [ ] USB device logging
- [ ] Network traffic analysis
- [ ] PowerShell/command logging
- [ ] Behavioral analytics

**📖 [COMPREHENSIVE DEFENSIVE GUIDE →](DEFENSIVE_GUIDE.md)**

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

### Device-Specific Setup

**KeyCroc:**
```bash
# Copy payload to device
scp keycroc/payloads/system-recon.croc root@172.16.64.1:/root/payloads/

# Set as active
ssh root@172.16.64.1 'cp /root/payloads/system-recon.croc /root/payload.croc'
```

**Rubber Ducky:**
```bash
# Encode payload
cd rubber-ducky/tools
python payload-encoder.py ../payloads/windows/system-recon.txt

# Copy inject.bin to Ducky SD card
cp inject.bin /media/DUCKY/
```

**LAN Turtle:**
```bash
# Copy module to device
scp lan-turtle/modules/network-recon.sh root@172.16.84.1:/turtle/modules/

# Enable module
ssh root@172.16.84.1
turtle-module enable network-recon
```

---

## 📊 Payload Overview

### KeyCroc Payloads

| Payload | Target | Execution Time | Stealth | Capabilities |
|---------|--------|----------------|---------|--------------|
| **System Recon** | Windows | 60-90s | Low | System enumeration |
| **Cred Exfil** | Windows | 120-300s | Medium | Credential harvesting |

### Rubber Ducky Payloads

| Payload | Target | Execution Time | Stealth | Capabilities |
|---------|--------|----------------|---------|--------------|
| **System Recon** | Windows | 30-60s | Low | Quick enumeration |
| **Reverse Shell** | Windows | 10-20s | Medium | Remote access |
| **Cred Harvester** | Windows | 45-90s | Low | Password extraction |
| **Quick Recon** | Linux | 20-40s | Low | System info gathering |
| **Persistence** | Linux | 30-60s | High | Backdoor installation |

### LAN Turtle Modules

| Module | Purpose | Network Impact | Detectability | Capabilities |
|--------|---------|----------------|---------------|--------------|
| **Persistent Access** | Remote shell | Low | Medium | SSH backdoor |
| **Network Recon** | Discovery | Medium | Low | Network mapping |
| **DNS Spoof** | MITM | High | High | Traffic redirection |
| **Packet Capture** | Analysis | Low | Low | Traffic recording |

---

## 🔍 Detection Methods

### USB Device Detection

**Windows Event Logs:**
- Event ID 6416 - New device recognized
- Event ID 20001/20003 - USB connect/disconnect
- Event ID 4688 - Process creation

**Indicators:**
- Unrecognized HID devices
- Rapid PowerShell execution after USB insertion
- Network connections from user workstations
- File creation on removable media

### Network Anomaly Detection

**Indicators:**
- Unknown MAC addresses
- Unexpected network segments
- Anomalous traffic patterns
- New DHCP requests
- Rogue DNS responses

**Tools:**
- SIEM correlation rules
- Network access control (NAC)
- Intrusion detection systems (IDS)
- Traffic baselines

---

## 🛠️ Analysis Tools

### Unified Loot Analyzer
**Purpose:** Cross-device payload analysis

```bash
python tools/unified-analyzer.py -d keycroc loot/recon-*.txt
python tools/unified-analyzer.py -d rubber-ducky loot/system-info.log
python tools/unified-analyzer.py -d lan-turtle captures/traffic.pcap
```

**Features:**
- Device-specific parsing
- Security gap identification
- Risk scoring
- JSON export
- Report generation

### Payload Converter
**Purpose:** Convert payloads between formats

```bash
# KeyCroc to Rubber Ducky
python tools/payload-converter.py -i keycroc -o ducky payload.croc

# Rubber Ducky to KeyCroc
python tools/payload-converter.py -i ducky -o keycroc payload.txt
```

---

## 📈 Statistics

- **Devices Supported:** 3
- **Total Payloads:** 11
- **Analysis Tools:** 4
- **Documentation Pages:** 15+
- **Lines of Code:** 5000+
- **MITRE Techniques:** 25+
- **Detection Methods:** 20+

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
- **Offensive Security PEN-200:** PWK
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
- Defensive strategies → See DEFENSIVE_GUIDE.md
- Contributions → Submit pull request

---

## ⚠️ Final Warning

**UNAUTHORIZED ACCESS IS A FEDERAL CRIME**

- These tools are for **AUTHORIZED TESTING ONLY**
- Violations result in **CRIMINAL PROSECUTION**
- You are **SOLELY RESPONSIBLE** for your actions
- **CHECK LOCAL LAWS** before use

**If there is ANY doubt about authorization, DO NOT PROCEED.**

---

**🔒 Use Responsibly. Test Ethically. Defend Proactively. 🔒**

*Last Updated: November 2025*
