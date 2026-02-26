# Task: Verify PowerShell and Pester Installation

## Dependencies

- PowerShell 7.4+ ([setup-powershell-windows.md](setup-powershell-windows.md))
- Pester 5.7+ ([setup-pester-windows.md](setup-pester-windows.md))

## Purpose

These smoke tests confirm that PowerShell 7 and Pester 5 are correctly installed, that the
right versions are active, and that Pester can discover and run a test. Run these after
completing the installation tasks and before attempting to run any Continuous Delphi test suite.

## Step 1: Confirm PowerShell 7 is active

Open a terminal and run:

```powershell
pwsh --version
```

Expected: `PowerShell 7.4.0` or higher.

If `pwsh` is not found or returns a 5.x version, complete
[setup-powershell-windows.md](setup-powershell-windows.md) first.

## Step 2: Confirm PowerShell 7 is the active session

Inside a `pwsh` session, run:

```powershell
$PSVersionTable.PSVersion
```

Expected output shows `Major` as `7` and `Minor` as `4` or higher:

```
Major  Minor  Patch  PreReleaseLabel BuildLabel
-----  -----  -----  --------------- ----------
7      5      4
```

## Step 3: Confirm Pester 5 is available

```powershell
Get-Module -ListAvailable Pester | Select-Object Name, Version
```

Expected: at least one entry with version `5.7.x` or higher.

## Step 4: Confirm Pester 5 loads correctly

```powershell
Import-Module Pester -MinimumVersion 5.7.0 -Force
(Get-Module Pester).Version
```

Expected: `5.7.x` or higher. If this returns `3.4.0`, the `-Force` flag did not override
the inbox version. Try closing and reopening your terminal, then repeat the import.

## Step 5: Run a minimal Pester smoke test

Create a temporary test file to confirm Pester can discover and execute a test:

```powershell
$tmp = Join-Path $env:TEMP 'SmokeTest.Tests.ps1'
Set-Content -Path $tmp -Value @'
Describe 'Smoke' {
  It 'Pester is working' {
    1 + 1 | Should -Be 2
  }
}
'@
Invoke-Pester -Path $tmp -Output Detailed
Remove-Item $tmp
```

Expected output:

```
Pester v5.7.x
Starting discovery in 1 files.
Discovery found 1 tests in Xms.
Running tests.
Describing Smoke
  [+] Pester is working Xms
Tests completed in Xms
Tests Passed: 1, Failed: 0, Skipped: 0, Inconclusive: 0, NotRun: 0
```

<img width="722" height="470" alt="image" src="https://github.com/user-attachments/assets/979c9774-e58b-4c72-83d8-b2f4ddc15cab" />


A passing result confirms PowerShell 7 and Pester 5 are correctly installed and functional.

## Troubleshooting

| Symptom | Likely cause | Fix |
|---|---|---|
| `pwsh` not found | PowerShell 7 not installed or not in PATH | Complete [setup-powershell-windows.md](setup-powershell-windows.md), open a new terminal |
| `Output` parameter ambiguous error | Pester 3 is loaded | Run `Import-Module Pester -MinimumVersion 5.7.0 -Force` |
| Pester version shows 3.4.0 after import | `-Force` not used | Add `-Force` to the `Import-Module` command |
| Test file not found during Invoke-Pester | Wrong working directory | Confirm the path passed to `-Path` is correct |
