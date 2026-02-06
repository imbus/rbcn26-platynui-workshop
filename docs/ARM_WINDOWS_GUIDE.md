# PlatynUI Workshop Prerequisites and Installation Guide — Windows on ARM (VM on ARM host)

This guide describes how to prepare a **Windows 11 ARM64 VM** (running on an ARM host, e.g., Apple Silicon) for the PlatynUI workshop.

Target setup:

- **Windows 11 ARM64 VM**
- **ARM64 Python (64-bit)** running natively on Windows-on-ARM (**recommended**)
- **.NET 8 Desktop Runtime (x64 or ARM64)** installed under the appropriate location
- Robot Framework + PlatynUI (pythonnet-based CLR integration)

Why the special handling?

- For **ARM64 .NET**, the default install root is **`C:\Program Files\dotnet`**.
- If you install **x64 .NET** on Windows ARM64 (emulation), it installs under **`C:\Program Files\dotnet\x64`**.
- `pythonnet` (used by PlatynUI) must be pointed at the correct **.NET root**; otherwise `hostfxr.dll` discovery/loading fails.

---

## Download links

- Python for Windows (choose **Windows installer (ARM64)**): <https://www.python.org/downloads/windows/>
- .NET 8.0 downloads (choose **Desktop Runtime** → **Windows Arm64** or **Windows x64**): <https://dotnet.microsoft.com/en-us/download/dotnet/8.0>
- Visual Studio Code: <https://code.visualstudio.com/Download>
- Git for Windows: <https://git-scm.com/download/win>
- uv installation docs: <https://docs.astral.sh/uv/getting-started/installation/>
- VS Code extension — RobotCode: <https://marketplace.visualstudio.com/items?itemName=d-biehl.robotcode>
- VS Code extension — Python: <https://marketplace.visualstudio.com/items?itemName=ms-python.python>

---

## 0) Key decision: Use ARM64 Python (recommended)

On Windows-on-ARM VMs, PlatynUI works best with **native ARM64 Python (64-bit)**.

> Note: Some ecosystems still publish wheels primarily for `win_amd64`. If you hit missing wheels on ARM64 Python, an alternative is to switch to **x64 Python under emulation**. In that case, you must also align your .NET runtime choice (see below).

**Recommendation:** Install **ARM64 Python 3.12 or 3.13** inside the Windows ARM VM.

Verify what you have:

```powershell
python -c "import platform; print(platform.machine(), platform.architecture())"
```

Expected for ARM64 Python: machine should be `ARM64` (for example: `ARM64 ('64bit', 'WindowsPE')`).

---

## 1) Install required tools

You need:

- **Python**: `>=3.10` and `<3.14` (recommended: **3.12** or **3.13**) — **ARM64**
- **.NET 8 Desktop Runtime** (match your Python architecture)
- **Visual Studio Code**
- VS Code extensions:
  - **Python** (`ms-python.python`)
  - **RobotCode** (`d-biehl.robotcode`)
- **Git**
- **uv** (optional but recommended)

### 1.1 Install Python (ARM64)

Install from python.org (choose the **Windows installer (ARM64)**), or use your preferred package manager (ensure it installs **ARM64** Python).

Verify:

```powershell
python --version
python -c "import struct; print('py-bitness:', struct.calcsize('P')*8)"
```

Expected bitness: `64`.

### 1.2 Install .NET 8 Desktop Runtime (match your Python architecture)

Install the **.NET Desktop Runtime 8** (Desktop Runtime recommended for UI-related stacks). Choose the architecture that matches your Python:

- **If you use ARM64 Python (recommended):** install **Windows Arm64 Desktop Runtime**.
- **If you intentionally use x64 Python (emulation):** install **Windows x64 Desktop Runtime**.

After installation, confirm:

```powershell
dotnet --info
```

#### Where .NET installs on Windows ARM64

- **ARM64 .NET** installs under: `C:\Program Files\dotnet`
- **x64 .NET (emulated)** installs under: `C:\Program Files\dotnet\x64`

Sanity-check that `hostfxr.dll` exists (pick the path that matches your install):

```powershell
# ARM64 .NET
Get-ChildItem "C:\Program Files\dotnet\host\fxr" -Recurse -Filter hostfxr.dll

# x64 .NET on ARM64
Get-ChildItem "C:\Program Files\dotnet\x64\host\fxr" -Recurse -Filter hostfxr.dll
```

### 1.3 Install Git + VS Code

Install via your preferred method (installer, Chocolatey, Scoop).

Verify:

```powershell
git --version
code --version
```

### 1.4 Install VS Code extensions

Either via UI, or CLI:

```powershell
code --install-extension ms-python.python
code --install-extension d-biehl.robotcode
```

---

## 2) Configure pythonnet / CoreCLR (Windows on ARM)

PlatynUI uses `pythonnet` to load **CoreCLR**. On Windows ARM64, failures typically come from a mismatch between:

- Python architecture (ARM64 vs x64)
- .NET Desktop Runtime architecture (Arm64 vs x64)
- The `DOTNET_ROOT` path that pythonnet uses to locate `hostfxr.dll`

### Required environment variables

You need these variables set when running Robot / PlatynUI:

- `PYTHONNET_RUNTIME=coreclr`
- `PYTHONNET_CORECLR_DOTNET_ROOT=...` (points to the correct .NET root)
- `DOTNET_ROOT=...` (same root; also used by other tooling)

