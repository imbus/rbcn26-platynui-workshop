#!/usr/bin/env bash
set -euo pipefail

# Determine DISPLAY used by the VNC desktop
if [[ -z "${DISPLAY:-}" ]]; then
  if [[ -S /tmp/.X11-unix/X1 ]]; then
    export DISPLAY=:1
  elif [[ -S /tmp/.X11-unix/X0 ]]; then
    export DISPLAY=:0
  else
    export DISPLAY=:1
  fi
fi

# Wait until the X server is reachable (helps after "Reopen in Container")
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
  exit 1
fi

# Always run from repo root so relative paths behave
REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$REPO_ROOT"

# Make SUT importable (src-layout under ./sut/src)
export PYTHONPATH="$REPO_ROOT/sut/src${PYTHONPATH:+:$PYTHONPATH}"

# Start the SUT
exec uv run python -m platynui_sut.main