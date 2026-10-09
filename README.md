
# Linux-builds

My personal Linux development workspace.

Linux-builds is a long-term project focused on developing a
modular, portable and maintainable personal Linux environment.

The objective is to preserve my preferred desktop experience,
configurations, keybindings, scripts and workflows across
different Linux distributions and window managers.

Rather than depending entirely on a specific distribution or
preconfigured desktop, the project aims to build reusable
components that can be combined according to the target system.

> One personal environment. Multiple Linux distributions.
> Interchangeable window managers. Shared components.

## Project Status

**In development — Configuration Migration (Phase 02)**

The repository audit and foundation are complete. Existing Linux
configurations are now being imported one component at a time.
The i3 and JaKooLit source snapshots are imported, but live testing remains
outstanding. JaKooLit source-history preservation is also pending.

## Architecture

The architecture separates the personal Linux environment
into several independent components.

| Component | Responsibility |
|---|---|
| Shared | Common configurations, scripts and conventions |
| Window Managers | Independent WM implementations |
| Desktop Shell | Reusable desktop interface components |
| Presets | Customizations of existing Linux configurations |
| Distributions | Distribution-specific dependencies and setup |
| Profiles | Combinations of compatible components |

The long-term intention is to support combinations such as:

- Arch Linux + Hyprland + Quickshell.
- Debian + i3 + Quickshell.
- Fedora + Hyprland + Quickshell.

These are architectural targets, not currently verified
installation profiles.

See [Architecture](docs/architecture.md) for the complete
design principles and development approach.

## Existing Components

| Component | Description |
|---|---|
| [Omarchy](omarchy/README.md) | Personal Omarchy configurations, overrides and Symbiote theme |
| [Zsh](zsh/) | Personal Zsh and Starship configurations |
| [i3](configs/window-managers/i3/README.md) | Imported independent X11 configuration; live verification pending |
| [JaKooLit preset](configs/presets/jakoolit/README.md) | Imported preset snapshot; verification and history work pending |

## Planned Components

The following components will be introduced progressively:

### Window Managers

- Hyprland — independent personal configuration.
- DWM — personal DWM build.

### Configuration Presets

- Omarchy — existing personal customizations.

### Desktop Interface

- Quickshell — intended reusable desktop interface,
  with environment-specific integrations where necessary.

### Additional Development

- Shared scripts and utilities.
- Configuration management.
- Installation profiles.
- Distribution-specific setup.
- Linux experiments and learning projects.

## Development and Documentation

Every maintained project should have its own README.

Repository documentation follows common templates to ensure
that installation, usage, compatibility and limitations are
recorded consistently.

| Location | Purpose |
|---|---|
| [AGENTS.md](AGENTS.md) | AI agent governance and development rules |
| [ROADMAP.md](ROADMAP.md) | Development phases and current priorities |
| [.agents/skills/](.agents/skills/) | Specialized agent workflows |
| [docs/](docs/) | Architecture and general documentation |
| [reports/](reports/README.md) | Development and implementation reports |
| [needs/](needs/README.md) | Planned requirements and improvements |

## AI-Assisted Development

AI agents are used as development assistants.

The repository owner retains authority over architectural
decisions, project direction, priorities and consequential
repository operations.

All contributing agents must follow AGENTS.md and use the
applicable repository skills.

## Portability

Portability is a design objective.

Compatibility depends on the distribution, display server,
window manager and component requirements.

Functionality must be verified on supported environments
rather than assumed to work universally.

## License

No repository-wide license has been selected. Imported components may have
separate upstream licensing requirements; see individual component documentation.