### Option A (recommended): ARM64 Python + ARM64 .NET

Use the default ARM64 .NET root:

```powershell
$env:PYTHONNET_RUNTIME = "coreclr"
$env:PYTHONNET_CORECLR_DOTNET_ROOT = "C:\Program Files\dotnet"
$env:DOTNET_ROOT = "C:\Program Files\dotnet"
```

### Option B: ARM64 Windows VM using x64 .NET (emulated) — known working setup

If you installed **Windows x64 .NET Desktop Runtime** on Windows ARM64, it lives under `C:\Program Files\dotnet\x64`. Point pythonnet at that root:

```powershell
$env:PYTHONNET_RUNTIME = "coreclr"
$env:PYTHONNET_CORECLR_DOTNET_ROOT = "C:\Program Files\dotnet\x64"
$env:DOTNET_ROOT = "C:\Program Files\dotnet\x64"
```

### Option C: Set variables in Robot Framework via `.robot.toml` (project-local)

If you already use a `.robot.toml` in your Robot Framework project, add the matching block.

**ARM64 Python + ARM64 .NET**:

```toml
[env]
PYTHONNET_RUNTIME = "coreclr"
PYTHONNET_CORECLR_DOTNET_ROOT = "C:\\Program Files\\dotnet"
DOTNET_ROOT = "C:\\Program Files\\dotnet"
```

**x64 .NET on ARM64**:

```toml
[env]
PYTHONNET_RUNTIME = "coreclr"
PYTHONNET_CORECLR_DOTNET_ROOT = "C:\\Program Files\\dotnet\\x64"
DOTNET_ROOT = "C:\\Program Files\\dotnet\\x64"
```

### Option D: Set variables permanently (System Properties)

Set them in:
**System Properties → Environment Variables → (User or System variables)**

Then restart terminals and VS Code.

---

## 3) Verify CoreCLR loads (critical)

Before running the workshop, validate that pythonnet can load CoreCLR successfully:

```powershell
python -c "from pythonnet import load; load('coreclr'); print('coreclr loaded')"
```

If this fails with errors mentioning `hostfxr.dll`, your `DOTNET_ROOT` / `PYTHONNET_CORECLR_DOTNET_ROOT` is wrong, or the Desktop Runtime is missing.

---

## 4) Clone the workshop repository and install dependencies

Clone:

```powershell
git clone git@github.com:imbus/rbcn26-platynui-workshop.git
cd rbcn26-platynui-workshop
```

Create venv and install (example; adapt to your workflow):

```powershell
python -m venv .venv
.\.venv\Scripts\activate

pip install -U pip
pip install robotframework robotframework-platynui
```

Quick check that the environment sees PlatynUI:

```powershell
python -c "import PlatynUI; print('PlatynUI:', PlatynUI.__file__)"
```

---

## 5) Run Robot tests (with the env vars in place)

If using shell env vars (Option A or B), run from the same shell:

```powershell
robot -d results tests
```

If using `.robot.toml`, run via the tooling that reads it (e.g., RobotCode run configuration).

---

## Troubleshooting (ARM64 VM specifics)

### A) `RuntimeError: Could not find a suitable hostfxr library ...`

**Cause:** pythonnet can’t locate or load `hostfxr.dll` because `DOTNET_ROOT` points to the wrong install root (or the runtime isn’t installed).

**Fix:**

1. Confirm which runtime you installed (Arm64 vs x64):

```powershell
dotnet --info
```

2. Locate `hostfxr.dll`:

```powershell
# ARM64 .NET
Get-ChildItem "C:\Program Files\dotnet\host\fxr" -Recurse -Filter hostfxr.dll

# x64 .NET on ARM64
Get-ChildItem "C:\Program Files\dotnet\x64\host\fxr" -Recurse -Filter hostfxr.dll
```

3. Set `DOTNET_ROOT` and `PYTHONNET_CORECLR_DOTNET_ROOT` to the matching root (`C:\Program Files\dotnet` or `C:\Program Files\dotnet\x64`) and re-test:

```powershell
python -c "from pythonnet import load; load('coreclr'); print('coreclr loaded')"
```

### B) `hostfxr.dll` exists but fails to load (e.g., error `0x7e`)

This often indicates a missing dependency at load time (not just “file missing”).

Actions:

1. Verify you installed the **Desktop Runtime x64** (not Arm64).
2. Confirm hostfxr location:

   ```powershell
   dir "C:\Program Files\dotnet\x64\host\fxr\*\hostfxr.dll"
   ```

3. Ensure you’re running **x64 Python** (`platform.machine()` should be `AMD64`).

### C) Robot/PlatynUI still can’t find CLR when launched from VS Code

VS Code may not inherit env vars set in another terminal.

Fix options:

- Put the variables into `.robot.toml` (Option C), or
- Set them as **User/System** environment variables and restart VS Code, or
- Configure env vars in the VS Code run configuration used by RobotCode.

---

## Setup complete

At this point your Windows ARM VM has:

- ARM64 Python (recommended)
- .NET 8 Desktop Runtime installed under the appropriate location (`C:\Program Files\dotnet` or `C:\Program Files\dotnet\x64`)
- pythonnet configured via environment variables to load CoreCLR
- Robot Framework + PlatynUI installed
- VS Code + Python + RobotCode ready

You should be able to run the workshop suite without `hostfxr` / CoreCLR initialization errors.
