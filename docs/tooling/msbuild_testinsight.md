# DUnitX CI Compiler Define - MSBuild Notes

## The Problem with Passing DCC_Define via MSBuild

When building a Delphi project from the command line using MSBuild,
passing `/p:DCC_Define=CI` will **replace** all existing compiler defines rather
than appending to them. This means defines already configured in your build
configuration will be silently discarded, potentially leading to unexpected
build behavior or runtime failures.

A suggested approach is to **append** the `CI` define to the existing set by
referencing the MSBuild property itself such as:

```test
/p:DCC_Define="$(DCC_Define);CI"
```

This expands the current value of `DCC_Define` (as configured in the `.dproj` for
the selected config) and appends `CI` to it, preserving all existing defines.
Order does not matter for simple `{$IFDEF}` checks since all defines are resolved
before compilation begins. This approach means you can continue using your
standard `Debug` build configuration without needing a separate `CI` config to
maintain and keep in sync.

A full example build and test run:

```bash
msbuild "MyDUnitXTestProject.dproj" /t:Build /p:Config=Debug /p:Platform=Win64 /p:DCC_Define="$(DCC_Define);CI" /nologo /v:minimal
bin\Win64\Debug\MyDUnitXTestProject.exe -xml:.\results.xml
```

Note the `.\` prefix on the results filename - omitting it causes DUnitX to attempt
to create a directory structure from the filename, resulting in
an `EInOutError: Unable to create directory` at runtime.

## Recommended: Add CI Guard to the Top of Your DUnitX .dpr File

DUnitX project templates already reference the `CI` define in generated
code (e.g., to suppress the "Press Enter to quit" pause). To ensure `TESTINSIGHT`
is also cleanly disabled in headless environments without requiring a dedicated build
configuration, add the following block at the top of your DUnitX project `.dpr` file,
immediately after the `program` declaration:

```pascal
{$IFDEF CI}
  {$UNDEF TESTINSIGHT}
{$ENDIF}
```

This keeps your `Debug` configuration as the single source of truth for IDE
development while giving headless build environments a clean, predictable
way to opt out of IDE-specific behavior with a single define.
