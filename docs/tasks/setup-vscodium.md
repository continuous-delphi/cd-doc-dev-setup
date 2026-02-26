# Task: Install VSCodium

## Dependencies

- Git for Windows 2.47+ ([setup-git-for-windows.md](setup-git-for-windows.md))
- PowerShell 7.4+ ([setup-powershell-windows.md](setup-powershell-windows.md))

Install Git for Windows and PowerShell 7 before launching VSCodium for the first time.
VSCodium scans PATH at startup and extensions configure themselves against whatever is
present. Starting VSCodium before these tools are installed means extensions will not
configure correctly and will require a restart.

## Background

VSCodium is an open-source build of Visual Studio Code with Microsoft telemetry and branding
removed. It is the recommended editor for PowerShell scripts, GitHub Actions YAML, JSON
datasets, and Markdown documentation across Continuous Delphi repositories.


## Installation Options

### Option A: winget (recommended)

```powershell
winget install --id VSCodium.VSCodium
```

### Option B: Manual installer

1. Go to https://vscodium.com/ or
   https://github.com/VSCodium/vscodium/releases/latest
2. Download the `.exe` installer for your architecture
   (`VSCodiumSetup-x64-1.x.x.exe`)
3. Run the installer and accept the defaults

## Verification

```powershell
codium --version
```

Expected output shows the version number on the first line like this:

```
1.96.x
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
x64
```

Open VSCodium and confirm Git integration is working:

1. Open the Source Control panel (`Ctrl+Shift+G`)
2. If a repository folder is open, it should show the current branch and any pending changes
3. If no repository is open, the panel will prompt to open a folder or clone a repository --
   this is also correct

## Recommended Extensions

VSCodium uses the Open VSX Registry (https://open-vsx.org/) rather than the Microsoft
Marketplace. Install extensions from the Extensions panel (`Ctrl+Shift+X`).

| Extension ID | Purpose |
|---|---|
| `ms-vscode.powershell` | PowerShell syntax highlighting, IntelliSense, and debugging |
| `eamodio.gitlens` | Enhanced Git history, blame annotations, and repository insights |
| `redhat.vscode-yaml` | Schema validation for GitHub Actions workflow files |

## Known Issues and Workarounds

### Menu delays on VMware Workstation

When running VSCodium inside a VMware Workstation virtual machine, menus may exhibit a
noticeable delay before appearing. This is caused by hardware acceleration conflicting with
the VMware display driver.

**Fix:**

1. Open the Command Palette: `Ctrl+Shift+P`
2. Type `Configure Runtime Arguments` and select it
3. The file `argv.json` will open in the editor
4. Add the following line inside the JSON object:

```json
"disable-hardware-acceleration": true
```

5. Save the file (`Ctrl+S`) and restart VSCodium

The file should look similar to this after the change:

```json
{
  "disable-hardware-acceleration": true
}
```

This setting persists across VSCodium updates and only affects this machine.

## Notes

- If the PowerShell extension does not detect `pwsh` automatically, open a `.ps1` file,
  click the PowerShell version indicator in the status bar, and select
  **Enter path to PowerShell installation** pointing to
  `C:\Program Files\PowerShell\7\pwsh.exe`.
- Settings sync and keybindings are compatible with Visual Studio Code. If your team uses
  VS Code, your configuration transfers directly.
- VSCodium updates do not reset `argv.json`. The hardware acceleration workaround survives
  updates.
