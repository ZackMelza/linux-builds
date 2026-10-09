# JaKooLit-based Hyprland preset

**Status:** Imported snapshot; live deployment and history preservation pending.

This is the existing, customized JaKooLit **preset**, not the future independent Linux-builds Hyprland configuration. Source: [ZackMelza/hyprland](https://github.com/ZackMelza/hyprland) at [`001438a3807b0ed84feab4d0b4730504713e4800`](https://github.com/ZackMelza/hyprland/commit/001438a3807b0ed84feab4d0b4730504713e4800).

## Licensing and provenance

The upstream [JaKooLit/Hyprland-Dots](https://github.com/JaKooLit/Hyprland-Dots) project provides the GNU GPLv3 license; its full text is included as [LICENSE.md](LICENSE.md). This does **not** declare a blanket license for Linux-builds. The owner's original repository has no standalone license file; review individual inherited third-party scripts/notices before broader redistribution.

**History gate:** The source commit is pinned and the source repository remains intact, but this GitHub snapshot import does **not** import the historical source Git graph. Preserve or import its meaningful history separately before closing that requirement.

## Structure and configuration

The original `jakoolithyprl/` layout is intentionally maintained:

- `common/` — shared JaKooLit configuration and inherited scripts.
- `profiles/` and `laptop/`, `desktop/` — machine-dependent configuration.
- `set-hypr-profile.sh` — builds the local/generated `active/` tree and links `~/.config/hypr`.
- `check-hypr.sh` — health checks after installation.
- `PROJECT_JOURNAL.md` — original notes and historical decisions (some paths are stale).

The ignored `active/` directory, generated `UserConfigs/Host.conf`, monitor/workspace overrides, wallust/wallpaper state and generated service state are never part of the imported tracked source.

## Compatibility and requirements

Original notes target Hyprland 0.55.x, using Wayland with the JaKooLit ecosystem (Waybar, Rofi, Hyprlock, Hypridle, wallpaper/Wallust tools). Actual package/dependency combinations and Arch/Debian/Fedora compatibility are **not verified**. The optional guard expects a systemd user session. This preset is not automatically compatible with the existing Omarchy setup.

## Preview and setup

From the root of the Linux-builds checkout:

```bash
bash configs/presets/jakoolit/jakoolithyprl/set-hypr-profile.sh --profile desktop --dry-run
```

The dry run is read-only. **Do not run the actual installer on your daily machine without inspecting existing `~/.config/hypr`, the environment profile and systemd user services.** The real setup generates `active/`, links Hyprland configuration and enables the guard; its rollback has not been tested. Choose `--profile laptop` or omit the profile to auto-detect. No installation was performed during migration.

To validate a configured test machine:

```bash
bash configs/presets/jakoolit/jakoolithyprl/check-hypr.sh
hyprctl configerrors
```

These commands have **not** been run against the migrated configuration.

## PAM/faillock warning

**System PAM is NOT changed by default.** The old installer changed `/etc/security/faillock.conf` automatically to effectively disable failed-authentication lockouts. Only an **explicitly requested** `--configure-faillock` enables that legacy, security-weakening operation. It uses root/sudo, may reset failure counters, and should ordinarily be avoided; fix the underlying PAM/Hyprlock issue instead. Existing authentication configuration is backed up under `/etc/security/faillock.conf.bak.<timestamp>` (with collision suffix if necessary). Restoration requires reviewing and restoring the correct backup as root; this has not been tested.

Existing user environment profile files, Hyprland links/configs and guard unit files are backed up before replacement, including when `--force` is provided. Generated `active/` is still rebuilt in place, so preserve any private local state separately first.

## Verification and limitations

The imported source tree and executable modes are preserved, apart from this component README and the deliberately adjusted profile installer. Static `bash -n`, ShellCheck, the generated tree, desktop startup, guard and runtime settings **still require testing** in a suitable environment. No compatibility or fresh-host install is claimed.

Phase 03 may extract shared utilities after the preset has been verified. See the [migration audit](../../../docs/repository-audit.md).
