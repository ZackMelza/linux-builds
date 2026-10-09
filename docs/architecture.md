
# Linux-builds — Architecture

**Status:** Directory layout approved; runtime architecture remains proposed
**Version:** 0.2

## 1. Vision

Linux-builds aims to provide a modular and portable personal
Linux environment.

The objective is to preserve a consistent user experience
across multiple Linux distributions, window managers and
hardware configurations.

The distribution provides the operating system.
The window manager handles window management.
Shared components provide the personal environment.

## 2. Design Principles

1. Portability over distribution-specific assumptions.
2. Modularity over duplicated configurations.
3. Shared behaviour with environment-specific implementations.
4. Reproducible installation and restoration.
5. Human-directed development.
6. Clear documentation for every maintained component.

Portability is a design objective, not a guarantee that every
component works identically on every platform.

## 3. Component Architecture

### Shared Components

Common configurations and utilities intended for reuse
across different environments.

Examples:
- Shared shell configuration (a future goal for Zsh).
- Shared scripts and utilities.
- Keybinding conventions.
- Common application preferences.

The migrated `shared/zsh/.zshrc` and `shared/starship/starship.toml` remain
personal configurations, not confirmed portable defaults. Zsh still uses
Omarchy- and distribution-specific paths; Starship includes a hard-coded
home path. Extracting universally reusable versions is future work.

### Window Managers

Each window manager maintains an independent implementation.

Planned components:
- Hyprland (personal build, Wayland).
- i3 (X11).
- DWM (X11).

Additional window managers may be introduced later.

These components should follow common workspace and
keybinding conventions wherever technically possible.

### Desktop Shell

Quickshell is the intended foundation for a reusable
personal desktop interface.

Potential responsibilities:
- Workspace indicators.
- System information.
- Status bar and widgets.
- Notifications and other desktop elements.

Window-manager-specific integrations must be isolated where
possible.

Quickshell functionality and compatibility must be tested
separately for each target environment.

### Existing Configuration Presets

Existing configurations are maintained separately from
independent personal builds.

- Omarchy: existing Omarchy customizations.
- Jakoolit: customizations based on Jakoolit's configuration.

Presets must not be treated as the source of truth for
independent window-manager configurations.

### Distribution Support

Distribution-specific modules will eventually manage
differences such as:

- Package names and package managers.
- Required dependencies.
- System paths and services.
- Installation requirements.

Initial intended distributions:
- Arch Linux.
- Debian.
- Fedora.

Support must be documented according to actual testing.

## 4. Profiles

Profiles define combinations of reusable components.

Examples:

Arch + Hyprland + Quickshell
Debian + i3 + Quickshell
Fedora + Hyprland + Quickshell

Profiles should reference reusable components instead of
maintaining unnecessary duplicate configurations.

These examples represent architectural targets, not
currently verified working installations.

## 5. Consistent User Experience

Linux-builds should aim to preserve:

- Familiar workspace behaviour.
- Common keybinding intentions.
- Consistent visual identity.
- Shared scripts and utilities.
- Predictable configuration management.

For example, switching to workspace 1 should follow the
same user-facing keybinding convention.

The actual command may differ between Hyprland, i3 and DWM.

Functionality that depends on compositor-specific features,
animations or display-server capabilities may not be portable.

## 6. Approved Repository Organization

The owner approved a simple role-based layout on 2026-10-09:

```text
wm/
    hyprland/        # planned independent build
    i3/              # imported independent X11 configuration
    dwm/             # planned independent build
shell/
    quickshell/      # planned reusable desktop UI
presets/
    jakoolit/        # imported Hyprland preset and original Git history
    omarchy/         # saved user overrides and theme
shared/
    zsh/             # personal Zsh configuration
    starship/        # personal Starship configuration
docs/
needs/
reports/
AGENTS.md
README.md
ROADMAP.md
```

This diagram shows the **intended** paths, not a claim that all planned
directories or components have been implemented. Avoid empty placeholders.
Existing historical component contents are preserved until the owner
approves later redesign and Quickshell-related cleanup.

Imported preset files are not the source of truth for new, independent builds.
The JaKooLit profile directories `common/`, `laptop/`, `desktop/` and
`profiles/` are retained directly under `presets/jakoolit/` (removing
the redundant `jakoolithyprl/` wrapper). Local `active/` is still generated
and excluded from Git. Relative-path setup code and documentation must follow
the new paths; actual desktop compatibility remains unverified.

The owner prefers future independent builds to primarily consist of files
that can be copied or symlinked, with Quickshell handling supported desktop
UI responsibilities. This is tracked as
[N-001](../needs/N-001-lean-config-only-desktops.md), not approval to strip
the imported working presets or assume universal Quickshell support.

## 7. Development Approach

1. Establish governance and documentation.
2. Audit existing repositories and configurations.
3. Migrate existing projects without unnecessary rewrites.
4. Identify reusable components.
5. Establish common conventions.
6. Build independent window-manager configurations.
7. Develop and integrate Quickshell.
8. Introduce profiles and distribution-specific installation.
9. Test supported combinations individually.

## 8. Architectural Changes

Significant changes to this architecture require approval
from the repository owner.

Agents may propose improvements but must not independently
redefine the project's direction.
