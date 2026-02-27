# Task: Install Pester 5.7+ on Windows 11

## Dependencies

- PowerShell 7.4+ ([setup-powershell-windows.md](setup-powershell-windows.md))

## Background

Windows ships with Pester 3.4 as an inbox module. This version is incompatible with the
`Continuous Delphi` test suite, which requires Pester 5. Both versions can coexist on the
same machine (installing Pester 5 does not remove 3.4.)

The inbox Pester 3.4 is signed by Microsoft. Installing a newer version from the PowerShell
Gallery requires bypassing the publisher check with `-SkipPublisherCheck`.

## Installation

Open a `pwsh` terminal (PowerShell 7, not Windows PowerShell) and run:

```powershell
Install-Module -Name Pester -MinimumVersion 5.7.0 -Force -SkipPublisherCheck -Scope CurrentUser
```

Flag explanations:

| Flag | Reason |
| --- | --- |
| `-MinimumVersion 5.7.0` | Ensures Pester 5 is installed, not an older version |
| `-Force` | Allows installation even when another version is already present |
| `-SkipPublisherCheck` | Required because inbox Pester 3.4 is Microsoft-signed; this allows a different publisher |
| `-Scope CurrentUser` | Installs for your user account only; does not require administrator elevation |

## Verification

After installation, confirm both versions are present:

```powershell
Get-Module -ListAvailable Pester | Select-Object Name, Version, Path
```

Expected output will show two entries: version 3.4.0 (inbox) and version 5.7.x (newly installed).

Confirm Pester 5 loads correctly:

```powershell
Import-Module Pester -MinimumVersion 5.7.0 -Force
(Get-Module Pester).Version
```

Expected output: `5.7.x` or higher.

## Using Pester 5 in a Session

Because PowerShell may default to loading Pester 3.4, always import Pester 5 explicitly
before running tests:

```powershell
Import-Module Pester -MinimumVersion 5.7.0 -Force
Invoke-Pester ./tests/pwsh -Output Detailed
```

## Notes

- The `-Force` flag in `Import-Module` overrides the automatically loaded 3.4 version.
  Without it, `Invoke-Pester` may use Pester 3 syntax and fail with ambiguous parameter errors.
- If you see `Parameter cannot be processed because the parameter name 'Output' is ambiguous`,
  Pester 3 is loaded. Run the `Import-Module` command above to switch to Pester 5.
- CI pipelines pin Pester to a specific patch version using `-RequiredVersion` for
  reproducibility. Local development uses `-MinimumVersion` for flexibility.
