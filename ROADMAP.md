
# Linux-builds — Development Roadmap

**Project:** Linux-builds
**Owner:** Zack
**Status:** Active Development

## 1. Project Objective

Develop a modular, portable personal Linux environment
that maintains a consistent experience across different
distributions, window managers and hardware configurations.

The long-term objective is to allow components to be
selected and combined according to the target machine.

Examples:

- Arch Linux + Hyprland + Quickshell.
- Debian + i3 + Quickshell.
- Fedora + Hyprland + Quickshell.

These are target configurations, not confirmed compatible
or completed installation profiles.

See [Architecture](docs/architecture.md) for design details.

---

## 2. Development Principles

- Learn the relevant concepts before major implementations.
- Develop one primary component at a time.
- Prefer reusable functionality over duplicated code.
- Separate shared behaviour from platform-specific implementations.
- Document components as they are developed.
- Test changes before considering work complete.
- Preserve existing configurations during migration.
- Keep the repository owner in control of development priorities.

AI agents must follow AGENTS.md.

A proposed task is not automatically approved for implementation.

---

# 3. Development Phases

## Phase 00 — Repository Audit

Status: Completed

### Objectives

Review existing Linux repositories before consolidation.

### Tasks

- [x] Identify existing GitHub repositories.
- [x] Identify initial migration candidates.
- [x] Inspect the contents of each migration candidate.
- [x] Check dependencies, licenses and sensitive information.
- [x] Decide which projects require Git history preservation.
- [x] Document the migration plan.

See [Repository audit and migration plan](docs/repository-audit.md) for
findings, unresolved migration gates and the approved import order.

### Initial Migration Candidates

| Source Repository | Proposed Destination |
|---|---|
| hyprland (Jakoolit customizations) | configs/presets/jakoolit/ |
| i3-configs | configs/window-managers/i3/ |
| dwm-build | configs/window-managers/dwm/ |

Existing Omarchy and Zsh configurations will also be
reorganized during the approved migration phase.

Do not delete or archive original repositories before
successful migration and verification.

---

## Phase 01 — Repository Foundation

Status: Completed

### Learning Objectives

- Git branching and repository organization.
- Markdown documentation.
- AGENTS.md and Agent Skills conventions.
- Project architecture and task management.

### Tasks

- [x] Establish AGENTS.md.
- [x] Create initial agent skills.
- [x] Establish README, report and need templates.
- [x] Create docs/architecture.md.
- [x] Update the root README.
- [x] Create ROADMAP.md.
- [x] Review and verify foundation files.
- [x] Merge the foundation branch after owner approval.

### Completion Criteria

The repository has documented development rules,
a defined architecture and consistent documentation
standards before configuration migrations begin.

---

## Phase 02 — Configuration Migration

Status: In Progress

### Learning Objectives

- Git history and migration techniques.
- Linux filesystem organization.
- XDG Base Directory conventions.
- Configuration dependencies.
- Symbolic links and file permissions.

### Objectives

Consolidate existing personal Linux configurations
without unnecessarily rewriting their functionality.

### Tasks

- [ ] Prepare the final configuration directory structure.
- [ ] Move existing Omarchy configurations.
- [ ] Move the existing Zsh configuration.
- [x] Import Jakoolit customizations (Git ancestry preserved; static and live verification pending).
- [x] Import i3 configurations (live deployment verification pending).
- [ ] Import the DWM project.
- [ ] Create or update individual component READMEs.
- [ ] Verify migrated components.
- [ ] Update references to previous repositories.
- [ ] Archive original repositories after approval.

### Completion Criteria

Existing configurations are organized, documented
and verifiably preserved.

---

## Phase 03 — Shared Environment

Status: Planned

### Learning Objectives

- Bash scripting.
- Linux environment variables.
- XDG conventions.
- GNU Stow and symbolic links.
- Process execution and shell configuration.
- Defensive scripting and error handling.

### Objectives

Extract reusable functionality from individual
desktop configurations.

### Planned Components

- Shared scripts.
- Common workspace conventions.
- Keybinding conventions.
- Common application preferences.
- Shared shell configurations.

### Completion Criteria

Reusable components are documented and no longer
unnecessarily tied to one specific desktop setup.

---

