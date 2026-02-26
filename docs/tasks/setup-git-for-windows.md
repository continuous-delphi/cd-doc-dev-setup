# Task: Install Git for Windows

## Dependencies

None. Git for Windows is a standalone install.

## Background

Git for Windows provides the `git` command-line tool, a Bash environment, and supporting
utilities including a bundled `gpg.exe` for signed commits. It is the foundation for all
other version control tooling in the `Continuous Delphi` ecosystem and must be installed
before TortoiseGit, GitHub CLI, or VSCodium.

The task and tooling guides in this repository assume Git
for Windows is installed and will build on it incrementally.

## Installation Options

### Option A: winget (recommended)

```powershell
winget install --id Git.Git
```

Accept the UAC prompt when it appears. winget will install the latest stable release.

### Option B: Manual installer

1. Go to https://git-scm.com/download/win or
   https://github.com/git-for-windows/git/releases/latest
2. Download the `.exe` installer for your architecture
   (most machines: `Git-2.x.x-64-bit.exe`)
3. Run the installer

### Recommended installer options

Accept defaults for most screens. The following screens warrant attention:

| Screen | Recommended choice | Reason |
|---|---|---|
| Default branch name | `main` | Matches GitHub default and Continuous Delphi repositories |
| Line ending handling | Checkout as-is, commit as-is | Continuous Delphi repositories use `.gitattributes` to manage line endings explicitly |
| Default terminal emulator | Windows Terminal or MinTTY | Either works; Windows Terminal integrates better with modern Windows 11 |

## Verification

Open a **new** terminal after installation and run:

```powershell
git --version
```

Expected output:

```
git version 2.47.x.windows.x
```

Confirm the configured identity (required for commits):

```powershell
git config --global user.name
git config --global user.email
```

If these return nothing, set them now:

```powershell
git config --global user.name "Your Name"
git config --global user.email "you@example.com"
```

## Notes

- Git for Windows bundles its own `gpg.exe` at `C:\Program Files\Git\usr\bin\gpg.exe`.
  This is used for signed commits. See the signed commits documentation when that topic
  is covered.
- The `git` command is available in PowerShell, Command Prompt, and Git Bash after
  installation.
- Cloning a repository with submodules (as used in `cd-ci-toolchain`) requires the
  `--recurse-submodules` flag:
  `git clone --recurse-submodules <url>`
