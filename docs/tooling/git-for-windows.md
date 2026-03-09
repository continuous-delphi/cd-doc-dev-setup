# Git for Windows

## Overview

Git for Windows is the standard Git distribution for Windows. It provides the `git` command-line
tool, a Bash environment (Git Bash), and supporting utilities. All `Continuous Delphi` repositories
are hosted on GitHub and require Git for all version control operations.

If you have only ever used source control through a Delphi IDE plugin or a folder-copy workflow,
Git is the foundational tool to learn first. Everything else in this guide builds on it.

## Version Required

| Requirement | Value |
| --- | --- |
| Minimum version | 2.47 |
| Recommended version | Latest stable |

## Role in Continuous Delphi

- Required for cloning all repositories
- Required for working with submodules (used in `cd-ci-toolchain`)
- Required by TortoiseGit, GitHub CLI, and most CI tooling
- Provides `gpg.exe` bundled in `usr/bin/` (used for signed commits)

## Download

- Latest release: [https://git-scm.com/download/win](https://git-scm.com/download/win)
- GitHub releases: [https://github.com/git-for-windows/git/releases/latest](https://github.com/git-for-windows/git/releases/latest)
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

-# Git References for Delphi Developers

## Delphi-Specific Git Guides

- `2023-02-16 DelphiCon 2023` [Demystifying Git, Why is it Popular, and How to Use it?](https://learndelphi.org/demystifying-git-why-is-it-popular-and-how-to-use-it/)
  - `2023-03-13` Embarcadero YouTube Video: [Git, Demystified - Rich Dudley - Delphicon 2023](https://youtu.be/fv8ZgT1jexE)

- `2022-01-09 Embarcadero Blog` [How to Automate Large Numbers of Delphi Project Builds](https://blogs.embarcadero.com/how-to-automate-large-numbers-of-delphi-project-builds/)
- `2021-12-05 IdeasAwakened` [RADAuthenticator Part 4 – Build Automation with Delphi and GitHub by Installing a Self-hosted Runner](https://ideasawakened.com/post/radauthenticator-part-4-build-automation-with-delphi-and-github-by-installing-a-self-hosted-runner)
- `2020-08-19 Embarcadero Blog` [Version Control: Get Started with Git, Remote Repositories and RAD Studio XE8](https://blogs.embarcadero.com/version-control-get-started-with-git-remote-repositories-and-rad-studio-xe8/)
`2020-08-14` Embarcadero YouTube Video: [Using Git Source Code Control in Delphi and RAD Studio, feat. Ian Barker](https://youtu.be/JSswgwPbjNs) 
- `2020-07-22 Delphi Code Monkey` [Git with Delphi: The Basics](http://delphicodemonkey.blogspot.com/2020/07/git-with-delphi-basics.html)
- `2018-03-05 Medium` [How I Implemented a CI Build of Delphi Binaries Using GitLab CI](https://medium.com/@brilvio/how-i-implemented-a-ci-build-of-delphi-binaries-using-gitlab-ci-d1123826698f)
- `2016-12-08 The Delphi Geek` [RAD Studio and Version Control + Git – Links](https://www.thedelphigeek.com/2016/12/rad-studio-and-version-control-git-links.html)
- `2015-02-10 Fixed by Code` [Git' Delphi](https://fixedbycode.blogspot.com/2015/02/git-delphi.html)
- Victor Tadashi, GitHub User: `charoleizer` [delphi-gitlab-ci-sample (GitLab CI/CD with Delphi example repo)](https://github.com/charoleizer/delphi-gitlab-ci-sample)
- GitHub [Official Delphi.gitignore Template](https://github.com/github/gitignore/blob/main/Delphi.gitignore)
- toptal.com [Delphi .gitignore Generator](https://www.toptal.com/developers/gitignore/api/delphi)

## Official Documentation

- Embarcadero DocWiki [Git Integration in the IDE](https://docwiki.embarcadero.com/RADStudio/en/Git_Integration_in_the_IDE)

## GPG Signed Commits on Windows

- GitHub Docs [About Commit Signature Verification](https://docs.github.com/en/authentication/managing-commit-signature-verification/about-commit-signature-verification)
- GitHub Docs [Signing Commits](https://docs.github.com/en/authentication/managing-commit-signature-verification/signing-commits)
- GitHub Docs [Signing Tags](https://docs.github.com/en/authentication/managing-commit-signature-verification/signing-tags)
- `2022-10-07 Ken Muse` [Comparing GitHub Commit Signing Options (GPG vs SSH vs S/MIME)](https://www.kenmuse.com/blog/comparing-github-commit-signing-options/)
- `2021-12-05 IdeasAwakened` [Configure Git for Signed Commits on Windows Using GPG](https://ideasawakened.com/post/configure-git-for-signed-commits-on-windows-using-gpg)
- `2020-11-24 Nick Janetakis` [Signing and Verifying Git Commits on the Command Line and GitHub](https://nickjanetakis.com/blog/signing-and-verifying-git-commits-on-the-command-line-and-github)

## CI/CD Pipelines

- GitHub Docs [GitHub Actions: CI/CD Overview](https://docs.github.com/en/actions)
- GitLab Docs [Get Started with GitLab CI/CD](https://docs.gitlab.com/ci/)
- `2021-12-05 IdeasAwakened` [RADAuthenticator Part 4 - Build Automation with Delphi and GitHub by Installing a Self-hosted Runner](https://ideasawakened.com/post/radauthenticator-part-4-build-automation-with-delphi-and-github-by-installing-a-self-hosted-runner)
- `2021-01-13 IdeasAwakened` [Getting Started with CI/CD Using Delphi and Jenkins on Windows](https://ideasawakened.com/post/getting-started-with-ci-cd-using-delphi-and-jenkins-on-windows)

## Branching Strategies & Workflows

- Atlassian [Git Flow Workflow](https://www.atlassian.com/git/tutorials/comparing-workflows/gitflow-workflow)
- conventionalcommits.org [Conventional Commits Specification](https://www.conventionalcommits.org/)
- GitVersion [GitVersion Documentation – Semantic Versioning from Git History](https://gitversion.net/docs/)
- GitHub Marketplace [Git Semantic Version GitHub Action](https://github.com/marketplace/actions/git-semantic-version)
- `2019-03-11 Ordinary Experts` [Git Flow, Semantic Versioning, and CHANGELOG.md - Walkthrough](https://ordinaryexperts.com/blog/2019/03/11/git-flow-walkthrough/)

## Git Submodules

- git-scm.com [Pro Git – Git Tools: Submodules](https://git-scm.com/book/en/v2/Git-Tools-Submodules)
- GitHub Blog [Working with Submodules](https://github.blog/open-source/git/working-with-submodules/)
- Atlassian [Git Submodule Tutorial](https://www.atlassian.com/git/tutorials/git-submodule)

## General Git References

- git-scm.com [Pro Git Book (free)](https://git-scm.com/book/en/v2)
- Roger Dudler [Git: The Simple Guide](https://rogerdudler.github.io/git-guide)
- GitHub Docs [GitHub Documentation](https://docs.github.com)
- GitLab Docs [GitLab Documentation](https://docs.gitlab.com)
