#!/bin/zsh

echo "--> configuring symlinks"
# configure zsh
ln -sf ~/.dotfiles/zsh/rc.zsh ~/.zshrc
mkdir -p ~/.zsh
ln -sf ~/.dotfiles/zsh/alias.zsh ~/.zsh/alias.zsh
ln -sf ~/.dofiles/zsh/exports.zsh ~/.zsh/exports.zsh
ln -sf ~/.dotfiles/zsh/keybindings.zsh ~/.zsh/keybindings.zsh

# configure tmux
ln -sf ~/.dotfiles/tmux/tmux.conf ~/.tmux.conf

# configure wezterm
ln -sf ~/.dotfiles/wezterm/wezterm.lua ~/.wezterm.lua

# configure ghostty
ln -sf ~/.dotfiles/ghostty/config ~/.config/ghostty/config