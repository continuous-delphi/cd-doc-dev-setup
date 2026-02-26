# Task: Verify PowerShell and Pester Installation

## Dependencies

- PowerShell 7.4+ ([setup-powershell-windows.md](setup-powershell-windows.md))
- Pester 5.7+ ([setup-pester-windows.md](setup-pester-windows.md))

## Shortcut

If you prefer to run the verification as a single script rather than follow
the manual steps below:

```powershell
Invoke-Expression (Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/continuous-delphi/cd-doc-dev-setup/main/tools/Invoke-PesterSmokeTest.ps1').Content
```

Or if you have already cloned this repository:

```powershell
pwsh ./tools/Invoke-PesterSmokeTest.ps1
```

The manual steps below cover exactly what the script does. Follow them if you prefer
to work through each check individually, or if the shortcut itself fails.

---

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

```powershell
Invoke-Pester -Configuration (New-PesterConfiguration | ForEach-Object {
  $_.Run.ScriptBlock = { Describe 'Smoke' { It '1 + 1 equals 2' { (1+1) | Should -Be 2 } } }
  $_.Output.Verbosity = 'Detailed'
  $_
})
```

Expected output:

```
Pester v5.7.x
Starting discovery in 1 files.
Discovery found 1 tests in Xms.
Running tests.
Describing Smoke
  [+] 1 + 1 equals 2 Xms
Tests completed in Xms
Tests Passed: 1, Failed: 0, Skipped: 0, Inconclusive: 0, NotRun: 0
```

A passing result confirms PowerShell 7 and Pester 5 are correctly installed and functional.

## Troubleshooting

| Symptom | Likely cause | Fix |
|---|---|---|
| `pwsh` not found | PowerShell 7 not installed or not in PATH | Complete [setup-powershell-windows.md](setup-powershell-windows.md), open a new terminal |
| `Output` parameter ambiguous error | Pester 3 is loaded | Run `Import-Module Pester -MinimumVersion 5.7.0 -Force` |
| Pester version shows 3.4.0 after import | `-Force` not used | Add `-Force` to the `Import-Module` command |
| Test file not found during Invoke-Pester | Wrong working directory | Confirm the path passed to `-Path` is correct |