#!/usr/bin/env bash
set -euo pipefail

# Pick a display
if [[ -z "${DISPLAY:-}" ]]; then
  if [[ -S /tmp/.X11-unix/X1 ]]; then
    export DISPLAY=:1
  elif [[ -S /tmp/.X11-unix/X0 ]]; then
    export DISPLAY=:0
  else
    export DISPLAY=:1
  fi
fi

# Ensure we use the session cookie
export XAUTHORITY="${XAUTHORITY:-/home/devcontainer/.Xauthority}"

# Wait for the X server to be ready
for _ in {1..60}; do
  if xdpyinfo -display "$DISPLAY" >/dev/null 2>&1; then
    break
  fi
  sleep 0.5
done

if ! xdpyinfo -display "$DISPLAY" >/dev/null 2>&1; then
  echo "ERROR: X11 display not reachable on DISPLAY=$DISPLAY"
  echo "Available X sockets:"
  ls -l /tmp/.X11-unix/ || true
  echo "X processes:"
  ps aux | egrep -i "Xvnc|Xtigervnc|Xorg|Xwayland|websockify|novnc" | grep -v egrep || true
  exit 1
fi

exec dbus-run-session -- uv run PlatynUI.Spy