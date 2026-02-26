<#
.SYNOPSIS
  Smoke test for PowerShell 7 and Pester 5 installation.

.DESCRIPTION
  Verifies that PowerShell 7.4+ and Pester 5.7+ are correctly installed
  and operational. Produces a clear pass/fail summary with actionable
  guidance for any failure.

  This script is self-contained and requires no dependencies beyond
  PowerShell itself. It does not assume Pester is installed -- it checks
  for it as part of the verification.

.NOTES
  Part of cd-doc-dev-setup (Continuous Delphi organization).
  See docs/tasks/verify-powershell-pester.md for the manual equivalent.

.EXAMPLE
  # Run directly (requires prior clone):
  pwsh ./tools/Invoke-PesterSmokeTest.ps1

  # Run without cloning (requires internet access):
  Invoke-Expression (Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/continuous-delphi/cd-doc-dev-setup/main/tools/Invoke-PesterSmokeTest.ps1').Content
#>

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$RequiredPSMajor    = 7
$RequiredPSMinor    = 4
$RequiredPesterMajor = 5
$RequiredPesterMinor = 7

$pass = @()
$fail = @()

function Write-Check {
  param([string]$Label, [bool]$Result, [string]$Detail)
  if ($Result) {
    Write-Host ("  [PASS] {0}" -f $Label) -ForegroundColor Green
    if ($Detail) { Write-Host ("         {0}" -f $Detail) -ForegroundColor DarkGray }
    $script:pass += $Label
  } else {
    Write-Host ("  [FAIL] {0}" -f $Label) -ForegroundColor Red
    if ($Detail) { Write-Host ("         {0}" -f $Detail) -ForegroundColor Yellow }
    $script:fail += $Label
  }
}

Write-Host ""
Write-Host "cd-doc-dev-setup: PowerShell and Pester smoke test" -ForegroundColor Cyan
Write-Host "----------------------------------------------------" -ForegroundColor Cyan
Write-Host ""

# -----------------------------------------------------------------------
# Check 1: PowerShell major version
# -----------------------------------------------------------------------
Write-Host "PowerShell" -ForegroundColor White
$psMajor = $PSVersionTable.PSVersion.Major
$psMinor = $PSVersionTable.PSVersion.Minor
# Use ToString() for display - avoids strict mode failure on missing Patch
# property when the script runs via Invoke-Expression
$psVersionString = $PSVersionTable.PSVersion.ToString()

$psVersionOk = ($psMajor -gt $RequiredPSMajor) -or
               ($psMajor -eq $RequiredPSMajor -and $psMinor -ge $RequiredPSMinor)

Write-Check `
  -Label  "PowerShell $RequiredPSMajor.$RequiredPSMinor+ is active" `
  -Result $psVersionOk `
  -Detail ("Active version: {0}  |  Required: {1}.{2}+{3}" -f
           $psVersionString,
           $RequiredPSMajor,
           $RequiredPSMinor,
           $(if (-not $psVersionOk) { "  ->  Install PowerShell 7: winget install --id Microsoft.PowerShell" } else { "" }))

# -----------------------------------------------------------------------
# Check 2: Not running under Windows PowerShell 5.1
# -----------------------------------------------------------------------
$isCore = $PSVersionTable.PSEdition -eq 'Core'
Write-Check `
  -Label  "Running PowerShell Core (not Windows PowerShell 5.1)" `
  -Result $isCore `
  -Detail $(if (-not $isCore) { "Run this script with 'pwsh', not 'powershell'" } else { "Edition: $($PSVersionTable.PSEdition)" })

Write-Host ""

# -----------------------------------------------------------------------
# Check 3: Pester 5.7+ is available
# -----------------------------------------------------------------------
Write-Host "Pester" -ForegroundColor White
$availablePester = Get-Module -ListAvailable Pester |
                   Where-Object { $_.Version.Major -gt $RequiredPesterMajor -or
                                  ($_.Version.Major -eq $RequiredPesterMajor -and
                                   $_.Version.Minor -ge $RequiredPesterMinor) } |
                   Sort-Object Version -Descending |
                   Select-Object -First 1

$pesterAvailable = $null -ne $availablePester
Write-Check `
  -Label  "Pester $RequiredPesterMajor.$RequiredPesterMinor+ is available" `
  -Result $pesterAvailable `
  -Detail $(if ($pesterAvailable) {
              "Found: Pester $($availablePester.Version)  at  $($availablePester.ModuleBase)"
            } else {
              "Run: Install-Module -Name Pester -MinimumVersion 5.7.0 -Force -SkipPublisherCheck -Scope CurrentUser"
            })

# -----------------------------------------------------------------------
# Check 4: Pester 5.7+ loads correctly
# -----------------------------------------------------------------------
$pesterLoaded = $false
$loadedVersion = $null
if ($pesterAvailable) {
  try {
    Import-Module Pester -MinimumVersion "$RequiredPesterMajor.$RequiredPesterMinor" -Force
    $loadedVersion = (Get-Module Pester).Version
    $pesterLoaded = ($loadedVersion.Major -gt $RequiredPesterMajor) -or
                    ($loadedVersion.Major -eq $RequiredPesterMajor -and
                     $loadedVersion.Minor -ge $RequiredPesterMinor)
  } catch {
    $pesterLoaded = $false
  }
}

Write-Check `
  -Label  "Pester $RequiredPesterMajor.$RequiredPesterMinor+ loads correctly" `
  -Result $pesterLoaded `
  -Detail $(if ($pesterLoaded) {
              "Loaded: Pester $loadedVersion"
            } elseif (-not $pesterAvailable) {
              "Skipped - Pester not available"
            } else {
              "Import-Module failed. Try closing and reopening your terminal."
            })

# -----------------------------------------------------------------------
# Check 5: Pester can discover and run a test
# -----------------------------------------------------------------------
$pesterRan = $false
if ($pesterLoaded) {
  try {
    $container = New-PesterContainer -ScriptBlock {
      Describe 'Smoke' {
        It '1 + 1 equals 2' {
          (1 + 1) | Should -Be 2
        }
      }
    }
    $config = New-PesterConfiguration
    $config.Run.Container = $container
    $config.Output.Verbosity = 'None'
    $config.Run.PassThru = $true
    $result = Invoke-Pester -Configuration $config
    $pesterRan = ($result.FailedCount -eq 0 -and $result.PassedCount -gt 0)
  } catch {
    $pesterRan = $false
  }
}

Write-Check `
  -Label  "Pester can discover and run a test" `
  -Result $pesterRan `
  -Detail $(if ($pesterRan) {
              "Inline smoke test passed"
            } elseif (-not $pesterLoaded) {
              "Skipped - Pester did not load"
            } else {
              "Pester loaded but failed to run a test. Check for conflicting module versions."
            })

# -----------------------------------------------------------------------
# Summary
# -----------------------------------------------------------------------
Write-Host ""
Write-Host "----------------------------------------------------" -ForegroundColor Cyan
$total = $pass.Count + $fail.Count
if ($fail.Count -eq 0) {
  Write-Host ("  All {0} checks passed. Environment is ready." -f $total) -ForegroundColor Green
} else {
  Write-Host ("  {0} of {1} checks passed. {2} failed:" -f $pass.Count, $total, $fail.Count) -ForegroundColor Red
  foreach ($f in $fail) {
    Write-Host ("    - {0}" -f $f) -ForegroundColor Yellow
  }
  Write-Host ""
  Write-Host "  See docs/tasks/verify-powershell-pester.md for guidance." -ForegroundColor Yellow
}
Write-Host ""

# When run as a file, exit with the failure count so callers and CI can
# detect failure via exit code.
# When run via Invoke-Expression, $MyInvocation.CommandOrigin is 'Runspace'
# and 'exit' would kill the calling shell session. In that case we skip the
# exit call -- the summary output is sufficient.
if ($MyInvocation.CommandOrigin -ne 'Runspace') {
  exit $fail.Count
}
