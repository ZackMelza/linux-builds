# Omarchy component

This directory is the Omarchy preset of Linux-builds. It stores Zack's
personal Omarchy/Hyprland overrides. Omarchy's packaged defaults remain
managed by Omarchy; these are the user files saved for restoration after a
fresh installation.

## Files to keep backed up

The reusable configuration is under `presets/omarchy/hypr/`:

- `hyprland.lua` — loads the personal modules, including workspace rules.
- `input.lua` — US/Greek keyboard layouts, Alt+Shift switching, and normal Caps Lock behavior.
- `bindings.lua` — personal keybindings and keybindings-help descriptions.
- `workspace_rules.lua` — application-to-workspace placement rules.
- `looknfeel.lua` — personal window spacing, corners and border colors.

The saved personal Zsh configuration is under `shared/zsh/` and `shared/starship/`:

- `.zshrc` — loads Omarchy's user environment setup.
- `starship.toml` (in `shared/starship/`) — full-path prompt and Git status/counts.

The custom Omarchy theme is under `presets/omarchy/themes/symbiote/`:

- `colors.toml` — black-suit palette with cool web highlights and crimson accents.
- `backgrounds/` — matching wallpapers, including the original
  `marvel-black-suit.webp` reference image plus `symbiote.png`, `city-web.png`,
  `black-weave.png`, `moonlit-rooftop.png`, and `symbiote-creature.png`.

Current application placement includes browsers on workspace 2, VS Code and
other IDEs on 3, Steam/Lutris/Heroic on 5, Discord and messaging apps on 7,
and games on 8. Email, screen sharing, virtual machines, and multimedia are
also assigned to workspaces 1, 4, 6, and 9 respectively.

## Restore on a new Omarchy installation

Install and launch Omarchy once first so its normal `~/.config/hypr/` files
exist. The block below creates a new, uniquely named backup directory on each
run. It copies existing Hyprland, Zsh, Starship and Symbiote theme files there
before replacing them, and stops if a backup or syntax check fails. Keep the
printed backup location for recovery.

The saved theme's user destination and activation command follow
[Omarchy's theme documentation](https://github.com/omacom/omarchy/blob/quattro/default/agents/skills/omarchy/theming.md).
These steps have not been tested on a fresh installation of the target Omarchy
version.

```bash
(set -e
sudo pacman -S zsh
chsh -s /usr/bin/zsh

git clone https://github.com/ZackMelza/linux-builds.git ~/linux-builds
backup_dir=$(mktemp -d -- "$HOME/linux-builds-backup.XXXXXXXX")

if [ -e "$HOME/.config/hypr" ] || [ -L "$HOME/.config/hypr" ]; then
  cp -aL -- "$HOME/.config/hypr" "$backup_dir/hypr"
fi
if [ -e "$HOME/.zshrc" ] || [ -L "$HOME/.zshrc" ]; then
  cp -aL -- "$HOME/.zshrc" "$backup_dir/.zshrc"
fi
if [ -e "$HOME/.config/starship.toml" ] || [ -L "$HOME/.config/starship.toml" ]; then
  cp -aL -- "$HOME/.config/starship.toml" "$backup_dir/starship.toml"
fi
if [ -e "$HOME/.config/omarchy/themes/symbiote" ] || [ -L "$HOME/.config/omarchy/themes/symbiote" ]; then
  cp -aL -- "$HOME/.config/omarchy/themes/symbiote" "$backup_dir/symbiote"
fi
printf 'Backups saved to %s\n' "$backup_dir"

luac -p ~/linux-builds/presets/omarchy/hypr/hyprland.lua
luac -p ~/linux-builds/presets/omarchy/hypr/input.lua
luac -p ~/linux-builds/presets/omarchy/hypr/bindings.lua
luac -p ~/linux-builds/presets/omarchy/hypr/workspace_rules.lua
luac -p ~/linux-builds/presets/omarchy/hypr/looknfeel.lua

mkdir -p ~/.config/hypr ~/.config/omarchy/themes/symbiote

cp ~/linux-builds/presets/omarchy/hypr/hyprland.lua ~/.config/hypr/
cp ~/linux-builds/presets/omarchy/hypr/input.lua ~/.config/hypr/
cp ~/linux-builds/presets/omarchy/hypr/bindings.lua ~/.config/hypr/
cp ~/linux-builds/presets/omarchy/hypr/workspace_rules.lua ~/.config/hypr/
cp ~/linux-builds/presets/omarchy/hypr/looknfeel.lua ~/.config/hypr/
cp ~/linux-builds/shared/zsh/.zshrc ~/.zshrc
cp ~/linux-builds/shared/starship/starship.toml ~/.config/starship.toml
cp -a ~/linux-builds/presets/omarchy/themes/symbiote/. ~/.config/omarchy/themes/symbiote/

hyprctl reload
hyprctl configerrors
omarchy theme set symbiote
)
```

After restoring, the personal shortcuts are:

| Shortcut | Action |
| --- | --- |
| `Super+H` | Keybindings help |
| `Super+E` | File manager |
| `Super+L` | Lock system |
| `Super+D` | Discord |
| `Super+Shift+C` | Codex |

The ThinkPad F1 mute key remains available while locked and uses the custom
audio-sink mute handler.

`Super+C` remains Omarchy's Universal Copy binding.

## Updating the backup

After changing a user config file, copy it back into the Linux-builds repository and
commit it:

```bash
cp ~/.config/hypr/<changed-file>.lua ~/linux-builds/presets/omarchy/hypr/
git -C ~/linux-builds add omarchy/hypr/<changed-file>.lua
git -C ~/linux-builds commit -m "Describe the customization"
git -C ~/linux-builds push
```

## Important boundaries

- Do not edit or copy `/usr/share/omarchy/`; Omarchy owns and updates it.
- Do not copy the entire `~/.config/hypr/` directory over a new install.
- Do not run the JaKooLit/Hyprland repository setup script on Omarchy. That
  repository is reference material for selected workspace behavior only.
- Keep machine-specific monitor, display, and generated state out of this
  backup unless they are deliberately made portable.
