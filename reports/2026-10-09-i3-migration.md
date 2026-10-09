# Report: i3 Configuration Import

- Date: 2026-10-09
- Related need: None
- Status: Partial (import prepared; live verification pending)

## Objective

Begin Phase 02 by importing the existing independent i3/X11 configuration from `ZackMelza/i3-configs` into Linux-builds, preserving the source setup while fixing migration-specific path and backup issues.

## Scope and Affected Files

- Added `configs/window-managers/i3/`, including i3 and Picom configuration, wallpaper settings, installer, helper scripts and component README.
- Updated the root `README.md` and `ROADMAP.md` to reflect Phase 02 work.
- Did not alter, archive or delete `ZackMelza/i3-configs`, nor any running Linux environment.

## Implementation

Source repository revision: [`8382eb2921bb6b57e2f794dacac708045ab4494f`](https://github.com/ZackMelza/i3-configs/commit/8382eb2921bb6b57e2f794dacac708045ab4494f).

Imported the original file layout under `configs/window-managers/i3/` and retained source executable modes. Changes compared with the source revision are deliberately limited to:

- `README.md`: replaced the standalone-source instructions with Linux-builds component documentation and an explicit source reference.
- `local/bin/i3-startup`: replaced hard-coded `/home/zack` paths with home-relative helper paths, retaining the X11 startup design.
- `install.sh`: handles dangling existing symlinks without aborting, avoids overwriting existing timestamped backups, and no longer changes tracked script modes at installation time.

The remaining source files are carried across without modifications. No shared scripts were extracted; that is deferred to Phase 03. The one-commit source history is documented rather than grafted into the destination repository.

## Verification

| Check | Result | Notes |
|---|---|---|
| GitHub source inventory | Passed | 16 tracked source files at the recorded revision. |
| File content retrieval | Passed | All source files were read by their recorded commit. |
| Source comparisons | Passed | Files other than the documented three were imported unchanged. |
| Original executable permissions | Passed | Executable script modes are preserved in the Git tree. |
| Hard-coded path inspection | Passed | No `/home/zack` reference remains in imported `i3-startup`. |
| Documentation checks | Passed | Relative links and filenames checked against the target tree. |
| `bash -n` / ShellCheck / Python parse | Not run | GitHub connector writes files but does not execute local tools. |
| i3 config validation / installation / live session | Not run | Requires appropriate local dependencies and explicit host-environment authorization. |

## Known Issues and Limitations

The imported configuration is Linux Mint/Cinnamon/X11-oriented. Its runtime compatibility has not been established on the target distributions. The installer has no dry-run or uninstall command, and its global user paths could conflict with other configurations. The source did not include a license file.

## Follow-up Work

Review this import through a pull request, perform static validation in a local checkout, and test the i3 configuration in a suitable X11 environment before marking the component fully verified. Continue Phase 02 with the JaKooLit preset and then DWM; reorganize Omarchy and Zsh separately.

## Owner Decisions Required

The owner must approve merging the migration pull request, any installation on a real machine, and any later archiving of the source repository.
