#!/usr/bin/env bash

set -e



echo "==> Updating Repository"

sudo dnf makecache

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



echo "==> Authenticating tailscale"
sudo tailscale up

echo "==> Tailscale Status"
tailscale status || true

echo "==> Setting a password for liveuser"
sudo passwd liveuser


echo "==> Starting a remote terminal session"
tmux new -s remote





