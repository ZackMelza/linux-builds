# Report: JaKooLit Preset Migration

- Date: 2026-10-09
- Related need: None
- Status: Partial — runtime verification and source-history preservation outstanding

## Objective

Import the existing JaKooLit-based profile repository to its own preset component without rewriting inherited configuration, and remove automatic security-sensitive PAM modifications.

## Scope and Affected Files

All 116 tracked source files from `ZackMelza/hyprland` commit `001438a3807b0ed84feab4d0b4730504713e4800` were prepared under `configs/presets/jakoolit/`. Added the upstream GPLv3 license text and adjusted the root README and roadmap.

## Implementation

The source files and executable modes are retained. The source README is replaced by a Linux-builds component README. The profile installer now defaults to no PAM change and requires `--configure-faillock` to invoke the old dangerous behavior. Backups are used for existing Hyprland config paths, environment profile, user guard unit files and colliding PAM backup names. The generated `active/` architecture is preserved.

The source Git history **has not** been imported into the Linux-builds commit graph; the source repo and exact SHA are documented. The existing external source repository remains available and unarchived.

## Verification

| Check | Result | Notes |
|---|---|---|
| GitHub inventory | Passed | 116 source files at recorded source SHA |
| Source snapshot import | Passed | Original file contents and modes retained except installer and README |
| PAM default inspection | Passed | Explicit `--configure-faillock` needed for PAM path |
| Upstream license | Fetched | GNU GPLv3 from JaKooLit project |
| Static shell/parser validation | Not run | GitHub API alone does not execute local tools |
| Runtime profile and guard | Not run | Requires separate isolated host testing |
| Source-history graft | Not done | Explicit open migration gate |

## Known Issues and Limitations

Source history preservation and live verification remain unresolved. Individual third-party script provenance may need additional review. The PAM opt-in operation remains risky and should ordinarily not be used. User guard/rollback behavior has not been runtime-tested.

## Follow-up Work

Review the PR, run local static checks and a dry run on a test checkout, decide on Git-history integration before closing the migration, and test in a controlled Hyprland environment. Later proceed with DWM, Omarchy and Zsh.

## Owner Decisions Required

Merge authorization, history import method and any subsequent installation, privileged change or archival remain with the owner.
