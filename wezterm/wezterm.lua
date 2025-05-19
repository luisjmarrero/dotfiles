local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.color_scheme = 'Catppuccin Mocha'

config.initial_cols = 130
config.initial_rows = 35

config.font = wezterm.font("MesloLGS Nerd Font Mono")
config.font_size = 14

config.enable_tab_bar = false

config.window_decorations = "RESIZE"

config.window_background_opacity = 0.98
config.macos_window_background_blur = 10

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

config.default_prog = { '/bin/zsh', '-i' }

-- and finally, return the configuration to wezterm
return config
