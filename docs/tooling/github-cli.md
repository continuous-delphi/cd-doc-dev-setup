# GitHub CLI

## Overview

GitHub CLI (`gh`) is the official command-line interface for GitHub. It allows you to interact
with GitHub repositories, issues, pull requests, releases, and Actions workflows directly from
the terminal without opening a browser.

For `Continuous Delphi` maintainers, GitHub CLI is used for creating releases, managing pull
requests, and triggering or inspecting CI workflow runs. It is not required for day-to-day
development but becomes useful once you are publishing releases or working with CI pipelines.

## Version Required

| Requirement | Value |
| --- | --- |
| Minimum version | 2.65 |
| Recommended version | Latest stable |
| Prerequisite | Git for Windows 2.47+ |

## Role in Continuous Delphi

- Creating and publishing GitHub releases
- Managing pull requests from the command line
- Inspecting and re-running GitHub Actions workflow runs
- Scripting repository operations in automation tasks

## Download

- Latest release: [https://cli.github.com/](https://cli.github.com/)
- GitHub releases: [https://github.com/cli/cli/releases/latest](https://github.com/cli/cli/releases/latest)
- winget: `winget install --id GitHub.cli`

## Installation

See [setup-github-cli.md](../tasks/setup-github-cli.md) for step-by-step installation
instructions on Windows 11.

## Notes

- After installation, authenticate with: `gh auth login`
  Follow the interactive prompts to authenticate via browser. Choose HTTPS as the protocol
  when asked.
- `gh --version` should return `gh version 2.65.x` or later after installation.
- GitHub CLI respects the Git credential configuration already set up by Git for Windows.
  You do not need to configure credentials separately.
