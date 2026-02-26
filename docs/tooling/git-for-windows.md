# Git for Windows

## Overview

Git for Windows is the standard Git distribution for Windows. It provides the `git` command-line
tool, a Bash environment (Git Bash), and supporting utilities. All `Continuous Delphi` repositories
are hosted on GitHub and require Git for all version control operations.

If you have only ever used source control through a Delphi IDE plugin or a folder-copy workflow,
Git is the foundational tool to learn first. Everything else in this guide builds on it.

## Version Required

| Requirement | Value |
|---|---|
| Minimum version | 2.47 |
| Recommended version | Latest stable |

## Role in Continuous Delphi

- Required for cloning all repositories
- Required for working with submodules (used in `cd-ci-toolchain`)
- Required by TortoiseGit, GitHub CLI, and most CI tooling
- Provides `gpg.exe` bundled in `usr/bin/` (used for signed commits)

## Download

- Latest release: https://git-scm.com/download/win
- GitHub releases: https://github.com/git-for-windows/git/releases/latest
- winget: `winget install --id Git.Git`

## Installation

See [setup-git-for-windows.md](../tasks/setup-git-for-windows.md) for step-by-step
installation instructions on Windows 11.

## Notes

- During installation, when asked about the default branch name, choose `main`.
- When asked about line ending handling, choose "Checkout as-is, commit as-is" if your
  repositories use `.gitattributes` to manage line endings explicitly (`Continuous Delphi`
  repositories do). Otherwise choose "Checkout Windows-style, commit Unix-style line endings".
- Git for Windows bundles its own `gpg.exe` at `C:\Program Files\Git\usr\bin\gpg.exe`.
  This is used for signed commits when configured. See signed commits documentation for details.
- `git --version` should return `git version 2.47.x.windows.x` or later after installation.
