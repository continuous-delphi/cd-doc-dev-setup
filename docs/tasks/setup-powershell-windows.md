# Task: Install PowerShell 7.4+ on Windows 11

## Dependencies

None. PowerShell 7 is a standalone install.

## Background

Windows 11 ships with _Windows-Only_ PowerShell 5.1. This is a separate, older product that remains
installed and untouched. Cross-Platform PowerShell (Core) installs alongside it and adds a new `pwsh` command.
`Continuous Delphi` scripts and tests use `pwsh` and not `powershell`.

## Installation Options

### Option A: winget (recommended)

winget is built into Windows 11. Open a terminal and run:

```powershell
winget install --id Microsoft.PowerShell
```

winget will download and install the latest stable PowerShell 7 release. Accept the UAC
prompt when it appears.

### Option B: Manual installer

1. Go to [https://github.com/PowerShell/PowerShell/releases/latest](https://github.com/PowerShell/PowerShell/releases/latest)
2. Download the `.msi` file for your architecture (most machines: `PowerShell-7.x.x-win-x64.msi`)
3. Run the installer and accept the defaults
4. Ensure "Add PowerShell to PATH Environment Variable" is checked

## Verification

Open a **new** terminal window after installation (PATH changes require a new session) and run:

```powershell
pwsh --version
```

Expected output:

```text
PowerShell 7.5.x
```

The version number should be 7.4.0 or higher. If the command is not found, close and reopen
your terminal. If it still fails, verify that `C:\Program Files\PowerShell\7` is in your
system PATH.

## Verify the correct executable is being used

```powershell
(Get-Command pwsh).Source
```

Expected: `C:\Program Files\PowerShell\7\pwsh.exe`

If this returns a different path, an older or alternative PowerShell installation may be
taking precedence in PATH.

## Notes

- `powershell` (Windows PowerShell 5.1) and `pwsh` (PowerShell 7) are different executables.
  Always use `pwsh` for `Continuous Delphi` scripts.
- PowerShell 7 updates do not affect Windows PowerShell 5.1.
- You can have multiple PowerShell 7 minor versions installed simultaneously as needed.
