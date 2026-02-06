# PoC: Robot Framework JSON-RPC Remote + PlatynUI on Windows 11 ARM VM (SUT) + macOS Client

This document describes a reproducible setup where:

- **SUT domain (Windows 11 ARM VM):** runs `robot-jsonrpcremote-server` hosting **PlatynUI**.
- **Client domain (macOS):** runs Robot Framework tests using `JsonRpcRemote` to call PlatynUI keywords remotely.

## 1) Prerequisites

### SUT (Windows 11 ARM VM)

- Python venv containing:
  - `robotframework`
  - `robotframework-jsonrpcremote-server`
  - `PlatynUI` (and its dependencies)
- .NET runtime installed at:
  - `C:\Program Files\dotnet\x64`
- Network connectivity from macOS to the VM IP/port (example: `192.168.64.9:8271`).

### Client (macOS)

- Python environment containing:
  - `robotframework`
  - `robotframework-jsonrpcremote`

## 2) Server-side (Windows VM) setup and start

### 2.1 Activate the correct venv

Run in PowerShell (adjust path if needed):

```powershell
& "C:\Users\Fabian\Development\rbcn26-platynui-workshop\.venv\Scripts\Activate.ps1"
```

Verify you are using the venv python:

```powershell
python -c "import sys; print(sys.executable)"
```

### 2.2 Set required environment variables (MUST be set in the same session before starting the server)

```powershell
$env:PYTHONNET_RUNTIME="coreclr"
$env:DOTNET_ROOT="C:\Program Files\dotnet\x64"
$env:PYTHONNET_CORECLR_DOTNET_ROOT="C:\Program Files\dotnet\x64"
```

(Optional) Verify they are set:

```powershell
python -c "import os; print(os.environ.get('PYTHONNET_RUNTIME')); print(os.environ.get('DOTNET_ROOT')); print(os.environ.get('PYTHONNET_CORECLR_DOTNET_ROOT'))"
```

### 2.3 Start the JSON-RPC remote server hosting PlatynUI

```powershell
robot-jsonrpcremote-server --host 0.0.0.0 --port 8271 PlatynUI
```

Expected result: server starts without `No module named 'PlatynUI.Runtime'` errors.

> Note: The env vars must be present in the **server process environment**. Setting them in a different shell/session will not work.

## 3) Client-side (macOS) test setup

### 3.1 Robot test suite example

Create a `.robot` file, e.g. `tests/calc.robot`:

```robot
*** Settings ***
Library    JsonRpcRemote    uri=tcp://<remote-ip-address>:8271    library_name=PlatynUI

*** Variables ***
${CALC_WINDOW}                  Window[@Name="Rechner" or @Name="Calculator"]
${9_BUTTON}                     ${CALC_WINDOW}//Button[@AutomationId="num9Button"]
${4_BUTTON}                     ${CALC_WINDOW}//Button[@AutomationId="num4Button"]
${MINUS_BUTTON}                 ${CALC_WINDOW}//Button[@AutomationId="minusButton"]
${EQUALS_BUTTON}                ${CALC_WINDOW}//Button[@AutomationId="equalButton"]
${RESULT_TEXT}                  ${CALC_WINDOW}//Text[@AutomationId="NormalOutput"]

*** Test Cases ***
Exercise 2 - Subtraction 9 - 4 = 5
    Activate    ${9_BUTTON}
    Activate    ${MINUS_BUTTON}
    Activate    ${4_BUTTON}
    Activate    ${EQUALS_BUTTON}
    ${text}=    Get Property Value    ${RESULT_TEXT}    Name
    Should Be Equal    ${text}    5
```

### 3.2 Run the tests

```bash
robot -d results tests/calc.robot
```

## 4) Troubleshooting

### Error: `No module named 'PlatynUI.Runtime'`

Cause: The JSON-RPC server process was started **without** the required `PYTHONNET_*` / `DOTNET_ROOT` variables.

Fix: Ensure the following are set **in the same PowerShell session** *before* starting the server:

```powershell
$env:PYTHONNET_RUNTIME="coreclr"
$env:DOTNET_ROOT="C:\Program Files\dotnet\x64"
$env:PYTHONNET_CORECLR_DOTNET_ROOT="C:\Program Files\dotnet\x64"
```

Then restart:

```powershell
robot-jsonrpcremote-server --host 0.0.0.0 --port 8271 PlatynUI
```
