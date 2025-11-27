# KeyCroc Arsenal 🐊

![KeyCroc](https://img.shields.io/badge/Device-KeyCroc-green?style=for-the-badge)
![Payloads](https://img.shields.io/badge/Payloads-2-blue?style=for-the-badge)
![Tools](https://img.shields.io/badge/Tools-1-orange?style=for-the-badge)

**USB keystroke injection and credential exfiltration device**

---

## ⚠️ Legal Warning

**FOR AUTHORIZED PENETRATION TESTING ONLY**

Unauthorized use violates:
- Computer Fraud and Abuse Act (18 U.S.C. § 1030)
- Electronic Communications Privacy Act (18 U.S.C. § 2510-2523)
- State computer crime laws

**[Read Full Legal Disclaimer](../LEGAL_DISCLAIMER.md)**

---

## 🎯 Device Overview

### Capabilities
- **Inline Keyboard Interception** - Sits between keyboard and computer
- **Keystroke Injection** - HID attack mode
- **Mass Storage** - Exfiltrate data via storage mode
- **Network Exfiltration** - Remote data transfer
- **Dual Attack Modes** - HID + Storage simultaneously

### Technical Specs
- **Processor:** ARM Cortex-A7
- **Storage:** MicroSD (up to 128GB)
- **Interface:** USB Type-A
- **Network:** Ethernet over USB
- **OS:** Custom Linux (Buildroot)
- **Languages:** Bash, C, Python

---

## 📦 Payloads

### 1. System Reconnaissance
**File:** `payloads/system-recon.croc`

**Purpose:** Comprehensive Windows system enumeration

**Collected Data:**
- System information (OS, patches, hardware)
- Network configuration (IPs, DNS, routes, connections)
- User accounts and privileges
- Running processes and services
- Installed software
- Security products (AV, firewall)
- Recent activity and USB history

**Execution Time:** 60-90 seconds  
**Stealth Level:** Low (PowerShell visible)  
**Target:** Windows 8/10/11, Server 2012+

**[Full Documentation →](payloads/SYSTEM_RECON_README.md)**

---

### 2. Credential Exfiltration on Screenlock
**File:** `payloads/cred-exfil-on-screenlock.croc`

**Purpose:** Extract credentials when user locks workstation

**Extracted Data:**
- Chrome/Firefox saved passwords
- Windows Credential Vault
- WiFi passwords
- Registry hives (SAM/SYSTEM)
- LSASS memory dumps

**Execution Time:** 120-300 seconds  
**Stealth Level:** Medium (runs during screenlock)  
**Target:** Windows 10/11

**Advanced Payload** - Requires careful timing and testing

---

## 🛠️ Analysis Tools

### Loot Analyzer
**File:** `tools/loot-analyzer.py`

**Purpose:** Automated analysis of captured reconnaissance data

**Features:**
- Parses system reconnaissance output
- Identifies security gaps (missing patches, weak configs)
- Network analysis (IPs, DNS, connections)
- Service analysis (risky services)
- Risk scoring system (Critical/High/Medium/Low)
- Color-coded console output
- JSON export for reporting
- Batch analysis support

**Usage:**
```bash
# Single file analysis
python tools/loot-analyzer.py recon-DESKTOP-20251126.txt

# With JSON export
python tools/loot-analyzer.py recon.txt -o report.json

# Batch analysis
python tools/loot-analyzer.py -d /root/loot/
```

**Risk Scoring:**
- **HIGH RISK** (≥20 points): Immediate remediation required
- **MEDIUM RISK** (≥10 points): Review and remediate  
- **LOW RISK** (<10 points): Maintain security posture

---

## 🚀 Quick Start

### Prerequisites
- KeyCroc device
- MicroSD card (8GB minimum)
- SSH client
- Target authorization

### Setup

1. **SSH to Device:**
```bash
ssh root@172.16.64.1
Password: hak5croc
```

2. **Deploy Payload:**
```bash
# Copy payload to device
scp payloads/system-recon.croc root@172.16.64.1:/root/payloads/

# Set as active payload
ssh root@172.16.64.1
cp /root/payloads/system-recon.croc /root/payload.croc
```

3. **Deploy:**
   - Insert KeyCroc inline between keyboard and computer
   - Wait for attack sequence
   - Monitor via LED indicators

4. **Retrieve Loot:**
```bash
# Mount KeyCroc storage
# Copy loot files from /mnt/keycroc/

# Analyze
python tools/loot-analyzer.py loot/*.txt
```

### LED Indicators

| LED Pattern | Status |
|-------------|--------|
| Green/Blue Slow | Setup/Initialization |
| Blue Fast Blink | Attack in progress |
| Green Solid | Success |
| Red Slow Blink | Error/Failure |

---

## 🛡️ Defensive Countermeasures

### Prevention

**Physical Security:**
- Lock workstations (Windows+L) when unattended
- Disable unused USB ports in BIOS
- Use USB port locks
- Implement clean desk policy
- Monitor workspaces with cameras

**USB Device Controls:**
- Whitelist authorized USB devices
- Block unauthorized HID commands
- Require admin approval for new devices
- Implement Device Guard policies

**Endpoint Protection:**
- Deploy EDR (CrowdStrike, SentinelOne)
- Enable PowerShell logging
- Set execution policy to AllSigned
- Enable Constrained Language Mode
- Remove PowerShell v2

### Detection

**Windows Event Logs:**

| Event ID | Description | Severity |
|----------|-------------|----------|
| 6416 | New external device | MEDIUM |
| 20001/20003 | USB device connection | MEDIUM |
| 4688 | Process creation | HIGH (if PowerShell) |
| 4103 | PowerShell module logging | HIGH |
| 4104 | PowerShell script block logging | CRITICAL |
| 4663 | File access attempt | MEDIUM |

**SIEM Correlation Rule:**
```
IF (USB_Device_Connected 
    AND PowerShell_Execution 
    AND System_Enumeration_Commands 
    AND File_Created_On_USB)
THEN Alert = CRITICAL
```

**Behavioral Indicators:**
- PowerShell execution from removable media
- Multiple enumeration commands in <60 seconds
- Rapid file writes to USB
- Network connections from user workstations
- Registry hive access

### Response

**If Suspected KeyCroc Detected:**

1. **DO NOT UNPLUG** - Preserve evidence
2. **Disconnect network** - Prevent exfiltration
3. **Photo device** - Document with serial numbers
4. **Note time** - Record detection timestamp
5. **Contact security team** - Initiate incident response

**Evidence Collection:**
- Memory dump (system RAM)
- USB device information (VID/PID)
- Windows Event Logs
- Process list and network connections
- PowerShell command history

---

## 📊 MITRE ATT&CK Mapping

**Tactics Covered:**

| Tactic | Technique | ID |
|--------|-----------|----|
| **Discovery** | System Information | T1082 |
| **Discovery** | Network Configuration | T1016 |
| **Discovery** | Network Connections | T1049 |
| **Discovery** | Process Discovery | T1057 |
| **Discovery** | Software Discovery | T1518 |
| **Discovery** | Permission Groups | T1069 |
| **Credential Access** | Credentials from Files | T1552.001 |
| **Credential Access** | Credentials from Registry | T1552.002 |
| **Collection** | Data from Local System | T1005 |
| **Exfiltration** | Physical Medium | T1052 |

---

## 🎓 Educational Resources

### Training
- **SANS SEC560:** Network Penetration Testing
- **SANS FOR508:** Advanced Incident Response
- **Offensive Security PEN-200:** PWK/OSCP
- **eLearnSecurity eCPPT**

### Tools
- **Mimikatz:** Credential extraction
- **PowerSploit:** PowerShell exploitation
- **Impacket:** Network protocol tools
- **BloodHound:** AD reconnaissance

### Reading
- The Hacker Playbook 3
- Red Team Field Manual
- MITRE ATT&CK Framework
- NIST 800-53 Security Controls

---

## 🔗 Additional Resources

- **[Main Repository](../README.md)**
- **[Legal Disclaimer](../LEGAL_DISCLAIMER.md)**
- **[Defensive Guide](../DEFENSIVE_GUIDE.md)**
- **Hak5 Docs:** https://docs.hak5.org/keycroc
- **Community Payloads:** https://github.com/hak5/keycroc-payloads

---

## 📄 License

MIT License - See [LICENSE](../LICENSE)

---

## ⚠️ Final Reminder

**These payloads are for AUTHORIZED TESTING ONLY.**

Unauthorized use is a **FEDERAL CRIME** with consequences including:
- Up to 10 years imprisonment
- $250,000 fines
- Civil liability
- Criminal record

**Check your jurisdiction's laws before use.**

---

**[← Back to Main Arsenal](../README.md)**
