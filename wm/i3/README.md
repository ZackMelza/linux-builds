# i3 Window Manager Configuration

**Status:** Migrated from i3-configs; live deployment not yet verified in Linux-builds.

## Overview

An independent i3/X11 desktop configuration originally developed for a Linux Mint/Cinnamon installation. Includes i3 keybindings, a Python i3bar status program, Picom settings, keyboard layout management, audio/display/power menus and wallpaper rotation.

This is an independent window-manager build, not a JaKooLit or Omarchy preset. The existing implementation is preserved during Phase 02; extraction of reusable scripts is planned for Phase 03.

## Compatibility

- **Source environment:** Linux Mint with i3 on X11; original README described it as installed on the owner's machine.
- **Imported Linux-builds environment:** Not yet installed or runtime-tested.
- **Other distributions:** Arch, Debian, Fedora and others have not been verified for this component.
- **Wayland:** Not supported by the X11-specific tools and i3 configuration.

## Requirements

This installer does **not** install packages. Install i3 and the relevant dependencies for your distribution before using it.

- Core desktop programs: `i3`, `i3-msg`, `xfce4-terminal`, `brave-browser`, `thunar`, `rofi`, `python3`, `bash`.
- Configuration features: `xsetroot`, `setxkbmap`, `xset`, `xrandr`, `feh`, `shuf`, `xdotool`, `pactl` or `wpctl` for audio, `systemctl` for the power menu.
- Optional startup components: `picom`, `dunst`, `nm-applet`, `pasystray`, `blueman-applet`, `xfce4-power-manager`, `udiskie`; `pavucontrol` or `xfce4-mixer` for the volume mixer.
- Optional editor: `code`, `codium`, or the VS Code Flatpak with `flatpak`.

This is an observed command/dependency inventory, **not** a validated distro package manifest. Keyboard initialization optionally writes Cinnamon `gsettings` settings.

## Installation

From the **root of Linux-builds**:

```bash
bash wm/i3/install.sh
```

After this directory move, the installer continues to resolve paths relative to its own location. It creates symlinks for all files under `config/` and `local/bin/`, targeting `~/.config/` and `~/.local/bin/` respectively. Existing destination files or symlinks are moved to timestamped `.backup.*` paths first. Reruns avoid replacing already-correct symlinks; backup names avoid collisions. No root permissions or package installation are required.

**Caution:** Review the target files before running it. The installer has no dry-run option and uses shared locations such as `~/.config/picom` and generic `~/.local/bin` command names, which could conflict with another desktop configuration. It has **not** been executed as part of this migration. Do not assume that it can safely install alongside the DWM/Omarchy configurations.

## Configuration

- `config/i3/config`: keybindings, workspace names, applications, bar and window rules.
- `config/picom/picom.conf`: X11 compositor settings.
- `config/wallpaper-rotator.conf`: wallpaper directory, interval and fallback.
- `local/bin/i3-startup`: X11 session services and wallpaper/keyboard initialization.
- `local/bin/i3bar-status`: clickable status output using the i3bar protocol.
- `local/bin/`: menus and small utilities.

The current keyboard layouts are US and Greek (`us,gr`), with `Alt+Shift` switching. Wallpapers are expected in `~/Pictures/Wallpapers`; the fallback points to `~/Pictures/terminal_codex.png` if present.

## Usage

After deployment and starting an i3 X11 session:

```bash
i3-msg reload
```

Common shortcuts include `Super+Return` (terminal), `Super+R` (Rofi launcher), `Super+1` through `Super+0` (workspaces), and `Super+Shift+P` (power menu). See `config/i3/config` for the complete list.

## Verification

Static checks to run in a checkout:

```bash
bash -n wm/i3/install.sh
bash -n wm/i3/local/bin/i3-startup
```

After dependencies are installed and with i3 available, validate the configuration and then test in a disposable X11 session:

```bash
i3 -C -c ~/.config/i3/config
```

Check the window shortcuts, startup, keyboard layouts, bar, audio/display menus and wallpaper rotation. The commands above are **instructions**, not claims that these tests have been run.

## Known Limitations

- No recorded live test after import into Linux-builds.
- Mint/Cinnamon assumptions and X11-specific commands remain.
- `i3-startup` requires the helper scripts to be installed in `~/.local/bin`.
- The installer shares system-wide user configuration names with other setups and has no dry-run/uninstall support.
- `kill-focused-window` deliberately sends SIGKILL; use it only as a force-kill action.
- Dependencies, exact versions and complete distro compatibility remain unverified.
- The original source repository does not include an explicit license file; no new license is asserted by this migration.

## Future Improvements

Potential Phase 03 work includes extracting reusable audio, wallpaper and editor utilities and replacing Cinnamon-specific assumptions. These are not automatically approved changes.

## Origin and Credits

Imported from [ZackMelza/i3-configs](https://github.com/ZackMelza/i3-configs) at commit [`8382eb2921bb6b57e2f794dacac708045ab4494f`](https://github.com/ZackMelza/i3-configs/commit/8382eb2921bb6b57e2f794dacac708045ab4494f). The original repository has one commit; it remains intact, and this import does not graft unrelated Git history.

See the [migration audit](../../docs/repository-audit.md) for background and remaining requirements.
