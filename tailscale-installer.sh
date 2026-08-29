#!/usr/bin/env bash

set -e



echo "==> Updating Repository"

sudo dnf check-update

echo "==> Installing Tailscale"
sudo dnf install -y tailscale

echo "==> Enabling Tailscale..."
sudo systemctl enable --now tailscaled

echo "==> Installing OpenSSH..."
sudo dnf install -y openssh-server

echo "==> Enabling SSH"
sudo systemctl enable --now sshd

echo "==> Staring Tailscaled"
sudo systemctl enable --now tailscaled
sudo systemctl start tailscaled

echo "==> Tailscale Status"
tailscale status

echo "==> Setting a password for liveuser"
sudo passwd liveuser
echo
echo "Done!, Run 'sudo tailscale up' to authenticate tailscale"




