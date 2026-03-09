# Python

## Overview

Python is a general-purpose, interpreted programming language widely used for scripting,
automation, data processing, and tooling. In the `Continuous Delphi` ecosystem, Python
serves as a scripting and automation layer for tasks that fall outside the Delphi/Pascal
toolchain — such as settup up MkDocs static websites,
running cross-platform utility scripts, and supporting
CI pipeline tooling.

## Version Required

| Requirement | Value |
| --- | --- |
| Minimum version | 3.13 |
| Recommended version | Latest stable (3.14.x or later) |
| Installer | Python Install Manager (`py` launcher) |

## Download

Python for Windows is now distributed through the **Python Install Manager**, a modern
MSIX-based package that replaces the traditional standalone installer.

- Downloads page: [https://www.python.org/downloads/windows/](https://www.python.org/downloads/windows/)
- Under **Python Releases for Windows**, select the **latest Python Install Manager**
  (currently `python-manager-26.0.msix` or later)

## Installation

See [setup-python-windows.md](../tasks/setup-python-windows.md) for step-by-step
installation instructions on Windows 11.

## Notes

- The `py` launcher is the recommended entry point. Use `py` (or `py -3`) to launch
  the default Python 3 runtime, and `py -V:3.14` to target a specific version.
- The Python Install Manager enables long path support (paths longer than 260 characters)
  as part of its configuration. This requires a system-wide registry change and a reboot
  to take effect.
- The global shortcuts directory (`C:\Users\<user>\AppData\Local\Python\bin`) must be
  on `PATH` for version-tagged commands like `python3.14.exe` to be available in a
  terminal. The `py` and `python` commands do not require this.
- After installation, open a **new** terminal to pick up the updated `PATH` before
  running verification commands.
- `python --version` and `py --version` should both return `Python 3.14.x` or later
  after a successful install.

## Links

- Python Windows documentation: [https://docs.python.org/3/using/windows.html](https://docs.python.org/3/using/windows.html)
- Python releases for Windows: [https://www.python.org/downloads/windows/](https://www.python.org/downloads/windows/)
