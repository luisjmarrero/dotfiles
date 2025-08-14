local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.color_scheme = 'Catppuccin Mocha'

config.initial_cols = 130
config.initial_rows = 35

config.exit_behavior = "Close"

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
    bottom = 5
}

config.keys = { -- Send ESC + b for Option + Left Arrow (move back word in shells like bash/zsh)
{
    key = 'LeftArrow',
    mods = 'OPT',
    action = wezterm.action.SendString('\x1bb')
}, -- Send ESC + f for Option + Right Arrow (move forward word)
{
    key = 'RightArrow',
    mods = 'OPT',
    action = wezterm.action.SendString('\x1bf')
}, {
    key = "t",
    mods = "CMD",
    action = wezterm.action.DisableDefaultAssignment
}}

-- This is the key to stop snapping to bottom
config.selection_word_boundary = " \t\n{}[]()\"'`,;:|"
config.alternate_buffer_wheel_scroll_speed = 3

config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true

-- config.default_prog = { '/bin/zsh', '-i' }
-- config.default_prog = { "/bin/zsh", "-c", "/opt/homebrew/bin/tmux new-session -A -s local; exec /bin/zsh" }
config.default_prog = {"/bin/zsh", "-l", "-c", "/opt/homebrew/bin/tmux new-session -A -s local || exec zsh"}

-- and finally, return the configuration to wezterm
return config
