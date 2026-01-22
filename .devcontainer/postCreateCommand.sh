#!/usr/bin/env bash
set -euo pipefail
set -x

export DEBIAN_FRONTEND=noninteractive

echo "[postCreate] Sanity checks..."
whoami
python --version || true
uv --version || true

echo "[postCreate] Refreshing apt indices (with retries)..."
# Stale lists can break installs after feature layers modify sources
sudo rm -rf /var/lib/apt/lists/*
sudo apt-get -o Acquire::Retries=5 update

echo "[postCreate] Installing UI automation prerequisites..."
sudo apt-get -o Acquire::Retries=5 install -y --no-install-recommends \
  dbus-x11 \
  at-spi2-core \
  libatk-bridge2.0-0 \
  libgtk-3-0 \
  x11-utils \
  xdotool \
  wmctrl \
  xclip \
  unzip \
  ca-certificates \
  libxcb-ewmh2 libxcb-ewmh-dev \
  libxcb-icccm4 libxcb-icccm4-dev \
  libxcb-cursor0 \
  kate \
  keepassxc

echo "[postCreate] Syncing Python env with uv..."
# If a lockfile exists, enforce it; otherwise resolve from pyproject
if [[ -f "uv.lock" ]]; then
  uv sync --frozen
else
  uv sync
fi

echo "[postCreate] Installing SUT..."
bash sut/install.sh || true

echo "[postCreate] Done."