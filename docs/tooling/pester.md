# Pester

## Overview

Pester is the standard testing framework for PowerShell. It provides a BDD-style syntax for
writing unit tests, integration tests, and infrastructure validation scripts. `Continuous Delphi`
uses Pester to test the PowerShell implementation of `cd-ci-toolchain` and any other PowerShell
tooling in the organization.

## Version Required

| Requirement | Value |
|---|---|
| Minimum version | 5.7 |
| Recommended version | Latest stable 5.x |
| Pester 3.x (inbox) | Not supported |

Windows ships with Pester 3.4 as part of the OS. This version is incompatible with the test
suite. Pester 5 must be installed explicitly and both versions will coexist on the machine.
The correct version must be explicitly imported before running tests.

## Role in Continuous Delphi

- Test framework for `cd-ci-toolchain` PowerShell implementation
- Test framework for all other PowerShell tooling in the organization
- CI pipelines pin to a specific Pester patch version for reproducibility

## Download

- PowerShell Gallery: https://www.powershellgallery.com/packages/Pester
- GitHub: https://github.com/pester/Pester
- Documentation: https://pester.dev

## Installation

See [setup-pester-windows.md](../tasks/setup-pester-windows.md) for step-by-step
installation instructions on Windows 11.

## Notes

- The inbox Pester 3.4 is signed by Microsoft. Installing Pester 5 requires `-SkipPublisherCheck`
  to bypass the publisher mismatch check.
- Always import Pester 5 explicitly before running tests:
  `Import-Module Pester -MinimumVersion 5.7.0 -Force`
- The `-Force` flag is required to override the inbox 3.4 that PowerShell may load by default.
- Pester 5 introduces a significantly different syntax and API from Pester 3. Pester 3 test
  files are not compatible with Pester 5 without modification.
