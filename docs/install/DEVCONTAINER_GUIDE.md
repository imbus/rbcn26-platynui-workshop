# Robocon 2026 – PlatynUI Workshop Devcontainer

This repository provides a ready-to-use workshop environment for desktop UI automation with Robot Framework and **robotframework-platynui**.

Key goals:

- A consistent **Linux desktop** for everyone (Windows/macOS/Linux hosts) via **noVNC**.
- A preconfigured **Python + uv** development environment.
- A GUI-capable environment to run:
  - **PlatynUI Spy** (element inspection, locator development)
  - the workshop **SUT** (Qt / PySide6 application) inside the VNC desktop

---

## What you get

- A Linux desktop reachable in your browser (noVNC)
- Python project dependencies managed by **uv**
- Helper scripts for common tasks:
  - Start PlatynUI Spy
  - Start the SUT
  - Run Robot Framework tests

---

## Prerequisites (participants)

Install locally:

- Docker Desktop
- Visual Studio Code
- VS Code extension: **Dev Containers** (`ms-vscode-remote.remote-containers`)

No Python installation is required on the host, because everything runs inside the container.

---

## Quick start

### 1) Open in the Dev Container

1. Open this repository in VS Code.
2. Run **“Dev Containers: Rebuild and Reopen in Container”** (first time) or **“Reopen in Container”** (subsequent times).

The container is pinned to **linux/amd64** because `robotframework-platynui` provides Linux wheels for x86_64.
On Apple Silicon this runs under emulation and may be slower than a native amd64 machine.

### 2) Open the Linux desktop (noVNC)

In VS Code:

- Open the **Ports** panel.
- Find port **6080** and open it in the browser.

You should see the container desktop session.

---

## Running PlatynUI Spy

Run (inside the container terminal):

```bash
scripts/start-spy.sh
```
