# Report: Role-based Repository Reorganization

- Date: 2026-10-09
- Related need: [N-001](../needs/N-001-lean-config-only-desktops.md) (future redesign; not implemented)
- Status: Partial — file organization prepared; live verification pending

## Objective

Adopt the owner's approved shorter role-based structure (`wm/`, `shell/`,
`presets/`, `shared/`) and separate layout work from JaKooLit's import,
while preserving file contents, source Git ancestry and runtime responsibilities.

## Scope and Affected Files

Reorganized 148 tracked source files:
- 16 files from `configs/window-managers/i3/` to `wm/i3/`
- 117 files from `configs/presets/jakoolit/` to `presets/jakoolit/`
- 13 files from `omarchy/` to `presets/omarchy/`
- 2 files from `zsh/` to `shared/zsh/` and `shared/starship/`

The extra `jakoolithyprl/` path segment was removed; its
`common/`, `desktop/`, `laptop/` and `profiles/` trees remain.
DWM, independent Hyprland and Quickshell are still planned and were
**not** created as empty directories.

## Implementation

The tree moves were made by referencing the exact preexisting Git blob SHA
for each destination file and removing its obsolete path. This preserves
file content, executable bits and inherited commit ancestry. Only
documentation and the JaKooLit `.gitignore` need content changes:
- Changed JaKooLit ignore rules to match the flattened profile paths.
- Updated i3/JaKooLit component documentation and their root-relative
  command examples and relative links.
- Updated Omarchy restore/backup instructions to use the new source paths.
- Added simple Zsh/Starship README files documenting unchanged machine-specific
  content and deployment paths.
- Updated the root README, architecture, roadmap and Phase 00 audit addendum.
- Left historical implementation reports and the original JaKooLit project
  journal unchanged as records of their time.

No programs were installed or executed on the user's Arch machine. The
separate JaKooLit source repository and Linux-builds main were not touched.

## Verification

| Check | Result | Notes |
|---|---|---|
| Source tree inventory | Passed | 148 source files mapped exactly once |
| Source Git content/modes | Passed | Git blob SHA and mode referenced unchanged for relocations |
| JaKooLit profile layout | Inspected | Paths flattened, profile directories preserved |
| Ignored/generated state rules | Reviewed | `active/`, Host.conf and profile overrides still excluded |
| Documentation paths | Reviewed | Root, component and Omarchy restore examples updated |
| Script syntax and shell lint | Not run | GitHub connector does not execute shell tools |
| Installation/desktop behavior | Not run | Original JaKooLit is active on owner machine; this branch was not installed |
| Original Git history | Preserved | Reorganization descends from JaKooLit two-parent ancestry merge |

## Known Issues and Limitations

JaKooLit scripts may have non-portable references inherited from upstream;
not all runtime dependencies and absolute paths are independently tested.
The Omarchy restore instructions include system package and shell changes:
they are documented commands, **not tested actions**. Do not deploy the
reorganized profiles on a currently working system without a controlled
test and backups.

## Follow-up Work

Review the stacked PR after the JaKooLit migration PR is merged, validate
syntax and meaningful path references in a local checkout, then test the
new locations safely. Resume DWM migration into `wm/dwm/`.
The later Quickshell-first reduction of installers/background scripts
remains a separate future need, N-001.

## Owner Decisions Required

The owner must approve any merge, host installation, source archival or
future architectural work beyond the approved directory reorganization.
