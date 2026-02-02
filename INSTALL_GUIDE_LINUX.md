# PlatynUI Workshop Prerequisites and Installation Guide Linux

This guide describes how to prepare a **Fedora Linux** workstation (host or VM) for the PlatynUI workshop.

Supported participant setups:

- **Fedora Workstation** on a physical machine
- **Fedora Workstation in a VM** (recommended for a clean workshop environment)

Recommended baseline:

- Fedora **current** (or one of the last ~2 releases)
- CPU: **x86_64** preferred

> PlatynUI currently works best on **X11**. Fedora GNOME defaults to Wayland; switch to an **Xorg/X11** session before running PlatynUI Spy or tests.

---

## 1) Mandatory requirement: use X11 (GNOME on Xorg)

### Check your current session type

```bash
echo "$XDG_SESSION_TYPE"
```

- Expected: `x11`
- If you see `wayland`, switch to Xorg as described below.

### Option A (recommended): select “GNOME on Xorg” at login

1. Log out.
2. At the login screen, click the **gear/cog** icon.
3. Select **GNOME on Xorg**.
4. Log in again.

### Option B: set Xorg as the default session (system-wide)

Fedora docs describe how to configure GNOME on Xorg as default:

- <https://docs.fedoraproject.org/en-US/quick-docs/configuring-xorg-as-default-gnome-session/>

In short, edit:

```bash
sudo nano /etc/gdm/custom.conf
```

In the `[daemon]` section:

```ini
WaylandEnable=false
DefaultSession=gnome-xorg.desktop
```

Reboot:

```bash
sudo reboot
```

Verify again:

```bash
echo "$XDG_SESSION_TYPE"
```

---

## 2) Install base tools (curl, git, ssh)

```bash
sudo dnf -y upgrade
sudo dnf -y install \
  ca-certificates curl git openssh-clients unzip
```

Verify:

```bash
git --version
ssh -V
```

---

## 3) Install uv and a supported Python

### Install uv

Use Astral’s official installer:

```bash
curl -LsSf https://astral.sh/uv/install.sh | sh
```

Docs:

- <https://docs.astral.sh/uv/getting-started/installation/>

Open a new terminal (or source your shell profile) and verify:

```bash
uv --version
```

### Install a supported Python version

Workshop requirement: **Python > 3.10 and < 3.14** (recommended: **3.12 or 3.13**)

```bash
uv python install 3.13
```

Verify:

```bash
uv run python --version
```

---

## 4) Install .NET 8 runtime

On Fedora, .NET can be installed via distro packages. Microsoft documents Fedora support and installation steps here:

- <https://learn.microsoft.com/en-us/dotnet/core/install/linux-fedora>

Install the runtime (choose one):

```bash
# Base .NET runtime
sudo dnf -y install dotnet-runtime-8.0

# (recommended) ASP.NET Core runtime includes the base runtime
sudo dnf -y install aspnetcore-runtime-8.0
```

Verify:

```bash
dotnet --info
```

---

## 5) Install Visual Studio Code + extensions

### Install VS Code

The official VS Code docs describe downloading the **.rpm** and installing it with `dnf`:

- <https://code.visualstudio.com/docs/setup/linux>
- Download page (choose the **.rpm** for Fedora): <https://code.visualstudio.com/download>

Install (example):

```bash
sudo dnf install -y ./code-*.rpm
```

Verify:

```bash
code --version
```

### Install extensions (Python + RobotCode)

Option A: via UI

Open VS Code → Extensions → install:

- **Python** (`ms-python.python`)
- **RobotCode** (`d-biehl.robotcode`)

Option B: via CLI

```bash
code --install-extension ms-python.python
code --install-extension d-biehl.robotcode
```

---

## 6) Enable AT-SPI (ATSPI) accessibility stack

PlatynUI relies on Linux accessibility: **AT-SPI2 over D-Bus** for discovering/interacting with UI elements.

### Install AT-SPI2 packages

```bash
sudo dnf -y install \
  at-spi2-core at-spi2-atk
```

### Enable “toolkit accessibility” (GNOME)

```bash
gsettings set org.gnome.desktop.interface toolkit-accessibility true
```

> If `gsettings` fails, you’re likely not in a proper desktop session bus context. Log out/in (in an Xorg session) and retry.

(Optional) Verify the accessibility bus responds:

```bash
gdbus call --session \
  --dest org.a11y.Bus \
  --object-path /org/a11y/bus \
  --method org.freedesktop.DBus.Peer.Ping
```

---

## 7) Install required X11/XCB native libraries

PlatynUI Spy and the workshop SUT (Qt/PySide6) require X11/XCB runtime libraries.

### Minimum set (recommended)

```bash
sudo dnf -y install \
  xcb-util-cursor \
  xcb-util-wm xcb-util-wm-devel \
  libxkbcommon libxkbcommon-x11
```

Notes:

- For Qt 6.5+, Fedora/RedHat-based distros typically need `xcb-util-cursor` to load the **xcb** platform plugin.
- PlatynUI’s X11 stack uses EWMH/ICCCM helpers; on Fedora these are provided by `xcb-util-wm`.
- If you still see “Could not load the Qt platform plugin xcb”, install additional common XCB helpers:

```bash
sudo dnf -y install \
  xcb-util xcb-util-image xcb-util-keysyms xcb-util-renderutil
```

Qt’s Linux requirements reference:

- <https://doc.qt.io/qt-6/linux-requirements.html>

---

## 8) Optional (recommended for the workshop demo): install Kate and KeePassXC

If you want to use common desktop apps as a demo SUT:

```bash
sudo dnf -y install kate keepassxc
```

---

## 9) Clone the workshop repository

```bash
git clone git@github.com:imbus/rbcn26-platynui-workshop.git
cd rbcn26-platynui-workshop
```

### SSH keys (if cloning via SSH fails)

GitHub’s official SSH docs:

- <https://docs.github.com/en/authentication/connecting-to-github-with-ssh>

Quick test:

```bash
ssh -T git@github.com
```

---

## 10) Setup complete

At this point you have:

- Fedora (host or VM)
- X11 session enabled (GNOME on Xorg)
- Python in the supported range (via `uv python install ...`)
- uv installed
- .NET 8 runtime installed
- VS Code + extensions (Python, RobotCode)
- Git installed
- AT-SPI2 enabled
- required X11/XCB libraries installed
- workshop repository cloned

---
