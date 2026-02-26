# cd-doc-dev-setup

![Status](https://img.shields.io/badge/status-incubator-orange)
![Platform](https://img.shields.io/badge/platform-windows-blue)
![OS](https://img.shields.io/badge/os-windows%2011%2024H2-blue)
![PowerShell](https://img.shields.io/badge/powershell-7.4%2B-blue)
![Pester](https://img.shields.io/badge/pester-5.7%2B-blue)
![Continuous Delphi](https://img.shields.io/badge/org-continuous--delphi-red)

Development environment setup guides for the `Continuous Delphi` organization.

---

## Who this is for

If your Delphi shop has been shipping software since before "The Cloud" meant something other
than a collection of mist in the sky above your head, this is your starting point. This guide
assumes you know your way around Delphi and Windows. It does not assume you know a lot about
PowerShell, Pester, or any of the various tools that make up an environment for automated
workflows.

Every guide here is written for a working Delphi developer who needs to get a machine configured
correctly and get back to work. Steps are explicit. Nothing is assumed to already be installed.
Gotchas encountered on real machines are documented where they were found.

---

## How to use this guide

Start with the [Tooling Index](#tooling-index) to understand what each tool is and why
`Continuous Delphi` uses it. Then follow the [Task Index](#task-index) for installation
and configuration instructions.

Each task document lists its dependencies at the top. Work through them in order on a fresh
machine and you will arrive at a fully configured development environment.

---

## Tooling Index

These are some of the tools used across the `Continuous Delphi` organization. Each entry links
to a dedicated page covering the tool's purpose, the version required, and its role in this
ecosystem.

| Tool | Reference Version | Purpose |
|---|---|---|
| [Git for Windows](docs/tooling/git-for-windows.md) | 2.47 | Version control. Required for all repositories. |
| [TortoiseGit](docs/tooling/tortoisegit.md) | 2.16 | Windows Shell GUI for Git. Optional but recommended for teams new to Git. |
| [VSCodium](docs/tooling/vscodium.md) | 1.96 | Open-source VS Code build. Primary editor for scripts, configs, and documentation. |
| [GitHub CLI](docs/tooling/github-cli.md) | 2.65 | Command-line interface for GitHub. Used for releases, PRs, and workflow automation. |
| [PowerShell](docs/tooling/powershell.md) | 7.4 | Required runtime for the PowerShell implementation of cd-ci-toolchain and all CI scripts. |
| [Pester](docs/tooling/pester.md) | 5.7 | PowerShell testing framework. Required for running the cd-ci-toolchain test suite. |

---

## Task Index

Tasks are ordered by dependency. A fresh machine should be configured top to bottom.

### Foundation

These tasks establish the baseline environment every other tool depends on.

| Task | Depends On |
|---|---|
| [Install Git for Windows](docs/tasks/setup-git-for-windows.md) | Nothing |
| [Install TortoiseGit](docs/tasks/setup-tortoisegit.md) | Git for Windows |
| [Install VSCodium](docs/tasks/setup-vscodium.md) | Nothing |
| [Install GitHub CLI](docs/tasks/setup-github-cli.md) | Git for Windows |
| [Install PowerShell 7.4+](docs/tasks/setup-powershell-windows.md) | Nothing |
| [Install Pester 5.7+](docs/tasks/setup-pester-windows.md) | PowerShell 7.4+ |

### Verification

Run these after completing the foundation tasks to confirm everything is working.

| Task | Depends On |
|---|---|
| [Verify PowerShell and Pester installation](docs/tasks/verify-powershell-pester.md) | PowerShell 7.4+, Pester 5.7+ |

---

## Baseline Environment

Guides in this repository are written and tested against the following baseline:

- **OS:** Windows 11 24H2
- **Architecture:** x64

Older versions of Windows may work but are not covered here.

---

## Maturity

This repository is currently `incubator` and is under active development.
It will graduate to `stable` once:

- A minimal tool list is defined
- Tasks have been validated against a real machine
- At least one other repo links to it as a dependency or reference
- A `1.0.0` tag has been published

Until graduation, breaking links may occur.

---

## Part of Continuous Delphi

This repository follows the `Continuous Delphi` organization taxonomy. See
[cd-meta-org](https://github.com/continuous-delphi/cd-meta-org) for navigation and governance.

- `docs/org-taxonomy.md` -- naming and tagging conventions
- `docs/versioning-policy.md` -- release and versioning rules
- `docs/repo-lifecycle.md` -- lifecycle states and graduation criteria
