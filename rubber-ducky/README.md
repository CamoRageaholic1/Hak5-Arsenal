# Rubber Ducky Arsenal 🦆

![Rubber Ducky](https://img.shields.io/badge/Device-Rubber_Ducky-yellow?style=for-the-badge)
![DuckyScript](https://img.shields.io/badge/Language-DuckyScript-blue?style=for-the-badge)
![Cross--Platform](https://img.shields.io/badge/Platform-Multi--OS-green?style=for-the-badge)

**USB keystroke injection with DuckyScript programming language**

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
- **HID Keyboard Emulation** - Appears as standard USB keyboard
- **Cross-Platform** - Works on Windows, Linux, macOS
- **Rapid Deployment** - Executes in seconds
- **No Software Required** - Pure HID attacks
- **Portable** - Small form factor
- **Scriptable** - DuckyScript programming language

### Technical Specs
- **Processor:** 60 MHz 32-bit CPU
- **Storage:** MicroSD card
- **Interface:** USB Type-A HID
- **Typing Speed:** Up to 1000 words/minute
- **Language:** DuckyScript
- **Compatible:** Windows, macOS, Linux, Android

---

## 📦 Payload Categories

### Windows Payloads

#### 1. System Reconnaissance
**File:** `payloads/windows/system-recon.txt`

**Purpose:** Quick Windows enumeration

**Collected Data:**
- System information
- Network configuration
- Running processes
- Installed software
- Environment variables

**Execution:** 30-60 seconds  
**Stealth:** Low  
**Output:** C:\\temp\\recon.txt

---

#### 2. Reverse Shell
**File:** `payloads/windows/reverse-shell.txt`  
**⚠️ Advanced Payload**

**Purpose:** PowerShell reverse shell connection

**Requirements:**
- Attacker listener (nc, metasploit, etc.)
- Network connectivity
- Modify ATTACKER_IP and PORT

**Execution:** 10-20 seconds  
**Stealth:** Medium  
**Detection Risk:** HIGH (network connection)

---

#### 3. Credential Harvester
**File:** `payloads/windows/credential-harvester.txt`

**Purpose:** Extract saved credentials

**Extracted Data:**
- Chrome saved passwords
- Windows Credential Vault
- WiFi passwords
- Browser cookies

**Execution:** 45-90 seconds  
**Stealth:** Low  
**Output:** C:\\temp\\*_creds.*

---

### Linux Payloads

#### 4. Quick Reconnaissance
**File:** `payloads/linux/quick-recon.txt`

**Purpose:** Fast Linux system enumeration

**Collected Data:**
- OS version and kernel
- Network interfaces and connections
- User accounts
- Running processes
- Installed packages

**Execution:** 20-40 seconds  
**Stealth:** Low  
**Output:** /tmp/recon.txt

---

#### 5. Persistence Backdoor
**File:** `payloads/linux/persistence.txt`  
**⚠️ Advanced Payload**

**Purpose:** Install SSH backdoor with persistence

**Mechanisms:**
- SSH authorized_keys injection
- Cron-based callback
- Service persistence

**Execution:** 30-60 seconds  
**Stealth:** High  
**Detection Risk:** Medium (requires monitoring)

---

### macOS Payloads

#### 6. System Enumeration
**File:** `payloads/macos/system-enum.txt`

**Purpose:** macOS reconnaissance

**Collected Data:**
- System profiler information
- Network configuration
- Installed applications
- User accounts
- Security settings

**Execution:** 30-60 seconds  
**Stealth:** Low  
**Output:** ~/recon.txt

---

## 🛠️ Tools

### DuckyScript Encoder
**File:** `tools/payload-encoder.py`

**Purpose:** Convert DuckyScript (.txt) to inject.bin

**Usage:**
```bash
# Encode payload
python tools/payload-encoder.py payloads/windows/system-recon.txt

# Output: inject.bin
# Copy to Rubber Ducky SD card
```

**Features:**
- DuckyScript validation
- Syntax checking
- Multiple language support
- Optimization

---

## 🚀 Quick Start

### Prerequisites
- USB Rubber Ducky
- MicroSD card (formatted FAT/FAT32)
- Target authorization
- DuckyScript encoder

### Deployment

1. **Select Payload:**
```bash
cd payloads/windows/
cat system-recon.txt
```

2. **Encode Payload:**
```bash
# Using official encoder
java -jar duckencoder.jar -i system-recon.txt -o inject.bin

# Or use provided tool
python ../../tools/payload-encoder.py system-recon.txt
```

3. **Deploy to Device:**
```bash
# Copy inject.bin to SD card root
cp inject.bin /media/DUCKY/

# Safely eject SD card
```

4. **Execute:**
   - Insert Rubber Ducky into target
   - Payload executes automatically
   - LED indicates execution status
   - Remove device when complete

### LED Indicators

| LED State | Meaning |
|-----------|----------|
| Green (solid) | Ready |
| Red (blinking) | Executing |
| Green (blinking) | Complete |
| Red (solid) | Error |

---

## 🛡️ Defensive Countermeasures

### Prevention

**Physical Security:**
- Lock workstations when unattended
- Disable USB ports when not needed
- Use USB port locks
- Monitor workspaces
- Train users on USB threats

**USB Security:**
- Whitelist authorized USB devices
- Block HID devices via Group Policy
- Require admin approval for devices
- Deploy USB monitoring tools

**Endpoint Protection:**
- Enable PowerShell logging
- Restrict script execution
- Deploy EDR solutions
- Application whitelisting

### Detection

**Indicators of Compromise:**
- Unrecognized USB HID device
- Rapid keyboard input (>500 WPM)
- PowerShell execution after USB insertion
- Unexpected CMD/Terminal windows
- New files in temp directories
- Network connections from workstations

**Windows Event Logs:**
- Event ID 6416 - New device
- Event ID 4688 - Process creation
- Event ID 4103 - PowerShell module
- Event ID 4104 - Script block logging

**SIEM Correlation:**
```
IF (USB_HID_Connected 
    AND PowerShell_Execution < 5_seconds 
    AND Rapid_Commands)
THEN Alert = CRITICAL
```

### Response

**If Rubber Ducky Suspected:**

1. **Disconnect network** immediately
2. **DO NOT unplug device** (forensics)
3. **Photo device** and note time
4. **Check Event Logs** (USB, processes)
5. **Scan for artifacts** (temp files, shells)
6. **Initiate IR procedure**

---

## 📝 DuckyScript Reference

### Basic Commands

| Command | Description | Example |
|---------|-------------|----------|
| `REM` | Comment | `REM This is a comment` |
| `DELAY` | Wait (ms) | `DELAY 1000` |
| `STRING` | Type text | `STRING notepad.exe` |
| `ENTER` | Press Enter | `ENTER` |
| `GUI` | Windows/Cmd key | `GUI r` |
| `CTRL` | Control key | `CTRL ALT DELETE` |
| `ALT` | Alt key | `ALT F4` |
| `SHIFT` | Shift key | `SHIFT INSERT` |

### Special Keys

| Key | DuckyScript |
|-----|-------------|
| Escape | `ESCAPE` |
| Space | `SPACE` |
| Tab | `TAB` |
| Backspace | `BACKSPACE` |
| Up Arrow | `UP` / `UPARROW` |
| Down Arrow | `DOWN` / `DOWNARROW` |
| Left Arrow | `LEFT` / `LEFTARROW` |
| Right Arrow | `RIGHT` / `RIGHTARROW` |

### Example Script

```duckyscript
REM Windows Quick Recon
REM Opens PowerShell and runs commands

DELAY 1000
GUI r
DELAY 500
STRING powershell
ENTER
DELAY 1000

STRING Get-ComputerInfo
ENTER
DELAY 2000

STRING ipconfig /all
ENTER
DELAY 2000

STRING exit
ENTER
```

---

## 📊 MITRE ATT&CK Mapping

| Tactic | Technique | ID |
|--------|-----------|----|
| **Initial Access** | Replication Through Removable Media | T1091 |
| **Execution** | Command and Scripting Interpreter | T1059 |
| **Execution** | PowerShell | T1059.001 |
| **Persistence** | Account Manipulation | T1098 |
| **Persistence** | Boot or Logon Autostart | T1547 |
| **Credential Access** | Credentials from Files | T1552.001 |
| **Discovery** | System Information | T1082 |
| **Collection** | Data from Local System | T1005 |
| **Command and Control** | Ingress Tool Transfer | T1105 |

---

## 🎓 Educational Resources

### Official Documentation
- **Hak5 Shop:** https://shop.hak5.org/products/usb-rubber-ducky
- **DuckyScript Docs:** https://docs.hak5.org/duckyscript
- **Payload Library:** https://github.com/hak5/usbrubberducky-payloads

### Training
- **SANS SEC560:** Network Penetration Testing
- **Offensive Security PEN-200:** PWK/OSCP
- **HackerOne 101:** Bug Bounty Hunting

### Community
- **Hak5 Forums:** https://forums.hak5.org
- **Reddit:** /r/hak5
- **Discord:** Hak5 Community Server

---

## 🔗 Additional Resources

- **[Main Repository](../README.md)**
- **[Legal Disclaimer](../LEGAL_DISCLAIMER.md)**
- **[Defensive Guide](../DEFENSIVE_GUIDE.md)**
- **[KeyCroc Arsenal](../keycroc/README.md)**
- **[LAN Turtle Arsenal](../lan-turtle/README.md)**

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

**If there is ANY doubt about authorization, DO NOT PROCEED.**

---

**[← Back to Main Arsenal](../README.md)**
