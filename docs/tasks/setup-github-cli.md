# Task: Install GitHub CLI

## Dependencies

- Git for Windows 2.47+ ([setup-git-for-windows.md](setup-git-for-windows.md))

## Background

GitHub CLI (`gh`) is the official command-line interface for GitHub. It allows you to
interact with GitHub repositories, issues, pull requests, releases, and Actions workflow
runs directly from a terminal.

For day-to-day development it is optional. It becomes essential once you are publishing
releases, managing pull requests from the command line, or scripting repository operations
as part of CI automation.

## Installation Options

### Option A: winget (recommended)

```powershell
winget install --id GitHub.cli
```

### Option B: Manual installer

1. Go to https://cli.github.com/ or
   https://github.com/cli/cli/releases/latest
2. Download the `.msi` installer for your architecture
   (`gh_2.x.x_windows_amd64.msi`)
3. Run the installer and accept the defaults

## Verification

Open a **new** terminal after installation and run:

```powershell
gh --version
```

Expected output should be something like:

```
gh version 2.65.x (2026-xx-xx)
https://github.com/cli/cli/releases/tag/v2.65.x
```

## Authentication

GitHub CLI requires authentication before it can interact with GitHub. Run:

```powershell
gh auth login
```

Follow the interactive prompts:

| Prompt | Recommended choice |
|---|---|
| Where do you use GitHub? | `GitHub.com` |
| Preferred protocol | `HTTPS` |
| Authenticate with credentials | `Login with a web browser` |

A one-time code will be displayed in the terminal. Your browser will open automatically.
Enter the code, authorise the application, and return to the terminal. The CLI will confirm
successful authentication.

Verify authentication is working:

```powershell
gh auth status
```

Expected output confirms your account and the active token.

## Notes

- GitHub CLI respects the Git credential configuration already set up by Git for Windows.
  You do not need to configure credentials separately for `git` operations.
- `gh` commands operate on the repository in the current directory by default. Run `gh`
  commands from inside a cloned repository folder.
- To view available commands: `gh help`
- To check workflow run status for the current repository: `gh run list`
