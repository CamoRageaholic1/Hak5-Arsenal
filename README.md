# Hak5 Arsenal

![Security](https://img.shields.io/badge/Security-Research-red?style=for-the-badge&logo=security&logoColor=white)
![Hak5](https://img.shields.io/badge/Hak5-Arsenal-blue?style=for-the-badge&logo=hackthebox&logoColor=white)
![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)
![Devices](https://img.shields.io/badge/Devices-6-orange?style=for-the-badge)
![Payloads](https://img.shields.io/badge/Payloads-32-purple?style=for-the-badge)

**Comprehensive collection of 32 production-ready payloads for Hak5 penetration testing devices.**

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

| Device | Category | Payloads | Status |
|--------|----------|----------|--------|
| **KeyCroc** | USB Keystroke Injection | 5 | ✅ Complete |
| **Rubber Ducky** | USB Keystroke Injection | 6 | ✅ Complete |
| **LAN Turtle** | Network Implant | 5 | ✅ Complete |
| **WiFi Pineapple** | Wireless Auditing | 6 | ✅ Complete |
| **Plunder Bug** | USB Data Exfiltration | 5 | ✅ Complete |
| **Shark Jack** | Portable Network Attack | 5 | ✅ Complete |

### Total Arsenal
- **📦 32 Payloads/Modules** fully implemented and tested
- **📚 100KB+ Documentation** across 6 devices
- **🛡️ Complete Defensive Guides** for each device
- **🔍 Detection Methods** with SIEM rules

---

## 📁 Repository Structure

```
Hak5-Arsenal/
├── README.md                      # This file
├── LEGAL_DISCLAIMER.md            # Comprehensive legal framework
├── COMPLETION_SUMMARY.md          # Project completion details
├── LICENSE                        # MIT License
├── requirements.txt               # Python dependencies
├── .gitignore                     # Protects sensitive data
│
├── keycroc/                       # KeyCroc Payloads (5)
│   ├── README.md                  # Device documentation (15KB)
│   └── payloads/
│       ├── system-recon.croc
│       ├── browser-cred-exfil.croc
│       ├── wifi-password-dump.croc
│       ├── sam-registry-dump.croc
│       └── reverse-shell.croc
│
├── rubber-ducky/                  # Rubber Ducky Scripts (6)
│   ├── README.md                  # Device documentation (18KB)
│   └── payloads/
│       ├── windows/
│       │   ├── system-recon.txt
│       │   ├── reverse-shell.txt
│       │   └── credential-harvester.txt
│       ├── linux/
│       │   ├── quick-recon.txt
│       │   └── persistence.txt
│       └── macos/
│           └── system-enum.txt
│
├── lan-turtle/                    # LAN Turtle Modules (5)
│   ├── README.md                  # Device documentation (19KB)
│   └── modules/
│       ├── persistent-access.sh
│       ├── network-recon.sh
│       ├── dns-spoof.sh
│       ├── packet-capture.sh
│       └── mitm-sslstrip.sh
│
├── wifi-pineapple/                # WiFi Pineapple Modules (6)
│   ├── README.md                  # Device documentation (15KB)
│   └── modules/
│       ├── evil-portal.sh
│       ├── pineap.sh
│       ├── deauth.sh
│       ├── recon-scanner.sh
│       ├── handshake-capture.sh
│       └── packet-capture.sh
│
├── plunder-bug/                   # Plunder Bug Modules (5)
│   ├── README.md                  # Device documentation (20KB)
│   └── modules/
│       ├── document-harvester.sh
│       ├── creds-and-keys.sh
│       ├── media-collector.sh
│       ├── database-exfiltrator.sh
│       └── source-code-collector.sh
│
└── shark-jack/                    # Shark Jack Modules (5)
    ├── README.md                  # Device documentation (18KB)
    └── modules/
        ├── network-recon.sh
        ├── packet-capture.sh
        ├── smb-enumeration.sh
        ├── responder-attack.sh
        └── ssh-bruteforce.sh
```

---

## 🔧 Device-Specific Guides

### [KeyCroc](keycroc/README.md) 🐊
**USB keystroke injection and credential exfiltration**

**5 Production Payloads:**
1. **system-recon.croc** - Complete Windows system enumeration (25+ categories)
2. **browser-cred-exfil.croc** - Chrome, Firefox, Edge credential databases
3. **wifi-password-dump.croc** - All saved WiFi network passwords
4. **sam-registry-dump.croc** - Windows SAM/SYSTEM/SECURITY hives (requires admin)
5. **reverse-shell.croc** - PowerShell reverse shell connection

**[View KeyCroc Payloads →](keycroc/)**

---

### [Rubber Ducky](rubber-ducky/README.md) 🦆
**USB keystroke injection with DuckyScript**

**6 Production Payloads:**

**Windows (3):**
1. **system-recon.txt** - Fast Windows enumeration
2. **reverse-shell.txt** - PowerShell reverse shell
3. **credential-harvester.txt** - Multi-browser credential extraction

**Linux (2):**
4. **quick-recon.txt** - Rapid Linux system discovery
5. **persistence.txt** - SSH backdoor with cron persistence

**macOS (1):**
6. **system-enum.txt** - macOS system profiler data collection

**[View Rubber Ducky Payloads →](rubber-ducky/)**

---

### [LAN Turtle](lan-turtle/README.md) 🐢
**Covert network implant and MITM attacks**

**5 Production Modules:**
1. **persistent-access.sh** - Autossh reverse tunnel with auto-reconnect
2. **network-recon.sh** - Comprehensive network mapping (nmap, arp-scan)
3. **dns-spoof.sh** - DNS redirection and poisoning
4. **packet-capture.sh** - Full traffic capture with rotation
5. **mitm-sslstrip.sh** - SSL downgrade MITM attack

**[View LAN Turtle Modules →](lan-turtle/)**

---

### [WiFi Pineapple](wifi-pineapple/README.md) 🍍
**Wireless network auditing and rogue access point**

**6 Production Modules:**
1. **evil-portal.sh** - Captive portal phishing with credential logging
2. **pineap.sh** - Rogue AP with Karma attack and SSID harvesting
3. **deauth.sh** - WiFi deauthentication attacks (⚠️ HIGH DETECTABILITY)
4. **recon-scanner.sh** - Wireless network and client discovery
5. **handshake-capture.sh** - WPA/WPA2 4-way handshake capture
6. **packet-capture.sh** - Full 802.11 frame capture

**[View WiFi Pineapple Modules →](wifi-pineapple/)**

---

### [Plunder Bug](plunder-bug/README.md) 🐞
**Covert USB data exfiltration and file harvesting**

**5 Production Modules:**
1. **document-harvester.sh** - Office documents, PDFs, text files
2. **creds-and-keys.sh** - SSH keys, browser DBs, GPG keys, password managers
3. **media-collector.sh** - Images, videos, audio with filtering
4. **database-exfiltrator.sh** - SQLite, CSV, Excel databases
5. **source-code-collector.sh** - Source code and Git repositories

**[View Plunder Bug Modules →](plunder-bug/)**

---

### [Shark Jack](shark-jack/README.md) 🦈
**Portable network attack and reconnaissance**

**5 Production Modules:**
1. **network-recon.sh** - Fast network discovery (2-10 min)
2. **packet-capture.sh** - Targeted traffic capture (HTTP/FTP/Telnet)
3. **smb-enumeration.sh** - Windows share and NetBIOS discovery
4. **responder-attack.sh** - LLMNR/NBT-NS poisoning for NTLMv2 hashes
5. **ssh-bruteforce.sh** - SSH credential testing with common passwords

**[View Shark Jack Modules →](shark-jack/)**

---

## 📊 Complete Payload Matrix

### USB Attack Devices (16 payloads)

| Device | Payload | Category | Target |
|--------|---------|----------|--------|
| KeyCroc | system-recon | Reconnaissance | Windows |
| KeyCroc | browser-cred-exfil | Credential Access | Windows |
| KeyCroc | wifi-password-dump | Credential Access | Windows |
| KeyCroc | sam-registry-dump | Credential Access | Windows (Admin) |
| KeyCroc | reverse-shell | Execution | Windows |
| Rubber Ducky | system-recon | Reconnaissance | Windows |
| Rubber Ducky | reverse-shell | Execution | Windows |
| Rubber Ducky | credential-harvester | Credential Access | Windows |
| Rubber Ducky | quick-recon | Reconnaissance | Linux |
| Rubber Ducky | persistence | Persistence | Linux |
| Rubber Ducky | system-enum | Reconnaissance | macOS |
| Plunder Bug | document-harvester | Collection | Cross-platform |
| Plunder Bug | creds-and-keys | Credential Access | Cross-platform |
| Plunder Bug | media-collector | Collection | Cross-platform |
| Plunder Bug | database-exfiltrator | Collection | Cross-platform |
| Plunder Bug | source-code-collector | Collection | Cross-platform |

### Network Attack Devices (10 payloads)

| Device | Module | Category | Detectability |
|--------|--------|----------|--------------|
| LAN Turtle | persistent-access | Persistence | Low |
| LAN Turtle | network-recon | Discovery | Medium |
| LAN Turtle | dns-spoof | MITM | High |
| LAN Turtle | packet-capture | Collection | Low |
| LAN Turtle | mitm-sslstrip | MITM | High |
| Shark Jack | network-recon | Discovery | Medium |
| Shark Jack | packet-capture | Collection | Low |
| Shark Jack | smb-enumeration | Discovery | Medium |
| Shark Jack | responder-attack | Credential Access | High |
| Shark Jack | ssh-bruteforce | Credential Access | High |

### Wireless Attack Device (6 payloads)

| Module | Category | Detectability | Legal Risk |
|--------|----------|---------------|------------|
| evil-portal | Credential Access | Medium-High | High |
| pineap | MITM | Medium | High |
| deauth | Denial of Service | High | VERY HIGH |
| recon-scanner | Discovery | Low | Low |
| handshake-capture | Credential Access | Medium | Medium |
| packet-capture | Collection | Low | Low |

---

## 🚀 Quick Start

### Prerequisites

```bash
# Clone repository
git clone https://github.com/CamoRageaholic1/Hak5-Arsenal.git
cd Hak5-Arsenal

# Install Python dependencies (for future tools)
pip install -r requirements.txt
```

### KeyCroc Deployment

```bash
# Copy payload to KeyCroc
scp keycroc/payloads/system-recon.croc root@172.16.64.1:/root/payloads/

# SSH to KeyCroc and activate
ssh root@172.16.64.1
cp /root/payloads/system-recon.croc /root/payload.croc

# Deploy device and wait for LED to indicate completion
```

### Rubber Ducky Deployment

```bash
# Payloads are in DuckyScript format (.txt)
# Use duckencoder or online encoder to convert to inject.bin
# Copy inject.bin to Ducky SD card

# Example: Encode Windows recon payload
# (Use online encoder at: https://ducktoolkit.com/encode)
# Copy rubber-ducky/payloads/windows/system-recon.txt
# Encode to inject.bin
# Copy inject.bin to Ducky SD card root
```

### LAN Turtle Deployment

```bash
# Copy module to LAN Turtle
scp lan-turtle/modules/network-recon.sh root@172.16.84.1:/root/modules/

# SSH and execute
ssh root@172.16.84.1
bash /root/modules/network-recon.sh
```

### WiFi Pineapple Deployment

```bash
# SSH to Pineapple
ssh root@172.16.42.1

# Copy module
scp wifi-pineapple/modules/evil-portal.sh root@172.16.42.1:/root/modules/

# Execute module
bash /root/modules/evil-portal.sh
```

### Plunder Bug Deployment

```bash
# Mount Plunder Bug MicroSD card
# Copy modules to card
cp plunder-bug/modules/*.sh /mnt/plunderbug/

# Configure target file types in each module
# Insert into target system
# Modules execute automatically
# Retrieve device and mount to view loot/
```

### Shark Jack Deployment

```bash
# Enter Arming Mode (hold button during boot - LED turns blue)
ssh root@172.16.24.1
# Password: hak5shark

# Copy payload
scp shark-jack/modules/network-recon.sh root@172.16.24.1:/root/payloads/

# Set as active payload
cp /root/payloads/network-recon.sh /root/payload.sh
chmod +x /root/payload.sh

# Deploy on target network, press button to execute
```

---

## 🛡️ Defensive Strategies

### Quick Defense Checklist

**Physical Security:**
- [x] Lock workstations when unattended
- [x] Disable unused USB ports
- [x] Implement clean desk policy
- [x] Use cable locks for devices
- [x] Secure network equipment in locked rooms
- [x] Monitor for rogue wireless access points

**USB Security:**
- [x] USB device whitelisting
- [x] Block unauthorized HID devices
- [x] Endpoint protection with USB monitoring
- [x] Alert on new device connections
- [x] Disable AutoRun/AutoPlay

**Network Security:**
- [x] Network segmentation (VLANs)
- [x] Anomaly detection systems
- [x] Baseline network behavior
- [x] Monitor for rogue devices (NAC)
- [x] MAC address authentication
- [x] 802.1X authentication

**Wireless Security:**
- [x] WPA3 encryption
- [x] Protected Management Frames (PMF 802.11w)
- [x] WIDS/WIPS deployment
- [x] Regular wireless surveys
- [x] Disable WPS
- [x] Strong PSKs (20+ characters)

**Monitoring:**
- [x] SIEM with correlation rules
- [x] USB device logging
- [x] Network traffic analysis
- [x] PowerShell command logging
- [x] Behavioral analytics (UEBA)
- [x] Wireless IDS (Kismet, WIDS)

---

## 🔍 Detection Methods

### USB Device Detection
- Event ID 6416 - New device recognized
- Event ID 20001/20003 - USB connect/disconnect
- Event ID 4688 - Process creation after USB insertion
- Rapid sequential file access patterns
- Unknown HID devices

### Network Anomaly Detection
- Unknown MAC addresses on network
- Network scanning activity (nmap signatures)
- LLMNR/NBT-NS poisoning attempts
- Rogue DHCP responses
- SSH brute force attempts
- Unusual authentication patterns
- New devices requesting DHCP

### Wireless Attack Detection
- Duplicate SSIDs with different BSSIDs
- Deauthentication storms (excessive deauth frames)
- Rogue access points
- Evil twin detection
- Certificate warnings on known networks
- Unexpected captive portals

---

## 📈 Statistics

- **Devices Supported:** 6
- **Total Payloads:** 32 (100% complete)
- **Documentation:** 100KB+
- **Lines of Code:** 3,000+
- **Device Categories:** USB (3), Network (2), Wireless (1)
- **Platforms Covered:** Windows, Linux, macOS
- **MITRE Techniques:** 50+
- **Detection Methods:** 40+

---

## 🎓 Educational Resources

### Official Hak5 Documentation
- **Hak5 Shop:** https://shop.hak5.org
- **Hak5 Docs:** https://docs.hak5.org
- **Hak5 Forums:** https://forums.hak5.org
- **DuckyScript:** https://docs.hak5.org/duckyscript

### Training Courses
- **SANS SEC560:** Network Penetration Testing
- **SANS SEC504:** Hacker Tools and Techniques
- **SANS SEC617:** Wireless Penetration Testing
- **SANS FOR508:** Advanced Incident Response
- **Offensive Security PEN-200:** PWK/OSCP
- **Offensive Security PEN-210:** OSWP
- **eLearnSecurity eCPPT**

### Community Resources
- **Reddit:** /r/hak5
- **Discord:** Hak5 Community Server
- **GitHub:** Official Hak5 Repositories

---

## 🤝 Contributing

Contributions are welcome! Please follow these guidelines:

1. Fork the repository
2. Create a feature branch
3. Follow existing code structure
4. Include legal disclaimers
5. Document defensive countermeasures
6. Provide detection methods
7. Test thoroughly
8. Submit pull request

**All contributions must:**
- Include appropriate legal warnings
- Be educational in nature
- Follow ethical guidelines
- Document blue team defenses

---

## 📄 License

MIT License - See [LICENSE](LICENSE)

**Copyright © 2025 David Osisek**

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND.

---

## 📧 Contact

**Author:** David Osisek (CamoZeroDay)  
**GitHub:** [@CamoRageaholic1](https://github.com/CamoRageaholic1)  
**LinkedIn:** [linkedin.com/in/davidosisek](https://linkedin.com/in/davidosisek)

**For questions about:**
- Payload usage → Read device-specific documentation
- Legal concerns → Consult an attorney
- Defensive strategies → See device-specific guides
- Contributions → Submit a pull request

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

## 🏆 Project Highlights

**What Makes This Repository Unique:**
- ✅ Most comprehensive Hak5 arsenal on GitHub (6 devices, 32 payloads)
- ✅ Production-ready code (tested and documented)
- ✅ Both offensive and defensive perspectives
- ✅ Legal compliance frameworks
- ✅ MITRE ATT&CK mapping
- ✅ Professional-grade documentation (100KB+)
- ✅ Multi-platform support (Windows, Linux, macOS)
- ✅ Complete detection methodologies

**Ideal For:**
- Security researchers
- Penetration testers
- Red team operators
- Blue team defenders
- Security students
- IT professionals

---

**🔒 Use Responsibly. Test Ethically. Defend Proactively. 🔒**

*Last Updated: November 2025*
