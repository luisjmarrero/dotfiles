local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.color_scheme = 'Catppuccin Mocha'

config.initial_cols = 130
config.initial_rows = 35

config.font = wezterm.font("MesloLGS Nerd Font Mono")
config.font_size = 13

config.enable_tab_bar = false

config.window_decorations = "RESIZE"

config.window_background_opacity = 0.98
config.macos_window_background_blur = 10

config.use_fancy_tab_bar = true
config.hide_tab_bar_if_only_one_tab = false

config.window_padding = {
  left = 10,
  right = 10,
  top = 5,
  bottom = 5,
}

config.keys = {
  -- Send ESC + b for Option + Left Arrow (move back word in shells like bash/zsh)
  {
    key = 'LeftArrow',
    mods = 'OPT',
    action = wezterm.action.SendString('\x1bb'),
  },
  -- Send ESC + f for Option + Right Arrow (move forward word)
  {
    key = 'RightArrow',
    mods = 'OPT',
    action = wezterm.action.SendString('\x1bf'),
  },
}

config.mouse_bindings = {
  -- CMD-click will open the link under the mouse cursor
  {
    event = { Up = { streak = 1, button = "Left" } },
    mods = "SUPER",
    action = wezterm.action.OpenLinkAtMouseCursor,
  },
}

-- config.default_prog = { '/bin/zsh', '-i' }
config.default_prog = { "/opt/homebrew/bin/tmux", "new-session", "-A", "-s", "local" }

-- and finally, return the configuration to wezterm
return config
