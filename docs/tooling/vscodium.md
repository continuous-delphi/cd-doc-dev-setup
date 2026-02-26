# VSCodium

## Overview

VSCodium is a community-maintained, freely-licensed build of Visual Studio Code with Microsoft
telemetry and branding removed. It is the recommended editor for working with PowerShell scripts,
YAML workflow files, JSON configuration, and Markdown documentation across all `Continuous Delphi`
repositories.

## Version Required

| Requirement | Value |
|---|---|
| Minimum version | 1.96 |
| Recommended version | Latest stable |

## Role in Continuous Delphi

- Editing PowerShell scripts with syntax highlighting and IntelliSense (via PowerShell extension)
- Editing GitHub Actions workflow YAML files
- Editing JSON dataset files and configuration
- Editing Markdown documentation

## Download

- Latest release: https://vscodium.com/
- GitHub releases: https://github.com/VSCodium/vscodium/releases/latest
- winget: `winget install --id VSCodium.VSCodium`

## Installation

See [setup-vscodium.md](../tasks/setup-vscodium.md) for step-by-step installation
instructions on Windows 11.

## Recommended Extensions

| Extension | Purpose |
|---|---|
| PowerShell (ms-vscode.PowerShell) | Syntax highlighting, IntelliSense, debugging for .ps1 files |
| GitLens | Enhanced Git history and blame annotations |
| YAML (redhat.vscode-yaml) | Schema validation for GitHub Actions workflow files |

## Known Issues and Workarounds

### Menu delays on VMware Workstation

When running VSCodium inside a VMware Workstation virtual machine, menus may exhibit a
noticeable delay before appearing. This is caused by hardware acceleration conflicting with
the VMware display driver.

**Fix:** Disable hardware acceleration in VSCodium's runtime arguments.

1. Open the Command Palette: `Ctrl+Shift+P`
2. Type `Configure Runtime Arguments` and select it
3. In the `argv.json` file that opens, add the following line inside the JSON object:
   `"disable-hardware-acceleration": true`
4. Save the file and restart VSCodium.


## Notes

- VSCodium uses the Open VSX Registry (https://open-vsx.org/) for extensions rather than the
  Microsoft Marketplace. Most popular extensions are available. If a specific Microsoft extension
  is not found, check Open VSX directly.
- Settings and keybindings are compatible with Visual Studio Code. If your team uses VS Code,
  your settings transfer directly.
