-- Keep only your personal keybinding overrides here. Add new bindings or
-- unbind defaults before replacing them.

-- See current bindings and descriptions:
--   omarchy menu keybindings --print

-- To disable every Omarchy default binding, set this in
-- ~/.config/hypr/hyprland.lua before require("default.hypr.omarchy"), then add
-- only the bindings you want below:
--   omarchy_default_bindings = false

-- To disable all preinstalled app/webapp bindings, set:
--   omarchy_preinstalled_bindings = false

-- Unbind default SUPER+W (close window) before replacing it.
hl.unbind("SUPER + W")

-- Keep the ThinkPad F1 mute indicator synchronized with the active audio sink.
hl.unbind("XF86AudioMute")
o.bind("XF86AudioMute", "Mute", "thinkpad-audio-mute-toggle", { locked = true })

-- Add a new binding.
-- o.bind("SUPER + SHIFT + R", "SSH", "alacritty -e ssh your-server")

-- Change an existing binding by unbinding it first, then binding the key again.
-- This example changes SUPER+SPACE from the launcher to the Omarchy root menu.
-- hl.unbind("SUPER + SPACE")
-- o.bind("SUPER + SPACE", "Omarchy menu", "omarchy-menu toggle root")

-- Disable a default binding without replacing it.
-- hl.unbind("SUPER + SHIFT + B")

-- Logitech MX Keys examples:
-- o.bind("SUPER + SHIFT + S", nil, "omarchy-capture-screenshot")
-- o.bind("SUPER + H", nil, "voxtype record toggle")
-- o.bind("SUPER + PERIOD", nil, "omarchy-shell shell toggle omarchy.emojis")

-- Close window with SUPER + Q (instead of default SUPER + W)
hl.unbind("SUPER + Q")
o.bind("SUPER + Q", "Close window", hl.dsp.window.close())

-- Launch default browser with SUPER + B
hl.unbind("SUPER + B")
o.bind("SUPER + B", "Launch browser", { omarchy = "browser" })

-- Personal shortcuts. Unbind Omarchy defaults before replacing them so the
-- keybindings help shows only the new actions.
hl.unbind("SUPER + K")
o.bind("SUPER + H", "Keybindings", "omarchy-menu-keybindings")

o.bind("SUPER + E", "File manager", { omarchy = "nautilus" })

hl.unbind("SUPER + L")
o.bind("SUPER + L", "Lock system", "omarchy-system-lock")

-- Launch communication and development tools.
o.bind("SUPER + D", "Discord", { launch = "discord" })
hl.unbind("SUPER + SHIFT + C")
o.bind("SUPER + SHIFT + C", "Codex", { tui = "codex" })

-- Use Super + Ctrl + 1-0 to send the active window silently to a workspace.
-- Move the default bar-panel shortcuts to the old silent-workspace combination.
for workspace = 1, 10 do
  local key = "code:" .. tostring(workspace + 9)
  hl.unbind("SUPER + CTRL + " .. key)
  hl.unbind("SUPER + SHIFT + ALT + " .. key)
  o.bind(
    "SUPER + CTRL + " .. key,
    "Move window silently to workspace " .. workspace,
    hl.dsp.window.move({ workspace = tostring(workspace), follow = false })
  )
end

for panel = 1, 9 do
  local key = "code:" .. tostring(panel + 9)
  o.bind(
    "SUPER + SHIFT + ALT + " .. key,
    "Bar panel " .. panel,
    "omarchy-shell -q shell togglePanelAt right " .. panel
  )
end
