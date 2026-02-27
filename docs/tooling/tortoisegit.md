# TortoiseGit

## Overview

TortoiseGit is a Windows Shell extension that adds Git operations to the right-click context
menu in File Explorer. It provides a graphical interface for the most common Git workflows:
committing, pushing, pulling, viewing history, and resolving merge conflicts.

For developers who are new to Git or prefer a visual workflow over the command line, TortoiseGit
is the recommended starting point. It sits on top of Git for Windows and requires it to be
installed first.

## Version Required

| Requirement | Value |
| --- | --- |
| Minimum version | 2.16 |
| Recommended version | Latest stable |
| Prerequisite | Git for Windows 2.47+ |

## Role in Continuous Delphi

- Optional but recommended for developers new to Git
- Provides visual diff and merge tools
- Simplifies submodule operations which are used in `cd-ci-toolchain`

## Download

- Latest release: [https://tortoisegit.org/download/](https://tortoisegit.org/download/)
- GitHub releases: [https://github.com/TortoiseGit/TortoiseGit/releases/latest](https://github.com/TortoiseGit/TortoiseGit/releases/latest)

## Installation

See [setup-tortoisegit.md](../tasks/setup-tortoisegit.md) for step-by-step installation
instructions on Windows 11.

## Notes

- TortoiseGit requires Git for Windows to be installed first. The installer will warn if it
  is not found.
- TortoiseGit does not replace the `git` command line. Both are available after installation.
- The language pack is a separate installer download if you need a non-English interface.
- On first use, TortoiseGit will prompt you to configure your name and email if Git has not
  already been configured globally.
