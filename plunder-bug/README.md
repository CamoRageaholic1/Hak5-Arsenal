# Plunder Bug Arsenal 🐞

![Plunder Bug](https://img.shields.io/badge/Device-Plunder_Bug-purple?style=for-the-badge)
![Modules](https://img.shields.io/badge/Modules-4-blue?style=for-the-badge)
![USB](https://img.shields.io/badge/Type-USB_Exfiltration-red?style=for-the-badge)

**Covert USB data exfiltration and file harvesting device**

---

## ⚠️ Legal Warning

**FOR AUTHORIZED PENETRATION TESTING ONLY**

Unauthorized use violates:
- Computer Fraud and Abuse Act (18 U.S.C. § 1030)
- Electronic Communications Privacy Act (18 U.S.C. § 2510-2523)
- State computer crime laws
- Corporate data protection policies

**[Read Full Legal Disclaimer](../LEGAL_DISCLAIMER.md)**

---

## 🎯 Device Overview

### Capabilities
- **Mass Storage Mode** - Appears as standard USB flash drive
- **Covert Exfiltration** - Automatic file copying
- **Targeted Collection** - File type filtering
- **Stealth Operation** - Background data harvesting
- **Large Capacity** - Up to 128GB storage
- **No Software Required** - Hardware-based operation
- **Cross-Platform** - Windows, macOS, Linux

### Technical Specs
- **Form Factor:** USB flash drive appearance
- **Storage:** MicroSD card (8GB - 128GB)
- **Interface:** USB 2.0/3.0 Type-A
- **LED Indicator:** Activity light (configurable)
- **Operation:** Automatic on insertion
- **Compatibility:** All major operating systems
- **Detection:** Appears as legitimate storage device

### How It Works
1. Device inserted into target computer
2. Appears as normal USB flash drive
3. Covertly copies specified file types
4. Stores data on internal MicroSD card
5. User removes device
6. Data analyzed offline

---

## 📦 Modules

### 1. Document Harvester
**File:** `modules/document-harvester.sh`

**Purpose:** Automatically collect document files

**Target File Types:**
- Microsoft Office (.docx, .xlsx, .pptx)
- PDFs (.pdf)
- Text files (.txt, .rtf)
- OpenOffice (.odt, .ods, .odp)
- Archives (.zip, .rar, .7z)

**Configuration:**
```bash
# Target extensions
TARGETS=".docx .xlsx .pptx .pdf .txt"

# Max file size (MB)
MAX_SIZE=10

# Search locations
SOURCES="Desktop Documents Downloads"

# Copy depth (subdirectory levels)
DEPTH=3
```

**Execution Time:** 30-120 seconds (depends on file count)  
**Detectability:** Low (background operation)  
**Capacity:** Limited by MicroSD size

**Use Cases:**
- Red team document exfiltration
- Data loss prevention testing
- Insider threat simulation
- Physical security assessments

---

### 2. Credentials & Keys
**File:** `modules/creds-and-keys.sh`

**Purpose:** Harvest credentials and private keys

**Collected Items:**
- SSH private keys (~/.ssh/id_*)
- PGP/GPG keys (~/.gnupg/)
- Browser credential databases
- Password manager files (.kdbx, .1pif)
- Configuration files (.env, config.json)
- Certificate files (.pem, .p12, .pfx)
- API tokens and secrets

**Target Locations:**
- User home directory
- SSH directory
- Browser profile folders
- Application config directories
- Development folders

**Execution Time:** 20-60 seconds  
**Detectability:** Low  
**Risk Level:** CRITICAL (highly sensitive data)

**Security Note:** This module collects extremely sensitive data. Only use with explicit authorization and secure the Plunder Bug device immediately after collection.

---

### 3. Media Collector
**File:** `modules/media-collector.sh`

**Purpose:** Collect images and media files

**Target File Types:**
- Images (.jpg, .jpeg, .png, .gif, .bmp)
- Videos (.mp4, .avi, .mov, .mkv)
- Audio (.mp3, .wav, .flac)
- RAW photos (.raw, .cr2, .nef)

**Filtering Options:**
```bash
# Minimum resolution (pixels)
MIN_WIDTH=800
MIN_HEIGHT=600

# Date range
DATE_FROM="2024-01-01"
DATE_TO="2025-12-31"

# Max file size (MB)
MAX_SIZE=50

# EXIF data collection
COLLECT_EXIF=true
```

**Execution Time:** 60-300 seconds  
**Detectability:** Medium (larger files, more I/O)  

**Use Cases:**
- OSINT collection
- Forensic evidence gathering
- Intellectual property assessment
- Social engineering preparation

---

### 4. Database Exfiltrator
**File:** `modules/database-exfiltrator.sh`

**Purpose:** Extract database files and dumps

**Target Formats:**
- SQLite (.db, .sqlite, .sqlite3)
- MySQL dumps (.sql)
- MongoDB exports (.json, .bson)
- CSV data exports (.csv)
- Excel spreadsheets (.xlsx, .xls)
- Access databases (.mdb, .accdb)

**Special Handling:**
- Chrome/Firefox browser databases
- Application local databases
- Development database files
- Backup files (.bak, .backup)

**Execution Time:** 30-90 seconds  
**Detectability:** Low  
**Data Sensitivity:** HIGH

---

## 🛠️ Analysis Tools

### Plunder Analyzer
**File:** `tools/plunder-analyzer.py`

**Purpose:** Analyze collected data from Plunder Bug

**Features:**
- Automatic file categorization
- Duplicate detection
- Metadata extraction (EXIF, author, timestamps)
- Sensitive data detection (SSN, credit cards, API keys)
- Timeline reconstruction
- File relationship mapping
- Report generation

**Usage:**
```bash
# Analyze collected data
python tools/plunder-analyzer.py /mnt/plunderbug/

# Search for sensitive patterns
python tools/plunder-analyzer.py --scan-sensitive /mnt/plunderbug/

# Generate HTML report
python tools/plunder-analyzer.py -r report.html /mnt/plunderbug/

# Extract metadata
python tools/plunder-analyzer.py --metadata /mnt/plunderbug/
```

**Detection Patterns:**
- Social Security Numbers
- Credit card numbers
- API keys and tokens
- Private keys (PEM, SSH)
- Database credentials
- Email addresses
- Phone numbers

---

### File Classifier
**File:** `tools/file-classifier.sh`

**Purpose:** Organize and classify exfiltrated files

**Classification Categories:**
- Documents (by type and sensitivity)
- Credentials (by system/service)
- Media (by date and location)
- Code (by language and project)
- Databases (by type and size)

**Output Structure:**
```
classified/
├── documents/
│   ├── financial/
│   ├── legal/
│   └── technical/
├── credentials/
│   ├── ssh-keys/
│   ├── passwords/
│   └── certificates/
├── media/
│   ├── photos/
│   └── videos/
└── databases/
    ├── sqlite/
    └── exports/
```

---

## 🚀 Quick Start

### Prerequisites
- Plunder Bug device
- MicroSD card (8GB minimum, 128GB recommended)
- Target authorization
- Secure storage for collected data

### Setup

1. **Prepare MicroSD Card:**
```bash
# Format card (FAT32 for compatibility)
sudo mkfs.vfat -F 32 /dev/sdX1

# Mount card
mount /dev/sdX1 /mnt/plunderbug

# Copy modules
cp modules/*.sh /mnt/plunderbug/
```

2. **Configure Module:**
```bash
# Edit configuration
cd /mnt/plunderbug
vi document-harvester.sh

# Set target file types
TARGETS=".docx .xlsx .pdf"

# Set max file size
MAX_SIZE=10  # MB
```

3. **Deploy:**
   - Insert Plunder Bug into target computer
   - Device appears as USB flash drive
   - Module executes automatically
   - LED blinks during operation
   - Remove when LED stops blinking

4. **Analyze:**
```bash
# Mount device
mount /dev/sdX1 /mnt/plunderbug

# Run analyzer
python tools/plunder-analyzer.py /mnt/plunderbug/loot/

# Generate report
python tools/plunder-analyzer.py -r report.html /mnt/plunderbug/loot/
```

### LED Indicators

| LED State | Meaning |
|-----------|----------|
| Off | Idle / Not collecting |
| Slow blink | Scanning for files |
| Fast blink | Copying files |
| Solid | Collection complete |
| Red (if equipped) | Error / Storage full |

---

## 🛡️ Defensive Countermeasures

### Prevention

**Physical Security:**
- Lock workstations when unattended
- Disable AutoRun/AutoPlay
- USB port locks
- Clean desk policy
- Surveillance cameras
- Visitor escorts

**USB Security Policies:**
- Whitelist authorized USB devices
- Block unknown storage devices
- Require admin approval for new devices
- Disable USB mass storage via Group Policy
- Implement Device Guard

**Data Loss Prevention (DLP):**
- Monitor file access patterns
- Alert on bulk file reads
- Restrict sensitive file access
- Encrypt sensitive documents
- Rights management (IRM/RMS)

**Endpoint Protection:**
- USB device monitoring
- File access auditing
- Behavioral analytics
- EDR solutions
- Application whitelisting

### Detection

**Indicators of Compromise:**
- Unknown USB mass storage device
- Rapid sequential file access
- Large volume of file reads
- Access to multiple user directories
- Unusual file copy operations
- USB device with suspicious VID/PID

**Windows Event Logs:**

| Event ID | Description | Severity |
|----------|-------------|----------|
| 6416 | New external device recognized | MEDIUM |
| 20001 | USB device connected | MEDIUM |
| 4663 | File access attempt | HIGH (if bulk) |
| 4656 | Handle to object requested | MEDIUM |
| 5140 | Network share accessed | MEDIUM |

**SIEM Correlation Rule:**
```
IF (USB_Storage_Connected 
    AND File_Access_Count > 100 
    AND Time_Window < 60_seconds)
THEN Alert = CRITICAL - Possible Exfiltration Device
```

**Behavioral Indicators:**
- File access across multiple directories
- Sequential file reads without writes
- Access to sensitive file types
- Rapid file enumeration
- USB device insertion during off-hours

### Response

**If Plunder Bug Suspected:**

1. **DO NOT remove device** - Preserve evidence
2. **Disconnect network** - Prevent remote exfiltration
3. **Photo device** - Document with serial numbers
4. **Isolate system** - Prevent lateral movement
5. **Capture forensics:**
   - USB device information (VID/PID/Serial)
   - File access logs
   - Process list
   - Memory dump
6. **Investigate scope:**
   - Which files were accessed?
   - What data was copied?
   - Who inserted the device?
   - How long was it connected?
7. **Containment:**
   - Secure the device
   - Identify affected data
   - Assess damage
   - Notify stakeholders

---

## 📊 MITRE ATT&CK Mapping

| Tactic | Technique | ID |
|--------|-----------|-----|
| **Initial Access** | Replication Through Removable Media | T1091 |
| **Collection** | Data from Local System | T1005 |
| **Collection** | Data from Removable Media | T1025 |
| **Collection** | Data Staged | T1074.001 |
| **Exfiltration** | Physical Medium | T1052.001 |
| **Exfiltration** | Automated Collection | T1119 |

---

## 🎓 Educational Resources

### Official Documentation
- **Hak5 Shop:** https://shop.hak5.org
- **Hak5 Forums:** https://forums.hak5.org

### Training
- **SANS SEC504:** Hacker Tools and Techniques
- **SANS FOR508:** Advanced Incident Response
- **Offensive Security PEN-200:** PWK

### Data Loss Prevention
- **DLP Solutions:** Symantec, McAfee, Digital Guardian
- **USB Security:** Endpoint Protector, DeviceLock
- **Forensics:** EnCase, FTK, X-Ways

---

## 🔍 Comparison with Other Devices

| Feature | Plunder Bug | KeyCroc | Rubber Ducky |
|---------|-------------|---------|---------------|
| **Type** | Data exfiltration | Keystroke injection | Keystroke injection |
| **Stealth** | High | Medium | Low |
| **Speed** | Slow (file I/O) | Fast | Very fast |
| **Capacity** | High (128GB) | Medium (microSD) | Low (SD card) |
| **Detection** | Low | Medium | Medium-High |
| **Use Case** | Data theft | Credential harvesting | Quick attacks |

---

## 🔗 Additional Resources

- **[Main Repository](../README.md)**
- **[Legal Disclaimer](../LEGAL_DISCLAIMER.md)**
- **[KeyCroc Arsenal](../keycroc/README.md)**
- **[Rubber Ducky Arsenal](../rubber-ducky/README.md)**
- **[LAN Turtle Arsenal](../lan-turtle/README.md)**
- **[WiFi Pineapple Arsenal](../wifi-pineapple/README.md)**
- **[Shark Jack Arsenal](../shark-jack/README.md)**

---

## 📄 License

MIT License - See [LICENSE](../LICENSE)

---

## ⚠️ Final Reminder

**These modules are for AUTHORIZED TESTING ONLY.**

Unauthorized data exfiltration is a **FEDERAL CRIME** under:
- Computer Fraud and Abuse Act (18 U.S.C. § 1030)
- Economic Espionage Act (18 U.S.C. § 1831)
- Trade Secrets Act

**Consequences:**
- Up to 10 years imprisonment
- $250,000 fines
- Civil liability (potentially millions)
- Criminal record
- Permanent career damage

**Data exfiltration requires EXPLICIT authorization.**  
**Secure collected data immediately.**  
**Check all applicable laws before deployment.**

---

**[← Back to Main Arsenal](../README.md)**