## Phase 04 — Independent Window Manager Builds

Status: Planned

### Learning Objectives

- X11 and Wayland architecture.
- Window manager configuration.
- Workspace management.
- Input handling and keybindings.
- Window rules and display management.

### Planned Builds

- [ ] Hyprland — independent personal configuration.
- [ ] i3 — personal configuration.
- [ ] DWM — personal build.

Each build should follow common behavioural conventions
where technically possible.

Development and testing will be performed separately
for each environment.

### Completion Criteria

Every completed window manager has installation
documentation, configuration instructions and
known compatibility limitations.

---

## Phase 05 — Quickshell Development

Status: Planned

### Learning Objectives

- Qt and QML.
- JavaScript fundamentals relevant to QML.
- Quickshell architecture and components.
- IPC and inter-process communication.
- Window manager integrations.
- X11 and Wayland compatibility limitations.

### Objectives

Develop a reusable desktop interface that provides
a consistent personal experience across supported
window managers.

### Potential Features

- Workspace indicator.
- Status bar.
- System information.
- Audio controls.
- Network information.
- Notifications.
- Application launcher.

These are potential features, not approved implementation
requirements.

Window-manager-specific integrations should remain
separate from shared visual components.

### Completion Criteria

Quickshell works with documented, tested environment
combinations and degrades appropriately when a feature
is unavailable.

---

## Phase 06 — Installation and Profiles

Status: Planned

### Learning Objectives

- Package management differences.
- Dependency handling.
- Installation scripting.
- Configuration deployment.
- Idempotency and rollback.
- Distribution-specific system behaviour.

### Objectives

Allow the owner to assemble an environment using
compatible components.

### Potential Profile Structure

profiles/
    arch-hyprland/
    debian-i3/
    fedora-hyprland/

### Planned Capabilities

- Select a supported environment.
- Resolve its documented dependencies.
- Install or restore selected configurations.
- Preserve and back up existing user configurations.
- Validate required components.
- Report unsupported combinations.

Installation tools must avoid destructive operations
and require appropriate user authorization.

### Completion Criteria

At least one supported installation profile can be
deployed reproducibly and verified on a clean test
environment.

---

## Phase 07 — Linux Tools and Experiments

Status: Planned

### Learning Objectives

- Advanced Bash.
- Python.
- systemd.
- Linux networking.
- Logging and diagnostics.
- Testing and automation.

### Potential Projects

- System Health CLI.
- Configuration backup and restore tool.
- Arch maintenance utility.
- Service monitoring utility.
- Linux bootstrap utility.

Individual projects require separate approval before
implementation.

Experiments belong in labs/ until promoted into
maintained projects.

---

## Phase 08 — Quality and Maintenance

Status: Planned

### Learning Objectives

- Automated testing.
- ShellCheck.
- GitHub Actions.
- CI workflows.
- Software maintenance.
- Versioning and release management.

### Objectives

Improve repository reliability and maintainability.

### Tasks

- [ ] Establish applicable validation tools.
- [ ] Introduce automated checks.
- [ ] Test supported environments.
- [ ] Maintain documentation.
- [ ] Track outstanding issues through needs/.
- [ ] Record substantial implementations in reports/.

Quality improvements may be introduced progressively
during earlier phases.

---

# 4. Current Development Focus

Completed milestones: Repository Audit (Phase 00) and Repository Foundation
(Phase 01). Current milestone: Configuration Migration (Phase 02, in progress).

Current migration work is tracked through Git branches and pull requests.

Immediate priorities:

1. Defer i3 live verification to a VM and redesign until after Quickshell.
2. Review the JaKooLit migration and complete static and runtime verification.
3. Migrate the DWM build with installer/uninstaller hardening.
4. Reorganize existing Omarchy and Zsh files after planning their moves.

Do not begin independent window manager or Quickshell
development before the relevant architectural requirements
have been reviewed.

---

# 5. Progress Management

This roadmap provides high-level direction.

Specific implementation requirements belong in needs/.
Substantial completed work belongs in reports/.

The repository owner controls:

- Priorities.
- Project scope.
- Architectural decisions.
- Approval of proposed requirements.
- Progression between major milestones.

Agents may recommend changes but must not independently
redefine or expand the roadmap.
