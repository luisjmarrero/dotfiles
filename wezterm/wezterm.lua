local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- =========================
-- Basic Window / Font Setup
-- =========================
config.color_scheme = "Catppuccin Mocha"

config.font = wezterm.font("MesloLGS Nerd Font Mono")
config.font_size = 13

config.initial_cols = 130
config.initial_rows = 35

config.window_decorations = "RESIZE"
config.window_background_opacity = 0.98
config.macos_window_background_blur = 10

config.window_padding = {
    left = 10,
    right = 10,
    top = 5,
    bottom = 5,
}

config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = true

-- =========================
-- Keybindings
-- =========================
config.keys = {
  { key = 'LeftArrow',  mods = 'OPT', action = wezterm.action.SendString('\x1bb') },
  { key = 'RightArrow', mods = 'OPT', action = wezterm.action.SendString('\x1bf') },
  { key = "t", mods = "CMD", action = wezterm.action.DisableDefaultAssignment },
}

-- =========================
-- Default Shell + tmux
-- =========================
config.default_prog = { "/bin/zsh", "-l", "-c", "/opt/homebrew/bin/tmux new-session -A -s local || exec zsh" }

-- =========================
-- Truecolor + ANSI Mapping
-- =========================
config.colors = {
  ansi = {
    "#1E1E2E", -- black
    "#F28FAD", -- red
    "#ABE9B3", -- green
    "#FAE3B0", -- yellow
    "#56596b", -- cyan (autocomplete popup background)
    "#F5C2E7", -- magenta
    "#B5E8E0", -- blue
    "#F9F5D7", -- white
  },
  brights = {
    "#6E6C7E", -- bright black
    "#FFAAA5", -- bright red
    "#B9FBC0", -- bright green
    "#FFFACD", -- bright yellow
    "#56596b", -- bright cyan
    "#F5C2E7", -- bright magenta
    "#A0C4FF", -- bright blue
    "#FFFFFF", -- bright white
  },
}

-- =========================
-- Truecolor support in tmux
-- =========================
-- Add to ~/.tmux.conf:
-- set -g default-terminal "tmux-256color"
-- set -ga terminal-overrides ',xterm-256color:Tc'

-- =========================
-- Return config
-- =========================
return config
