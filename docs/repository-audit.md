# Repository audit and Phase 02 migration plan

**Status:** Historical Phase 00 audit and initial Phase 02 plan; see the post-audit layout addendum below.

**Date:** 2026-09-30

## Scope and decision basis

Phase 00 identified three external repositories for consolidation. This
document records the repository owner's completed audit findings and approved
migration decisions. No local checkouts were found under
`/home/zack/projects/`, and the GitHub pages could not be fetched for an
independent rescan. Findings such as commit count and absence of obvious
secrets are recorded from the supplied audit, not re-verified here.

The planned destinations follow the component boundaries in
[architecture.md](architecture.md). No configuration has been migrated.

| Source | Role | Phase 02 destination | History decision |
|---|---|---|---|
| [ZackMelza/hyprland](https://github.com/ZackMelza/hyprland) | JaKooLit-based preset | `configs/presets/jakoolit/` | Preserve meaningful Git history. |
| [ZackMelza/i3-configs](https://github.com/ZackMelza/i3-configs) | Independent i3 build | `configs/window-managers/i3/` | One source commit; full history preservation is not required. |
| [ZackMelza/dwm-build](https://github.com/ZackMelza/dwm-build) | Independent DWM build | `configs/window-managers/dwm/` | Preserve Git history. |

## ZackMelza/hyprland: JaKooLit preset

This repository is a JaKooLit-based configuration preset. It is not the
future independent Hyprland build. Import it under
`configs/presets/jakoolit/`, preserving its `common/`, `desktop/`,
`laptop/` and profile architecture before considering any extraction of
shared code. Preserve meaningful source history and document its origin.

During migration:

- Keep generated `active/` state out of Git.
- Resolve GPL obligations and upstream JaKooLit attribution before treating
  the imported content as ready for distribution.
- Redesign any PAM/faillock modification as an explicit opt-in action, with
  the affected files and rollback documented.
- Review `--force` backup behavior so existing user configuration is not
  silently discarded.

These are migration gates. This plan does not authorize running an installer
or modifying PAM.

## ZackMelza/i3-configs: independent i3 build

Import this as an independent window-manager component under
`configs/window-managers/i3/`. The current configuration is oriented toward
Linux Mint, Cinnamon and X11; support elsewhere remains unverified. Preserve
its working structure first, then consider shared-code extraction in a later
phase. Replace hard-coded `/home/zack` paths during migration without assuming
that other parts are portable.

The source has one commit, so a full history-preserving import is not
required. The supplied audit found no obvious secrets, but that is not a
guarantee; review imported content again before publishing it.

## ZackMelza/dwm-build: independent DWM build

Import the complete DWM build as one component under
`configs/window-managers/dwm/` and preserve its Git history. Keep the
existing MIT/X Consortium notice. Distribution compatibility is intended
until tested on specific systems.

During migration, harden the bootstrap and uninstall paths before running
them on a live system:

- Back up existing user configuration by default; `--force` must not simply
  remove it.
- Make uninstall symmetrical with install, including the files each command
  owns and the restoration of prior state.
- Protect pre-existing system configuration, including SDDM files.
- Review string/eval command execution and replace unsafe construction where
  needed.
- Correct stale CI claims in `SECURITY.md` to match actual automation.

## Migration order and checks

1. **i3:** It is the smallest import and can validate the new repository
   structure, documentation pattern and verification process before the more
   complex imports.
2. **JaKooLit preset:** Preserve its profile layout and meaningful history,
   then resolve attribution, generated state and installer safety gates.
3. **DWM:** Preserve the complete build and history, then harden bootstrap,
   uninstall and system-configuration handling before execution.

For each import, inspect the source at a recorded revision, confirm the files
and license notices copied, document dependencies and tested environments,
check for sensitive information, and compare the destination against the
source. Do not archive or delete an original repository until its migration
has been verified and the owner has separately approved that action.

The existing Omarchy and Zsh files remain in place pending their Phase 02
reorganization. Their moves and every configuration migration task in the
[roadmap](../ROADMAP.md) remain unstarted.

## Post-audit layout amendment (2026-10-09)

The owner subsequently approved a shorter, role-based layout for Linux-builds.
The proposed paths in the original audit table above are retained as a
**historical record**, not as the current destinations. The adopted paths are:

| Component | Current destination |
|---|---|
| Independent i3 | `wm/i3/` |
| Independent DWM (planned migration) | `wm/dwm/` |
| JaKooLit preset | `presets/jakoolit/` |
| Omarchy preset | `presets/omarchy/` |
| Zsh config | `shared/zsh/` |
| Starship config | `shared/starship/` |
| Future Quickshell | `shell/quickshell/` |

The JaKooLit wrapper directory was flattened while preserving its shared,
laptop, desktop and profile subtrees and original Git commit ancestry.
The approved configuration-only redesign is a **later planning requirement**
([N-001](../needs/N-001-lean-config-only-desktops.md)); the migration itself
must not discard working legacy scripts or claim live compatibility.

See [architecture.md](architecture.md) for the current folder organization
and the Phase 02 reorganization report for validation limits.
