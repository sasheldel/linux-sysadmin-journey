# 🔐 WireGuard VPN Setup Guide

This guide documents how we set up a private VPN tunnel using **WireGuard** between two Linux machines:

- **Sasakovich** (Client)
- **Sastronik** (Server)

This VPN tunnel allows secure, encrypted communication and remote access over private IPs — ideal for file sharing, streaming, and SSH.

---

## 🛠️ Requirements

- Both devices running Linux (Ubuntu preferred)
- `sudo` access on both
- WireGuard installed
- Static IPs or a way to reliably communicate (LAN or port forwarding)
- SSH connection between machines already established

---

## 🔁 1. Install WireGuard

On **both devices**:

```bash
sudo apt update
sudo apt install wireguard
🔐 2. Generate Keys

On each device, run:wg genkey | tee privatekey | wg pubkey > publickey
	•	privatekey: Your machine’s private key
	•	publickey: Public key you’ll share with the other device
📄 3. Create wg0.conf on Sastronik (Server)
sudo nano /etc/wireguard/wg0.conf
[Interface]
PrivateKey = <Sastronik's PRIVATE key>
Address = 10.0.0.X/24
ListenPort = 51820

[Peer]
PublicKey = <Sasakovich's PUBLIC key>
AllowedIPs = 10.0.0.X/32


⸻

📄 4. Create wg0.conf on Sasakovich (Client) sudo nano /etc/wireguard/wg0.conf


[Interface]
PrivateKey = <Sasakovich's PRIVATE key>
Address = 10.0.0.x/24

[Peer]
PublicKey = <Sastronik's PUBLIC key>
Endpoint = <Sastronik's IP>:51820
AllowedIPs = 10.0.0.xx/32
PersistentKeepalive = 25

🔓 5. Enable IP Forwarding (Sastronik)

Edit this file:sudo nano /etc/sysctl.conf
net.ipv4.ip_forward=1
Apply it:sudo sysctl -p

🔥 6. Start the VPN on both
sudo wg-quick up wg0


🔐 Optional: Auto-start VPN

Enable WireGuard on boot (optional but useful):sudo systemctl enable wg-qsudo systemctl enable wg-quick@wg0
