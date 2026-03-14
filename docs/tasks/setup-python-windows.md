# Task: Install Python on Windows

## Dependencies

None. Python for Windows is a standalone install via the Python Install Manager.

## Background

Python is installed on Windows using the **Python Install Manager**, an MSIX-based
package that replaces the traditional `.exe` installer. It provides the `py` launcher
command for managing and launching Python runtimes, and handles system configuration
such as long path support and `PATH` registration.

This guide covers installing Python 3.14 (current latest) using the Python Install
Manager version 26.0 (or later).

## Installation

### Step 1: Download the Python Install Manager

1. Open a browser and go to [https://www.python.org/downloads/windows/](https://www.python.org/downloads/windows/)
2. Under **Python Releases for Windows**, locate the **latest Python Install Manager**
   (currently `python-manager-26.0.msix`)
3. Click the link to download it

### Step 2: Launch the installer

Double-click the downloaded `.msix` file to open the Windows installer. When the
installer opens, click **Install Python** to begin.

### Step 3: Answer the configuration prompts

The Python Install Manager runs a configuration helper in a terminal window. Answer
the prompts as follows:

**Prompt 1 -- Long path support:**

```
Windows is not configured to allow paths longer than 260 characters.
Update setting now? [y/N]
```

Enter `Y` and press Enter. This applies a system-wide registry change to enable
long path support. A reboot will be required for this to take full effect.

**Prompt 2 -- Global shortcuts directory:**

```
The global shortcuts directory is not configured.
Add commands directory to your PATH now? [y/N]
```

Enter `Y` and press Enter. This adds `C:\Users\<user>\AppData\Local\Python\bin`
to your `PATH`, enabling version-tagged commands such as `python3.14.exe` to be
called directly from a terminal.

Expected output after this step:

```
PATH has been updated, and will take effect after opening a new terminal.
```

**Prompt 3 -- Install CPython runtime:**

```
You do not have the latest Python runtime.
Install CPython now? [Y/n]
```

Press Enter (or type `Y`) to accept and install the latest CPython runtime.
The installer will display progress:

```
Installing Python 3.14.3.
Extracting: ...................................................................✅
```

**Prompt 4 -- View online help:**

```
View online help? [y/N]
```

Press Enter (or type `N`) to skip. Installation is now complete.

## Verification

Open a **new** terminal (required to pick up the updated `PATH`) and run:

```powershell
python --version
```

Expected output:

```
Python 3.14.3
```

You can also verify via the `py` launcher:

```powershell
py --version
```

Expected output:

```
Python 3.14.3
```

To list all installed Python runtimes managed by the `py` launcher:

```powershell
py list
```

## Install uv Python Package Manager

```powershell
powershell -ExecutionPolicy ByPass -c "irm https://astral.sh/uv/install.ps1 | iex"
```

see: https://docs.astral.sh/uv/

## Notes

- The long path registry change made in Step 3 requires a **reboot** to fully take
  effect system-wide. You may continue working, but some tools may behave unexpectedly
  with long paths until after the reboot.
- The global shortcuts directory (`C:\Users\<user>\AppData\Local\Python\bin`) is only
  needed for version-tagged commands like `python3.14.exe`. The `py` and `python`
  commands work without it.
- If the `python` command is not found after opening a new terminal, confirm the
  shortcuts directory was added to `PATH` by running:

  ```powershell
  $env:PATH -split ';' | Where-Object { $_ -like '*Python*' }
  ```

- The Python Install Manager can also be launched from the Start menu for future
  configuration changes, or via `py install --configure` in a terminal.
- To update Python later, run `py install --update` or relaunch the installer.
- For more `py` launcher commands, run `py help`.
