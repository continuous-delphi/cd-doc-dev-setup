# PowerShell

## Overview

PowerShell is a cross-platform scripting language and shell built on .NET. `Continuous Delphi`
uses PowerShell for toolchain discovery, CI integration scripts, and automation tasks that
need to run reliably across developer machines and CI runners.

Windows ships with Windows PowerShell 5.1, which is a separate, older product. PowerShell 7
is the current cross-platform version and is not a replacement for 5.1 -- both can coexist
on the same machine. `Continuous Delphi` requires PowerShell 7.4 or later.

## Version Required

| Requirement | Value |
|---|---|
| Minimum version | 7.4 |
| Recommended version | Latest stable 7.x |
| Windows PowerShell 5.1 | Not supported |

Always invoke `Continuous Delphi` scripts with `pwsh` (PowerShell 7), not `powershell`
(Windows PowerShell 5.1). The two executables are distinct.

## Role in Continuous Delphi

- Runtime for `cd-ci-toolchain` PowerShell implementation (`source/pwsh/`)
- Runtime for CI workflow scripts
- Required to run the Pester test suite

## Download

- Latest release: https://github.com/PowerShell/PowerShell/releases/latest
- Documentation: https://learn.microsoft.com/en-us/powershell/

## Installation

See [setup-powershell-windows.md](../tasks/setup-powershell-windows.md) for step-by-step
installation instructions on Windows 11.

## Notes

- PowerShell 7 installs to `C:\Program Files\PowerShell\7\` by default and adds `pwsh`
  to the system PATH.
- Running `pwsh --version` should return `PowerShell 7.x.x`. If it returns a 5.x version
  or is not found, the installation did not complete correctly or PATH was not updated.
- Windows PowerShell 5.1 remains installed and untouched. Scripts that depend on it are
  unaffected.
