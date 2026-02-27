# Task: Install TortoiseGit

## Dependencies

- Git for Windows 2.47+ ([setup-git-for-windows.md](setup-git-for-windows.md))

## Background

TortoiseGit is a Windows Shell extension that adds Git operations to the right-click context
menu in File Explorer. It provides a graphical interface for committing, pushing, pulling,
viewing history, and resolving merge conflicts without using the command line.

It is optional but strongly recommended for developers who are new to Git. TortoiseGit does
not replace the `git` command line -- both remain available after installation.

## Installation Options

### Option A: Manual installer (recommended)

TortoiseGit is not currently available via winget. Download the installer directly:

1. Go to [https://tortoisegit.org/download/](https://tortoisegit.org/download/)
2. Download the 64-bit `.msi` installer
   (`TortoiseGit-2.x.x.x-64bit.msi`)
3. Run the installer and accept the defaults

A language pack is available as a separate download on the same page if needed.

## First Launch Configuration

On first use, TortoiseGit will run a First Start Wizard. It will check for Git for Windows
and pre-populate your name and email from your global Git configuration if already set.

If the wizard reports that Git for Windows is not found, verify that
[setup-git-for-windows.md](setup-git-for-windows.md) was completed and that `git --version`
works in a new terminal before proceeding.

## Verification

After installation, right-click any folder in File Explorer. You should see a TortoiseGit
submenu in the context menu.

To confirm TortoiseGit can see your Git installation, open any repository folder, right-click,
and select **TortoiseGit > Show Log**. If the log window opens and shows commit history,
TortoiseGit is working correctly.

Confirm the version via the About dialog:

1. Right-click any folder
2. Select **TortoiseGit > About**
3. Confirm version is 2.16.x or higher

## Notes

- TortoiseGit overlays (the coloured icons on files and folders showing Git status) may take
  a moment to appear after installation. A restart of Explorer or a reboot will clear any
  delay.
- Windows limits the number of Shell icon overlays. If TortoiseGit overlays do not appear,
  other applications (Dropbox, OneDrive) may have taken the available slots. This is a Windows
  limitation and does not affect TortoiseGit functionality beyond the icons.
- TortoiseGit has its own diff and merge tool (TortoiseGitMerge) which installs alongside it
  and integrates automatically.
