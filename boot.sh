#!/bin/bash

echo "Downloading Tailscale..."
wget -qO- https://pkgs.tailscale.com/stable/tailscale_1.74.0_amd64.tgz | tar xz

echo "Starting Tailscale in userspace mode..."
./tailscale_1.74.0_amd64/tailscaled --tun=userspace-networking --socks5-server=localhost:1055 &
sleep 3

echo "Authenticating Tailscale..."
# حتما متغیر TS_AUTHKEY را در تنظیمات سایت مقصد وارد کن
./tailscale_1.74.0_amd64/tailscale up --authkey="${TS_AUTHKEY}" --hostname=nextjs-node --advertise-exit-node &

echo "Starting Next.js App..."
# اجرای نکست جی‌اس روی پورتی که پلتفرم تعیین کرده
npm run start:next -- -p ${PORT:-3000}
