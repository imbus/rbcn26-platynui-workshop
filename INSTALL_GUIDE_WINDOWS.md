# PlatynUI Workshop Prerequisites and Installation Guide Windows

This guide describes how to prepare a **Windows** workstation (host or VM) for the PlatynUI workshop.

Supported participant setups:

- **Windows 10 or Windows 11** client
- **Windows 10 or Windows 11 VM** (x86_64 or ARM64)

> Tip for Windows-on-ARM VMs: Some Python wheels for desktop automation ecosystems are published for `win_amd64` only. If you are on Windows ARM, prefer installing an **x64 Python** (Windows can run x64 apps under emulation) to minimize compatibility issues.

---

## 1) Install a Windows package manager (optional)

We recommend using a package manager to make installation repeatable.

### Option A: Chocolatey

Follow Chocolatey’s official installation instructions (PowerShell Administrator).

- Chocolatey install page: [Chocolatey Install](https://chocolatey.org/install)
- Chocolatey setup docs: [Chocolatey Setup](https://docs.chocolatey.org/en-us/choco/setup/)

Verify:

```powershell
choco -v
```

### Option B: Scoop

Follow Scoop’s official installer instructions (PowerShell **non-admin**). [Scoop Install](https://scoop.sh/)

Verify:

```powershell
scoop --version
```

---

## 2) Install the required tools

You need:

- **Python**: `>=3.10` and `<3.14` (recommended: **3.12** or **3.13**)
- **uv** (Python/project manager)
- **.NET 8.0 runtime** (Desktop Runtime recommended)
- **Visual Studio Code**
- VS Code extensions:
  - **Python** (`ms-python.python`)
  - **RobotCode** (`d-biehl.robotcode`)
- **Git**

Choose either Chocolatey-based or Scoop-based installation.

### A) Install with Chocolatey

Open **PowerShell (Administrator)** and run:

```powershell
# Python (recommended)
choco install -y python313

# Git
choco install -y git.install

# Visual Studio Code
choco install -y vscode.install

# .NET 8 Desktop Runtime
choco install -y dotnet-8.0-desktopruntime

# uv python project manager
choco install -y uv
```

Chocolatey package references:

- Python 3.13 package (`python313`): [Python 3.13.11](https://community.chocolatey.org/packages/python313)
- .NET 8 Desktop Runtime package: [Microsoft .NET 8.0 Runtime 8.0.23](https://community.chocolatey.org/packages/dotnet-8.0-runtime)

### B) Install with Scoop (and uv-managed Python)

Open **PowerShell (non-admin)** and run:

```powershell
# uv
scoop install main/uv
```

Astral documents Scoop installation for uv: [Installing uv](https://docs.astral.sh/uv/getting-started/installation/)

Install a supported Python via uv (recommended: 3.13):

```powershell
uv python install 3.13
```

Then install Git and VS Code:

```powershell
# Some setups need the extras bucket for GUI apps like VS Code
scoop bucket add extras

scoop install git
scoop install vscode
```

For .NET 8:

```powershell
scoop install dotnet8-runtime
```

or install from the official .NET 8 download page: [Download .NET 8.0](https://dotnet.microsoft.com/en-us/download/dotnet/8.0)

---

## 3) Install VS Code extensions

You can install extensions via the UI or the `code` CLI.

### Option A: Install via UI

Open VS Code → Extensions → install:

- **Python** (`ms-python.python`)
- **RobotCode** (`d-biehl.robotcode`)

Robot Framework docs recommend using **RobotCode** and installing only one Robot Framework extension to avoid conflicts. citeturn2search10

### Option B: Install via CLI

VS Code supports `--install-extension` on the command line. citeturn1search10

```powershell
code --install-extension ms-python.python
code --install-extension d-biehl.robotcode
```

---

## 4) Verify your installation

Open a new PowerShell and verify versions:

```powershell
python --version
uv --version
dotnet --info
git --version
code --version
```

Make sure Python is **>=3.10 and <3.14**.

---

## 5) Clone the workshop repository

Repository:

```powershell
git clone git@github.com:imbus/rbcn26-platynui-workshop.git
cd rbcn26-platynui-workshop
```

### SSH key setup (if needed)

If cloning via SSH fails, set up SSH keys for GitHub:

- Generate a new SSH key and add it to the ssh-agent (includes Windows steps): citeturn0search3
- Add the SSH public key to your GitHub account: citeturn0search14
- Overview: connecting to GitHub with SSH: citeturn0search17

Test your SSH connection:

```powershell
ssh -T git@github.com
```

---

## 6) Setup complete

At this point you have:

- Python (supported version)
- uv installed
- .NET 8 runtime installed
- VS Code + extensions (Python, RobotCode)
- Git installed
- Workshop repository cloned

---
