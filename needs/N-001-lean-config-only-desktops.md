# N-001: Lean Config-Only Desktop Components

- Status: Proposed
- Priority: Unassigned
- Area: Architecture / Quickshell / Window Managers
- Created: 2026-10-09

## Problem

The imported i3, JaKooLit and DWM setups currently contain installers,
background helpers, startup scripts, profile managers, and standalone UI
utilities inherited from their original repositories. These were kept
during Phase 02 to preserve the existing setups, but the owner does not
want the future personally designed environment to depend on redundant
per-window-manager installers or background-management scripts.

## Objective

After Quickshell and the independent desktop architecture are sufficiently
developed and tested, maintain minimal, transparent window-manager
configuration components that can be deployed by **copying or symlinking**
the intended files into their standard configuration locations. Assign
desktop UI and suitable runtime controls to Quickshell rather than
duplicating them separately in each window-manager configuration.

This is a future design objective, **not an instruction to remove or
rewrite the imported presets during Phase 02**.

## Requirements

- Preserve existing imported presets and their source provenance/history
  throughout the migration and development phases.
- Distinguish **independent new window-manager builds** from historical
  JaKooLit/Omarchy presets.
- Favor minimal configuration files, documented locations and predictable
  copy/symlink deployment, instead of component-specific installation
  frameworks.
- Where supported and tested, place status bar, widgets, application
  launcher, notifications, wallpaper/UI interactions and similar desktop
  behavior in a shared Quickshell implementation.
- Avoid redundant per-window-manager background scripts and services when
  their responsibilities have demonstrably moved to Quickshell or another
  shared, required component.
- Keep essential compositor/window-manager-native configuration and any
  technically necessary startup or IPC integration. Quickshell is not a
  substitute for all native WM behavior, package prerequisites or
  distribution/service responsibilities.
- Explicitly test Quickshell support on each intended display-server/
  window-manager combination (especially i3 and DWM on X11) before
  committing to shared controls there.
- Revisit the Phase 06 installer/profile roadmap with the owner before
  implementing a distribution-wide installation framework.

## Acceptance Criteria

- Each redesigned independent WM component documents exactly which files
  to copy or symlink, and can be deployed without its own full installer.
- No duplicate, always-running legacy scripts remain merely because they
  were inherited from a preset; required exceptions are documented.
- Quickshell-managed functionality is separated cleanly from native WM
  configuration and works in each *explicitly tested* supported environment.
- Existing original presets remain recoverable as a reference until the
  owner decides otherwise.
- The revised design and any corresponding roadmap/architecture changes
  are reviewed and approved by the owner.

## Dependencies

- Phase 02 migrations and source-history preservation.
- Phase 04 independent window-manager designs.
- Phase 05 Quickshell implementation and compatibility tests.
- Any approved revision to Phase 06 installation/profile requirements.

## Notes

Owner preference recorded on 2026-10-09: after the initial phases and once
Quickshell is ready, he wants a configuration-focused repository where
the files needed for a chosen WM can simply be copied or linked, without
separate installation, wallpaper, or background-management scripts where
Quickshell can supply the equivalent behavior.

This is a **Proposed** future need. The current working imported files
must not be deleted in advance, and runtime compatibility is not assumed.

## Implementation Report

Not yet implemented.
