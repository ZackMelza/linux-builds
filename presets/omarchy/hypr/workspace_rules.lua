-- Application placement rules adapted from the JaKooLit Hyprland profile.
-- Keep these as Omarchy Lua rules; do not replace Omarchy's configuration.

-- Email
hl.window_rule({
  match = { class = "^([Tt]hunderbird|org\\.mozilla\\.Thunderbird|org\\.gnome\\.Evolution|eu\\.betterbird\\.Betterbird)$" },
  workspace = "1",
})

-- Browsers
hl.window_rule({
  match = {
    class = "^([Ff]irefox|org\\.mozilla\\.firefox|[Ff]irefox-esr|[Ff]irefox-bin|[Gg]oogle-chrome(-beta|-dev|-unstable)?|com\\.google\\.Chrome|chrome-.+-Default|[Cc]hromium|org\\.chromium\\.Chromium|[Mm]icrosoft-edge(-stable|-beta|-dev|-unstable)?|[Bb]rave.*|com\\.brave\\.Browser|[Tt]horium-browser|[Cc]achy-browser|zen-alpha|zen|io\\.github\\.zen_browser\\.zen|[Vv]ivaldi.*|[Oo]pera.*|[Ll]ibrewolf|[Ff]loorp)$",
  },
  workspace = "2",
})

-- Editors and IDEs
hl.window_rule({
  match = { class = "^(code|code-oss|code-url-handler|VSCode|codium|codium-url-handler|VSCodium|jetbrains-.+|dev\\.zed\\.Zed|antigravity)$" },
  workspace = "3",
})

-- Codex runs inside an Omarchy-managed terminal with this app ID.
hl.window_rule({ match = { class = "^org\\.omarchy\\.codex$" }, workspace = "3" })

-- Screen sharing / virtual machines
hl.window_rule({ match = { class = "^com\\.obsproject\\.Studio$" }, workspace = "4 silent" })
hl.window_rule({ match = { class = "^(.virt-manager-wrapped|virt-manager)$" }, workspace = "6 silent" })

-- Game stores (Steam, Lutris, Heroic)
hl.window_rule({
  match = { class = "^[Ss]team$" },
  workspace = "5",
})
hl.window_rule({ match = { title = "^[Ll]utris$" }, workspace = "5" })
hl.window_rule({ match = { class = "^com\\.heroicgameslauncher\\.hgl$" }, workspace = "5" })

-- Discord and other messaging clients
hl.window_rule({
  match = { class = "^([Dd]iscord|[Ww]ebCord|[Vv]esktop|[Ff]erdium|[Ww]hatsapp-for-linux|ZapZap|com\\.rtosta\\.zapzap|org\\.telegram\\.desktop|io\\.github\\.tdesktop_x64\\.TDesktop|teams-for-linux|im\\.riot\\.Riot|Element)$" },
  workspace = "7",
})

-- Games
hl.window_rule({ match = { class = "^(gamescope|steam_app_\\d+)$" }, workspace = "8" })

-- Multimedia
hl.window_rule({
  match = { class = "^([Aa]udacious|[Mm]pv|vlc|com\\.github\\.rafostar\\.Clapper)$" },
  workspace = "9 silent",
})
